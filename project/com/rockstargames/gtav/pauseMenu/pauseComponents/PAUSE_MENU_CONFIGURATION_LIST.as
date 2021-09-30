class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CONFIGURATION_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_CONFIGURATION_LIST()
   {
      super();
      this.dbgID = "PAUSE_MENU_CONFIGURATION_LIST";
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:0,columnSpacing:0,container:this.CONTENT,linkage:["configurationListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuConfigurationView)this.model.getCurrentView();
      _loc2_.__set__index(i);
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc2_ = 0;
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         this.model.prevItem();
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         this.model.nextItem();
      }
   }
}
