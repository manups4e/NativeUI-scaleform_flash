class com.rockstargames.NativeUI.items.UIMenuItem extends com.rockstargames.NativeUI.items.BaseMenuItem
{
	var rightTextTF;
	var rightText;
	var badgeMC;
	var rightBadge = com.rockstargames.NativeUI.utils.Badges.NONE;
	var _data;
	var txd_loader;
	function UIMenuItem(str, substr, parentMenu, mainColor, highlightColor, textColor, textHighlightColor)
	{
		super(parentMenu,str,substr);
		this.itemMC = this.parentMC.attachMovie("UIMenuItem", "menuItem", this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.rightTextTF = this.itemMC.RLabelMC.labelTF;
		if (mainColor != undefined)
		{
			this._mainColor = mainColor;
		}
		if (highlightColor != undefined)
		{
			this._highlightColor = highlightColor;
		}
		if (textColor != undefined)
		{
			this._textColor = textColor;
		}
		if (textHighlightColor != undefined)
		{
			this._textHighlightColor = textHighlightColor;
		}
		com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,this.leftText,true,true);
		/*
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		*/
	}

	function SetRightText(str)
	{
		this.setRightText(this.rightTextTF,str);
	}

	function SetRightBadge(txd, id)
	{
		if (this.rightBadge == com.rockstargames.NativeUI.utils.Badges.NONE)
		{
			this.itemMC.RLabelMC._x -= 24;
			this.badgeMC = this.itemMC.createEmptyMovieClip("badge", this.itemMC.getNextHighestDepth());
			var sprite_name = com.rockstargames.NativeUI.utils.Badges.getSpriteNameById(id);
			this.loadclip(txd,sprite_name,this.badgeMC);
		}
		else
		{
			removeMovieClip(this.badgeMC);
			this.itemMC.RLabelMC._x += 24;
		}
	}
	
	//LOADCLIP E ONLOADINIT VANNO INSIEME!!
	//TESTARE PER CARICARE DINAMICAMENTE ANCHE LE LIBRERIE BASE DI UIMENU!
	function loadclip(textureDict, textureName, targetMC)
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
		//com.rockstargames.ui.utils.Colour.ApplyHudColour(target_mc,!this.highlighted ? this._textColor : this._textHighlightColor);
		delete this.txd_loader;
	}

	function set highlighted(_h)
	{
		super.highlighted = _h;
		//com.rockstargames.ui.utils.Colour.ApplyHudColour(this.badgeMC,!_h ? this._textColor : this._textHighlightColor);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rightTextTF,!_h ? this._textColor : this._textHighlightColor);
	}
}