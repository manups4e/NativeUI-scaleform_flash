class com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick extends MovieClip
{
	static var TYPE_FEED:Number = 0;
	static var TYPE_TWITTER:Number = 1;
	static var TYPE_SOCIAL:Number = 2;
	static var TYPE_JOB:Number = 3;
	var crewTagScale:Number = 85;
	var crewtagOffset:Number = -12;
	var attachMovie;
	var endMC;
	var getNextHighestDepth;

	function OnlineTVTick()
	{
		super();
	}

	function setLabel(enum, str)
	{
		var __reg3 = undefined;
		var __reg5 = 0;
		var __reg7 = 14;
		var __reg4 = 0;
		while (__reg4 < arguments.length)
		{
			var __reg0 = arguments[__reg4];
			if ((__reg0) === com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_JOB)
			{
				__reg3 = this.attachMovie("TickJobItem", "l" + __reg4 / 2, this.getNextHighestDepth(), {_x:__reg5});
				__reg3.bgMC._alpha = 0;
				__reg7 = 20;
			}
			else if (__reg0 === com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_SOCIAL)
			{
				__reg3 = this.attachMovie("TickFeedItem", "l" + __reg4 / 2, this.getNextHighestDepth(), {_x:__reg5});
				com.rockstargames.ui.utils.Colour.Colourise(__reg3.bgMC,255,167,21);
			}
			else if (__reg0 === com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER)
			{
				__reg3 = this.attachMovie("TickFeedItem", "l" + __reg4 / 2, this.getNextHighestDepth(), {_x:__reg5});
				com.rockstargames.ui.utils.Colour.Colourise(__reg3.bgMC,92,173,226);
			}
			else
			{
				__reg0 === com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED;
				__reg3 = this.attachMovie("TickFeedItem", "l" + __reg4 / 2, this.getNextHighestDepth(), {_x:__reg5});
				com.rockstargames.ui.utils.Colour.Colourise(__reg3.bgMC,193,3,15);
			}
			__reg3.textTF.autoSize = true;
			__reg3.textTF.htmlText = arguments[__reg4 + 1];
			var __reg6 = __reg3.textTF._width + __reg7 * 2;
			__reg3.bgMC._width = __reg6;
			__reg3.textTF._x = __reg7;
			__reg5 = __reg3._x + __reg6;
			__reg4 = __reg4 + 2;
		}
		this.endMC._x = Math.round(__reg5);
	}

	function get tickWidth()
	{
		return this.endMC._x + 1;
	}

}