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
	var arrow_loader;

	function UIMenuSliderItem(str, substr, parentMenu, max, mult, startIndex, mainColor, highlightColor, textColor, textHighlightColor, sliderBGColor, sliderColor)
	{
		super(parentMenu,str,substr);
		this.itemMC = this.parentMC.attachMovie("UIMenuSliderItem", "sliderMenuItem_" + this._parentMenu.itemCount + 1, this.parentMC.getNextHighestDepth());
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
		this.initBaseMouseInterface();
		this.leftArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverS, this.leftArrow);
		this.leftArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutS, this.leftArrow);
		this.rightArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverS, this.rightArrow);
		this.rightArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutS, this.rightArrow);
		this.itemMC.sliderMC.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverS, this.itemMC.sliderMC);
		this.itemMC.sliderMC.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutS, this.itemMC.sliderMC);
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

	function mOverS(mc)
	{
		if (mc == this.leftArrow)
		{
			this._hovered = true;
			this.hover = 0;
		}
		else if (mc == this.rightArrow)
		{
			this._hovered = true;
			this.hover = 1;
		}
		else if (mc == this.itemMC.sliderMC)
		{
			this._hovered = true;
			this.hover = 2;
		}
	}
	function mOutS(mc)
	{
		this._hovered = false;
		this.hover = -1;
	}
	function addPanel(_panel)
	{
		this.panels.push(_panel);
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
		this.leftArrow._visible = _h;
		this.rightArrow._visible = _h;
		for (var _panel in this.panels)
		{
			this.panels[_panel].isVisible = _h;
		}
	}

	function Select(posX, posY)
	{
		if (this.highlighted)
		{
			switch (this.hover)
			{
				case 0 :
					this.value -= this.multiplier;
					break;
				case 1 :
					this.value += this.multiplier;
					break;
			}
		}
		if (this.hover == 2)
		{
			var val = ((posX - 228.55 + 25) / (this._sliderBG._width - this._slider._width)) * this._max;
			this.value = val;
		}
		return this.value;
	}
}