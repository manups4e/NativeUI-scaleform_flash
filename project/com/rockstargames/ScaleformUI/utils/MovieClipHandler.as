class com.rockstargames.ScaleformUI.utils.MovieClipHandler
{
	static var txd_loader;
	static var callback;
	static function LoadClip(targetMC, textureDict, textureName, callback)
	{
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.callback = callback;
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.txd_loader = new MovieClipLoader();
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.txd_loader.addListener(com.rockstargames.ScaleformUI.utils.MovieClipHandler);
		var _loc2_ = "img://" + textureDict + "/" + textureName;
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.txd_loader.loadClip(_loc2_,targetMC);
	}

	function onLoadInit(targetMC)
	{
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.callback.apply(targetMC);
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.txd_loader.removeListener(com.rockstargames.ScaleformUI.utils.MovieClipHandler);
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.txd_loader = null;
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.callback = null;
	}


	static function SetClip(targetMC, textureDict, textureName, w, h, callback, depth)
	{
		var alreadyLoaded = true;
		if (targetMC.textureFilename != textureName && targetMC.textureDict != textureDict)
		{
			var alreadyLoaded = false;
		}
		targetMC.init("ScaleformUI",textureDict,textureName,w,h);
		var depthAfterContent = splitPath.slice(splitPath.length - 2).join(".").length;
		var splitPath = String(targetMC).split(".");
		var pathWithoutContent = splitPath.slice(splitPath.length - depthAfterContent).join(".");
		com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(targetMC);
		targetMC._alpha = 100;
		targetMC.requestTxdRef(pathWithoutContent,alreadyLoaded,callback,depth);
	}

	static function UpdateFont(tf, fontName)
	{
		tf.embedFonts = true;
		tf.antiAliasType = "advanced";
		tf.selectable = false;
		var newFont = tf.getTextFormat();
		newFont.font = fontName;
		tf.setNewTextFormat(newFont);
		tf.setTextFormat(newFont);
	}

}