class com.rockstargames.ScaleformUI.UIMenu
{
	var subCounterFont;
	var _mainMC;
	var menuItems;
	var windows;
	var BannerSprite;
	var BodySprite;
	var DescriptionSprite;
	var SubtitleSprite;
	var SubtitleText;
	var CounterText;
	var BannerTitle;
	var _menuTitle;
	var _menuSubtitle;
	var Footer;
	var maxItemsOnScreen = 6;
	var _currentItem;
	var _activeItem = 0;
	var itemCount = 0;
	var windowsCount = 0;
	var _minItem = 0;
	var _maxItem = this.maxItemsOnScreen;
	var isVisible = false;
	var _bannerTxd = "commonmenu";
	var _bannerTexture = "interaction_bgd";
	var _bodyTexture = "gradient_bgd";
	var _upAndDownArrows = "shop_arrows_upanddown";
	var txd_loader;
	var mouseOn;
	var _menuOff = [];
	var blipLayer;
	var itemsBG;
	var scrollableContent;
	var _itemsOffset;
	var viewHeight;
	var EnableAnim;
	var AnimType;

	function UIMenu(mc, title, subtitle, alternative, x, y, txd, txn, enableAnim, animType)
	{
		this._menuOff = new Array(x, y);
		this.menuItems = new Array();
		this.windows = new Array();
		this._mainMC = mc;
		this._menuTitle = title;
		this._menuSubtitle = subtitle;
		this._maxItem = this.maxItemsOnScreen;
		this._minItem = 0;
		this.itemCount = 0;

		this.BannerSprite = this._mainMC.attachMovie("BannerSprite", "bannerSpriteMC", this._mainMC.getNextHighestDepth());
		this.BannerSprite._x = 0 + this._menuOff[0];
		this.BannerSprite._y = 0 + this._menuOff[1];
		this.BannerSprite._width = 288;
		this.BannerSprite._height = 65;
		this._bannerTxd = txd;
		this._bannerTexture = txn;

		var banner = this.BannerSprite.bannerBG.attachMovie("txdLoader", "bannerSprite", this.BannerSprite.bannerBG.getNextHighestDepth());
		var _alreadyLoaded = true;
		if (banner.textureFilename != txn && banner.textureDict != txd)
		{
			_alreadyLoaded = false;
		}
		this._bannerTxd = txd;
		this._bannerTexture = txn;
		if (banner.isLoaded)
		{
			banner.removeTxdRef();
		}
		banner.init("ScaleformUI",txd,txn,288,54.75);
		var _loc7_ = 3;
		var _loc5_ = String(banner).split(".");
		var _loc8_ = _loc5_.slice(_loc5_.length - _loc7_).join(".");
		com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(banner);
		banner._alpha = 100;
		banner.requestTxdRef(_loc8_,_alreadyLoaded,this.bannerLoaded,this);
		if (this._menuTitle != undefined && this._menuTitle != "")
		{
			if (!alternative)
			{
				var bannerFont = new TextFormat("$Font5", 31);
				bannerFont.align = "center";
				this.BannerTitle = this.BannerSprite.titleMC.labelTF;
				this.BannerTitle.embedFonts = true;
				this.BannerTitle.antiAliasType = "advanced";
				this.BannerTitle.selectable = false;
				com.rockstargames.ui.utils.UIText.setSizedText(this.BannerSprite.titleMC.labelTF,this._menuTitle,true,true,31,31);
			}
			else
			{
				var bannerFont = new TextFormat("$Font2_cond_NOT_GAMERNAME", 31);
				bannerFont.align = "left";
				bannerFont.bold = true;
				this.BannerTitle = this.BannerSprite.titleMC.labelTF2;
				this.BannerTitle.embedFonts = true;
				this.BannerTitle.antiAliasType = "advanced";
				this.BannerTitle.selectable = false;
				com.rockstargames.ui.utils.UIText.setSizedText(this.BannerSprite.titleMC.labelTF2,this._menuTitle,true,true,31,31);
			}
		}

		this.SubtitleSprite = this._mainMC.attachMovie("SubtitleSprite", "subtitleSprite", this._mainMC.getNextHighestDepth());
		this.SubtitleSprite._x = 0 + this._menuOff[0];
		this.SubtitleSprite._y = this.BannerSprite._y + this.BannerSprite._height - 1;
		this.SubtitleSprite._width = 288;
		this.SubtitleSprite._height = 25;
		this.SubtitleText = this.SubtitleSprite.subtitleMC.labelTF;
		this.SubtitleText.embedFonts = true;
		this.SubtitleText.autoSize = true;
		this.SubtitleText.antiAliasType = "advanced";
		this.SubtitleText.selectable = false;
		if (this._menuSubtitle != undefined && this._menuSubtitle != "")
		{
			com.rockstargames.ui.utils.UIText.setSizedText(this.SubtitleText,this._menuSubtitle,true,true);
		}
		this.CounterText = this.SubtitleSprite.counterMC.labelTF;
		this.CounterText.antiAliasType = "advanced";
		this.CounterText.selectable = false;
		com.rockstargames.ui.utils.UIText.setSizedText(this.CounterText,"0/0",true,true);

		this.itemsBG = this._mainMC.attachMovie("backgroundBody", "backgroundBody_" + this._mainMC.getNextHighestDepth(), this._mainMC.getNextHighestDepth());
		this.itemsBG._x = 0 + this._menuOff[0];
		this.itemsBG._y = this.SubtitleSprite._y + this.SubtitleSprite._height - 1;
		this.itemsBG.bgMC._height = 0;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemsBG.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		this.itemsBG.bgMC._alpha = 0;
		this.scrollableContent = this.itemsBG.createEmptyMovieClip("viewContainer", this.itemsBG.getNextHighestDepth());
		this.itemsBG.setMask(this.itemsBG.maskMC);
		//this.itemsBG._visible = false;
		this._itemsOffset = this.itemsBG._y + this.itemsBG.bgMC._height;

		this.Footer = this._mainMC.attachMovie("Footer", "footer", this._mainMC.getNextHighestDepth());
		this.Footer._visible = false;
		this.DescriptionSprite = this._mainMC.attachMovie("DescriptionBG", "descriptionSprite", this._mainMC.getNextHighestDepth());
		var _loc3_ = new com.rockstargames.ui.utils.HudColour();
		com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
		com.rockstargames.ui.utils.Colour.Colourise(this.DescriptionSprite.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
		this.DescriptionSprite._visible = false;
		this.EnableAnim = enableAnim;
		this.AnimType = animType;
	}

	function addItem(id, str, substr, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13)
	{
		var _selectedItem = this.currentSelection;
		var item;
		if (id == 5)
		{
			item = new com.rockstargames.ScaleformUI.items.UIMenuStatsItem(id, str, substr, this, param1, param2, param3, param4, param5, param6, param7, param8, param9);
		}
		else
		{
			item = new com.rockstargames.ScaleformUI.items.UIMenuItem(id, str, substr, this, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13);
		}
		this.itemCount = this.menuItems.push(item);
		if (this.itemCount == 1)
		{
			item.itemMC._y = 0;
		}
		else if (this.itemCount > 1)
		{
			item.itemMC._y = this.menuItems[this.itemCount - 1].itemMC._y + this.menuItems[this.itemCount - 1].itemMC._height;
		}
		this.itemsBG.bgMC._height += item.itemMC._height;
		if (this.itemsBG.bgMC._height > 175)
		{
			this.itemsBG.bgMC._height = 175;
		}
		this._itemsOffset = this.itemsBG._y + this.itemsBG.bgMC._height;
		this.currentSelection = _selectedItem;
		this.updateItemsDrawing();
	}

	function addPanel(item, id, param1, param2, param3, param4, param5, param6, param7, param8)
	{
		var panel;
		var selectItem = this.menuItems[item];
		switch (id)
		{
			case 0 :
				panel = new com.rockstargames.ScaleformUI.panels.UIMenuColorPanel(selectItem, param1, param2, param3, param4);
				break;
			case 1 :
				panel = new com.rockstargames.ScaleformUI.panels.UIMenuPercentagePanel(selectItem, param1, param2, param3, param4);
				break;
			case 2 :
				panel = new com.rockstargames.ScaleformUI.panels.UIMenuGridPanel(selectItem, param1, param2, param3, param4, param5, param6, param7, param8);
				break;
			case 3 :
				panel = new com.rockstargames.ScaleformUI.panels.UIMenuStatsPanel(selectItem);
				break;
		}
		selectItem.addPanel(panel);
		if (!selectItem.highlighted)
		{
			panel.isVisible = false;
		}
		this.updateItemsDrawing();
	}

	function addWindow(id, param0, param1, param2, param3, param4, param5, param6, param7, param8, param9)
	{
		var wind;
		switch (id)
		{
			case 0 :
				wind = new com.rockstargames.ScaleformUI.windows.UIMenuHeritageWindow(this, param0, param1);
				break;
			case 1 :
				wind = new com.rockstargames.ScaleformUI.windows.UIMenuDetailsWindow(this, param0, param1, param2, param3, param4, param5, param6, param7, param8, param9);
				break;
		}
		this.windowsCount = this.windows.push(wind);
		wind.itemMC._x = this._menuOff[0];
		if (this.windowsCount == 1)
		{
			wind.itemMC._y = this.SubtitleSprite._y + this.SubtitleSprite._height + 1;
		}
		else if (this.windowsCount > 1)
		{
			wind.itemMC._y = this.itemsBG._y;
		}
		this.itemsBG._y = wind.itemMC._y + wind.itemMC._height + 1;
		this._itemsOffset = this.itemsBG._y + this.itemsBG.bgMC._height;
		this.updateItemsDrawing();
	}

	function addSidePanel(item, idx, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
	{
		var panel;
		switch (idx)
		{
			case 0 :
				panel = new com.rockstargames.ScaleformUI.sidePanels.MissionDetailsPanel(this, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10);
				break;
			case 1 :
				panel = new com.rockstargames.ScaleformUI.sidePanels.ColourPickerPanel(this, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10);
				break;
		}
		this.menuItems[item].addSidePanel(panel);
		if (!this.menuItems[item].highlighted)
		{
			panel.isVisible = false;
		}
		this.updateItemsDrawing();
	}

	function ScrollMenu(targetIndex, end, offset)
	{
		if (end == undefined)
		{
			end = false;
		}
		if (offset != undefined)
		{
			_loc2_ = offset;
		}
		else
		{
			var _loc2_ = this.scrollableContent._y;
			switch (targetIndex)
			{
				case 1 :
					_loc2_ = _loc2_ - this.currentItem.itemMC._height;
					if (end)
					{
						_loc2_ = 0;
					}
					else
					{
						if (_loc2_ <= -this.scrollableContent._height - 175)
						{
							_loc2_ = -this.scrollableContent._height - 175;
						}
					}
					break;
				case -1 :
					_loc2_ = _loc2_ + this.currentItem.itemMC._height;
					if (end)
					{
						_loc2_ = -(this.scrollableContent._height - 175);
					}
					else
					{
						if (_loc2_ >= 0)
						{
							_loc2_ = 0;
						}
					}
					break;
			}
		}
		if (this.EnableAnim)
		{
			com.rockstargames.ui.tweenStar.TweenStarLite.to(this.scrollableContent,0.2,{_y:_loc2_, onCompleteScope:this, onComplete:this.scrollComplete, onCompleteArgs:[targetIndex, end, _loc2_], ease:this.AnimType});
		}
		else
		{
			this.scrollableContent._y = _loc2_;
		}
	}

	function scrollComplete(dir, end, posy)
	{
		if (!end)
		{
			if (dir == 1)
			{
				if (this.scrollableContent._y != 175 - (this.currentItem.itemMC._y + this.currentItem.itemMC._height))
				{
					this.scrollableContent._y = 175 - (this.currentItem.itemMC._y + this.currentItem.itemMC._height);
				}
			}
			else if (dir == -1)
			{
				if (this.scrollableContent._y != -this.currentItem.itemMC._y)
				{
					this.scrollableContent._y = -this.currentItem.itemMC._y;
				}
			}
		}
	}

	function goUp()
	{
		if (this.itemCount > this.maxItemsOnScreen + 1)
		{
			if (this.currentSelection == 0)
			{
				this._activeItem = 1000 - (1000 % this.itemCount);
				this._activeItem += this.itemCount - 1;
				this.ScrollMenu(-1,true);
				if (this.currentItem._type == 6)
				{
					if (this.currentItem.jumpable)
					{
						this._activeItem--;
						if (this.scrollableContent._y < -this.currentItem.itemMC._y)
						{
							this.ScrollMenu(-1);
						}
					}
				}
			}
			else
			{
				this._activeItem--;
				if (this.scrollableContent._y < -this.currentItem.itemMC._y)
				{
					this.ScrollMenu(-1);
				}
				if (this.currentItem._type == 6)
				{
					if (this.currentItem.jumpable)
					{
						this._activeItem--;
						if (this.scrollableContent._y < -this.currentItem.itemMC._y)
						{
							this.ScrollMenu(-1);
						}
					}
				}
			}
		}
		else
		{
			this._activeItem--;
			if (this.currentItem._type == 6)
			{
				if (this.currentItem.jumpable)
				{
					this._activeItem--;
				}
			}
		}
		this.updateItemsDrawing();
		com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET");
		return this.currentSelection;
	}

	function goDown()
	{
		if (this.itemCount > this.maxItemsOnScreen + 1)
		{
			if (this.currentSelection == this.itemCount - 1)
			{
				this._activeItem = 1000 - (1000 % this.itemCount);
				this.ScrollMenu(1,true);
				if (this.currentItem._type == 6)
				{
					if (this.currentItem.jumpable)
					{
						this._activeItem++;
						if (this.scrollableContent._y < -this.currentItem.itemMC._y)
						{
							this.ScrollMenu(1);
						}
					}
				}
			}
			else
			{
				this._activeItem++;
				if (this.scrollableContent._y > 175 - (this.currentItem.itemMC._y + this.currentItem.itemMC._height))
				{
					this.ScrollMenu(1);
				}
				if (this.currentItem.jumpable)
				{
					this._activeItem++;
					if (this.scrollableContent._y < -this.currentItem.itemMC._y)
					{
						this.ScrollMenu(1);
					}
				}
			}
		}
		else
		{
			this._activeItem++;
			if (this.currentItem.jumpable)
			{
				this._activeItem++;
			}
		}
		this.updateItemsDrawing();
		com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET");
		return this.currentSelection;
	}

	function goLeft()
	{
		var retVal = -1;
		if (this.currentItem._type == 1 || this.currentItem._type == 3 || this.currentItem._type == 4)
		{
			this.currentItem.Value--;
			retVal = this.currentItem.Value;
		}
		else if (this.currentItem instanceof com.rockstargames.ScaleformUI.items.UIMenuStatsItem)
		{
			this.currentItem.barscale--;
			retVal = this.currentItem.barscale;
		}
		this.updateItemsDrawing();
		com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_LEFT_RIGHT","HUD_FRONTEND_DEFAULT_SOUNDSET");
		return retVal;
	}

	function goRight()
	{
		var retVal = -1;
		if (this.currentItem._type == 1 || this.currentItem._type == 3 || this.currentItem._type == 4)
		{
			this.currentItem.Value++;
			retVal = this.currentItem.Value;
		}
		else if (this.currentItem instanceof com.rockstargames.ScaleformUI.items.UIMenuStatsItem)
		{
			this.currentItem.barscale++;
			retVal = this.currentItem.barscale;
		}
		this.updateItemsDrawing();
		com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_LEFT_RIGHT","HUD_FRONTEND_DEFAULT_SOUNDSET");
		return retVal;
	}

	function updateItemsDrawing()
	{
		this.itemsBG._x = 0 + this._menuOff[0];
		for (var item in this.menuItems)
		{
			this.menuItems[item].highlighted = false;
			this.menuItems[item].highlighted = (item == this.currentSelection);
			if (item == 0)
			{
				this.menuItems[item].itemMC._y = 0;
			}
			else if (item > 0)
			{
				this.menuItems[item].itemMC._y = this.menuItems[item - 1].itemMC._y + this.menuItems[item - 1].itemMC._height;
			}
		}

		if (this.currentItem._enabled)
		{
			if (this.currentItem.sidePanel != undefined)
			{
				this.currentItem.sidePanel.itemMC._y = this._menuOff[1];
				if (this.currentItem.sidePanel._titleType == 2)
				{
					this.currentItem.sidePanel.itemMC._y = this._menuOff[1] - 65;
				}

				if (this.currentItem.sidePanel.LeftRightSide == 0)
				{
					this.currentItem.sidePanel.itemMC._x = this._menuOff[0] - this.currentItem.sidePanel.itemMC._width - 1;
				}
				else
				{
					this.currentItem.sidePanel.itemMC._x = this._menuOff[0] + 288 + 1;
				}
			}


		}
		this.updateDescription();
		com.rockstargames.ui.utils.UIText.setSizedText(this.CounterText,this.currentSelection + 1 + "/" + this.itemCount,true,true);
	}

	function updateDescription()
	{
		var offset = this._itemsOffset;
		if (this.itemCount > this.maxItemsOnScreen + 1)
		{
			if (this.Footer == undefined)
			{
				this.Footer = this._mainMC.attachMovie("Footer", "footer", this._mainMC.getNextHighestDepth());
			}
			this.Footer._visible = true;
			this.Footer._x = 0 + this._menuOff[0];
			this.Footer._y = offset + 1;
		}

		if (this.currentItem._enabled)
		{
			if (this.currentItem.panels.length > 0)
			{
				var _offset = offset + 2;
				if (this.Footer._visible)
				{
					_offset += this.Footer._height;
				}
				for (var i = 0; i < this.currentItem.panels.length; i++)
				{
					this.currentItem.panels[i].itemMC._x = 0 + this._menuOff[0];
					this.currentItem.panels[i].itemMC._y = _offset;
					_offset += this.currentItem.panels[i].itemMC._height + 1;
				}
				offset = _offset;
			}
			else
			{
				if (this.Footer._visible)
				{
					offset += this.Footer._height + 1;
				}
			}
		}
		else
		{
			if (this.Footer._visible)
			{
				offset += this.Footer._height + 1;
			}
		}
		if (this.currentItem.subtitle != undefined && this.currentItem.subtitle != "")
		{
			this.DescriptionSprite._x = 0 + this._menuOff[0];
			this.DescriptionSprite._y = offset + 1;
			this.DescriptionSprite._visible = true;
			var textBlips = new com.rockstargames.ui.utils.Text();
			var format = this.DescriptionSprite.descriptionMC.descText.getTextFormat();
			//com.rockstargames.ui.utils.UIText.setDescText(this.DescriptionSprite.descriptionMC.descText,this.currentItem.subtitle,true);
			if (this.blipLayer)
			{
				this.blipLayer.removeMovieClip();
			}
			this.DescriptionSprite.descriptionMC.descText.wordWrap = true;
			this.DescriptionSprite.descriptionMC.descText.autoSize = "left";
			this.blipLayer = this.DescriptionSprite.descriptionMC.createEmptyMovieClip("blipLayer", this.DescriptionSprite.descriptionMC.getNextHighestDepth(), {_x:this.DescriptionSprite.descriptionMC.descText._x, _y:this.DescriptionSprite.descriptionMC.descText._y});
			textBlips.setTextWithIcons(this.currentItem.subtitle,this.blipLayer,this.DescriptionSprite.descriptionMC.descText,0,format.size,2,false);
			this.DescriptionSprite.descriptionMC.descText.setTextFormat(format);
			if (this.currentItem.blinkDesc)
			{
				if (this.DescriptionSprite.iMC._currentframe == 1)
				{
					this.DescriptionSprite.iMC.gotoAndPlay(2);
				}
			}
			else
			{
				this.DescriptionSprite.iMC.gotoAndStop(1);
			}
			this.DescriptionSprite.bgMC._height = this.DescriptionSprite.descriptionMC.descText.textHeight + 12;
		}
		else
		{
			this.DescriptionSprite._visible = false;
			this.DescriptionSprite.iMC.gotoAndStop(1);
		}
	}

	function get currentItem()
	{
		return this.menuItems[this.currentSelection];
	}
	function set currentItem(item)
	{
		var limit = this.UIMenu.itemCount - 1;
		var counter = 0;
		if (this.itemCount > this.maxItemsOnScreen + 1)
		{
			limit = this._maxItem;
		}

		for (var i = this._minItem; i <= limit; i++)
		{
			if (this.menuItems[i].leftText == item.leftText && this.menuItems[i].subtitle == item.subtitle)
			{
				this.currentSelection = i;
			}
		}
	}

	function get currentSelection()
	{
		if (this.itemCount == 0)
		{
			return 0;
		}
		return this._activeItem % this.itemCount;

	}

	function set currentSelection(val)
	{
		var dir = -1;
		if (this.itemCount == 0)
		{
			this._activeItem = 0;
			return;
		}
		if (val < this.currentSelection)
		{
		}
		else if (val > this.currentSelection)
		{
		}
		this._activeItem = 1000000 - (1000000 % this.itemCount) + val;
		if (this.currentSelection > this._maxItem)
		{
			dir = 175 - (this.currentItem.itemMC._y + this.currentItem.itemMC._height);
			this._maxItem = this.currentSelection;
			this._minItem = this.currentSelection - this.maxItemsOnScreen;
		}
		else if (this.currentSelection < this._minItem)
		{
			dir = -this.currentItem.itemMC._y;
			this._maxItem = this.maxItemsOnScreen + this.currentSelection;
			this._minItem = this.currentSelection;
		}
		this.ScrollMenu(0,0,dir);
		this.updateItemsDrawing();
	}

	function SetClip(targetMC, textureDict, textureName)
	{
		this.txd_loader = new MovieClipLoader();
		this.txd_loader.addListener(this);
		var _loc2_ = "img://" + textureDict + "/" + textureName;
		this.txd_loader.loadClip(_loc2_,targetMC);
	}

	function Clear()
	{
		for (var it in this.menuItems)
		{
			this.menuItems[it].Clear();
		}
		this.menuItems = new Array();
		if (this.windows.length > 0)
		{
			for (var wi in this.windows)
			{
				this.windows[wi].Clear();
			}
			this.windows = new Array();
		}
		this.BannerSprite.bannerBG.bannerSprite.removeTxdRef();
		this.BannerSprite.removeMovieClip();
		this.BodySprite.removeMovieClip();
		this.DescriptionSprite.removeMovieClip();
		this.SubtitleSprite.removeMovieClip();
		this.Footer.removeMovieClip();
	}

	function bannerLoaded()
	{
		this.BannerSprite.bannerBG.bannerSprite._alpha = 0;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.BannerSprite.bannerBG.bannerSprite,0.2,{_alpha:100});
	}
}