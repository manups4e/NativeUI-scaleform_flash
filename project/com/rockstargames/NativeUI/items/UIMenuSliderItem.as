class com.rockstargames.NativeUI.items.UIMenuSliderItem extends com.rockstargames.NativeUI.items.BaseMenuItem
{
	var _value = 0;
	var leftArrow;
	var rightArrow;
	var _max;
	var _multiplier;
	var _sliderBG;
	var _slider;
	var divider;
	var _sliderBGColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG;
	var _sliderColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;

	function UIMenuSliderItem(str, substr, parentMenu, max, mult, startIndex, mainColor, highlightColor, textColor, textHighlightColor, sliderBGColor, sliderColor)
	{
		super(parentMenu,str,substr);
		this.itemMC = this.parentMC.attachMovie("UIMenuSliderItem", "sliderMenuItem", this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftArrow = this.itemMC.leftArrow;
		this.rightArrow = this.itemMC.rightArrow;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this._sliderBG = this.itemMC.sliderMC.sliderBG;
		this._slider = this.itemMC.sliderMC.slider;
		this._max = max;
		this._multiplier = mult;
		if (startIndex == undefined)
		{
			this.value = 0;
		}
		else
		{
			this.value = startIndex;
		}
				if (mainColor != undefined)
		{
			this._mainColor = mainColor;
		}
		if (highlightColor != undefined)
		{
			this._highlightColor = highlightColor;
		}
		if (textColor != undefined)
		{
			this._textColor = textColor;
		}
		if (textHighlightColor != undefined)
		{
			this._textHighlightColor = textHighlightColor;
		}

		com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,this.leftText,true,true);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this._sliderBG,this._sliderBGColor);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this._slider,this._sliderColor);
	}

	function set maximum(val)
	{
		this._max = val;
		if (this._value > this._max)
		{
			this._value = this._max;
		}
	}

	function get maximum()
	{
		return this._max;
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
			this._slider._x = 25.0;
		}
		else if (val < 0)
		{
			this._value = 0;
			this._slider._x = -25.0;
		}
		else
		{
			this._value = val;
		}
		this._slider._x = -25 + ((this._value / this._max) * (this._sliderBG._width - this._slider._width));
	}

	function get multiplier()
	{
		return this._multiplier;
	}
	function set multiplier(val)
	{
		this._multiplier = val;
	}

	function set highlighted(_h)
	{
		super.highlighted = _h;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.leftArrow,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rightArrow,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
	}
}