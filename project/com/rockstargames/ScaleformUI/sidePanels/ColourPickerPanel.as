class com.rockstargames.ScaleformUI.sidePanels.ColourPickerPanel
{
	var itemMC;
	var _mainMC;
	var LeftRightSide = 1;
	var menu;
	var panelTitle;
	var panelTitleColour;
	var BannerTitle;
	var colorsArray = [];
	var titleFreemode;
	var _titleType;
	var hovered = -1;
	function ColourPickerPanel(menu, leftRight, titleType, panelTitle, panelColour)
	{
		this.menu = menu;
		this.colorsArray = com.rockstargames.ScaleformUI.utils.ColorPanelColors.VEHICLE_COLORS;
		this._mainMC = this.menu._mainMC;
		this.LeftRightSide = leftRight;
		this.itemMC = this._mainMC.attachMovie("ColourPicker", "colourPicker_" + this._mainMC.getNextHighestDepth(), this._mainMC.getNextHighestDepth());
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
				var alreadyLoaded = true;
				if (banner.textureFilename != this.menu._bannerTexture && banner.textureDict != this.menu._bannerTxd)
				{
					alreadyLoaded = false;
				}
				if (banner.isLoaded)
				{
					banner.removeTxdRef();
				}
				banner.init("ScaleformUI",this.menu._bannerTxd,this.menu._bannerTexture,288,54.75);
				var _loc7_ = 4;
				var _loc5_ = String(banner).split(".");
				var _loc8_ = _loc5_.slice(_loc5_.length - _loc7_).join(".");
				com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(banner);
				banner._alpha = 100;
				banner.requestTxdRef(_loc8_,alreadyLoaded,undefined,this);

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
				this.itemMC.gotoAndStop(2);
				this.itemMC.BannerSprite.bannerBG._alpha = 100;
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.BannerSprite.bannerBG,this.panelTitleColour);

				this.BannerTitle = this.itemMC.BannerSprite.titleMC.labelTF;
				if (this.panelTitle != undefined && this.panelTitle != "")
				{
					com.rockstargames.ui.utils.UIText.setSizedText(this.BannerTitle,this.panelTitle,true,true,12,12);
				}
				com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.BannerTitle,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
				break;
		}
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.imgPlaceholderMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		this.itemMC.honeyComb.maskMC._alpha = 0;
		for (var i = 0; i < this.colorsArray.length; i++)
		{
			var col = this.colorsArray[i];
			var cell = this.itemMC.honeyComb["colour_" + i];
			com.rockstargames.ui.utils.Colour.Colourise(cell,col.r,col.g,col.b,100);
			cell.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverCP, i);
			cell.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutCP, i);
		}
	}

	function mOverCP(id)
	{
		var cell = this.itemMC.honeyComb["colour_" + id];
		cell.swapDepths(this.itemMC.honeyComb.maskMC);
		cell._width += 30;
		cell._height += 30;
		this.hovered = id;
	}

	function mOutCP(id)
	{
		var cell = this.itemMC.honeyComb["colour_" + id];
		cell.swapDepths(this.itemMC.honeyComb.maskMC);
		cell._width -= 30;
		cell._height -= 30;
		this.hovered = -1;
	}


	function set isVisible(_v)
	{
		this.itemMC._visible = _v;
	}
	function get isVisible()
	{
		return this.itemMC._visible;
	}

	function Clear()
	{
		this.itemMC.removeMovieClip();
	}

	function get Value()
	{
		return this.hovered;
	}
}