class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_VERTICAL_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_VERTICAL_LIST()
   {
      super();
      this.dbgID = "PAUSE_MENU_VERTICAL_LIST";
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
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,container:this.CONTENT,linkage:["verticalMenuListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalView(this.model.getCurrentView());
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
