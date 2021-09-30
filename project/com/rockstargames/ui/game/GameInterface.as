class com.rockstargames.ui.game.GameInterface
{
   static var GENERIC_TYPE = 0;
   static var SCRIPT_TYPE = 1;
   static var HUD_TYPE = 2;
   static var MINIMAP_TYPE = 3;
   static var WEB_TYPE = 4;
   static var CUTSCENE_TYPE = 5;
   static var PAUSE_TYPE = 6;
   static var STORE = 7;
   static var GAMESTREAM = 8;
   static var SF_BASE_CLASS_VIDEO_EDITOR = 9;
   static var SF_BASE_CLASS_MOUSE = 10;
   function GameInterface()
   {
   }
   static function call()
   {
      flash.external.ExternalInterface.call.apply(null,arguments);
   }
}
