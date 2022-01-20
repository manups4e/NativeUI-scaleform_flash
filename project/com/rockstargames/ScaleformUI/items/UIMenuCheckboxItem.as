class com.rockstargames.ScaleformUI.items.UIMenuCheckboxItem extends com.rockstargames.ScaleformUI.items.BaseMenuItem
{
	static var CHECKBOX_STYLE_CROSS = 0;
	static var CHECKBOX_STYLE_TICK = 1;
	var checkbox;
	var tickStyle;
	var _checked;
	var txd_loader;

	function UIMenuCheckboxItem(str, substr, parentMenu, style, _active, mainColor, highlightColor, textColor, textHighlightColor, _enabled, _blink)
	{
		super(parentMenu,str,substr,_enabled);
		this.itemMC = this.parentMC.attachMovie("UIMenuCheckboxItem", "checkboxMenuItem_" + this._parentMenu.itemCount + 1, this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.checkbox = this.itemMC.createEmptyMovieClip("checkBox_" + this._parentMenu.itemCount + 1, this.itemMC.getNextHighestDepth());
		this.tickStyle = style;
		this.Checked = _active;
		this.blinkDesc = _blink;
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
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,this._enabled ? (!this.highlighted ? this._textColor : this._textHighlightColor) : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
		this.initBaseMouseInterface();
	}

	function mOverBox(mc)
	{
		if (!this.highlighted)
		{
			this._hovered = true;
			this.hover = 1;
		}
	}
	function mOutBox(mc)
	{
		if (this.highlighted)
		{
			this._hovered = false;
			this.hover = -1;
		}
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
		if (!this._enabled)
		{
			com.rockstargames.ui.utils.Colour.ApplyHudColour(target_mc,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
		}
		this.checkbox.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverBox, this.checkbox);
		this.checkbox.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutBox, this.checkbox);
		delete this.txd_loader;
	}

	function addPanel(_panel)
	{
		this.panels.push(_panel);
	}
	function set Checked(val)
	{
		this._checked = val;
		var sprite_name = this.getSprite(this.highlighted, this.tickStyle, this._checked);
		this.SetClip(this.checkbox,"commonmenu",sprite_name);
	}

	function get Checked()
	{
		return _checked;
	}

	function set highlighted(_h)
	{
		super.highlighted = _h;
		var sprite_name = this.getSprite(_h, this.tickStyle, this.Checked);
		this.SetClip(this.checkbox,"commonmenu",sprite_name);
		if (this._enabled)
		{
			for (var _panel in this.panels)
			{
				this.panels[_panel].isVisible = _h;
			}
		}
	}

	function getSprite(_highlighted, _style, _checked)
	{
		return _highlighted ? (_checked ? (_style == com.rockstargames.ScaleformUI.items.UIMenuCheckboxItem.CHECKBOX_STYLE_TICK ? "shop_box_tickb" : "shop_box_crossb") : "shop_box_blankb") : _checked ? (_style == com.rockstargames.ScaleformUI.items.UIMenuCheckboxItem.CHECKBOX_STYLE_TICK ? "shop_box_tick" : "shop_box_cross") : "shop_box_blank";
	}

	function get highlighted()
	{
		return super.highlighted;
	}

	function Select()
	{
		if (this.highlighted)
		{
			if (this.hover == 1)
			{
				this.Checked = !this.Checked;
			}
		}
		return this.Checked;
	}
}