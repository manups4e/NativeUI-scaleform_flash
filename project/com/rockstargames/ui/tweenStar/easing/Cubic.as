class com.rockstargames.ui.tweenStar.easing.Cubic
{
   function Cubic()
   {
   }
   static function easeIn(t, b, c, d)
   {
      return c * (t = t / d) * t * t + b;
   }
   static function easeOut(t, b, c, d)
   {
      return c * ((t = t / d - 1) * t * t + 1) + b;
   }
   static function easeInOut(t, b, c, d)
   {
      if((t = t / (d / 2)) < 1)
      {
         return c / 2 * t * t * t + b;
      }
      return c / 2 * ((t = t - 2) * t * t + 2) + b;
   }
}
