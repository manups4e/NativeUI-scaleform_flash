class com.rockstargames.ui.utils.Colour
{
	function Colour()
	{
	}
	static function Colourise(movieClip, r, g, b, a)
	{
		r = (255 - r) * -1;
		g = (255 - g) * -1;
		b = (255 - b) * -1;
		var _loc1_ = new flash.geom.Transform(movieClip);
		var _loc4_ = new flash.geom.ColorTransform(1, 1, 1, 1, r, g, b, 0);
		_loc1_.colorTransform = _loc4_;
		movieClip._alpha = a;
	}
	static function setHudColour(hudColourEnum, hudColourObject)
	{
		com.rockstargames.ui.game.GameInterface.call("GET_HUD_COLOUR",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,hudColourEnum,hudColourObject);
	}
	static function ColouriseB(my_mc, r, g, b, a)
	{
		var _loc1_ = new Color(my_mc);
		var _loc2_ = {ra:100, rb:r, ga:100, gb:g, ba:100, bb:b, aa:100, ab:100};
		_loc1_.setTransform(_loc2_);
	}
	static function RGBToHex(r, g, b)
	{
		var _loc2_ = r.toString(16);
		var _loc1_ = g.toString(16);
		var _loc3_ = b.toString(16);
		if (_loc2_ == "0")
		{
			_loc2_ = "00";
		}
		if (_loc1_ == "0")
		{
			_loc1_ = "00";
		}
		if (_loc3_ == "0")
		{
			_loc3_ = "00";
		}
		var _loc4_ = "0x" + _loc2_ + _loc1_ + _loc3_;
		return Number(_loc4_);
	}
	static function HexToRGB(hex)
	{
		var _loc1_ = hex >> 16;
		var _loc2_ = hex - (_loc1_ << 16);
		var _loc3_ = _loc2_ >> 8;
		var _loc4_ = _loc2_ - (_loc3_ << 8);
		return {r:_loc1_, g:_loc3_, b:_loc4_};
	}
	static function ApplyHudColour(mc, colourId)
	{
		var _loc1_ = new com.rockstargames.ui.utils.HudColour();
		com.rockstargames.ui.utils.Colour.setHudColour(colourId,_loc1_);
		com.rockstargames.ui.utils.Colour.Colourise(mc,_loc1_.r,_loc1_.g,_loc1_.b,_loc1_.a);
	}

	static function ApplyHudColourToTF(tf, colourId)
	{
		var _loc1_ = new com.rockstargames.ui.utils.HudColour();
		com.rockstargames.ui.utils.Colour.setHudColour(colourId,_loc1_);
		tf.textColor = com.rockstargames.ui.utils.Colour.RGBToHex(_loc1_.r, _loc1_.g, _loc1_.b);
	}
}