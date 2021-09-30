class com.rockstargames.ui.utils.DelegateStar
{
   function DelegateStar()
   {
   }
   static function create(obj, func)
   {
      var potentialArguments = arguments.slice(2);
      var _loc2_ = function()
      {
         var _loc2_ = arguments.callee.target;
         var _loc3_ = arguments.callee.func;
         return _loc3_.apply(_loc2_,potentialArguments);
      };
      _loc2_.target = obj;
      _loc2_.func = func;
      return _loc2_;
   }
}
