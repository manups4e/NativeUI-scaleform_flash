class com.rockstargames.ScaleformUI.items.UIMenuStatsItem extends com.rockstargames.ScaleformUI.items.BaseMenuItem
{
	var barMC;
	var bgMC;
	var darkbarMC;
	var type;
	var itemTextLeft;
	var itemTextRight;
	var min = 0;
	var max = 100;
	var _index;
	var _type = 5;
	function UIMenuStatsItem(id, str, substr, parentMenu, _enabled, _blink, _value, __type, barColor, mainColor, highlightColor, textColor, textHighlightColor)
	{
		super(parentMenu,str,substr, _enabled);
		this._type = id;
		this.itemMC = this.parentMC.attachMovie("characterStatsCardItem", "characterStatsCardItem_" + this._parentMenu.itemCount + 1, this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftTextTF = this.itemMC.labelMC.titleTF;
		this.itemTextRight = this.itemMC.labelMC.valueTF;
		this.barMC = this.itemMC.attachMovie("GenericColourBar", "darkbarMC", this.itemMC.getNextHighestDepth());
		this.darkbarMC = this.itemMC.attachMovie("GenericColourBar", "barMC", this.itemMC.getNextHighestDepth());
		this.barMC._x = this.darkbarMC._x = this.itemMC.maskMC._x;
		this.barMC._y = this.darkbarMC._y = this.itemMC.maskMC._y;
		this.type == __type;
		this._index = _value;
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

		this.blinkDesc = _blink;
		if (__type == 0)
		{
			this.itemMC.maskMC._visible = this.itemMC.darkmaskMC._visible = true;
			this.barMC.mc.baralphaMC._visible = false;
			this.barMC._height = 6;
			this.barMC.setMask(this.itemMC.maskMC);
			this.darkbarMC._visible = true;
			this.darkbarMC.setMask(this.itemMC.darkmaskMC);
			this.itemMC.bgMC._height = 40;
		}
		else if (__type == 1)
		{
			this.itemMC.maskMC._visible = this.itemMC.darkmaskMC._visible = false;
			this.barMC.mc.baralphaMC._visible = true;
			this.barMC._height = 10;
			this.barMC.setMask(null);
			this.darkbarMC._visible = false;
			this.itemMC.bgMC._height = 46;
		}
		com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,str);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,this._enabled ? (!this.highlighted ? this._textColor : this._textHighlightColor) : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
		this.itemMC.labelMC.valueTF._x = 280 - this.itemMC.labelMC.valueTF.textWidth;
		var __reg5 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
		if (barColor != undefined)
		{
			__reg5 = barColor;
		}
		var __reg4 = 100;
		if (_value != undefined)
		{
			__reg4 = Math.max(0, Math.min(_value, 100));
		}

		var __reg3 = 0;
		if (_value != undefined)
		{
			__reg3 = Math.max(0, Math.min(_value, 100));
		}

		if (this.barMC != undefined)
		{
			this.barMC.init(__reg5,278);
			var __reg6 = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(__reg4, 54, 2, 5);
			this.barMC.percent(__reg6,false);
		}

		if (this.darkbarMC != undefined)
		{
			this.darkbarMC.init(__reg5,278);
			this.darkbarMC._alpha = 70;
			var __reg7 = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(__reg3, 54, 2, 5);
			this.darkbarMC.percent(__reg7,false);
		}

		//this.highlighted = this._highlighted;
	}
	
	function addPanel(_panel)
	{
		this.panels.push(_panel);
	}

	function set barscale(bi)
	{
		this._index = bi;
		if (this._index > this.max)
		{
			this._index = this.max;
		}
		else if (this._index < 0)
		{
			this._index = 0;
		}
		var __reg4 = Math.max(0, Math.min(this._index, 100));
		var __reg6 = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(__reg4, 54, 2, 5);
		this.barMC.percent(__reg6,true);
		this.darkbarMC.percent(__reg6,true);
	}

	function get barscale()
	{
		return this._index;
	}
}