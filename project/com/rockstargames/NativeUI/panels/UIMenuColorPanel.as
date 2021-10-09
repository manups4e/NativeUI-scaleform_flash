class com.rockstargames.NativeUI.panels.UIMenuColorPanel extends com.rockstargames.NativeUI.panels.BasePanel
{
	var colorItems = new Array();
	var colorsArray = new Array();
	var selectedColors = new Array();
	var itemCount;
	var visibleItems = 9;
	var _selected;
	var _selectedItem;
	var leftArrow;
	var rightArrow;
	var _index = 0;
	var selector;
	var _title;
	var titleTF;
	var colorType;
	function UIMenuColorPanel(parentItem, title, index)
	{
		super(parentItem);
		this.itemCount = 0;
		this.colorItems = new Array();
		this.colorsArray = new Array();
		this.selectedColors = new Array();

		this.itemMC = parentItem.itemMC.attachMovie("UIMenuColorPanel", "colorPanel_" + parentItem.itemMC._name + "_" + (parentItem.panels.length + 1), parentItem.itemMC.getNextHighestDepth());
		this._title = title;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		this.titleTF = this.itemMC.titleMC.titleTF;
		this.leftArrow = this.itemMC.attachMovie("hairColourArrow", "leftArMC_" + this.itemMC._name, this.itemMC.getNextHighestDepth(), {_x:7.35, _y:13.6});
		this.rightArrow = this.itemMC.attachMovie("hairColourArrow", "rightArMC_" + this.itemMC._name, this.itemMC.getNextHighestDepth(), {_x:282, _y:13.6, _xscale:-100});
		this.leftArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOver, this.leftArrow);
		this.rightArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOver, this.rightArrow);
		this.leftArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOut, this.leftArrow);
		this.rightArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOut, this.rightArrow);
		if (index != undefined)
		{
			this.currentSelection = index;
		}
		else
		{
			this.currentSelection = 0;
		}
		this.selector = this.itemMC.attachMovie("ColorSelector", "selector_" + this.itemMC._name, this.itemMC.getNextHighestDepth());
		this.leftArrow.onRelease = com.rockstargames.ui.utils.DelegateStar.create(this, this.mPress, -1);
		this.rightArrow.onRelease = com.rockstargames.ui.utils.DelegateStar.create(this, this.mPress, 1);
		for (var i = 0; i < this.visibleItems; i++)
		{
			this.colorItems.push(this.itemMC.attachMovie("swatch", "_swatch_" + this.itemMC._name, this.itemMC.getNextHighestDepth()));
			this.colorItems[i].onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOver, i);
			this.colorItems[i].onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOut, i);
			this.colorItems[i]._x = 8 + this.colorItems[i]._width * i;
			this.colorItems[i]._y = 31.05;
		}

		this.selector._y = 31.05 - 5;
		this.selector._x = this.colorItems[this.currentSelection]._x;
		this.selector._visible = false;
		this.titleTF.embedFonts = true;
		this.titleTF.antiAliasType = "advanced";
		com.rockstargames.ui.utils.UIText.setSizedText(this.titleTF,this._title + " (" + (this.currentSelection + 1) + "/" + this.itemCount + ")",true,true);
	}

	function addColor(i, _r, _g, _b)
	{
		this.itemCount = this.colorsArray.push({i:i, r:_r, g:_g, b:_b, a:100});
		if (i < this.visibleItems)
		{
			com.rockstargames.ui.utils.Colour.Colourise(this.colorItems[i],_r,_g,_b,100);
			this.selectedColors[i] = this.colorsArray[i];
		}
		if (this.currentSelection == i)
		{
			this.selector._visible = true;
			this.selector._y = 31.05 - 5;
			this.selector._x = this.colorItems[0]._x;
		}
		com.rockstargames.ui.utils.UIText.setSizedText(this.titleTF,this._title + " (" + (this.currentSelection + 1) + "/" + this.itemCount + ")",true,true);
	}
	function mPress(direction)
	{
		switch (direction)
		{
			case -1 :
				this.goLeft();
				break;
			case 1 :
				this.goRight();
		}
	}
	function mOver(id)
	{
		if (id == this.rightArrow || id == this.leftArrow)
		{
			id._width += 2;
			id._height += 2;
			if (id == this.rightArrow)
			{
				id._xscale = -100;
			}
			return;
		}
		else
		{
			this._selected = id;
		}
	}
	function mOut(id)
	{
		if (id == this.rightArrow || id == this.leftArrow)
		{
			id._width -= 2;
			id._height -= 2;
			if (id == this.rightArrow)
			{
				id._xscale = -100;
			}
			return;
		}
		else
		{
			this._selected = -1;
		}
	}

	function get currentSelection()
	{
		return this._index;
	}

	function set currentSelection(val)
	{
		if (this.colorsArray.length == 0)
		{
			this._index = 0;
		}
		this._index = val;
		if (this._index < 0)
		{
			this._index += this.itemCount;
		}
		if (this._index > this.itemCount - 1)
		{
			this._index -= this.itemCount;
		}
		com.rockstargames.ui.utils.UIText.setSizedText(this.titleTF,this._title + " (" + (this.currentSelection + 1) + "/" + this.itemCount + ")",true,true);
	}

	function goLeft()
	{
		this.currentSelection--;
		if (this.selector._x == this.colorItems[0]._x)
		{
			var lowest = this.selectedColors[0].i;
			var newLowestValue = lowest - 1;
			if (newLowestValue < 0)
			{
				newLowestValue = 63;
			}
			this.selectedColors = this.selectedColors.slice(0, 8);
			this.selectedColors.splice(0,0,this.colorsArray[newLowestValue]);
		}
		this.updateColors();
	}
	function goRight()
	{
		this.currentSelection++;
		if (this.selector._x == this.colorItems[8]._x)
		{
			var highestValue = this.selectedColors[8].i;
			var newHighValue = highestValue + 1;
			if (newHighValue > 63)
			{
				newHighValue = 0;
			}
			this.selectedColors = this.selectedColors.slice(1, 9);
			this.selectedColors[8] = this.colorsArray[newHighValue];
		}
		this.updateColors();
	}

	function updateColors()
	{
		for (var i = 0; i < this.visibleItems; i++)
		{
			var color = this.selectedColors[i];
			com.rockstargames.ui.utils.Colour.Colourise(this.colorItems[i],color.r,color.g,color.b,color.a);
			if (color.i == this.currentSelection)
			{
				this.selector._y = 31.05 - 5;
				this.selector._x = this.colorItems[i]._x;
			}
		}
	}
}