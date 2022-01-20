class com.rockstargames.ScaleformUI.items.UIMenuItem extends com.rockstargames.ScaleformUI.items.BaseMenuItem
{
	var rightTextTF;
	var rightText;
	//var rightTextColor = this._textColor;
	var rightBadgeMC;
	var rightBadgeId = com.rockstargames.ScaleformUI.utils.Badges.NONE;
	var _data;
	var txd_loader;

	function UIMenuItem(str, substr, parentMenu, mainColor, highlightColor, textColor, textHighlightColor, _enabled, _blink)
	{
		super(parentMenu,str,substr,_enabled);
		this.itemMC = this.parentMC.attachMovie("UIMenuItem", "menuItem_" + this._parentMenu.itemCount + 1, this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.rightTextTF = this.itemMC.RLabelMC.labelTF;
		this.blinkDesc = _blink;
		if ((mainColor != undefined))
		{
			this._mainColor = mainColor;
		}
		if ((highlightColor != undefined))
		{
			this._highlightColor = highlightColor;
		}
		if ((textColor != undefined))
		{
			this._textColor = textColor;
		}
		if ((textHighlightColor != undefined))
		{
			this._textHighlightColor = textHighlightColor;
		}
		com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,this.leftText,true,true);
		if (this._textColor != com.rockstargames.ui.utils.HudColour.NONE && this._textHighlightColor != com.rockstargames.ui.utils.HudColour.NONE)
		{
			com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,!this.highlighted ? this._textColor : this._textHighlightColor);
		}
		this.initBaseMouseInterface();
	}


	function SetRightText(str)
	{
		this.rightText = str;
		this.setRightText(this.rightTextTF,this.rightText);
	}

	function SetRightBadge(txd, id)
	{
		this.rightBadgeId = id;
		if (this.rightBadgeId != com.rockstargames.ScaleformUI.utils.Badges.NONE)
		{
			this.itemMC.RLabelMC._x -= 24;
			this.rightBadgeMC = this.itemMC.createEmptyMovieClip((("badge_" + this._parentMenu.itemCount) + 1), this.itemMC.getNextHighestDepth());
			var sprite_name = com.rockstargames.ScaleformUI.utils.Badges.getSpriteNameById(id, this.highlighted);
			this.SetClip(this.rightBadgeMC,txd,sprite_name);
		}
		else
		{
			removeMovieClip(this.rightBadgeMC);
			this.itemMC.RLabelMC._x += 24;
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
		target_mc._x = 263.5;
		target_mc._y = 0.5;
		delete this.txd_loader;
	}

	function addPanel(_panel)
	{
		this.panels.push(_panel);
	}

	function set highlighted(_h)
	{
		super.highlighted = _h;
		if (this._enabled)
		{
			if (this._textColor != com.rockstargames.ui.utils.HudColour.NONE && this._textHighlightColor != com.rockstargames.ui.utils.HudColour.NONE)
			{
				com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rightTextTF,this._enabled ? (!_h ? this._textColor : this._textHighlightColor) : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
			}
		}
		if (this.rightBadgeMC != undefined)
		{
			var txd = com.rockstargames.ScaleformUI.utils.Badges.GetSpriteDictionary(this.rightBadgeId);
			var sprite_name = com.rockstargames.ScaleformUI.utils.Badges.getSpriteNameById(this.rightBadgeId, _h);
			this.SetClip(this.rightBadgeMC,txd,sprite_name);
			if (this.rightBadgeId == 1 || this.rightBadgeId == 4 || this.rightBadgeId == 26)
			{
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rightBadgeMC,com.rockstargames.ScaleformUI.utils.Badges.BadgeToColor(this.rightBadgeId, _h));
			}
		}
		if (this._enabled)
		{
			for (var _panel in this.panels)
			{
				this.panels[_panel].isVisible = _h;
			}
		}
	}
}