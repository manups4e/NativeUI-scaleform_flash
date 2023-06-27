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
	var maxItemsOnScreen;
	var _currentItem;
	var _activeItem = 0;
	var itemCount = 0;
	var windowsCount = 0;
	var _minItem = 0;
	var _maxItem = 7;
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
	var buildingType = 0;
	var slots = [];
	var alternativeTitle;
	var countCol;
	var descFont = 0;
	var totalItems = 0;
	var timerId = 0;
	var isFading = false;
	var fadingSpeed = 0.1;
	var __width;

	function UIMenu(mc, title, subtitle, alternative, x, y, txd, txn, maxItems, totItems, enableAnim, animType, buildType, counterColor, dFontName, dFontId, fadingSp)
	{
		this._menuOff = new Array(x, y);
		this.menuItems = new Array();
		this.windows = new Array();
		this._mainMC = mc;
		this._menuTitle = title;
		this._menuSubtitle = subtitle;
		this.maxItemsOnScreen = maxItems;
		this._minItem = 0;
		this._maxItem = this.maxItemsOnScreen;
		this.itemCount = 0;
		this.totalItems = totItems;
		this.alternativeTitle = alternative;
		this.countCol = counterColor;
		this.descFont = [dFontName, dFontId];
		this.BannerSprite = this._mainMC.attachMovie("BannerSprite", "bannerSpriteMC", this._mainMC.getNextHighestDepth());
		this.BannerSprite._x = 0 + this._menuOff[0];
		this.BannerSprite._y = 0 + this._menuOff[1];
		this.BannerSprite._width = 288;
		this.BannerSprite._height = 65;
		this._bannerTxd = txd;
		this._bannerTexture = txn;
		this.fadingSpeed = fadingSp;

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
			if (!this.alternativeTitle)
			{
				var bannerFont = new TextFormat("$Font5", 31);
				bannerFont.align = "center";
				this.BannerTitle = this.BannerSprite.titleMC.labelTF;
				this.BannerTitle.embedFonts = true;
				this.BannerTitle.antiAliasType = "advanced";
				this.BannerTitle.selectable = false;
				com.rockstargames.ui.utils.UIText.setSizedText(this.BannerSprite.titleMC.labelTF,this._menuTitle,true,true,31,31);
				this.BannerTitle.setTextFormat(bannerFont);
			}
			else
			{
				var bannerFont = new TextFormat("$Font2", 31);
				bannerFont.align = "left";
				bannerFont.bold = true;
				this.BannerTitle = this.BannerSprite.titleMC.labelTF2;
				this.BannerTitle.embedFonts = true;
				this.BannerTitle.antiAliasType = "advanced";
				this.BannerTitle.selectable = false;
				com.rockstargames.ui.utils.UIText.setSizedText(this.BannerSprite.titleMC.labelTF2,this._menuTitle,true,true,31,31);
				this.BannerTitle.setTextFormat(bannerFont);
			}
		}

		var subFont = new TextFormat("$Font2", 12);
		subFont.align = "left";
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
			this.SubtitleText.setTextFormat(subFont);
		}

		subFont = new TextFormat("$Font2", 12);
		subFont.align = "right";
		this.CounterText = this.SubtitleSprite.counterMC.labelTF;
		this.CounterText.antiAliasType = "advanced";
		this.CounterText.selectable = false;
		com.rockstargames.ui.utils.UIText.setSizedText(this.CounterText,"0/0",true,true);
		this.CounterText.setTextFormat(subFont);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CounterText,counterColor);

		this.itemsBG = this._mainMC.attachMovie("backgroundBody", "backgroundBody_" + this._mainMC.getNextHighestDepth(), this._mainMC.getNextHighestDepth());
		this.itemsBG._x = 0 + this._menuOff[0];
		this.itemsBG._y = this.SubtitleSprite._y + this.SubtitleSprite._height - 1;
		this.itemsBG.maskMC._height = 0;
		this.itemsBG.bgMC._height = 0;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemsBG.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		//this.itemsBG.bgMC._alpha = 100;
		this.scrollableContent = this.itemsBG.createEmptyMovieClip("viewContainer", this.itemsBG.getNextHighestDepth());
		this.itemsBG.setMask(this.itemsBG.maskMC);

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
		this.buildingType = buildType;
	}

	function addItem(before, id, index, str, substr, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13)
	{
		var item;
		if (id == 5)
		{
			item = new com.rockstargames.ScaleformUI.items.UIMenuStatsItem(id, index, str, substr, this, param1, param2, param3, param4, param5, param6, param7, param8, param9);
		}
		else
		{
			item = new com.rockstargames.ScaleformUI.items.UIMenuItem(id, index, str, substr, this, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13);
		}

		var lastItem = this.menuItems[this.itemCount - 1];
		if (before)
		{
			item.itemMC._y = this.menuItems[0].itemMC._y - item.itemMC._height;
			this.menuItems[this.itemCount - 1].Clear();
			this.menuItems.pop();
			this.itemCount = this.menuItems.unshift(item);
		}
		else
		{
			if (this.itemCount == 0)
			{
				item.itemMC._y = 0;
			}
			else
			{
				if (this.itemCount >= this.maxItemsOnScreen)
				{
					this.menuItems[0].Clear();
					this.menuItems.shift();
					this.itemCount = this.menuItems.length;
				}
				item.itemMC._y = lastItem.itemMC._y + lastItem.itemMC._height;
			}
			this.itemCount = this.menuItems.push(item);
		}

		if (this.buildingType > 0)
		{
			switch (this.buildingType)
			{
				case 1 :
					item.itemMC._x = -289;
					break;
				case 2 :
					item.itemMC._x = 289;
					break;
				case 3 :
					if (index % 2 == 0)
					{
						item.itemMC._x = 289;
					}
					else
					{
						item.itemMC._x = -289;
					}
					break;
			}
			com.rockstargames.ui.tweenStar.TweenStarLite.to(item.itemMC,0.45,{_x:0, ease:this.AnimType});
		}
		this.updateItemsDrawing();
		return this.itemCount;
	}

	function removeItem(id)
	{
		var _selectedItem = this.currentSelection;
		this.menuItems[id].Clear();
		this.menuItems.splice(id,1);
		this.itemCount = this.menuItems.length;
		this.currentSelection = _selectedItem;
		this.updateItemsDrawing();
		return this.itemCount;
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

	function removePanel(item, id)
	{
		var selectItem = this.menuItems[item];
		selectItem.removePanel(id);
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

	function ScrollMenu(targetIndex, delay, end, offset)
	{
		if (end == undefined)
		{
			end = false;
		}
		var time = 0.2;
		switch (delay)
		{
			case 150 :
				time = 0.2;
				break;
			case 140 :
				time = 0.09;
				break;
			case 130 :
				time = 0.087;
				break;
			case 120 :
				time = 0.083;
				break;
			case 110 :
				time = 0.08;
				break;
			case 100 :
				time = 0.05;
				break;
			case 90 :
				time = 0.03;
				break;
			case 80 :
				time = 0.02;
				break;
			case 70 :
				time = 0.01;
				break;
			case 60 :
				time = 0.007;
				break;
			case 50 :
				time = 0.003;
				break;
			case 25 :
				time = 0.0015;
				break;
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
						if (_loc2_ <= -this.scrollableContent._height - this.MaxHeight)
						{
							_loc2_ = -this.scrollableContent._height - this.MaxHeight;
						}
					}
					break;
				case -1 :
					_loc2_ = _loc2_ + this.currentItem.itemMC._height;
					if (end)
					{
						_loc2_ = -(this.scrollableContent._height - this.MaxHeight);
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
			com.rockstargames.ui.tweenStar.TweenStarLite.to(this.scrollableContent,time,{_y:_loc2_, onCompleteScope:this, onComplete:this.scrollComplete, onCompleteArgs:[targetIndex, end, _loc2_], ease:this.AnimType});
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
				if (this.scrollableContent._y != this.MaxHeight - (this.currentItem.itemMC._y + this.currentItem.itemMC._height))
				{
					this.scrollableContent._y = this.MaxHeight - (this.currentItem.itemMC._y + this.currentItem.itemMC._height);
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

	function goUp(val)
	{
		var delay = val;
		//this.ScrollMenu(-1,delay);
		this.scrollableContent._y = -this.currentItem.itemMC._y;
		this.updateItemsDrawing();
	}

	function goDown(val)
	{
		var delay = val;
		//this.ScrollMenu(1,delay);
		this.scrollableContent._y = this.MaxHeight - (this.currentItem.itemMC._y + this.currentItem.itemMC._height);
		this.updateItemsDrawing();
	}

	function goLeft()
	{
		var retVal = -1;
		if (this.currentItem._type == 1 || this.currentItem._type == 3 || this.currentItem._type == 4)
		{
			this.currentItem.Value--;
			retVal = this.currentItem.Value;
		}
		else if (this.currentItem._type == 5)
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
		else if (this.currentItem._type == 5)
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
		}
		if (this.currentSelection == 0)
		{
			this.scrollableContent._y = -this.currentItem.itemMC._y;
		}
		else if (this.currentSelection == this.maxItemsOnScreen - 1)
		{
			this.scrollableContent._y = this.MaxHeight - (this.currentItem.itemMC._y + this.currentItem.itemMC._height);
		}

		this.itemsBG.maskMC._height = this.itemsBG.bgMC._height = this.MaxHeight;
		this._itemsOffset = this.itemsBG._y + this.itemsBG.bgMC._height;

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
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CounterText,this.countCol);
	}

	function updateDescription()
	{
		var offset = this._itemsOffset;
		if (this.totalItems >= this.maxItemsOnScreen)
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
			//com.rockstargames.ui.utils.UIText.setDescText(this.DescriptionSprite.descriptionMC.descText,this.currentItem.subtitle,true);
			var format = this.DescriptionSprite.descriptionMC.descText.getTextFormat();
			if (this.blipLayer)
			{
				this.blipLayer.removeMovieClip();
			}
			this.DescriptionSprite.descriptionMC.descText.wordWrap = true;
			this.DescriptionSprite.descriptionMC.descText.autoSize = true;
			this.blipLayer = this.DescriptionSprite.descriptionMC.createEmptyMovieClip("blipLayer", 1000, {_x:this.DescriptionSprite.descriptionMC.descText._x, _y:this.DescriptionSprite.descriptionMC.descText._y});
			textBlips.setTextWithIcons(this.currentItem.subtitle,this.blipLayer,this.DescriptionSprite.descriptionMC.descText,this.descFont[1],13,2,false);
			format.font = this.descFont[0];
			format.size = 13;
			format.leading = 2;
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

	function updateTitleSubtitle(title, sub, alternative)
	{
		this._menuTitle = title;
		this._menuSubtitle = sub;
		this.alternativeTitle = alternative;
		if (this._menuTitle != undefined && this._menuTitle != "")
		{
			if (!this.alternativeTitle)
			{
				var bannerFont = new TextFormat("$Font5", 31);
				bannerFont.align = "center";
				this.BannerTitle = this.BannerSprite.titleMC.labelTF;
				this.BannerTitle.embedFonts = true;
				this.BannerTitle.antiAliasType = "advanced";
				this.BannerTitle.selectable = false;
				com.rockstargames.ui.utils.UIText.setSizedText(this.BannerSprite.titleMC.labelTF,this._menuTitle,true,true,31,31);
				this.BannerTitle.setTextFormat(bannerFont);
			}
			else
			{
				var bannerFont = new TextFormat("$Font2", 31);
				bannerFont.align = "left";
				bannerFont.bold = true;
				this.BannerTitle = this.BannerSprite.titleMC.labelTF2;
				this.BannerTitle.embedFonts = true;
				this.BannerTitle.antiAliasType = "advanced";
				this.BannerTitle.selectable = false;
				com.rockstargames.ui.utils.UIText.setSizedText(this.BannerSprite.titleMC.labelTF2,this._menuTitle,true,true,31,31);
				this.BannerTitle.setTextFormat(bannerFont);
			}
		}
		if (this._menuSubtitle != undefined && this._menuSubtitle != "")
		{
			var subFont = new TextFormat("$Font2", 12);
			subFont.align = "left";
			com.rockstargames.ui.utils.UIText.setSizedText(this.SubtitleText,this._menuSubtitle,true,true);
			this.SubtitleText.setTextFormat(subFont);
		}
		this.updateItemsDrawing();
	}

	function colorCounter(colour)
	{
		this.countCol = colour;
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CounterText,colour);
		this.updateItemsDrawing();
	}

	function setCounter(act, maxItems)
	{
		var subFont = new TextFormat("$Font2", 12);
		subFont.align = "right";
		com.rockstargames.ui.utils.UIText.setSizedText(this.CounterText,act + "/" + maxItems,true,true);
		this.CounterText.setTextFormat(subFont);
		this.updateItemsDrawing();
	}


	function get currentItem()
	{
		return this.menuItems[this.currentSelection];
	}
	function set currentItem(item)
	{
		for (var item in this.menuItems)
		{
			if (this.menuItems[item].leftText == item.leftText && this.menuItems[item].subtitle == item.subtitle)
			{
				this.currentSelection = item;
			}
		}
	}

	function get currentSelection()
	{
		return this._activeItem;
	}

	function set currentSelection(val)
	{
		this._activeItem = val;
		this.updateItemsDrawing();
	}

	function SetClip(targetMC, textureDict, textureName)
	{
		this.txd_loader = new MovieClipLoader();
		this.txd_loader.addListener(this);
		var _loc2_ = "img://" + textureDict + "/" + textureName;
		this.txd_loader.loadClip(_loc2_,targetMC);
	}

	function FadeOutMenu()
	{
		if (this.fadingSpeed > 0.0)
		{
			com.rockstargames.gtav.levelDesign.SCALEFORMUI.IS_FADING = true;
			this.FadeTween(this._mainMC,false);
		}
	}
	function FadeInMenu()
	{
		if (this.fadingSpeed > 0.0)
		{
			com.rockstargames.gtav.levelDesign.SCALEFORMUI.IS_FADING = true;
			this.FadeTween(this._mainMC,true);
		}
	}

	function FadeOutItems()
	{
		if (this.fadingSpeed > 0.0)
		{
			com.rockstargames.gtav.levelDesign.SCALEFORMUI.IS_FADING = true;
			this.FadeTween(this.scrollableContent,false);
		}
	}
	function FadeInItems()
	{
		if (this.fadingSpeed > 0.0)
		{
			com.rockstargames.gtav.levelDesign.SCALEFORMUI.IS_FADING = true;
			this.FadeTween(this.scrollableContent,true);
		}
	}

	function FadeTween(mc, bool)
	{
		var _alphaTo = 0;
		if (bool)
		{
			_alphaTo = 100;
			// fadein
		}
		else
		{
			//fadeo ut
			_alphaTo = 0;
		}
		com.rockstargames.ui.tweenStar.TweenStarLite.to(mc,this.fadingSpeed,{_alpha:_alphaTo, onCompleteScope:this, onComplete:this.fadingComplete});
	}

	function fadingComplete()
	{
		com.rockstargames.gtav.levelDesign.SCALEFORMUI.IS_FADING = false;
	}


	function ClearItems()
	{
		for (var it in this.menuItems)
		{
			this.menuItems[it].Clear();
		}
		this.menuItems = new Array();
	}

	function Clear()
	{
		this.ClearItems();
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
		this.itemsBG.removeMovieClip();
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

	function resizeMe(mc, maxW, maxH, constrainProportions)
	{
		maxH = maxH == 0 ? maxW : maxH;
		mc._width = maxW;
		mc._height = maxH;
		if (constrainProportions)
		{
			mc._xscale < mc._yscale ? mc._yscale = mc._xscale : mc._xscale = mc._yscale;
		}
	}

	function set Width(_w)
	{
		var scale = _w / 288;
		this.__width = _w;
		for (var it in this.menuItems)
		{
			this.menuItems[it].Width = _w;
		}
		if (this.windows.length > 0)
		{
			for (var wi in this.windows)
			{
				this.windows[wi].Width = _w;
			}
		}
		this.BannerSprite._xscale *= scale;
		this.itemsBG._xscale *= scale;
		this.BodySprite._xscale *= scale;
		this.DescriptionSprite._xscale *= scale;
		this.SubtitleSprite._xscale *= scale;
		this.Footer._xscale *= scale;
		com.rockstargames.ui.utils.Debug.log("AFTER width: " + _w + ", this.BannerSprite._width:" + this.BannerSprite._width);
	}

	function get MaxHeight()
	{
		var _h = 0;

		var limit = this.itemCount;
		for (var i = 0; i < limit; i++)
		{
			_h += this.menuItems[i].itemMC.bgMC._height;
		}
		return _h;
	}
}