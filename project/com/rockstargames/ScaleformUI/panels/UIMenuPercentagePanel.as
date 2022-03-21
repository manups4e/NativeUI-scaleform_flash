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
		this._slider.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverPP, this.itemMC.sliderMC);
		this._slider.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutPP, this.itemMC.sliderMC);
		if (startIndex != undefined)
		{
			this.Value = startIndex;
		}
		else
		{
			this.Value = 0;
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
		this._value = Math.max(0, Math.min(val, this._max));
		this._slider.percent(this._value,true);
	}

	function set Coords(_val)
	{
		var val = (_val-this._slider._x) / this._slider._width * this._max;
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