class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_TEXT_LIST_FULL extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_TEXT_LIST_FULL()
   {
      super();
      this.dbgID = "PAUSE_MENU_TEXT_LIST_FULL";
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
      this.SET_FOCUS(false);
      this.scrollableContent = this.CONTENT.createEmptyMovieClip("scrollContent",0);
      var _loc3_ = this.scrollableContent.createEmptyMovieClip("scrollContent",0);
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextFullModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,maskHeight:430,titleHeight:this.titleHeight,container:_loc3_,linkage:["textListFullItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
   }
   function SET_FOCUS(isFocused)
   {
      this.columnIsFocused = isFocused;
      this.SEND_COLUMN_PARAMS();
      if(isFocused)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextFullModel)this.model.highlightNext();
      }
      else
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextFullModel)this.model.clearHighlight();
      }
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextFullView)this.model.getCurrentView();
      _loc2_.__set__index(i);
   }
   function getKeys()
   {
      if(Key.isDown(38))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
      }
      else if(Key.isDown(40))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
      }
   }
   function SET_INPUT_EVENT(direction)
   {
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
