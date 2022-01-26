class com.rockstargames.ScaleformUI.items.BaseMenuItem
{
	var disabledItemColor = [163, 159, 148];
	var isActive = true;
	var _highlighted;
	var itemMC;
	var backgroundMC;
	var subtitle;
	var _parentMenu;
	var leftTextTF;
	var leftText;
	var parentMC;
	var _mainColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG;// HUD_COLOUR_PAUSE_BG
	var _highlightColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;// HUD_COLOUR_WHITE
	var _textColor = com.rockstargames.ui.utils.HudColour.NONE;
	var _textHighlightColor = com.rockstargames.ui.utils.HudColour.NONE;
	var _hovered = false;
	var hover = -1;
	var _enabled = true;
	var panels;
	var blinkDesc = false;

	function BaseMenuItem(parent, str, substr, _enabled)
	{
		this._parentMenu = parent;
		this.parentMC = this._parentMenu._mainMC;
		this.leftText = str;
		this.subtitle = substr;
		this.panels = new Array();
		this._hovered = false;
		this.Enabled = _enabled;
		this.blinkDesc = false;
	}

	function initBaseMouseInterface()
	{
		this.backgroundMC.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOver);
		this.backgroundMC.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOut);
	}

	function mOver()
	{
		if (!this._hovered)
		{
			this._hovered = true;
		}
		if (!this.highlighted)
		{
			if (this._mainColor == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG)
			{
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.backgroundMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_HIGHLIGHT);
			}
			else
			{
				var col = new com.rockstargames.ui.utils.HudColour();
				com.rockstargames.ui.utils.Colour.setHudColour(this._mainColor,col);
				com.rockstargames.ui.utils.Colour.Colourise(this.backgroundMC,col.r,col.g,col.b,col.a - 20);
			}
		}
	}
	function mOut()
	{
		if (this._hovered)
		{
			this._hovered = false;
		}
		if (!this.highlighted)
		{
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
		if ((sizeOffset != undefined))
		{
			_loc3_ = sizeOffset;
		}
		var _loc2_ = com.rockstargames.ui.utils.UIText.SIZE - _loc3_;
		if ((sizeOverride != undefined))
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
		if (!_h)
		{
			if (this._hovered)
			{
				if (!this.highlighted)
				{
					if (this._mainColor == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG)
					{
						com.rockstargames.ui.utils.Colour.ApplyHudColour(this.backgroundMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_HIGHLIGHT);
					}
					else
					{
						var col = new com.rockstargames.ui.utils.HudColour();
						com.rockstargames.ui.utils.Colour.setHudColour(this._mainColor,col);
						com.rockstargames.ui.utils.Colour.Colourise(this.backgroundMC,col.r,col.g,col.b,col.a - 20);
					}
				}
			}
			else
			{
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.backgroundMC,this._mainColor);
			}
		}
		else
		{
			com.rockstargames.ui.utils.Colour.ApplyHudColour(this.backgroundMC,this._highlightColor);
		}
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,this._enabled ? (!_h ? this._textColor : this._textHighlightColor) : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
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

	function set Enabled(e)
	{
		this._enabled = e;
	}
	function get Enabled()
	{
		return this._enabled;
	}
}