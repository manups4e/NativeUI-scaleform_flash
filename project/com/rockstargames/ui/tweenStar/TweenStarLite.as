class com.rockstargames.ui.tweenStar.TweenStarLite
{
	static var version:Number = 1.01;
	static var tweenMCDepth:Number = 99999;
	static var frameRate:Number = 30;
	static var tweenStarLiteRef:String = "TweenStarLiteRef";
	var duration;
	var ease;
	var props;
	var startTime;
	var target;
	var tweenStarUpdateRef;
	var updateMC;
	var vars;

	function TweenStarLite(_mytarget, _duration, _vars, _isTween)
	{
		_global.gfxExtensions = true;
		this.target = _mytarget;
		this.vars = _vars;
		this.duration = _duration * 1000;
		this.startTime = getTimer() + (this.vars.delay * 1000 || 0);
		this.ease = com.rockstargames.ui.tweenStar.Ease.EaseTable[com.rockstargames.ui.tweenStar.Ease.LINEAR];
		this.props = [];
		if (_isTween)
		{
			for (var __reg3 in this.vars)
			{
				if (__reg3 == "_x" || __reg3 == "_y" || __reg3 == "_alpha" || __reg3 == "_xscale" || __reg3 == "_yscale" || __reg3 == "_width" || __reg3 == "_height" || __reg3 == "_rotation" || __reg3 == "_xrotation" || __reg3 == "_yrotation" || __reg3 == "_zscale")
				{
					this.props.push([__reg3, this.target[__reg3], this.vars[__reg3]]);
				}
			}
			if (this.vars.ease != undefined)
			{
				if (typeof this.vars.ease == "number")
				{
					this.ease = com.rockstargames.ui.tweenStar.Ease.EaseTable[this.vars.ease];
				}
			}
		}
		this.updateMC = MovieClip(this.target).createEmptyMovieClip("TSLContainerMC", com.rockstargames.ui.tweenStar.TweenStarLite.tweenMCDepth);
		this.updateMC.tweenStarUpdateRef = this;
		this.updateMC.onEnterFrame = function()
		{
			this.tweenStarUpdateRef.updateAll();
		};
		this.target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef] = new com.rockstargames.ui.tweenStar.TweenStarLiteRef(this.updateMC, this.props, this.vars);
	}

	function updateAll()
	{
		var __reg4 = getTimer() - this.startTime;
		var __reg2 = __reg4 / this.duration;
		__reg2 = Math.min(__reg2, 1);
		for (var __reg3 in this.props)
		{
			if (__reg2 > 0)
			{
				this.target[this.props[__reg3][0]] = this.ease(__reg2, this.props[__reg3][1], this.props[__reg3][2] - this.props[__reg3][1], 1);
			}
		}
		if (__reg2 == 1)
		{
			for (__reg3 in this.props)
			{
				this.target[this.props[__reg3][0]] = this.props[__reg3][2];
			}
			delete this.updateMC.onEnterFrame;
			this.updateMC.removeMovieClip();
			if (this.vars.onComplete)
			{
				this.vars.onComplete.apply(this.vars.onCompleteScope,this.vars.onCompleteArgs);
			}
			false;
		}
	}

	static function to(target, duration, vars)
	{
		com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(target);
		var __reg1 = new com.rockstargames.ui.tweenStar.TweenStarLite(target, duration, vars, true);
		return __reg1;
	}

	static function delayCall(target, duration, vars)
	{
		com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(target);
		var __reg1 = new com.rockstargames.ui.tweenStar.TweenStarLite(target, duration, vars, false);
		return __reg1;
	}

	static function setDelay(target, _duration)
	{
		var __reg1 = target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef];
		__reg1.updateMC.tweenStarUpdateRef.startTime = 0;
		__reg1.updateMC.tweenStarUpdateRef.duration = _duration * com.rockstargames.ui.tweenStar.TweenStarLite.frameRate;
	}

	static function removeAllTweens()
	{
	}

	static function removeTweenOf(target)
	{
		var __reg1 = target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef];
		if (__reg1.updateMC != undefined)
		{
			delete __reg1.updateMC.onEnterFrame;
			__reg1.updateMC.removeMovieClip();
		}
	}

	static function endTweenOf(target, forceComplete)
	{
		var __reg1 = target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef];
		if (__reg1 != undefined)
		{
			for (var __reg3 in __reg1.props)
			{
				target[__reg1.props[__reg3][0]] = __reg1.props[__reg3][2];
			}
			if (__reg1.vars.onComplete && forceComplete)
			{
				__reg1.vars.onComplete.apply(__reg1.vars.onCompleteScope,__reg1.vars.onCompleteArgs);
			}
			delete __reg1.updateMC.onEnterFrame;
			__reg1.updateMC.removeMovieClip();
		}
	}

	static function endAllTweens(forceComplete)
	{
	}

	static function linearEase(t, b, c, d)
	{
		return c * t / d + b;
	}

}