class com.rockstargames.ui.media.ImageLoaderMC extends MovieClip
{
	var gfxFileName:String = "";
	var textureDict:String = "";
	var textureFilename:String = "";
	var isLoaded:Boolean = false;
	var x:Number = 0;
	var y:Number = 0;
	var _height;
	var _width;
	var callbackFunc;
	var callbackScope;
	var createEmptyMovieClip;
	var getNextHighestDepth;
	var h;
	var thisScope;
	var txdDummy;
	var txdListener;
	var txdLoader;
	var w;

	function ImageLoaderMC()
	{
		super();
		this.txdListener = null;
	}
	function init(_gfxName, _texDict, _texFilename, __w, __h, __x, __y)
	{
		this.gfxFileName = _gfxName;
		this.textureDict = _texDict;
		this.textureFilename = _texFilename;
		if (__w != undefined)
		{
			this.w = __w;
		}
		if (__h != undefined)
		{
			this.h = __h;
		}
		if (__x != undefined)
		{
			this.x = __x;
		}
		if (__y != undefined)
		{
			this.y = __y;
		}
	}
	function onResponse(_callbackFunc, _callbackScope)
	{
		this.callbackFunc = _callbackFunc;
		this.callbackScope = _callbackScope;
	}
	function addTxdRefWithPath(mcPath, depth, _callbackFunc, _callbackScope)
	{
		var _loc2_ = this.splitPath(mcPath, depth);
		this.addTxdRef(_loc2_,_callbackFunc,_callbackScope);
	}
	function addTxdRef(callbackStrID, _callbackFunc, _callbackScope)
	{
		if (this.gfxFileName != "" && this.textureDict != "")
		{
			this.onResponse(_callbackFunc,_callbackScope);
			com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.textureDict,callbackStrID);
		}
	}
	function splitPath(mcPath, depth)
	{
		var _loc1_ = mcPath.split(".");
		var _loc2_ = _loc1_.slice(_loc1_.length - depth).join(".");
		return _loc2_;
	}
	function requestTxdRefWithPath(mcPath, depth, _callbackFunc, _callbackScope)
	{
		var _loc2_ = this.splitPath(mcPath, depth);
		this.requestTxdRef(_loc2_,false,_callbackFunc,_callbackScope);
	}
	function requestTxdRef(callbackStrID, _txdAlreadyLoaded, _callbackFunc, _callbackScope)
	{
		if (this.gfxFileName != "" && this.textureDict != "")
		{
			this.onResponse(_callbackFunc,_callbackScope);
			var _loc2_ = false;
			if (_txdAlreadyLoaded != undefined)
			{
				_loc2_ = _txdAlreadyLoaded;
			}
			com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.textureDict,callbackStrID,_loc2_);
		}
	}
	function removeTxdRef()
	{
		if (this.gfxFileName != "" && this.textureDict != "")
		{
			this.clearTxd();
			com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.textureDict);
		}
	}
	function clearTxd()
	{
		this.isLoaded = false;
		this.txdLoader.removeListener(this.txdListener);
		this.txdLoader.unloadClip();
		this.txdDummy.removeMovieClip();
		this.txdLoader = null;
		this.txdDummy = null;
	}
	function displayTxdResponse()
	{
		this.clearTxd();
		this.txdLoader = new MovieClipLoader();
		if (this.txdListener == undefined || this.txdListener == null)
		{
			this.txdListener = new Object();
		}
		this.txdListener.thisScope = this;
		this.txdListener.onLoadInit = function(target_mc)
		{
			this.thisScope.onLoadInit();
		};
		this.txdListener.onLoadError = function(target_mc)
		{
			this.thisScope.onLoadError();
		};
		this.txdLoader.addListener(this.txdListener);
		if (this.txdDummy == undefined || this.txdDummy == null)
		{
			this.txdDummy = this.createEmptyMovieClip("txdDummyMC", this.getNextHighestDepth(), {_visible:false});
		}
		var _loc2_ = "img://" + this.textureDict + "/" + this.textureFilename;
		this.txdLoader.loadClip(_loc2_,this.txdDummy);
	}
	function loadWithValidation(_gfxName, _texDict, txn, depth, __w, __h, __x, __y)
	{
		if (_texDict == undefined || txn == undefined || _texDict == "" || txn == "")
		{
			this.removeTxdRef();
		}
		else if (this.textureDict == _texDict)
		{
			if (this.isLoaded)
			{
				this.init(_gfxName,_texDict,txn,__w,__h,__x,__y);
				this.displayTxdResponse(_texDict);
			}
		}
		else
		{
			if (this.isLoaded)
			{
				this.removeTxdRef();
			}
			this.init(_gfxName,_texDict,txn,__w,__h,__x,__y);
			this.addTxdRefWithPath(String(this),depth);
		}
	}
	function onLoadInit(targetMC)
	{
		this._width = this.w;
		this._height = this.h;
		this.txdDummy._x = this.x;
		this.txdDummy._y = this.y;
		this.txdDummy._visible = true;
		this.isLoaded = true;
		if (this.callbackFunc != undefined)
		{
			this.callbackFunc.apply(this.callbackScope);
		}
		this.callbackFunc = null;
		this.callbackScope = null;
		this.txdLoader.removeListener(this.txdListener);
		this.txdListener = null;
	}
	function onLoadError(targetMC)
	{
		this.txdLoader.removeListener(this.txdListener);
		this.txdLoader = null;
		this.txdListener = null;
	}
}