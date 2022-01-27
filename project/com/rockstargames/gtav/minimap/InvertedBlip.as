class com.rockstargames.gtav.minimap.InvertedBlip extends MovieClip
{
	function InvertedBlip()
	{
		super();
		var _loc3_ = new flash.geom.Transform(this);
		var _loc4_ = new flash.geom.ColorTransform(-1, -1, -1, 1, 255, 255, 255, 0);
		_loc3_.colorTransform = _loc4_;
	}
}