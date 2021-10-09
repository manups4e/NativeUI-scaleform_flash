class com.rockstargames.NativeUI.panels.UIMenuPercentagePanel extends com.rockstargames.NativeUI.panels.BasePanel
{
	var _sliderBG;
	var _slider;
	var _sliderBGColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG;
	var _sliderColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
	var _max = 100;
	var _value = 0;
	function UIMenuPercentagePanel(parentItem, title, minText, maxText, startIndex)
	{
		super(parentItem);
		this.itemMC = parentItem.itemMC.attachMovie("UIMenuPercentagePanel", "percentagePanel_" + parentItem.itemMC._name + "_" + (parentItem.panels.length + 1), parentItem.itemMC.getNextHighestDepth());
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
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
		if (startIndex != undefined)
		{
			this.value = startIndex;
		}
	}

	function get value()
	{
		return this._value;
	}
	function set value(val)
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

}