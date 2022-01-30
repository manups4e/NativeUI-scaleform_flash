class com.rockstargames.ScaleformUI.panels.UIMenuPercentagePanel extends com.rockstargames.ScaleformUI.panels.BasePanel
{
	var _sliderBG;
	var _slider;
	var _sliderBGColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG;
	var _sliderColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
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
		this._sliderBG = this.itemMC.sliderMC.sliderBG;
		this._slider = this.itemMC.sliderMC.slider;
		this.itemMC.sliderMC.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverPP, this.itemMC.sliderMC);
		this.itemMC.sliderMC.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutPP, this.itemMC.sliderMC);
		if ((startIndex != undefined))
		{
			this.Value = startIndex;
		}
	}

	function mOverPP(mc)
	{
		if (mc == this.itemMC.sliderMC)
		{
			this.hover = 1;
			this._hovered = true;
		}
	}
	function mOutPP(mc)
	{
		this.hover = -1;
		this._hovered = false;
	}
	function get Value()
	{
		return this._value;
	}

	function set Value(val)
	{
		if (val > this._max)
		{
			this._value = this._max;
			this._slider._width = 0;
		}
		else if (val < 0)
		{
			this._value = 0;
			this._slider._width = this._sliderBG._width;
		}
		else
		{
			this._value = val;
		}
		this._slider._width = this._sliderBG._width / this._max * this._value;
	}

	function set Coords(val)
	{
		var val = (val - 4) / this._sliderBG._width * this._max;
		this.Value = val;
	}
	function get Coords()
	{
		return this._slider._x + this._slider._width;
	}
}