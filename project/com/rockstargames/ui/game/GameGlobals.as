class com.rockstargames.ui.game.GameGlobals
{
   static var CELEBRATION_SCREEN = 10;
   static var YACHT = 11;
   static var OFFICE = 12;
   static var CLUBHOUSE = 13;
   static var GARAGE_1 = 14;
   static var GARAGE_2 = 15;
   static var VEHICLE_SALE = 16;
   static var TRUCK = 17;
   static var CHOPPER = 18;
   function GameGlobals()
   {
   }
   static function setGlobalFlag(globalFlagID, value)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,globalFlagID,value);
   }
}
