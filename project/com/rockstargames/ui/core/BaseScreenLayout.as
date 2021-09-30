class com.rockstargames.ui.core.BaseScreenLayout extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
	var FILE_WIDTH = 1280;
	var screenWidthPixels = 1280;
	var screenHeightPixels = 720;
	var safeTop = 54;
	var safeBottom = 666;
	var safeLeft = 96;
	var safeRight = 1184;
	var isWideScreen = true;
	var isHiDef = true;
	var isMultiplayer = false;
	var FOUR_THREE_PADDING = 0;
	var SD_CLIPPING = 0.125;
	function BaseScreenLayout()
	{
		super();
	}
	function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
	{
		this.isWideScreen = _isWideScreen;
		if (this.isWideScreen)
		{
			this.screenWidthPixels = 1280;
			this.screenHeightPixels = 720;
		}
		else
		{
			this.screenWidthPixels = 960;
			this.screenHeightPixels = 720;
		}
		this.safeLeft = Math.round(this.screenWidthPixels * _safeLeftPercent);
		this.safeRight = Math.round(this.screenWidthPixels * _safeRightPercent);
		this.safeTop = Math.round(this.screenHeightPixels * _safeTopPercent);
		this.safeBottom = Math.round(this.screenHeightPixels * _safeBottomPercent);
		if (!this.isWideScreen)
		{
			Stage.scaleMode = "noBorder";
		}
		this.isHiDef = _isHiDef;
		this.initScreenLayout();
	}
	function getDisplayConfig(shouldSet)
	{
		if (shouldSet == undefined)
		{
			shouldSet = true;
		}
		var _loc2_ = new com.rockstargames.ui.utils.DisplayConfig();
		com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc2_);
		if (shouldSet)
		{
			this.SET_DISPLAY_CONFIG(_loc2_.screenWidth,_loc2_.screenHeight,_loc2_.safeTop,_loc2_.safeBottom,_loc2_.safeLeft,_loc2_.safeRight,_loc2_.isWideScreen,_loc2_.isCircleAccept,_loc2_.isAsian);
		}
		return _loc2_;
	}
	function initScreenLayout()
	{
	}
	function addMCToScreenLayout(linkageID, instanceName, containerMC, position, onPixel)
	{
		var _loc3_ = containerMC.getNextHighestDepth();
		var _loc2_ = containerMC.attachMovie(linkageID, instanceName, _loc3_);
		this.positionToScreenLayout(_loc2_,position,onPixel);
		return _loc2_;
	}
	function positionToScreenLayout(mc, position, onPixel)
	{
		var _loc4_ = mc._width;
		var _loc5_ = mc._height;
		var _loc3_ = 0;
		var _loc2_ = 0;
		switch (position)
		{
			case "LT" :
			case "xLT" :
				_loc3_ = this.safeLeft;
				_loc2_ = this.safeTop;
				break;
			case "RT" :
				_loc3_ = this.safeRight - _loc4_;
				_loc2_ = this.safeTop;
				break;
			case "LB" :
				_loc3_ = this.safeLeft;
				_loc2_ = this.safeBottom - _loc5_;
				break;
			case "RB" :
				_loc3_ = this.safeRight - _loc4_;
				_loc2_ = this.safeBottom - _loc5_;
				break;
			case "RC" :
				_loc3_ = this.safeRight - _loc4_;
				_loc2_ = this.safeTop + (this.safeBottom - this.safeTop) / 2 - _loc5_ / 2;
				break;
			case "CC" :
				_loc3_ = this.FILE_WIDTH / 2 - _loc4_ / 2;
				_loc2_ = this.safeTop + (this.safeBottom - this.safeTop) / 2 - _loc5_ / 2;
				break;
			case "CB" :
				_loc3_ = this.safeLeft + (this.safeRight - this.safeLeft) / 2 - _loc4_ / 2;
				_loc2_ = this.safeBottom - _loc5_;
				break;
			case "CT" :
				_loc3_ = this.safeLeft + (this.safeRight - this.safeLeft) / 2 - _loc4_ / 2;
				_loc2_ = this.safeTop;
				break;
			case "xRT" :
				_loc3_ = this.safeRight;
				_loc2_ = this.safeTop;
				break;
			case "xLB" :
				_loc3_ = this.safeLeft;
				_loc2_ = this.safeBottom;
				break;
			case "xRB" :
				_loc3_ = this.safeRight;
				_loc2_ = this.safeBottom;
				break;
			case "xCC" :
				_loc3_ = this.FILE_WIDTH / 2 - _loc4_ / 2;
				_loc2_ = this.safeTop + (this.safeBottom - this.safeTop) / 2;
				break;
			case "xCB" :
				_loc3_ = this.FILE_WIDTH / 2 - _loc4_ / 2;
				_loc2_ = this.safeBottom;
				break;
			case "xCT" :
				_loc3_ = this.FILE_WIDTH / 2 - _loc4_ / 2;
				_loc2_ = this.safeTop;
		}
		if (onPixel)
		{
			_loc3_ = Math.round(_loc3_);
			_loc2_ = Math.round(_loc2_);
		}
		mc._x = _loc3_;
		mc._y = _loc2_;
	}
}