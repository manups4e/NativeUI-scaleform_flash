class com.rockstargames.ui.tweenStar.easing.Sine
{
   function Sine()
   {
   }
   static function easeIn(t, b, c, d)
   {
      return (- c) * Math.cos(t / d * 1.5707963267948966) + c + b;
   }
   static function easeOut(t, b, c, d)
   {
      return c * Math.sin(t / d * 1.5707963267948966) + b;
   }
   static function easeInOut(t, b, c, d)
   {
      return (- c) / 2 * (Math.cos(3.141592653589793 * t / d) - 1) + b;
   }
}
