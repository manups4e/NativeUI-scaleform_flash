class com.rockstargames.gtav.levelDesign.NATIVEUI extends com.rockstargames.ui.core.BaseScreenLayout
{
	var _componentsForLoadingImages = [];
	var loaderObject;
	var _customBannerLoaded = false;
	var barMC;
	var UIMenu;
	function NATIVEUI()
	{
		super();
		_global.gfxExtensions = true;
	}

	function INITIALISE(mc)
	{
		super.INITIALISE(mc);
		this.loaderObject = new Object();
		this.UIMenu = new com.rockstargames.NativeUI.UIMenu(this.CONTENT, "NativeUI UIMenu", "Let's test");
		this.loaderObject = new com.rockstargames.ui.media.ImageLoaderManager();
	}

	function ADD_ITEM(id, str, sub, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
	{
		this.UIMenu.addItem(id,str,sub,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
	}

	function GO_UP()
	{
		this.UIMenu.goUp();
	}
	function GO_DOWN()
	{
		this.UIMenu.goDown();
	}

	function GO_LEFT()
	{
		return this.UIMenu.goLeft();
	}
	function GO_RIGHT()
	{
		return this.UIMenu.goRight();
	}

	function ADD_ITEM_TO_ITEMLIST(listItemId, item)
	{

	}

	function SET_RIGHT_BADGE(item, txd, icon)
	{
		this.UIMenu.menuItems[item].SetRightBadge(txd, icon);
	}
	/*
	function SET_BANNER_SPRITE(txd, texture)
	{
	if (txd != undefined && txd != "")
	{
	this._bannerTexture = texture;
	this.requestTexture(txd);
	this._customBannerLoaded = true;
	}
	}
	
	function requestTexture(txd)
	{
	if (txd != "" && txd != undefined)
	{
	//com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"TEST_7",txd);
	}
	}
	
	function loadTexture(txd, texture, container)
	{
	var thisObj = this;
	this.loaderObject._depth = 100;
	this.loaderObject._mc = container;
	this.loaderObject._loader = new MovieClipLoader();
	this.loaderObject._height = this.loaderObject._mc._height;
	this.loaderObject._width = this.loaderObject._mc._width;
	this.loaderObject._x = this.loaderObject._mc._x;
	this.loaderObject._y = this.loaderObject._mc._y;
	this.loaderObject._listener = new Object();
	this.loaderObject._loader.addListener(this.loaderObject._listener);
	this.loaderObject._listener.thisObj = thisObj;
	this.loaderObject._listener.onLoadInit = function(target_mc)
	{
	target_mc._width = this.thisObj.loaderObject._width;
	target_mc._height = this.thisObj.loaderObject._height;
	target_mc._x = this.thisObj.loaderObject._x;
	target_mc._y = this.thisObj.loaderObject._y;
	var _loc2_ = this.thisObj.loaderObject;
	_loc2_._loader.removeListener(_loc2_._listener);
	_loc2_._loader = null;
	
	};
	var _loc3_ = "img://" + txd + "/" + texture;
	this.loaderObject._loader.loadClip(_loc3_,this.loaderObject._mc);
	}
	
	function TXD_HAS_LOADED(textureDict, success)
	{
	if (success)
	{
	if (textureDict == this._stockMenuDict)
	{
	this.loadTextureIntoMovieClip(textureDict,this._bannerTexture,this.bannerSprite);
	this.loadTextureIntoMovieClip(textureDict,this._bodyTexture,this.bodySprite);
	}
	}
	}
	
	function loadTextureIntoMovieClip(txd, texture, targetLoadedInto)
	{
	setDebugText("" + txd + " , " + texture + ".");
	var thisObj = this;
	var _loc3_ = this._componentsForLoadingImages.length + 1;
	var _loc2_ = new com.rockstargames.ui.core.BaseComponentInfo(_loc3_);
	this._componentsForLoadingImages[_loc3_] = _loc3_;
	_loc2_._depth = _loc3_ + 10;
	_loc2_._mc = targetLoadedInto;
	_loc2_._position[0] = targetLoadedInto._x;
	_loc2_._position[1] = targetLoadedInto._y;
	_loc2_._size[0] = targetLoadedInto._width;
	_loc2_._size[1] = targetLoadedInto._height;
	_loc2_._listener = new Object();
	_loc2_._loader.addListener(this.loaderObject._listener);
	_loc2_._listener.thisObj = thisObj;
	_loc2_._listener.componentID = _loc3_;
	_loc2_._listener.onLoadInit = function(target_mc)
	{
	target_mc._width = this.thisObj._loc2_._size[0];
	target_mc._height = this.thisObj._loc2_._size[1];
	target_mc._x = this.thisObj._loc2_._position[0];
	target_mc._y = this.thisObj._loc2_._position[1];
	var _loc2_ = this.thisObj._componentsForLoadingImages[this.componentID];
	_loc2_._loader.removeListener(_loc2_._listener);
	_loc2_._loader = null;
	};
	var _loc5_ = "img://" + txd + "/" + texture;
	_loc2_._loader.loadClip(_loc5_,_loc2_._mc);
	}
	*/
	/*   function LOAD_BACKGROUND(txdString)
	   {
	      this.wallpaper_loader = new MovieClipLoader();
	      this.wallpaper_loader.addListener(this);
	      var _loc2_ = "img://" + txdString + "/" + txdString;
	      this.wallpaper_loader.loadClip(_loc2_,this.CONTENT.phoneBackground.bgMC);
	   }
	*/
}