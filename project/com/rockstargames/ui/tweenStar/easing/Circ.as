class com.rockstargames.ui.tweenStar.easing.Circ
{
   function Circ()
   {
   }
   static function easeIn(t, b, c, d)
   {
      return (- c) * (Math.sqrt(1 - (t = t / d) * t) - 1) + b;
   }
   static function easeOut(t, b, c, d)
   {
      return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;
   }
   static function easeInOut(t, b, c, d)
   {
      if((t = t / (d / 2)) < 1)
      {
         return (- c) / 2 * (Math.sqrt(1 - t * t) - 1) + b;
      }
      return c / 2 * (Math.sqrt(1 - (t = t - 2) * t) + 1) + b;
   }
}
