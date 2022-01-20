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
	var _minItem = 0;
	var _maxItem = this.maxItemsOnScreen;
	var isVisible = false;
	var _bannerTexture = "interaction_bgd";
	var _bodyTexture = "gradient_bgd";
	var _upAndDownArrows = "shop_arrows_upanddown";
	var txd_loader;
	var mouseOn;
	var _menuOff = [];

	function UIMenu(mc, title, subtitle, txd, txn, offset)
	{
		this._menuOff = offset;
		this.menuItems = new Array();
		this.windows = new Array();
		this._mainMC = mc;
		this._menuTitle = title;
		this._menuSubtitle = subtitle;
		this._maxItem = this.maxItemsOnScreen;
		this._minItem = 0;
		this.itemCount = 0;

		this.BannerSprite = this._mainMC.attachMovie("BannerSprite", "bannerSpriteMC", this._mainMC.getNextHighestDepth());
		this.BannerSprite._x = 0 + _menuOff.x;
		this.BannerSprite._y = 0 + _menuOff.y;
		this.BannerSprite._width = 288;
		this.BannerSprite._height = 65;

		if (((txd == undefined) || txd == ""))
		{
			this.SetClip(this.BannerSprite.bannerBG,"commonmenu",this._bannerTexture);
		}
		else
		{
			this.SetClip(this.BannerSprite.bannerBG,txd,txn);
		}
		var bannerFont = new TextFormat("$Font5", 31);
		bannerFont.align = "center";
		this.BannerTitle = this.BannerSprite.titleMC.labelTF;
		this.BannerTitle.embedFonts = true;
		this.BannerTitle.antiAliasType = "advanced";
		this.BannerTitle.selectable = false;
		if (this._menuTitle != undefined && this._menuTitle != "")
		{
			com.rockstargames.ui.utils.UIText.setSizedText(this.BannerTitle,this._menuTitle,true,true,31,31);
		}
		this.SubtitleSprite = this._mainMC.attachMovie("SubtitleSprite", "subtitleSprite", this._mainMC.getNextHighestDepth());
		this.SubtitleSprite._x = 0 + _menuOff.x;
		this.SubtitleSprite._y = this.BannerSprite._height - 1;
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

		this.Footer = this._mainMC.attachMovie("Footer", "footer", this._mainMC.getNextHighestDepth());
		this.Footer._visible = false;
		this.DescriptionSprite = this._mainMC.attachMovie("DescriptionBG", "descriptionSprite", this._mainMC.getNextHighestDepth());
		var _loc3_ = new com.rockstargames.ui.utils.HudColour();
		com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
		com.rockstargames.ui.utils.Colour.Colourise(this.DescriptionSprite.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
		this.DescriptionSprite._visible = false;
	}

	function addItem(id, str, substr, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13)
	{
		var _selectedItem = this.currentSelection;
		var item;
		switch (id)
		{
			case 0 :
				item = new com.rockstargames.ScaleformUI.items.UIMenuItem(str, substr, this, param1, param2, param3, param4, param5, param6);
				break;
			case 1 :
				item = new com.rockstargames.ScaleformUI.items.UIMenuListItem(str, substr, this, param1, param2, param3, param4, param5, param6, param7, param8);
				break;
			case 2 :
				item = new com.rockstargames.ScaleformUI.items.UIMenuCheckboxItem(str, substr, this, param1, param2, param3, param4, param5, param6, param7, param8);
				break;
			case 3 :
				item = new com.rockstargames.ScaleformUI.items.UIMenuSliderItem(str, substr, this, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13);
				break;
			case 4 :
				item = new com.rockstargames.ScaleformUI.items.UIMenuProgressItem(str, substr, this, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12);
				break;
			case 5 :
				item = new com.rockstargames.ScaleformUI.items.UIMenuStatsItem(str, substr, this, param1, param2, param3, param4, param5);
				break;
			default :
				item = new com.rockstargames.ScaleformUI.items.UIMenuItem(str, substr, this);
		}
		this.itemCount = this.menuItems.push(item);
		var _off = this.itemCount > this.maxItemsOnScreen + 1 ? this.menuItems[this._maxItem].itemMC._y + this.menuItems[this._maxItem].itemMC._height : this.menuItems[this.itemCount - 1].itemMC._y + this.menuItems[this.itemCount - 1].itemMC._height;
		if (this.itemCount <= this.maxItemsOnScreen + 1)
		{
			item.itemMC._x = 0 + _menuOff.x;
			item.itemMC._y = _off;
		}
		else
		{
			item.isVisible = false;
		}
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
				panel = new com.rockstargames.ScaleformUI.panels.UIMenuColorPanel(selectItem, param1, param2, param3);
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

	function addWindow(mom, dad)
	{
		var wind = new com.rockstargames.ScaleformUI.windows.UIMenuHeritageWindow(this, mom, dad);
		this.windows.push(wind);
		this.updateItemsDrawing();
	}


	function goUp()
	{
		if (this.itemCount > this.maxItemsOnScreen + 1)
		{
			//overflow
			if (this.currentSelection <= this._minItem)
			{
				if (this.currentSelection == 0)
				{
					//overflow if firstElement
					this._minItem = this.itemCount - this.maxItemsOnScreen - 1;
					this._maxItem = this.itemCount - 1;
					this._activeItem = 1000 - (1000 % this.itemCount);
					this._activeItem += this.itemCount - 1;
				}
				else
				{
					//overflow classic
					this._minItem--;
					this._maxItem--;
					this._activeItem--;
				}
			}
			else
			{
				this._activeItem--;
			}
		}
		else
		{
			this._activeItem--;
		}
		this.updateItemsDrawing();
		com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET");
		return this.currentSelection;
	}

	function goDown()
	{
		if (this.itemCount > this.maxItemsOnScreen + 1)
		{
			// overflow
			if (this.currentSelection >= this._maxItem)
			{
				if (this.currentSelection == this.itemCount - 1)
				{
					//overflow if lastElement
					this._minItem = 0;
					this._maxItem = this.maxItemsOnScreen;
					this._activeItem = 1000 - (1000 % this.itemCount);
				}
				else
				{
					//overflow classic
					this._minItem++;
					this._maxItem++;
					this._activeItem++;
				}
			}
			else
			{
				this._activeItem++;
			}
		}
		else
		{
			this._activeItem++;
		}
		this.updateItemsDrawing();
		com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET");
		return this.currentSelection;
	}

	function goLeft()
	{
		var retVal = -1;
		if (this.currentItem instanceof com.rockstargames.ScaleformUI.items.UIMenuListItem)
		{
			this.currentItem.index--;
			retVal = this.currentItem.index;
		}
		else if (this.currentItem instanceof com.rockstargames.ScaleformUI.items.UIMenuSliderItem)
		{
			this.currentItem.value -= this.currentItem.multiplier;
			retVal = this.currentItem.value;
		}
		else if (this.currentItem instanceof com.rockstargames.ScaleformUI.items.UIMenuProgressItem)
		{
			this.currentItem.value--;
			retVal = this.currentItem.value;
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
		if (this.currentItem instanceof com.rockstargames.ScaleformUI.items.UIMenuListItem)
		{
			this.currentItem.index++;
			retVal = this.currentItem.index;
		}
		else if (this.currentItem instanceof com.rockstargames.ScaleformUI.items.UIMenuSliderItem)
		{
			this.currentItem.value += this.currentItem.multiplier;
			retVal = this.currentItem.value;
		}
		else if (this.currentItem instanceof com.rockstargames.ScaleformUI.items.UIMenuProgressItem)
		{
			this.currentItem.value++;
			retVal = this.currentItem.value;
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
		var windOff = 0;
		if (this.windows.length > 0)
		{
			this.windows[0].itemMC._y = this.BannerSprite._height + this.SubtitleSprite._height;
			windOff = 158;
		}
		for (var item in this.menuItems)
		{
			this.menuItems[item].highlighted = false;
			this.menuItems[item].isVisible = false;
		}
		var count = 0;
		for (var i = this._minItem; i <= this._maxItem; i++)
		{
			if (i <= this.itemCount)
			{
				this.menuItems[i].isVisible = true;
				if (count == 0)
				{
					this.menuItems[i].itemMC._y = this.BannerSprite._height + this.SubtitleSprite._height - 1 + windOff;
				}
				else if (count > 0)
				{
					this.menuItems[i].itemMC._y = this.menuItems[i - 1].itemMC._y + this.menuItems[i - 1].itemMC._height - 0.1;
				}
			}
			count++;
		}
		var _off = this.itemCount > this.maxItemsOnScreen + 1 ? this.menuItems[this._maxItem].itemMC._y + this.menuItems[this._maxItem].itemMC._height : this.menuItems[this.itemCount - 1].itemMC._y + this.menuItems[this.itemCount - 1].itemMC._height;
		this.currentItem.highlighted = true;

		if (this.itemCount > this.maxItemsOnScreen + 1)
		{
			if (this.Footer == undefined)
			{
				this.Footer = this._mainMC.attachMovie("Footer", "footer", this._mainMC.getNextHighestDepth());
			}
			this.Footer._visible = true;
			this.Footer._y = _off + 1;
		}
		this.updateDescription();
		com.rockstargames.ui.utils.UIText.setSizedText(this.CounterText,(this.currentSelection + 1) + "/" + this.itemCount,true,true);
	}

	function updateDescription()
	{
		var windOff = 0;
		if (this.windows.length > 0)
		{
			this.windows[0].itemMC._y = this.BannerSprite._height + this.SubtitleSprite._height;
			windOff = 158;
		}
		var offset = this.itemCount > this._maxItem ? this.menuItems[this._maxItem].itemMC._y + this.menuItems[this._maxItem].itemMC._height : this.menuItems[this.itemCount - 1].itemMC._y + this.menuItems[this.itemCount - 1].itemMC._height;

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
					this.currentItem.panels[i].itemMC._y = _offset;
					_offset += this.currentItem.panels[i].itemMC._height + 1;
				}
				offset = _offset;
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
			this.DescriptionSprite._visible = true;
			com.rockstargames.ui.utils.UIText.setDescText(this.DescriptionSprite.descriptionMC.descText,this.currentItem.subtitle,true);
			this.DescriptionSprite._y = offset + 1;
			this.DescriptionSprite.bgMC._height = this.DescriptionSprite.descriptionMC._height + 5;
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
		if (this.itemCount == 0)
		{
			this._activeItem = 0;
		}
		this._activeItem = 1000000 - (1000000 % this.itemCount) + val;
		if (this.currentSelection > this._maxItem)
		{
			this._maxItem = this.currentSelection;
			this._minItem = this.currentSelection - this.maxItemsOnScreen;
		}
		else if (this.currentSelection < this._minItem)
		{
			this._maxItem = this.maxItemsOnScreen + this.currentSelection;
			this._minItem = this.currentSelection;
		}
		this.updateItemsDrawing();
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
		if (target_mc == this.BannerSprite.bannerBG)
		{
			target_mc._x = 0 + _menuOff.x;
			target_mc._y = 0 + _menuOff.y;
			target_mc._width = 288;
			target_mc._height = 54.75;
			//com.rockstargames.ui.utils.Colour.ApplyHudColour(target_mc,!this.highlighted ? this._textColor : this._textHighlightColor);
		}
		else if (target_mc == this.DescriptionSprite.bgMC)
		{
			target_mc._width = 288;
			target_mc._height = this.DescriptionSprite.descriptionMC._height + 5;
		}
		delete this.txd_loader;
	}

	function Clear()
	{
		for (var it in this.menuItems)
		{
			for (var pan in this.menuItems[it].panels)
			{
				this.menuItems[it].panels[pan].itemMC.removeMovieClip();
			}
			this.menuItems[it].itemMC.removeMovieClip();
		}
		this.menuItems = new Array();
		if (this.windows.length > 0)
		{
			for (var wi in this.windows)
			{
				this.windows[wi].itemMC.removeMovieClip();
			}
			this.windows = new Array();
		}
		this.BannerSprite.removeMovieClip();
		this.BodySprite.removeMovieClip();
		this.DescriptionSprite.removeMovieClip();
		this.SubtitleSprite.removeMovieClip();
		this.Footer.removeMovieClip();
	}

	/*
	FOR DEBUG PURPOUSES!!!
	*/
	function setDebugText(str)
	{
		this._mainMC.debugText.html = false;
		this._mainMC.debugText.text = str;
		/*
		com.rockstargames.ui.utils.UIText.setDescText(this._mainMC.debugText,str,true);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this._mainMC.debugText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		*/
	}
}