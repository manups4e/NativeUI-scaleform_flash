class com.rockstargames.NativeUI.items.BaseMenuItem
{
	var disabledItemColor = [163, 159, 148];
	var isActive:Boolean = true;
	var _highlighted;
	var _width = 288;
	var _height = 25;
	var itemMC;
	var backgroundMC;
	var subtitle;
	var _parentMenu;
	var leftTextTF;
	var leftText;
	var customColourBG;
	var parentMC;
	function BaseMenuItem(parent, str, substr)
	{
		this._parentMenu = parent;
		this.parentMC = this._parentMenu._mainMC;
		this.leftText = str;
		this.subtitle = substr;
		
	}

	function set highlighted(_h)
	{
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.backgroundMC,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
		this._highlighted = _h;
	}

	function get highlighted()
	{
		return this._highlighted;
	}

	function getColour(col)
	{
		var _loc1_ = new com.rockstargames.ui.utils.HudColour();
		var _loc2_ = com.rockstargames.ui.utils.HudColour[col];
		if (isNaN(_loc2_))
		{
			_loc2_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
		}
		com.rockstargames.ui.utils.Colour.setHudColour(_loc2_,_loc1_);
		return _loc1_.r * 65536 + _loc1_.g * 256 + _loc1_.b;
	}

	function set _visible(_v)
	{
		this.itemMC._visible = _v;
	}
	function get _visible()
	{
		return this.itemMC._visible;
	}

}