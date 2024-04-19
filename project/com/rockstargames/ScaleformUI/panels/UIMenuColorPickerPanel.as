class com.rockstargames.ScaleformUI.panels.UIMenuColorPickerPanel extends com.rockstargames.ScaleformUI.panels.BasePanel
{
	var itemMC;
	var colorsArray = [];
	var hovered = -1;
	var colorIncludedArray = [];
	function UIMenuColorPickerPanel(parentItem, type)
	{
		super(parentItem);
		this.colorsArray = com.rockstargames.ScaleformUI.utils.ColorPanelColors.VEHICLE_COLORS;
		switch (type)
		{
			case 2 :// CHROMES AND METALS
				this.colorIncludedArray = com.rockstargames.ScaleformUI.utils.ColorPanelColors.VEHICLE_METALLIC;
				break;
			case 3 :// CHAMELEON
				this.colorIncludedArray = com.rockstargames.ScaleformUI.utils.ColorPanelColors.VEHICLE_CHAMELEON;
				break;
			default :
				this.colorIncludedArray = com.rockstargames.ScaleformUI.utils.ColorPanelColors.VEHICLE_COLORS;
				break;
		}
		//this.colorsArray.sort(compareColors);
		this.itemMC = parentItem._parentMenu._mainMC.attachMovie("ColourPicker", "colourPicker_" + parentItem._parentMenu._mainMC.getNextHighestDepth(), parentItem._parentMenu._mainMC.getNextHighestDepth());
		this.itemMC.gotoAndStop(1);
		this.itemMC.BannerSprite.removeMovieClip();
		this.itemMC.imgPlaceholderMC._y = this.itemMC.honeyComb._y = 0;

		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.imgPlaceholderMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		this.itemMC.honeyComb.maskMC._alpha = 0;
		for (var i = 0; i < this.colorsArray.length; i++)
		{
			var col = this.colorsArray[i];
			var cell = this.itemMC.honeyComb["colour_" + i];

			if (this.isIncluded(col.i))
			{
				com.rockstargames.ui.utils.Colour.Colourise(cell,col.r,col.g,col.b,100);
				cell.attachMovie("mouseCatcher","mouseCatcher",cell.getNextHighestDepth(),{_x:-35, _y:-40, _width:cell._width, _height:cell._height});
				cell.mouseCatcher.setupGenericMouseInterface(col.i,14,this.onMouseEvent,[cell, col.i, this]);
			}
			else
			{
				cell._width = 35;
				cell._height = 40;
				com.rockstargames.ui.utils.Colour.Colourise(cell,col.r,col.g,col.b,25);
			}
		}
	}

	function isIncluded(id)
	{
		if (this.colorIncludedArray.length == this.colorsArray.length)
		{
			return true;
		}
		for (var i = 0; i < this.colorIncludedArray.length; i++)
		{
			if (this.colorIncludedArray[i] == id)
			{
				return true;
			}
		}
		return false;
	}

	function onMouseEvent(evtType, targetMC, args)
	{
		var cell = args[0];
		var id = args[1];
		var panel = args[2];
		switch (evtType)
		{
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT :
				panel.mOutCP(cell,id);
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER :
				panel.mOverCP(cell,id);
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE_OUTSIDE :
				panel.mOutCP(cell,id);
		}

	}

	function mOverCP(cell, id)
	{
		cell.swapDepths(this.itemMC.honeyComb.maskMC);
		cell._width += 30;
		cell._height += 30;
		this.hovered = id;
	}

	function mOutCP(cell, id)
	{
		cell.swapDepths(this.itemMC.honeyComb.maskMC);
		cell._width -= 30;
		cell._height -= 30;
		this.hovered = -1;
	}

	function compareColors(color1:Object, color2:Object):Number
	{
		if (color1.a != color2.a)
		{
			return color1.a - color2.a;
		}
		else if (color1.r != color2.r)
		{
			return color1.r - color2.r;
		}
		else if (color1.g != color2.g)
		{
			return color1.g - color2.g;
		}
		else
		{
			return color1.b - color2.b;
		}
	}

	function Clear()
	{
		this.itemMC.removeMovieClip();
	}
}