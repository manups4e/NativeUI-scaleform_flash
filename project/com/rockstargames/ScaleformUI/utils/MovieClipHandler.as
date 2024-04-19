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
		var splitPath = String(targetMC).split(".");
		var pathWithoutContent = splitPath.slice(2).join(".");
		com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(targetMC);
		targetMC._alpha = 100;
		targetMC.requestTxdRef(pathWithoutContent,alreadyLoaded,callback,depth);
	}

	static function UpdateFont(tf, fontName, size)
	{
		tf.embedFonts = true;
		tf.antiAliasType = "advanced";
		tf.selectable = false;
		var newFont = tf.getTextFormat();
		newFont.font = fontName;
		if(size != undefined){
			newFont.size = size;
		}
		tf.setNewTextFormat(newFont);
		tf.setTextFormat(newFont);
	}

	static function ApplyHexColour(mc, hexCol)
	{
		var _loc1_ = new com.rockstargames.ui.utils.HudColour();
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.HexToARGB(hexCol,_loc1_);
		com.rockstargames.ui.utils.Colour.Colourise(mc,_loc1_.r,_loc1_.g,_loc1_.b,_loc1_.a);
	}

	static function ApplyHexColourToTF(tf, hexCol)
	{
		var _loc1_ = new com.rockstargames.ui.utils.HudColour();
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.HexToARGB(hexCol,_loc1_);
		tf.textColor = com.rockstargames.ui.utils.Colour.RGBToHex(_loc1_.r, _loc1_.g, _loc1_.b);
	}

	static function HexToARGB(hex, mc)
	{
		var val = hex & 0xFFFFFFFF
		// Convert the hexadecimal string to numeric values      

		// Extract the ARGB components
		var alpha = (val >> 24) & 0xFF;
		var red = (val >> 16) & 0xFF;
		var green = (val >> 8) & 0xFF;
		var blue = val & 0xFF;

		// Create and return the ARGB object
		mc.a = (alpha/255)*100;
		mc.r = red;
		mc.g = green;
		mc.b = blue;
	}
}