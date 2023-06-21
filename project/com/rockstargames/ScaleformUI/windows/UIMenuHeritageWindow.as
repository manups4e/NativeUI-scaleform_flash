class com.rockstargames.ScaleformUI.windows.UIMenuHeritageWindow
{
	var itemMC;
	var _parentMenu;
	var momIdx;
	var dadIdx;

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
		this._background = this.itemMC.attachMovie("txdLoader", "heritageBG", this.itemMC.getNextHighestDepth());
		this._dadSprite = this.itemMC.attachMovie("txdLoader", "heritageDad", this.itemMC.getNextHighestDepth(), {_x:124});
		this._momSprite = this.itemMC.attachMovie("txdLoader", "heritageMom", this.itemMC.getNextHighestDepth(), {_x:20});
		this.SetClip(this._background,"pause_menu_pages_char_mom_dad","mumdadbg",288,158);
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
		this.SetClip(this._dadSprite,"char_creator_portraits",this.dadIdx < 21 ? "male_" + this.dadIdx : "special_male_" + (this.dadIdx - 21),144,158,this.dadLoaded);
		this.SetClip(this._momSprite,"char_creator_portraits",this.momIdx < 21 ? "female_" + this.momIdx : "special_female_" + (this.momIdx - 21),144,158,this.momLoaded);
	}

	function SetClip(targetMC, textureDict, textureName, w, h, callback)
	{
		var _loaded = true;
		if (targetMC.textureFilename != textureName && targetMC.textureDict != textureDict)
		{
			_loaded = false;
		}
		/*
		if (targetMC.isLoaded)
		{
		targetMC.removeTxdRef();
		}
		*/ 
		targetMC.init("ScaleformUI",textureDict,textureName,w,h);
		var _loc7_ = 2;
		var _loc5_ = String(targetMC).split(".");
		var _loc8_ = _loc5_.slice(_loc5_.length - _loc7_).join(".");
		com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(targetMC);
		targetMC._alpha = 100;
		targetMC.requestTxdRef(_loc8_,_loaded,callback,this);
	}
	function momLoaded()
	{
		this._momSprite._x = 20;
	}
	function dadLoaded()
	{
		this._dadSprite._x = 124;
	}
	
	function set Width(w)
	{
		this.itemMC._width = w;
	}


	function Clear()
	{
		if (this._background != undefined)
		{
			if (this._background.isLoaded)
			{
				this._background.removeTxdRef();
			}
		}
		if (this._dadSprite != undefined)
		{
			if (this._dadSprite.isLoaded)
			{
				this._dadSprite.removeTxdRef();
			}
		}
		if (this._momSprite != undefined)
		{
			if (this._momSprite.isLoaded)
			{
				this._momSprite.removeTxdRef();
			}
		}
		this.itemMC.removeMovieClip();
	}
}