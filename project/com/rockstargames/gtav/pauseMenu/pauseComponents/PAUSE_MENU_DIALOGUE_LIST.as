class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_DIALOGUE_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_DIALOGUE_LIST()
   {
      super();
      this.dbgID = "PAUSE_MENU_DIALOGUE_LIST";
      this.scrollMask._visible = false;
   }
   function INITIALISE(mc)
   {
      if(mc)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      this.SET_FOCUS(false);
      this.containerMC = this.CONTENT.createEmptyMovieClip("containerMC",this.getNextHighestDepth());
      this.containerMC.setMask(this.scrollMask);
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuDialogueModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,maskHeight:this.scrollMask._height,titleHeight:this.titleHeight,container:this.containerMC,linkage:["dialogueListItem"],visibleItems:8,selectstyle:com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE});
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      this.CONTENT.bgMC.onRollOver = this.rollOver;
      this.CONTENT.bgMC.onRollOut = this.rollOut;
      this.CONTENT.bgMC.onDragOut = this.rollOut;
   }
   function rollOver()
   {
      _level0.TIMELINE.MOUSE_COLUMN_SHIFT(1);
   }
   function rollOut()
   {
      _level0.TIMELINE.MOUSE_COLUMN_SHIFT(0);
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      this.ON_DESTROY();
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuDialogueView)this.model.getCurrentView().scrollToBottom();
      if(this.containerMC._height > this.scrollMask._height)
      {
         this.SET_SCROLL_BAR(0,0);
         com.rockstargames.ui.game.GameInterface.call("COLUMN_CAN_SCROLL",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,true);
      }
   }
   function ON_DESTROY()
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem)_loc3_[_loc2_].onDestroy();
         _loc2_ = _loc2_ + 1;
      }
   }
}
