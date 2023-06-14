class com.rockstargames.ui.utils.Debug
{
   function Debug()
   {
   }
   static function log(str, scriptType)
   {
      if(scriptType == undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("DEBUG_LOG",com.rockstargames.ui.game.GameInterface.HUD_TYPE,str);
      }
      else
      {
         com.rockstargames.ui.game.GameInterface.call("DEBUG_LOG",scriptType,str);
      }
      return str;
   }
   static function ObjectTrace(object, recursive)
   {
      var _loc2_ = "";
      for(var _loc4_ in object)
      {
         _loc2_ = _loc2_ + ("Name:" + object[_loc4_]._name + " [Type]: " + typeof object[_loc4_] + " [Value]: " + object[_loc4_] + "\n");
         if(recursive)
         {
            _loc2_ = _loc2_ + "RECURSE\n";
            com.rockstargames.ui.utils.Debug.ObjectTrace(object[_loc4_]);
         }
      }
      com.rockstargames.ui.utils.Debug.log(_loc2_);
   }
   static function printStats(movieName)
   {
      com.rockstargames.ui.game.GameInterface.call("DEBUG_PRINT_MEMORY_STATS",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,movieName);
   }
}
