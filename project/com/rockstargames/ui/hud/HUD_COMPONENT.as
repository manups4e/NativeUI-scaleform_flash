class com.rockstargames.ui.hud.HUD_COMPONENT extends MovieClip
{
   var IS_PAUSED = false;
   var FADE_DURATION = 100;
   var ON_SCREEN_DURATION = 5000;
   var firstRunFlag = true;
   var MP_IS_ACTIVE = false;
   function HUD_COMPONENT()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
   }
   function READY(id)
   {
      this._enumID = id;
   }
   function getTopCompOffset()
   {
      return 0;
   }
   function getBottomCompOffset()
   {
      return 0;
   }
   function SET_HUD(hud)
   {
      this._HUD = hud;
   }
   function destroy()
   {
      this._HUD = null;
      delete this._HUD;
   }
}
