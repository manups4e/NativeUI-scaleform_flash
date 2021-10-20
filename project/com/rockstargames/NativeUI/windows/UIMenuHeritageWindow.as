class com.rockstargames.NativeUI.windows.UIMenuHeritageWindow
{
	var itemMC;
	var _parentMenu;
	var momIdx;
	var dadIdx;
	var heritageLoader;
	var _background;
	var _momSprite;
	var _dadSprite;
	function UIMenuHeritageWindow(parentMenu, mom, dad)
	{
		this._parentMenu = parentMenu;
		this.itemMC = this._parentMenu._mainMC.attachMovie("UIMenuHeritageWindow", "heritageWindow_" + this._parentMenu._name, this._parentMenu._mainMC.getNextHighestDepth());
		this._background = this.itemMC.bgMC;
		this._momSprite = this.itemMC.momMC;
		this._dadSprite = this.itemMC.dadMC;
		if (mom != undefined)
		{
			this.momIdx = mom;
		}
		if (dad != undefined)
		{
			this.dadIdx = dad;
		}
		this.SetClip(this._background,"pause_menu_pages_char_mom_dad","mumdadbg");
		this.setIndex(this.momIdx,this.dadIdx);
	}

	function setIndex(mom, dad)
	{
		this.momIdx = mom;
		this.dadIdx = dad;
		if (mom > 21)
		{
			this.momIdx = 21;
		}
		if (mom < 0)
		{
			this.momIdx = 0;
		}
		if (dad > 23)
		{
			this.dadIdx = 23;
		}
		if (dad < 0)
		{
			this.dadIdx = 0;
		}
		this.SetClip(this._momSprite,"char_creator_portraits",this.momIdx < 21 ? "female_" + this.momIdx : "special_female_" + (this.momIdx - 21));
		this.SetClip(this._dadSprite,"char_creator_portraits",this.dadIdx < 21 ? "male_" + this.dadIdx : "special_male_" + (this.dadIdx - 21));
	}

	function SetClip(targetMC, textureDict, textureName)
	{
		this.heritageLoader = new MovieClipLoader();
		this.heritageLoader.addListener(this);
		var _loc2_ = "img://" + textureDict + "/" + textureName;
		this.heritageLoader.loadClip(_loc2_,targetMC);
	}

	function onLoadInit(target_mc)
	{
		if (target_mc == this._background)
		{
			target_mc._x = 0;
			target_mc._width = 288;
			target_mc._height = 158;
			//com.rockstargames.ui.utils.Colour.ApplyHudColour(target_mc,!this.highlighted ? this._textColor : this._textHighlightColor);
		}
		else if (target_mc == this._momSprite || target_mc == this._dadSprite)
		{
			target_mc._width = 144;
			target_mc._height = 158;
		}
		delete this.heritageLoader;
	}

}