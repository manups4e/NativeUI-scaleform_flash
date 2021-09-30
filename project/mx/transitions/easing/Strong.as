class mx.transitions.easing.Strong
{
   static var version = "1.1.0.52";
   function Strong()
   {
   }
   static function easeIn(t, b, c, d)
   {
      return c * (t = t / d) * t * t * t * t + b;
   }
   static function easeOut(t, b, c, d)
   {
      return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
   }
   static function easeInOut(t, b, c, d)
   {
      if((t = t / (d / 2)) < 1)
      {
         return c / 2 * t * t * t * t * t + b;
      }
      return c / 2 * ((t = t - 2) * t * t * t * t + 2) + b;
   }
}
