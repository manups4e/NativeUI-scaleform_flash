﻿class com.rockstargames.ScaleformUI.sidePanels.MissionDetailsPanel
{
	var itemMC;
	var imgLdr;
	var defaultPlaceholderA;
	var _mainMC;
	var listDescItem;
	var LeftRightSide = 1;
	var menu;
	var panelTitle;
	var panelTitleColour;
	var BannerTitle;
	var descItems = [];
	var titleFreemode;
	var _titleType;
	function MissionDetailsPanel(menu, leftRight, titleType, panelTitle, panelColour, txd, txn)
	{
		this.menu = menu;
		this.listDescItem = 0;
		this.descItems = new Array();
		this._mainMC = this.menu._mainMC;
		this.LeftRightSide = leftRight;
		this.itemMC = this._mainMC.attachMovie("SideMissionPanel", "sideMissionPan_" + this._mainMC.getNextHighestDepth(), this._mainMC.getNextHighestDepth());
		this.itemMC.verifiedMC._visible = this.itemMC.verifiedbgMC._visible = false;
		this.panelTitle = panelTitle;
		this.panelTitleColour = panelColour;
		this._titleType = titleType;
		switch (titleType)
		{
			case 0 :
				this.itemMC.gotoAndStop(1);
				this.itemMC.BannerSprite._width = 288;
				this.itemMC.BannerSprite._height = 65;
				var banner = this.itemMC.BannerSprite.bannerBG.attachMovie("txdLoader", "internbannerSprite_" + this.itemMC.BannerSprite.bannerBG.getNextHighestDepth(), this.itemMC.BannerSprite.bannerBG.getNextHighestDepth());
				com.rockstargames.ScaleformUI.utils.MovieClipHandler.SetClip(banner,menu._bannerTxd,this.menu._bannerTexture,288,65, this);

				this.BannerTitle = this.itemMC.BannerSprite.titleMC.labelTF;
				this.BannerTitle.embedFonts = true;
				this.BannerTitle.antiAliasType = "advanced";
				this.BannerTitle.selectable = false;
				if (this.panelTitle != undefined && this.panelTitle != "")
				{
					com.rockstargames.ui.utils.UIText.setSizedText(this.BannerTitle,this.panelTitle,true,true,31,31);
				}
				this.updateFont(this.titleFreemode.itemTextLeft,"$Font2_cond_NOT_GAMERNAME");
				break;
			case 1 :
				this.itemMC.gotoAndStop(2);
				this.itemMC.BannerSprite.bannerBG._alpha = 100;
				com.rockstargames.ScaleformUI.utils.MovieClipHandler.ApplyHexColour(this.itemMC.BannerSprite.bannerBG,this.panelTitleColour);

				this.BannerTitle = this.itemMC.BannerSprite.titleMC.labelTF;
				if (this.panelTitle != undefined && this.panelTitle != "")
				{
					com.rockstargames.ui.utils.UIText.setSizedText(this.BannerTitle,this.panelTitle,true,true,12,12);
				}
				com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BannerTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
				break;
			case 2 :
				this.itemMC.BannerSprite._visible = false;
				this.titleFreemode = this.itemMC.attachMovie("freemodeTitleItem", "freemodeTitleItemMC", 1);
				this.titleFreemode._y = this.itemMC.descBG._y - this.titleFreemode.getHeight();
				this.titleFreemode.highlightTitle(false);
				com.rockstargames.ui.utils.UIText.setSizedText(this.titleFreemode.itemTextLeft,this.panelTitle,true,false,0,23);
				com.rockstargames.ui.utils.UIText.setSizedText(this.titleFreemode.labelMC.titleshadowTF,this.panelTitle,true,false,0,23);
				this.updateFont(this.titleFreemode.itemTextLeft,"$Font5");
				this.updateFont(this.titleFreemode.labelMC.titleshadowTF,"$Font5");

				this.titleFreemode.snapBGGrid(this.titleFreemode.bgMC);
				break;
		}

		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.descBG,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.verifiedbgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.imgPlaceholderMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		this.defaultPlaceholderA = this.itemMC.imgPlaceholderMC._alpha;
		this.listDescItem = 0;

		if (((txd == "") && txn == ""))
		{
			this.itemMC.descBG._y = this.itemMC.descBG._y - this.itemMC.imgPlaceholderMC._height;
			if ((titleType == 2))
			{
				this.itemMC.descBG._y = this.itemMC.descBG._y + this.titleFreemode.getHeight();
				this.titleFreemode._y = this.itemMC.descBG._y - this.titleFreemode.getHeight();
			}
			this.itemMC.imgPlaceholderMC._visible = false;
		}
		else
		{
			this.setPicture(txd,txn);
		}
		this.updateDescBG();
	}

	function setPicture(txd, txn)
	{
		if (this.imgLdr == undefined)
		{
			this.imgLdr = this.itemMC.imgMC.attachMovie("txdLoader", "imgLdr_" + this.itemMC.imgMC.getNextHighestDepth(), this.itemMC.imgMC.getNextHighestDepth());
		}
    	com.rockstargames.ScaleformUI.utils.MovieClipHandler.SetClip(this.imgLdr,txd, txn,288,160,this.transitionInBitmap, this);
	}

	function updateFont(tf, fontName)
	{
		tf.embedFonts = true;
		tf.antiAliasType = "advanced";
		tf.selectable = false;
		var newFont = tf.getTextFormat();
		newFont.font = fontName;
		tf.setNewTextFormat(newFont);
		tf.setTextFormat(newFont);
	}

	function setTitle(title)
	{
		this.panelTitle = title;
		switch (this._titleType)
		{
			case 0 :
				var bannerFont = new TextFormat("$Font5", 31);
				bannerFont.align = "center";
				this.BannerTitle = this.itemMC.BannerSprite.titleMC.labelTF;
				this.BannerTitle.embedFonts = true;
				this.BannerTitle.antiAliasType = "advanced";
				this.BannerTitle.selectable = false;
				if (this.panelTitle != undefined && this.panelTitle != "")
				{
					com.rockstargames.ui.utils.UIText.setSizedText(this.BannerTitle,this.panelTitle,true,true,31,31);
				}
				break;
			case 1 :
				this.BannerTitle = this.itemMC.BannerSprite.titleMC.labelTF;
				if (this.panelTitle != undefined && this.panelTitle != "")
				{
					com.rockstargames.ui.utils.UIText.setSizedText(this.BannerTitle,this.panelTitle,true,true,12,12);
				}
				com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BannerTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
				break;
			case 2 :
				this.itemMC.BannerSprite._visible = false;
				this.titleFreemode._y = this.itemMC.descBG._y - this.titleFreemode.getHeight();
				this.titleFreemode.highlightTitle(false);
				com.rockstargames.ui.utils.UIText.setSizedText(this.titleFreemode.itemTextLeft,this.panelTitle,true,false,0,23);
				com.rockstargames.ui.utils.UIText.setSizedText(this.titleFreemode.labelMC.titleshadowTF,this.panelTitle,true,false,0,23);
				this.titleFreemode.snapBGGrid(this.titleFreemode.bgMC);
				break;
		}
	}

	function AddItem(id, textLeft, textRight, param3, param4, param5, param6, param7, param8, param9, param10)
	{
		var item = new com.rockstargames.ScaleformUI.sidePanels.FreemodeDetailsItem(this, this.listDescItem + 1, id, textLeft, textRight, param3, param4, param5, param6, param7, param8, param9, param10);
		if (this.listDescItem == 0)
		{
			item.itemMC._y = this.itemMC.descBG._y;
		}
		else if (this.listDescItem > 0)
		{
			item.itemMC._y = this.descItems[this.listDescItem - 1].itemMC._y + this.descItems[this.listDescItem - 1].itemMC._height;
		}
		this.listDescItem = this.descItems.push(item);
		this.updateDescBG();
	}

	function RemoveItem(id)
	{
		this.descItems.splice(id,1);
		for (var it in this.descItems)
		{
			if ((it == 0))
			{
				this.descItems[it].itemMC._y = this.itemMC.descBG._y;
			}
			else if ((it > 0))
			{
				this.descItems[it].itemMC._y = this.descItems[it - 1].itemMC._y + this.descItems[it - 1].itemMC._height;
			}
		}
		this.updateDescBG();
	}

	function transitionInBitmap()
	{
		this.imgLdr._alpha = 0;
		this.imgLdr._visible = true;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgLdr,0.3,{_alpha:100, ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.itemMC.imgPlaceholderMC,0.3,{_alpha:0, ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT, onCompleteScope:this, onComplete:this.transitionComplete});
	}
	function transitionComplete()
	{
		this.itemMC.imgPlaceholderMC._alpha = this.defaultPlaceholderA;
		this.itemMC.imgPlaceholderMC._visible = false;
	}

	function updateDescBG()
	{
		var val = 0;
		for (var item in this.descItems)
		{
			val = val + this.descItems[item].itemMC.bgMC._height + 2;
		}
		this.itemMC.descBG._height = val;
	}


	function set isVisible(_v)
	{
		this.itemMC._visible = _v;
	}
	function get isVisible()
	{
		return this.itemMC._visible;
	}
	
	function ClearItems(){
		if (this.descItems.length > 0)
		{
			for (var dd in this.descItems)
			{
				this.descItems[dd].Clear();
			}
		}
		this.descItems = new Array();
		this.listDescItem = 0;
	}

	function Clear()
	{
		if (this.descItems.length > 0)
		{
			for (var dd in this.descItems)
			{
				this.descItems[dd].Clear();
			}
		}
		this.itemMC.removeMovieClip();

	}
}