﻿class com.rockstargames.NativeUI.items.UIMenuCheckboxItem extends com.rockstargames.NativeUI.items.BaseMenuItem
{
	static var CHECKBOX_STYLE_CROSS = 0;
	static var CHECKBOX_STYLE_TICK = 1;
	var checkbox;
	var tickStyle;
	var _checked;
	var txd_loader;

	function UIMenuCheckboxItem(str, substr, parentMenu, style, _active, mainColor, highlightColor, textColor, textHighlightColor)
	{
		super(parentMenu,str,substr);
		this.itemMC = this.parentMC.attachMovie("UIMenuCheckboxItem", "checkboxMenuItem_" + this._parentMenu.itemCount + 1, this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.checkbox = this.itemMC.createEmptyMovieClip("checkBox_" + this._parentMenu.itemCount + 1, this.itemMC.getNextHighestDepth());
		this.tickStyle = style;
		this.checked = _active;
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
		this.initBaseMouseInterface();
		this.checkbox.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverBox, this.checkbox);
		this.checkbox.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutBox, this.checkbox);
	}

	function mOverBox(mc)
	{
		mc._width += 2;
		mc._height += 2;
	}
	function mOutBox(mc)
	{
		mc._width -= 2;
		mc._height -= 2;
	}

	function set checked(bool)
	{
		this._checked = bool;
		var sprite_name = this.getSprite(this.highlighted, this.tickStyle, bool);
		this.SetClip(this.checkbox,"commonmenu",sprite_name);
	}

	function SetClip(targetMC, textureDict, textureName)
	{
		this.txd_loader = new MovieClipLoader();
		this.txd_loader.addListener(this);
		var _loc2_ = "img://" + textureDict + "/" + textureName;
		this.txd_loader.loadClip(_loc2_,targetMC);
	}
	function onLoadInit(target_mc)
	{
		target_mc._width = 24;
		target_mc._height = 24;
		target_mc._x = 261.5;
		target_mc._y = 0.5;
		//com.rockstargames.ui.utils.Colour.ApplyHudColour(target_mc,!this.highlighted ? this._textColor : this._textHighlightColor);
		delete this.txd_loader;
	}


	function get checked()
	{
		return _checked;
	}

	function set highlighted(_h)
	{
		super.highlighted = _h;
		var sprite_name = this.getSprite(_h, this.tickStyle, this.checked);
		this.SetClip(this.checkbox,"commonmenu",sprite_name);
		/*
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.tickMC,!_h ? this._highlightColor : this._mainColor);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.crossMC,!_h ? this._highlightColor : this._mainColor);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.checkBG,!_h ? this._textColor : this._textHighlightColor);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.emptyMC,!_h ? this._textColor : this._textHighlightColor);
		*/
	}

	function getSprite(_highlighted, _style, _checked)
	{
		return _highlighted ? (_checked ? (_style == com.rockstargames.NativeUI.items.UIMenuCheckboxItem.CHECKBOX_STYLE_TICK ? "shop_box_tickb" : "shop_box_crossb") : "shop_box_blankb") : _checked ? (_style == com.rockstargames.NativeUI.items.UIMenuCheckboxItem.CHECKBOX_STYLE_TICK ? "shop_box_tick" : "shop_box_cross") : "shop_box_blank";
	}

	function get highlighted()
	{
		return super.highlighted;
	}
}