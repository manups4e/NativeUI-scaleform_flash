class com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES
{
	function ROUND_DECIMAL_PLACES()
	{
	}
	static function roundDecimals(numIn, decimalPlaces)
	{
		if (decimalPlaces == undefined)
		{
			decimalPlaces = 2;
		}
		var _loc1_ = numIn.toString();
		var _loc2_ = _loc1_.lastIndexOf(".");
		if (_loc2_ == -1)
		{
			return parseFloat(_loc1_);
		}
		return parseFloat(_loc1_.substring(0, _loc2_ + decimalPlaces + 1));
	}
}