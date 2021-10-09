class com.rockstargames.NativeUI.items.UIMenuProgressItem extends com.rockstargames.NativeUI.items.BaseMenuItem
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
	var arrow_loader;

	function UIMenuProgressItem(str, substr, parentMenu, max, mult, startIndex, mainColor, highlightColor, textColor, textHighlightColor, sliderBGColor, sliderColor)
	{
		super(parentMenu,str,substr);
		this.itemMC = this.parentMC.attachMovie("UIMenuProgressItem", "progressMenuItem_" + this._parentMenu.itemCount + 1, this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftArrow = this.itemMC.leftArrow;
		this.rightArrow = this.itemMC.rightArrow;
		this.SetClip(this.leftArrow.arrowMC,"commonmenu","arrowleft");
		this.SetClip(this.rightArrow.arrowMC,"commonmenu","arrowright");
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this._sliderBG = this.itemMC.sliderMC.sliderBG;
		this._slider = this.itemMC.sliderMC.slider;
		this._max = max;
		this._multiplier = mult;
		this.leftArrow._x = 228.55 - 61;
		this.rightArrow._x = 228.55 + 49;
		this.leftArrow._y = 6;
		this.rightArrow._y = 6;
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
		if (sliderBGColor != undefined)
		{
			this._sliderBGColor = sliderBGColor;
		}
		if (sliderColor != undefined)
		{
			this._sliderColor = sliderColor;
		}

		com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,this.leftText,true,true);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this._sliderBG,this._sliderBGColor);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this._slider,this._sliderColor);
		this.initBaseMouseInterface();
		this.leftArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverArrow, this.leftArrow);
		this.leftArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutArrow, this.leftArrow);
		this.rightArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverArrow, this.rightArrow);
		this.rightArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutArrow, this.rightArrow);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rightArrow,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.leftArrow,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
	}

	function mOverArrow(mc)
	{
		mc._width += 2;
		mc._height += 2;
	}
	function mOutArrow(mc)
	{
		mc._width -= 2;
		mc._height -= 2;
	}
	function SetClip(targetMC, textureDict, textureName)
	{
		this.arrow_loader = new MovieClipLoader();
		this.arrow_loader.addListener(this);
		var _loc2_ = "img://" + textureDict + "/" + textureName;
		this.arrow_loader.loadClip(_loc2_,targetMC);
	}
	function onLoadInit(target_mc)
	{
		target_mc._width = 16;
		target_mc._height = 16;
		//com.rockstargames.ui.utils.Colour.ApplyHudColour(target_mc,!this.highlighted ? this._textColor : this._textHighlightColor);  
		delete this.arrow_loader;
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
		this.leftArrow._visible = _h;
		this.rightArrow._visible = _h;
	}
}