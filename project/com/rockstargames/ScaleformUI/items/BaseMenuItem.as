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
	var _mainColor = 1291845632;// com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG
	var _highlightColor = -986896;// com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE
	var _textColor = com.rockstargames.ui.utils.HudColour.NONE;
	var _textHighlightColor = com.rockstargames.ui.utils.HudColour.NONE;
	var _hovered = false;
	var hover = -1;
	var _enabled = true;
	var panels;
	var blinkDesc = false;
	var sidePanel;

	function BaseMenuItem(parent, str, substr, _enabled)
	{
		this._parentMenu = parent;
		this.parentMC = this._parentMenu.scrollableContent;
		this.leftText = str;
		this.subtitle = substr;
		this.panels = new Array();
		this._hovered = false;
		this.Enabled = _enabled;
		this.blinkDesc = false;
	}

	function mOver()
	{
		if (!this._hovered)
		{
			this._hovered = true;
		}
		if (!this.highlighted)
		{
			var _loc1_ = new com.rockstargames.ui.utils.HudColour();
			com.rockstargames.ScaleformUI.utils.MovieClipHandler.HexToARGB(this._highlightColor,_loc1_);
			com.rockstargames.ui.utils.Colour.Colourise(this.backgroundMC,_loc1_.r,_loc1_.g,_loc1_.b,_loc1_.a - 80);
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
			com.rockstargames.ScaleformUI.utils.MovieClipHandler.ApplyHexColour(this.backgroundMC,this._mainColor);

			if (this._mainColor == 1291845632)
			{
				this.backgroundMC._alpha = 0;
			}
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
					if (this._mainColor != 1291845632)
					{
						var _loc1_ = new com.rockstargames.ui.utils.HudColour();
						com.rockstargames.ScaleformUI.utils.MovieClipHandler.HexToARGB(this._mainColor,_loc1_);
						com.rockstargames.ui.utils.Colour.Colourise(this.backgroundMC,_loc1_.r,_loc1_.g,_loc1_.b,_loc1_.a - 20);
					}
					else
					{
						this.backgroundMC._alpha = 0;
					}
				}
			}
			else
			{
				com.rockstargames.ScaleformUI.utils.MovieClipHandler.ApplyHexColour(this.backgroundMC,this._mainColor);
				if (this._mainColor == 1291845632)
				{
					this.backgroundMC._alpha = 0;
				}
			}
		}
		else
		{
			com.rockstargames.ScaleformUI.utils.MovieClipHandler.ApplyHexColour(this.backgroundMC,this._highlightColor);
		}
		//com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,this._enabled ? (!_h ? this._textColor : this._textHighlightColor) : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
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