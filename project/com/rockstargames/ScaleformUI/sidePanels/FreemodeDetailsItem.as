class com.rockstargames.ScaleformUI.sidePanels.FreemodeDetailsItem
{
	var basetextW = 266;
	var itemMC;
	var parentPanel;
	var itemTextRight;
	var itemTextLeft;
	var _highlighted;
	var _type;
	var rightBadgeId;
	var badgeLoader;
	var labelFont;
	var rightLabelFont;

	function FreemodeDetailsItem(_parentPanel, index, type, textLeft, textRight, param3, param4, param5, param6, param7, param8, param9, param10)
	{
		this.parentPanel = _parentPanel;
		this.itemMC = this.parentPanel.itemMC.attachMovie("freemodeDetailsItem", "detailsItem_" + this.parentPanel.itemMC.getNextHighestDepth(), this.parentPanel.itemMC.getNextHighestDepth());
		this.itemMC.outlineMC._visible = false;
		this.itemTextRight = this.itemMC.labelMC.valueTF;
		this.itemTextLeft = this.itemMC.leftlabelMC.titleTF;
		this.basetextW = this.itemMC.itemTextLeft._width;
		this.itemMC.labelMC.scIconMC._visible = false;
		this._type = type;
		this.itemMC.bgMC._visible = false;

		if (this.itemMC.checkMC)
		{
			this.itemMC.checkMC._visible = false;
			com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.checkMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
		}
		this.itemMC.labelMC.nameTF.textAutoSize = "shrink";

		com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,textLeft,true);
		com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,textRight,true);

		this.snapBGGrid(this.itemMC.bgMC);

		if (this._type >= 0 && this._type < 3)
		{
			if (index % 2 == 1)
			{
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
				this.itemMC.bgMC._alpha = 20;
				this.itemMC.bgMC._height = 25;
				this.itemMC.bgMC._y = 2;
				this.itemMC.bgMC._visible = true;
			}
		}

		switch (this._type)
		{
			case 0 :
			case 1 :
				this.itemTextRight._width = 288 - (this.itemTextLeft._x + this.itemTextLeft.textWidth + 25);
				this.itemTextRight._x = 288 - this.itemTextRight._width - 6;
				this.updateLabelFont(param6,param7);
				this.updateRightLabelFont(param8,param9);
				break;
			case 2 :
				this.badgeLoader = this.itemMC.iconMC.attachMovie("txdLoader", "badge", this.itemMC.iconMC.getNextHighestDepth());
				this.SetRightBadge(param3);
				this.itemMC.iconMC._x = 261;
				this.itemMC.iconMC._y = 3;
				var _loc8_ = 5;
				this.itemTextRight._x = this.itemMC.iconMC._x - this.itemMC.iconMC.badge._width - 132 - _loc8_;
				var _loc7_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
				if (param4 != undefined)
				{
					_loc7_ = param4;
				}
				com.rockstargames.ScaleformUI.utils.MovieClipHandler.ApplyHexColour(this.itemMC.iconMC,_loc7_);
				if (param5 != undefined)
				{
					if (this.itemMC.checkMC)
					{
						this.itemMC.checkMC._visible = param5;
					}
				}
				this.updateLabelFont(param6,param7);
				this.updateRightLabelFont(param8,param9);
				break;
			case 3 :
				var _loc0_ = 2;
				this.itemMC.outlineMC._visible = true;
				this.itemMC.leftlabelMC._y = _loc0_ = 2;
				this.itemMC.labelMC._y = _loc0_;
				this.itemMC.bgMC._y = _loc0_;
				this.updateLabelFont(param6,param7);
				this.updateRightLabelFont(param8,param9);
				break;
			case 4 :
				this.itemMC.outlineMC._visible = this.parentPanel.listDescItem > 0;
				var _loc9_ = textLeft;
				var _loc5_ = this.itemTextLeft.getTextFormat();
				_loc5_.size = com.rockstargames.ui.utils.UIText.SIZE;
				this.itemTextLeft.setNewTextFormat(_loc5_);
				this.itemTextLeft.wordWrap = true;
				this.itemTextLeft.multiline = true;
				this.itemTextLeft.autoSize = true;
				this.itemTextLeft.text = _loc9_;
				if (this.itemTextLeft._height > 100)
				{
					this.itemTextLeft.autoSize = false;
					this.itemTextLeft._height = 100;
					while (this.itemTextLeft.textHeight > this.itemTextLeft._height)
					{
						var _loc3_ = this.itemTextLeft.text.substr(0, this.itemTextLeft.text.length - 4) + "...";
						this.itemTextLeft.text = _loc3_;
					}
					this.itemTextLeft.autoSize = true;
				}
				this.itemTextLeft._y = -2;
				this.itemTextRight._visible = false;
				this.itemMC.bgMC._height = this.itemTextLeft.textHeight <= 0 ? 0 : this.itemTextLeft.textHeight + 16;
				this.updateLabelFont(param6,param7);
		}
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.leftlabelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
	}

	function updateLabelFont(fontName, fontId)
	{
		this.labelFont = new Array(fontName, fontId);
		var newFont = this.itemMC.leftlabelMC.titleTF.getTextFormat();
		newFont.font = this.labelFont[0];
		this.itemMC.leftlabelMC.titleTF.embedFonts = true;
		this.itemMC.leftlabelMC.titleTF.antiAliasType = "advanced";
		this.itemMC.leftlabelMC.titleTF.selectable = false;
		this.itemMC.leftlabelMC.titleTF.setNewTextFormat(newFont);
		this.itemMC.leftlabelMC.titleTF.setTextFormat(newFont);
	}

	function updateRightLabelFont(fontName, fontId)
	{
		this.rightLabelFont = new Array(fontName, fontId);
		var newFont = this.itemMC.labelMC.valueTF.getTextFormat();
		newFont.font = this.rightLabelFont[0];
		this.itemMC.labelMC.valueTF.embedFonts = true;
		this.itemMC.labelMC.valueTF.antiAliasType = "advanced";
		this.itemMC.labelMC.valueTF.selectable = false;
		this.itemMC.labelMC.valueTF.setNewTextFormat(newFont);
		this.itemMC.labelMC.valueTF.setTextFormat(newFont);
	}


	function SetRightBadge(id)
	{
		this.rightBadgeId = id;
		if (this.rightBadgeId != com.rockstargames.ScaleformUI.utils.Badges.NONE)
		{
			var sprite_name = com.rockstargames.ScaleformUI.utils.Badges.getSpriteNameById(id, false);
			var sprite_txd = com.rockstargames.ScaleformUI.utils.Badges.GetSpriteDictionary(id);
			com.rockstargames.ScaleformUI.utils.MovieClipHandler.SetClip(this.badgeLoader,sprite_txd,sprite_name,20,20);
		}
		else
		{
			if (this.badgeLoader.isLoaded)
			{
				this.badgeLoader.removeTxdRef();
			}
		}
	}

	function snapBGGrid(bgMC)
	{
		var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
		bgMC._height = _loc2_ * 27 - 2;
	}
	function set highlighted(_h)
	{
		this._highlighted = _h;
	}

	function get highlighted()
	{
		return this._highlighted;
	}

	function Clear()
	{
		if (this.badgeLoader != undefined)
		{
			if (this.badgeLoader.isLoaded)
			{
				this.badgeLoader.removeTxdRef();
			}
		}
		this.itemMC.removeMovieClip();
	}

}