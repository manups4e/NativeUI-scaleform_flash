class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_TEXT_LIST_DOUBLE extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_TEXT_LIST_DOUBLE()
   {
      super();
      this.dbgID = "PAUSE_MENU_TEXT_LIST_DOUBLE";
      this.scrollMask._visible = false;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
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
      this.scrollableContent.setMask(this.scrollMask);
      var _loc3_ = this.scrollableContent.createEmptyMovieClip("scrollContent",0);
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:-2,columnSpacing:0,maskHeight:430,titleHeight:this.titleHeight,container:_loc3_,linkage:["textListDoubleItem"],visibleItems:15,selectstyle:com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE});
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW.apply(this,arguments);
      if(this.scrollableContent._height > 430)
      {
         com.rockstargames.ui.game.GameInterface.call("COLUMN_CAN_SCROLL",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,true);
      }
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      this.model.getCurrentView().viewContainer._y = 0;
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
