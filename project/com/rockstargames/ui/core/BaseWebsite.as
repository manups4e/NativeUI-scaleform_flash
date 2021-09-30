class com.rockstargames.ui.core.BaseWebsite extends MovieClip
{
   var IS_SITE_DYNAMIC = 0;
   var resetScroll = true;
   function BaseWebsite()
   {
      super();
      this.dataProviderUI = new Array();
      this.dataTextScope = new Array();
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.READY();
   }
   function READY()
   {
   }
   function SET_PRICES()
   {
   }
   function DISABLE_VIDEO()
   {
   }
   function SET_MOVIECLIP_VISIBILITY(isVisible, instanceEnum)
   {
   }
   function PROXY_FUNCTION()
   {
   }
   function showMovieClip(targetMC, xPos)
   {
      targetMC._visible = true;
      targetMC._x = xPos;
   }
   function hideMovieClip(targetMC)
   {
      targetMC._visible = false;
      targetMC._x = 1300;
   }
   function TXD_HAS_LOADED()
   {
   }
   function CLEANUP()
   {
   }
}
