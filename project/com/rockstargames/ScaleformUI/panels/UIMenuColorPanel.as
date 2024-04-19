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

	function UIMenuColorPanel(parentItem, title, type, index, colors)
	{
		super(parentItem);
		this.itemCount = 0;
		this.colorItems = new Array();
		this.selectedColors = new Array();
		this._title = title;
		switch (type)
		{
			case 0 :
				this.colorsArray = com.rockstargames.ScaleformUI.utils.ColorPanelColors.HAIR_COLORS;
				break;
			case 1 :
				this.colorsArray = com.rockstargames.ScaleformUI.utils.ColorPanelColors.MAKEUP_COLORS;
				break;
			case 2 :
				this.colorsArray = new Array();
				var arr = colors.split(",");
				for (var i = 0; i < arr.length; i++)
				{
					var _loc5_ = new com.rockstargames.ui.utils.HudColour();
					com.rockstargames.ScaleformUI.utils.MovieClipHandler.HexToARGB(arr[i],_loc5_);
					var item = {i:i, r:_loc5_.r, g:_loc5_.g, b:_loc5_.b, a:_loc5_.a};
					this.colorsArray.push(item);
					this.visibleItems = this.colorsArray.length > 9 ? 9 : this.colorsArray.length;
				}
				break;
		}
		this.itemCount = this.colorsArray.length;
		this.itemMC = parentItem._parentMenu._mainMC.attachMovie("UIMenuColorPanel", "colorPanel_" + parentItem.itemMC._name + "_" + (parentItem.panels.length + 1), parentItem._parentMenu._mainMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		this.titleTF = this.itemMC.titleMC.titleTF;
		this.leftArrow = this.itemMC.attachMovie("hairColourArrow", "leftArMC_" + this.itemMC._name, this.itemMC.getNextHighestDepth(), {_x:7.35, _y:12.6});
		this.rightArrow = this.itemMC.attachMovie("hairColourArrow", "rightArMC_" + this.itemMC._name, this.itemMC.getNextHighestDepth(), {_x:282, _y:12.6, _xscale:-100});
		this.leftArrow.setupGenericMouseInterface(-1,10,this.mouseEvent,[this, -1]);
		this.rightArrow.setupGenericMouseInterface(-2,10,this.mouseEvent,[this, -2]);

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
			this.colorItems[i].setupGenericMouseInterface(i,10,this.mouseEvent,[this, i]);
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

	function mouseEvent(evtType, targetMC, args)
	{
		var panel = args[0];
		var item = args[1];
		switch (evtType)
		{
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT :
				panel._selected = -3;
				panel._hovered = false;
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER :
				panel._selected = args[1];
				panel._hovered = true;
		}
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
		if (this.selector._x == this.colorItems[0]._x and this.visibleItems == 9)
		{
			var lowest = this.selectedColors[0].i;
			var newLowestValue = lowest - 1;
			if (newLowestValue < 0)
			{
				newLowestValue = this.colorsArray.length - 1;
			}
			this.selectedColors = this.selectedColors.slice(0, this.visibleItems - 1);
			this.selectedColors.splice(0,0,this.colorsArray[newLowestValue]);
		}
		this.updateColors();
	}
	function goRight()
	{
		this.currentSelection++;
		if (this.selector._x == this.colorItems[this.visibleItems - 1]._x and this.visibleItems == 9)
		{
			var highestValue = this.selectedColors[this.visibleItems - 1].i;
			var newHighValue = highestValue + 1;
			if (newHighValue > this.colorsArray.length - 1)
			{
				newHighValue = 0;
			}
			this.selectedColors = this.selectedColors.slice(1, this.visibleItems);
			this.selectedColors[this.visibleItems - 1] = this.colorsArray[newHighValue];
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
		if (this._selected != -3)
		{
			switch (this._selected)
			{
				case -1 :
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
			if (vl > this.colorsArray.length - 1)
			{
				vl -= this.colorsArray.length - 1;
			}
			else if (vl < 0)
			{
				vl += this.colorsArray.length - 1;
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
		for (var item in this.colorItems)
		{
			this.colorItems[item].dispose();
		}
		this.leftArrow.dispose();
		this.rightArrow.dispose();
		this.itemMC.removeMovieClip();
	}
}