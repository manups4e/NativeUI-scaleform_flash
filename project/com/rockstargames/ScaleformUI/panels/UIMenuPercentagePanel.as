class com.rockstargames.ScaleformUI.panels.UIMenuPercentagePanel extends com.rockstargames.ScaleformUI.panels.BasePanel
{
	var _slider;
	var _sliderColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
	var _max = 100;
	var _value = 0;
	var _coords;
	var hover = -1;

	function UIMenuPercentagePanel(parentItem, title, minText, maxText, startIndex)
	{
		super(parentItem);
		this.itemMC = parentItem._parentMenu._mainMC.attachMovie("UIMenuPercentagePanel", "percentagePanel_" + parentItem.itemMC._name + "_" + parentItem.panels.length + 1, parentItem._parentMenu._mainMC.getNextHighestDepth());
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		this.backgroundMC = this.itemMC.bgMC;
		this.itemMC.opacityTF.embedFonts = true;
		this.itemMC.opacityTF.antiAliasType = "advanced";
		com.rockstargames.ui.utils.UIText.setSizedText(this.itemMC.opacityTF,title,true,true);
		this.itemMC.minTF.embedFonts = true;
		this.itemMC.minTF.antiAliasType = "advanced";
		com.rockstargames.ui.utils.UIText.setSizedText(this.itemMC.minTF,minText,true,true);
		this.itemMC.maxTF.embedFonts = true;
		this.itemMC.maxTF.antiAliasType = "advanced";
		com.rockstargames.ui.utils.UIText.setSizedText(this.itemMC.maxTF,maxText,true,true);
		this._slider = this.itemMC.attachMovie("GenericColourBar", "progress_bar", this.itemMC.getNextHighestDepth(), {_x:4, _y:30});
		this._slider.init(this._sliderColor,279,8);
		if (startIndex != undefined)
		{
			this.Value = startIndex;
		}
		else
		{
			this.Value = 0;
		}
		this._slider.attachMovie("mouseCatcher","mouseCatcher",this._slider.getNextHighestDepth(),{_width:this._slider._width, _height:this._slider._height});
		this._slider.mouseCatcher.setupGenericMouseInterface(0,11,this.onMouseEvent,[this]);
	}

	function onMouseEvent(evtType, targetMC, args)
	{
		var panel = args[0];
		switch (evtType)
		{
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT :
				panel.mOutPP();
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER :
				panel.mOverPP();
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_PRESS :
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE :
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE_OUTSIDE :
				break;
		}
	}

	function mOverPP(mc)
	{
		this._hovered = true;
	}
	function mOutPP(mc)
	{
		this._hovered = false;
	}
	function get Value()
	{
		return this._value;
	}

	function set Value(val)
	{
		this._value = Math.max(0, Math.min(val, this._max));
		this._slider.percent(this._value,true);
	}

	function SetCoords()
	{
		var m = (_xmouse - this.parentItem._parentMenu._menuOff[0]);
		var val = (m - this._slider._x) / this._slider._width * this._max;
		this._value = Math.max(0, Math.min(val, this._max));
		this._slider.percent(this._value);
	}
	function get Coords()
	{
		return this._slider._x + this._slider._width;
	}
	function Clear()
	{
		this.itemMC.removeMovieClip();
	}

}