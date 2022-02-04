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
	function FreemodeDetailsItem(_parentPanel, index, type, textLeft, textRight, param3, param4, param5, param6)
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
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.iconMC,_loc7_);
				if (param5 != undefined)
				{
					if (this.itemMC.checkMC)
					{
						this.itemMC.checkMC._visible = param5;
					}
				}
				break;
			case 3 :
				var _loc0_ = 2;
				this.itemMC.outlineMC._visible = true;
				this.itemMC.leftlabelMC._y = _loc0_ = 2;
				this.itemMC.labelMC._y = _loc0_;
				this.itemMC.bgMC._y = _loc0_;
				break;
			case 4 :
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
		}
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.leftlabelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
	}

	function SetRightBadge(id)
	{
		this.rightBadgeId = id;
		if (this.rightBadgeId != com.rockstargames.ScaleformUI.utils.Badges.NONE)
		{
			var sprite_name = com.rockstargames.ScaleformUI.utils.Badges.getSpriteNameById(id, false);
			var sprite_txd = com.rockstargames.ScaleformUI.utils.Badges.GetSpriteDictionary(id);
			this.SetClip(this.badgeLoader,sprite_txd,sprite_name,20,20);
		}
		else
		{
			if (this.badgeLoader.isLoaded)
			{
				this.badgeLoader.removeTxdRef();
			}
		}
	}

	function SetClip(targetMC, textureDict, textureName, w, h, x, y, callback)
	{
		var _loc12_ = true;
		if (targetMC.textureFilename != textureDict && targetMC.textureDict != textureName)
		{
			var _loc12_ = false;
		}
		targetMC.init("ScaleformUI",textureDict,textureName,w,h);
		var _loc7_ = 4;
		var _loc5_ = String(targetMC).split(".");
		var _loc8_ = _loc5_.slice(_loc5_.length - _loc7_).join(".");
		com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(targetMC);
		targetMC._alpha = 100;
		targetMC.requestTxdRef(_loc8_,false,callback,this);
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

}