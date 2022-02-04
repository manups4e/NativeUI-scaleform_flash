class com.rockstargames.gtav.Multiplayer.ROCKSTAR_VERIFIED extends MovieClip
{
	var VERIFIED;
	function ROCKSTAR_VERIFIED()
	{
		super();
		this.VERIFIED = this;
	}
	function SET_VERIFIED(type, colourEnum)
	{
		this.VERIFIED.gotoAndStop(type + 1);
		var _loc2_ = new com.rockstargames.ui.utils.HudColour();
		if (colourEnum == undefined)
		{
			colourEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_NORTH_BLUE_OFFICIAL;
		}
		com.rockstargames.ui.utils.Colour.setHudColour(colourEnum,_loc2_);
		com.rockstargames.ui.utils.Colour.Colourise(this.VERIFIED,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
	}
}