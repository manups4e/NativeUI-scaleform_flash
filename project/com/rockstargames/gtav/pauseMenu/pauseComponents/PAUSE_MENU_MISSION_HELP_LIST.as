class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MISSION_HELP_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_MISSION_HELP_LIST()
   {
      super();
      this.dbgID = "PAUSE_MENU_MISSION_HELP_LIST";
      this.scrollMask._visible = false;
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
      this.containerMC = this.CONTENT.createEmptyMovieClip("scrollContent",0);
      this.containerMC.setMask(this.scrollMask);
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:8,columnSpacing:0,maskHeight:this.scrollMask._height,titleHeight:this.titleHeight,container:this.containerMC,linkage:["missionHelpListItem"],visibleItems:15,selectstyle:com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE});
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
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW.apply(this,arguments);
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpView)this.model.getCurrentView().scrollToBottom();
      if(this.containerMC._height > this.scrollMask._height)
      {
         this.SET_SCROLL_BAR(0,0);
         com.rockstargames.ui.game.GameInterface.call("COLUMN_CAN_SCROLL",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,true);
      }
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      this.model.getCurrentView().viewContainer._y = 0;
      this.model.getCurrentView().__set__index(0);
   }
   function SET_FOCUS(isFocused)
   {
      this.columnIsFocused = isFocused;
      this.SEND_COLUMN_PARAMS();
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
