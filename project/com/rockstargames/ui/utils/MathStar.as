class com.rockstargames.ui.utils.MathStar
{
   static var PI_OVER_180 = 0.017453292519943295;
   function MathStar()
   {
   }
   static function getRandomNumber(min, max)
   {
      var _loc1_ = Math.floor(Math.random() * (max - min + 1)) + min;
      return _loc1_;
   }
   static function toFixedRound(num, fractionDigits)
   {
      return com.rockstargames.ui.utils.MathStar.toFixed(num,fractionDigits,true);
   }
   static function toFixed(num, fractionDigits, round)
   {
      var _loc2_ = 1;
      var _loc1_ = 0;
      while(_loc1_ < fractionDigits)
      {
         _loc2_ = _loc2_ * 10;
         _loc1_ = _loc1_ + 1;
      }
      return (!round?Math.floor(num * _loc2_):Math.round(num * _loc2_)) / _loc2_;
   }
}
