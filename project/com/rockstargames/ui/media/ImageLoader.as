class com.rockstargames.ui.media.ImageLoader
{
	var gfxFileName = "";
	var textureDict = "";
	var textureFilename = "";
	var textureMethod = 0;
	var isLoaded = false;
	var textureContainer;

	function ImageLoader()
	{
	}
	function init(_gfxName, _texDict, _texFilename, _texContainer, _texMethod)
	{
		this.gfxFileName = _gfxName;
		this.textureDict = _texDict;
		this.textureFilename = _texFilename;
		if (_texContainer != undefined)
		{
			this.textureContainer = _texContainer;
		}
		if (_texMethod != undefined)
		{
			this.textureMethod = _texMethod;
		}
	}
	function loadImage()
	{
		this.isLoaded = false;
		if (this.gfxFileName != "" && this.textureDict != "")
		{
			com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.textureDict,this.textureFilename);
		}
	}
	function getImage(imageTextField)
	{
		this.isLoaded = false;
		if (this.gfxFileName != "" && this.textureDict != "")
		{
			com.rockstargames.ui.game.GameInterface.call("GET_TXD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.textureDict);
			this.setImage(imageTextField);
		}
	}
	function setImage(imageTextField, w, h)
	{
		var _loc4_ = "%d";
		var _loc2_ = "%d";
		if (w != undefined)
		{
			_loc4_ = w.toString();
		}
		if (h != undefined)
		{
			_loc2_ = h.toString();
		}
		if (this.textureContainer != undefined)
		{
			imageTextField = this.textureContainer;
		}
		if (imageTextField != undefined)
		{
			var _loc5_ = "img://" + this.textureDict + "/" + this.textureFilename;
			var _loc6_ = "<img src=\'" + _loc5_ + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc4_ + "\' height=\'" + _loc2_ + "\'/>";
			imageTextField.htmlText = _loc6_;
			imageTextField.autoSize = true;
		}
	}
	function setImageInMemory(imageTextField, w, h)
	{
		var _loc3_ = "%d";
		var _loc2_ = "%d";
		if (w != undefined)
		{
			_loc3_ = w.toString();
		}
		if (h != undefined)
		{
			_loc2_ = h.toString();
		}
		var _loc4_ = this.textureFilename;
		var _loc5_ = "<img src=\'" + _loc4_ + "\' vspace=\'0\' hspace=\'0\' width=\'" + _loc3_ + "\' height=\'" + _loc2_ + "\'/>";
		imageTextField.htmlText = _loc5_;
		imageTextField.autoSize = true;
	}
	function deleteImage()
	{
		if (this.gfxFileName != "" && this.textureDict != "")
		{
			com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,this.textureDict);
		}
	}
}