class com.rockstargames.NativeUI.UIMenu
{
	var id;
	var subCounterFont;
	var _mainMC;// provvisoria
	var menuItems = new Array();
	var panels = new Array();
	var BannerSprite;
	var BodySprite;
	var DescriptionSprite;
	var SubtitleSprite;
	var SubtitleText;
	var CounterText;
	var BannerTitle;
	var Footer;
	var maxItemsOnScreen = 9;
	var _currentItem;
	var _activeItem = 1000;
	var itemCount = 0;
	var _minItem = 0;
	var _maxItem = this.maxItemsOnScreen;
	var isVisible = false;
	var _bannerTexture = "interaction_bgd";
	var _bodyTexture = "gradient_bgd";
	var _upAndDownArrows = "shop_arrows_upanddown";

	// COSì POSSO FARE COME VOGLIO PER EDITARE LA DESCRIZIONE E RENDERE IL TEXTO SCROLLABLE COSì SCORRE SE PIU LUNGO.
	function UIMenu(mc, title, subtitle)
	{
		this._maxItem = this.maxItemsOnScreen;
		this._minItem = 0;

		this._mainMC = mc;
		var bannerFont = new TextFormat("$Font5", 31);
		bannerFont.align = "center";
		this.BannerSprite = mc.attachMovie("BannerSprite", "bannerSprite", mc.getNextHighestDepth());
		this.BannerSprite._x = 0;
		this.BannerSprite._y = 0;
		this.BannerSprite._width = 288;
		this.BannerSprite._height = 54.75;
		this.BannerTitle = this.BannerSprite.titleMC.labelTF;
		this.BannerTitle.embedFonts = true;
		this.BannerTitle.antiAliasType = "advanced";
		this.BannerTitle.selectable = false;
		if (title != undefined && title != "")
		{
			com.rockstargames.ui.utils.UIText.setSizedText(this.BannerTitle,title,true,true,31,31);
		}
		this.SubtitleSprite = mc.attachMovie("SubtitleSprite", "subtitleSprite", mc.getNextHighestDepth());
		this.SubtitleSprite._x = 0;
		this.SubtitleSprite._y = this.BannerSprite._height - 1;
		this.SubtitleSprite._width = 288;
		this.SubtitleSprite._height = 25;
		this.SubtitleText = this.SubtitleSprite.subtitleMC.labelTF;
		this.SubtitleText.embedFonts = true;
		this.SubtitleText.autoSize = true;
		this.SubtitleText.antiAliasType = "advanced";
		this.SubtitleText.selectable = false;
		if (subtitle != undefined && subtitle != "")
		{
			com.rockstargames.ui.utils.UIText.setSizedText(this.SubtitleText,subtitle,true,true);
		}
		this.CounterText = this.SubtitleSprite.counterMC.labelTF;
		this.CounterText.antiAliasType = "advanced";
		this.CounterText.selectable = false;
		com.rockstargames.ui.utils.UIText.setSizedText(this.CounterText,"0/0",true, true);

		this.Footer = this._mainMC.attachMovie("Footer", "footer", this._mainMC.getNextHighestDepth());
		this.Footer._visible = false;
		this.DescriptionSprite = mc.attachMovie("DescriptionBG", "description", mc.getNextHighestDepth());
		this.DescriptionSprite._visible = false;
	}

	function addItem(str, substr)
	{
		var _selectedItem = this.currentSelection;
		var item = new com.rockstargames.NativeUI.items.UIMenuItem(this._mainMC, str, substr, this);
		this.itemCount = this.menuItems.push(item);
		if (this.itemCount <= this.maxItemsOnScreen + 1)
		{
			item.itemMC._x = 0;
			item.itemMC._y = this.BannerSprite._height + this.SubtitleSprite._height + ((this.itemCount - 1) * 25);
		}
		else
		{
			item._visible = false;
		}
		this.currentSelection = _selectedItem;
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
	}


	function updateItemsDrawing()
	{
		if (this.itemCount > this.maxItemsOnScreen + 1)
		{
			if (this.Footer == undefined)
			{
				this.Footer = this._mainMC.attachMovie("Footer", "footer", this._mainMC.getNextHighestDepth());
			}
			this.Footer._visible = true;
			this.Footer._y = this.BannerSprite._height + this.SubtitleSprite._height + ((this.maxItemsOnScreen + 1) * 25);
		}
		for (var item in this.menuItems)
		{
			this.menuItems[item].highlighted = false;
			this.menuItems[item]._visible = false;
		}
		var count = 0;
		for (var i = this._minItem; i <= this._maxItem; i++)
		{
			if (i <= this.itemCount)
			{
				this.menuItems[i]._visible = true;
				this.menuItems[i].itemMC._y = this.BannerSprite._height + this.SubtitleSprite._height + (count * 25);
			}
			count++;
		}
		this.menuItems[this.currentSelection].highlighted = true;
		if (this.menuItems[this.currentSelection].subtitle != undefined && this.menuItems[this.currentSelection].subtitle != "")
		{
			this.DescriptionSprite._visible = true;
			com.rockstargames.ui.utils.UIText.setDescText(this.DescriptionSprite.descriptionMC.descText,this.menuItems[this.currentSelection].subtitle,true);
			if (this.itemCount >= this.maxItemsOnScreen + 1)
			{
				this.DescriptionSprite._y = this.BannerSprite._height + this.SubtitleSprite._height + ((this.maxItemsOnScreen + 1) * 25) + 1;
			}
			else
			{
				this.DescriptionSprite._y = this.BannerSprite._height + this.SubtitleSprite._height + (this.itemCount * 25) + 1;
			}
			this.DescriptionSprite.descBgMC._height = this.DescriptionSprite.descriptionMC.descText.textHeight + 5;
			if (this.Footer._visible)
			{
				this.DescriptionSprite._y += this.Footer._height;
			}
		}
		else
		{
			this.DescriptionSprite._visible = false;
		}
		com.rockstargames.ui.utils.UIText.setDescText(this.CounterText,this.currentSelection + 1 + "/" + this.itemCount,true);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CounterText,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
	}

	function get currentItem()
	{
		return this.menuItems[this._activeItem % (this.itemCount)];
	}
	function get currentSelection()
	{
		if (this.itemCount == 0)
		{
			return 0;
		}
		return this._activeItem % (this.itemCount);

	}
	function set currentSelection(val)
	{
		if (this.itemCount == 0)
		{
			this._activeItem = 0;
		}
		this.menuItems[this._activeItem % (this.itemCount)].highlighted = false;
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
	}
}