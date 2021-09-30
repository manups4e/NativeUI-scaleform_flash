class com.rockstargames.ui.core.ScreenLayoutUI extends com.rockstargames.ui.core.BaseScriptUI
{
   function ScreenLayoutUI()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.screenManager = new com.rockstargames.ui.core.ScreenLayoutManager();
   }
   function SET_SAFE(value)
   {
      this.screenManager.setSafeZone(arguments);
   }
   function SET_RATIO(r)
   {
      this.screenManager.setRatio(r);
   }
}
