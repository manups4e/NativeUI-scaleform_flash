class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CREWS_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var isHoverWidthLong = false;
   function PAUSE_MENU_CREWS_LIST()
   {
      super();
      this.dbgID = "PAUSE_MENU_CREWS_LIST";
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
      this.scrollableContent = this.CONTENT.createEmptyMovieClip("scrollContent",0);
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,maskHeight:430 - this.titleHeight,titleHeight:this.titleHeight,container:this.scrollableContent,linkage:["crewsListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
   }
   function SET_HOVER_WIDTH(b)
   {
      this.isHoverWidthLong = b;
   }
   function ADJUST_HOVER_WIDTH(b)
   {
      var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListView)this.model.getCurrentView();
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.itemList.length)
      {
         var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem)_loc4_.itemList[_loc2_];
         _loc3_.setBgWidthLong(this.isHoverWidthLong);
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_FOCUS(isFocused)
   {
      this.columnIsFocused = isFocused;
      this.SEND_COLUMN_PARAMS();
      if(isFocused)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListModel)this.model.highlightNext();
      }
      else
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListModel)this.model.clearHighlight();
      }
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
         this.scrollBase._visible = isFocused && this.scrollBase.displayEnabled();
      }
   }
   function SET_HIGHLIGHT(i)
   {
      this.CLEAR_HIGHLIGHT();
      var _loc3_ = (com.rockstargames.ui.components.GUIView)this.model.getCurrentView();
      _loc3_.__set__index(i);
      super.SET_FOCUS(true);
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      if(this.canMouseNav)
      {
         this.SEND_COLUMN_PARAMS();
      }
      this.ADJUST_HOVER_WIDTH();
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
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      (com.rockstargames.ui.components.GUIView)this.model.getCurrentView().__set__index(0);
   }
}
