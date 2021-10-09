class com.rockstargames.NativeUI.items.BaseMenuItem
{
	var disabledItemColor = [163, 159, 148];
	var isActive = true;
	var _highlighted;
	var _width = 288;
	var _height = 25;
	var itemMC;
	var backgroundMC;
	var subtitle;
	var _parentMenu;
	var leftTextTF;
	var leftText;
	var parentMC;
	var _mainColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG;// HUD_COLOUR_PAUSE_BG
	var _highlightColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;// HUD_COLOUR_WHITE
	var _textColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
	var _textHighlightColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
	var _mouseCatcher;
	var _hovered;
	var panels = new Array();
	function BaseMenuItem(parent, str, substr)
	{
		this._parentMenu = parent;
		this.parentMC = this._parentMenu._mainMC;
		this.leftText = str;
		this.subtitle = substr;
	}

	function initBaseMouseInterface()
	{
		this.backgroundMC.onRelease = mx.utils.Delegate.create(this, this.mPress);
		this.backgroundMC.onRollOver = mx.utils.Delegate.create(this, this.mOver);
		this.backgroundMC.onRollOut = mx.utils.Delegate.create(this, this.mOut);
	}

	function mPress()
	{
		for (var item in this._parentMenu.menuItems)
		{
			if (this._parentMenu.menuItems[item].leftText == this.leftText && this._parentMenu.menuItems[item].subtitle == this.subtitle)
			{
				if (!this._parentMenu.menuItems[item].highlighted)
				{
					this._parentMenu.currentSelection = item;
				}
			}
		}
	}
	function mOver()
	{
		if (!this.highlighted)
		{
			if (!this._hovered)
			{
				this._hovered = true;
			}
			com.rockstargames.ui.utils.Colour.ApplyHudColour(this.backgroundMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_HIGHLIGHT);
		}
	}
	function mOut()
	{
		if (!this.highlighted)
		{
			if (this._hovered)
			{
				this._hovered = false;
			}
			com.rockstargames.ui.utils.Colour.ApplyHudColour(this.backgroundMC,this._mainColor);
		}
	}


	function setRightText(tf, str, autoShrink, sizeOffset, sizeOverride)
	{
		tf.wordWrap = false;
		tf.multiline = false;
		tf.html = true;
		tf.autoSize = "right";
		var _loc3_ = 0;
		if (sizeOffset != undefined)
		{
			_loc3_ = sizeOffset;
		}
		var _loc2_ = com.rockstargames.ui.utils.UIText.SIZE - _loc3_;
		if (sizeOverride != undefined)
		{
			_loc2_ = sizeOverride;
		}
		tf.htmlText = "<FONT SIZE=\'" + _loc2_ + "\'>" + str + "</FONT>";
		tf.verticalAlign = "center";
		if (autoShrink)
		{
			tf.textAutoSize = "shrink";
		}
	}

	function getColour(col)
	{
		var _loc1_ = new com.rockstargames.ui.utils.HudColour();
		var _loc2_ = com.rockstargames.ui.utils.HudColour[col];
		if (isNaN(_loc2_))
		{
			_loc2_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
		}
		com.rockstargames.ui.utils.Colour.setHudColour(_loc2_,_loc1_);
		return _loc1_.r * 65536 + _loc1_.g * 256 + _loc1_.b;
	}

	function set highlighted(_h)
	{
		this._highlighted = _h;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.backgroundMC,!_h ? this._mainColor : this._highlightColor);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,!_h ? this._textColor : this._textHighlightColor);
	}

	function get highlighted()
	{
		return this._highlighted;
	}

	function set enabled(e)
	{
		this.isActive = e;
	}
	function get enabled()
	{
		return this.isActive;
	}
	function set isVisible(_v)
	{
		this.itemMC._visible = _v;
	}
	function get isVisible()
	{
		return this.itemMC._visible;
	}
}