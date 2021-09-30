class com.rockstargames.gtav.levelDesign.BreakingNewsTicker extends MovieClip
{
	var labelCount:Number = 0;
	var _x;
	var bgMC;
	var curLabel;
	var getNextHighestDepth;
	var labelMC;
	var removeMovieClip;

	function BreakingNewsTicker()
	{
		super();
		this.labelMC._visible = false;
	}

	function DISPLAY_SCROLL_TEXT_2(str, easing)
	{
	    var _loc2_ = com.rockstargames.ui.tweenStar.Ease[easing];
		this.CLEAR_SCROLL_TEXT_2(_loc2_);
		++this.labelCount;
		this.curLabel = this.labelMC.duplicateMovieClip("l" + this.labelCount, this.getNextHighestDepth(), {_x:this.labelMC._x + 100, _alpha:0, _visible:true});
		this.curLabel.labelTF.autoSize = true;
		this.curLabel.labelTF.htmlText = str;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.bgMC.barMC,0.3,{_width:this.labelMC._x + this.curLabel._width + 20, ease:_loc2_});
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.bgMC.tipMC,0.3,{_x:this.labelMC._x + this.curLabel._width + 20, ease:_loc2_});
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.curLabel,0.3,{_x:this.labelMC._x, _alpha:100, ease:_loc2_});
	}

	function CLEAR_SCROLL_TEXT_2(easing)
	{
		var __reg2 = this.curLabel;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(__reg2,0.2,{_x:this.labelMC._x - 50, _alpha:0, ease:easing, onComplete:this.removeMovieClip, onCompleteScope:__reg2});
	}

	function DISPLAY_SCROLL_TEXT(str)
	{
		this.CLEAR_SCROLL_TEXT();
		++this.labelCount;
		this.curLabel = this.labelMC.duplicateMovieClip("l" + this.labelCount, this.getNextHighestDepth(), {_x:this.labelMC._x + 100, _alpha:0, _visible:true});
		this.curLabel.labelTF.autoSize = true;
		this.curLabel.labelTF.htmlText = str;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.bgMC.barMC,0.3,{_width:this.labelMC._x + this.curLabel._width + 20, ease:com.rockstargames.ui.tweenStar.Ease.LINEAR});
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.bgMC.tipMC,0.3,{_x:this.labelMC._x + this.curLabel._width + 20, ease:com.rockstargames.ui.tweenStar.Ease.LINEAR});
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.curLabel,0.3,{_x:this.labelMC._x, _alpha:100, ease:com.rockstargames.ui.tweenStar.Ease.LINEAR});
	}

	function CLEAR_SCROLL_TEXT()
	{
		var __reg2 = this.curLabel;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(__reg2,0.2,{_x:this.labelMC._x - 50, _alpha:0, ease:com.rockstargames.ui.tweenStar.Ease.LINEAR, onComplete:this.removeMovieClip, onCompleteScope:__reg2});
	}

	function setLabelSafeZone(value)
	{
		this.labelMC._x = value - this._x;
		if (this.curLabel)
		{
			com.rockstargames.ui.tweenStar.TweenStarLite.to(this.curLabel,0.1,{_x:this.labelMC._x, _alpha:100, ease:com.rockstargames.ui.tweenStar.Ease.LINEAR});
		}
	}

}