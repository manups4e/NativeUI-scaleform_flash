class com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTicker extends MovieClip
{
	var tickCount:Number = 0;
	var speedDefault:Number = 3;
	var speedCur = com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTicker.prototype.speedDefault;
	var bg;
	var container;
	var createEmptyMovieClip;
	var getNextHighestDepth;
	var mask;
	var onEnterFrame;
	var ticks;

	function OnlineTVTicker()
	{
		super();
		this.ticks = [];
		this.container = this.createEmptyMovieClip("container", this.getNextHighestDepth());
		this.container.beginFill(16711935);
		this.container.lineTo(0,this.mask._height);
		this.container.setMask(this.mask);
	}

	function ADD_TICKER_TEXT(enum, str)
	{
		if (this.ticks.length == 0)
		{
			this.container._x = this.mask._width;
		}
		var __reg4 = this.ticks.length == 0 ? 0 : this.ticks[this.ticks.length - 1]._x + this.ticks[this.ticks.length - 1]._width;
		var __reg3 = com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick(this.container.attachMovie("Tick", "t" + this.tickCount++, this.container.getNextHighestDepth(), {_x:__reg4}));
		__reg3.setLabel.apply(__reg3,arguments);
		this.ticks.push(__reg3);
		if (this.onEnterFrame != this.updateDisplay)
		{
			this.onEnterFrame = this.updateDisplay;
		}
	}

	function SET_TICKER_SPEED(speed)
	{
		this.speedCur = speed;
	}

	function SET_DEFAULT_SPEED()
	{
		this.speedCur = this.speedDefault;
	}

	function updateWidth(value)
	{
		var __reg2 = this.mask._width - value;
		this.mask._width = this.bg._width = value;
		this.container._x = this.container._x - __reg2;
	}

	function updateDisplay()
	{
		this.container._x = Math.round(this.container._x - this.speedCur);
		var __reg2 = undefined;
		if (this.ticks.length == 0)
		{
			this.container._x = this.mask._width;
			this.onEnterFrame = undefined;
			return undefined;
		}
		if (this.container._x < 0 - this.ticks[0]._x - this.ticks[0]._width)
		{
			__reg2 = com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick(this.ticks.shift());
			__reg2.removeMovieClip();
			if (this.ticks.length == 0)
			{
				this.container._x = this.mask._width;
				return undefined;
			}
			var __reg5 = this.ticks[0]._x;
			this.container._x = this.container._x + __reg5;
			var __reg4 = 0;
			while (__reg4 < this.ticks.length)
			{
				__reg2 = this.ticks[__reg4];
				__reg2._x = __reg2._x - __reg5;
				++__reg4;
			}
		}
		var __reg3 = 0;
		__reg4 = 0;
		for (; ; )
		{
			if (__reg4 >= this.ticks.length)
			{
				return;
			}
			__reg2 = this.ticks[__reg4];
			if (__reg2._x != __reg3)
			{
				if (__reg2._x < __reg3 + 1)
				{
					__reg2._x = __reg3;
				}
				else if (__reg2._x - __reg3 < this.mask._width / 3)
				{
					__reg2._x = __reg2._x - (__reg2._x - __reg3) / 10;
				}
			}
			__reg3 = __reg2._x + __reg2.__get__tickWidth();
			++__reg4;
		}
	}

}