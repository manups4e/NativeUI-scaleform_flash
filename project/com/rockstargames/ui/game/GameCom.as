class com.rockstargames.ui.game.GameCom
{
   function GameCom()
   {
   }
   static function REQUEST_RESTART_MOVIE(movieName)
   {
      com.rockstargames.ui.game.GameInterface.call("FORCE_RESTART_MOVIE",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,movieName);
   }
}
