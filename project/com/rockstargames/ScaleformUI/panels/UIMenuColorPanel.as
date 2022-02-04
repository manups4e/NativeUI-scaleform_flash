class com.rockstargames.ScaleformUI.panels.UIMenuColorPanel extends com.rockstargames.ScaleformUI.panels.BasePanel
{
	var colorItems;
	var colorsArray;
	var selectedColors;
	var itemCount;
	var visibleItems = 9;
	var _selected;
	var _selectedItem;
	var _initial;
	var leftArrow;
	var rightArrow;
	var _index = 0;
	var selector;
	var _title;
	var titleTF;
	var colorType;

	function UIMenuColorPanel(parentItem, title, type, index)
	{
		super(parentItem);
		this.itemCount = 0;
		this.colorItems = new Array();
		this.selectedColors = new Array();
		if (type == 0)
		{
			this.colorsArray = com.rockstargames.ScaleformUI.utils.ColorPanelColors.HAIR_COLORS;
		}
		else
		{
			this.colorsArray = com.rockstargames.ScaleformUI.utils.ColorPanelColors.MAKEUP_COLORS;
		}
		this.itemCount = this.colorsArray.length;
		this.itemMC = parentItem._parentMenu._mainMC.attachMovie("UIMenuColorPanel", "colorPanel_" + parentItem.itemMC._name + "_" + (parentItem.panels.length + 1), parentItem._parentMenu._mainMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this._title = title;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		this.titleTF = this.itemMC.titleMC.titleTF;
		this.leftArrow = this.itemMC.attachMovie("hairColourArrow", "leftArMC_" + this.itemMC._name, this.itemMC.getNextHighestDepth(), {_x:7.35, _y:12.6});
		this.rightArrow = this.itemMC.attachMovie("hairColourArrow", "rightArMC_" + this.itemMC._name, this.itemMC.getNextHighestDepth(), {_x:282, _y:12.6, _xscale:-100});
		this.leftArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverCP, this.leftArrow);
		this.rightArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverCP, this.rightArrow);
		this.leftArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutCP, this.leftArrow);
		this.rightArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutCP, this.rightArrow);
		if (index != undefined)
		{
			this._index = index;
		}
		else
		{
			this._index = 0;
		}
		this.selector = this.itemMC.attachMovie("ColorSelector", "selector_" + this.itemMC._name, this.itemMC.getNextHighestDepth());
		for (var i = 0; i < this.visibleItems; i++)
		{
			this.colorItems.push(this.itemMC.attachMovie("swatch", "_swatch_" + this.itemMC._name, this.itemMC.getNextHighestDepth()));
			this.colorItems[i].onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverCP, i);
			this.colorItems[i].onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutCP, i);
			this.colorItems[i]._x = 8 + this.colorItems[i]._width * i;
			this.colorItems[i]._y = 31.05;
		}

		this.selector._y = 31.05 - 5;
		this.selector._x = this.colorItems[this.currentSelection]._x;
		this.selector._visible = false;
		this.titleTF.embedFonts = true;
		this.titleTF.antiAliasType = "advanced";
		this.Value = this.currentSelection;
		com.rockstargames.ui.utils.UIText.setSizedText(this.titleTF,this._title + " (" + (this.currentSelection + 1) + "/" + this.itemCount + ")",true,true);
	}

	function mOverCP(id)
	{
		if (id == this.rightArrow || id == this.leftArrow)
		{
			id._width += 2;
			id._height += 2;
			if (id == this.rightArrow)
			{
				this._selected = -2;
				id._xscale = -100;
			}
			else if (id == this.leftArrow)
			{
				this._selected = -3;
			}
			this._hovered = true;
			return;
		}
		else
		{
			this._hovered = true;
			this._selected = id;
		}
	}

	function mOutCP(id)
	{
		if (id == this.rightArrow || id == this.leftArrow)
		{
			id._width -= 2;
			id._height -= 2;
			if (id == this.rightArrow)
			{
				id._xscale = -100;
			}
			this._hovered = false;
			return;
		}
		this._selected = -1;
		this._hovered = false;
	}

	function get currentSelection()
	{
		return this._index;
	}

	function set currentSelection(val)
	{
		if (val != undefined && val != NaN)
		{
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
				this.selector._visible = true;
				this.selector._y = 31.05 - 5;
				this.selector._x = this.colorItems[i]._x;
				this._selectedItem = i;
			}
		}
	}

	function get Value()
	{
		if (this._selected != -1)
		{
			switch (this._selected)
			{
				case -3 :
					this.goLeft();
					break;
				case -2 :
					this.goRight();
					break;
				default :
					this.currentSelection = this.selectedColors[this._selected].i;
			}
			this.updateColors();
			return this.colorsArray[this.currentSelection].i;
		}
	}

	function set Value(val)
	{
		this.currentSelection = val;
		for (var i = 0; i < this.visibleItems; i++)
		{
			var vl = i + val;
			if (vl > 63)
			{
				vl -= 63;
			}
			else if (vl < 0)
			{
				vl += 63;
			}
			this.selectedColors[i] = this.colorsArray[vl];
			var color = this.selectedColors[i];
			com.rockstargames.ui.utils.Colour.Colourise(this.colorItems[i],color.r,color.g,color.b,color.a);
			if (color.i == this.currentSelection)
			{
				this.selector._visible = true;
				this.selector._y = 31.05 - 5;
				this.selector._x = this.colorItems[i]._x;
				this._selectedItem = i;
			}
		}
	}
	function Clear()
	{
		this.itemMC.removeMovieClip();
	}
}