class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_STATS_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var _highlightTitle = false;
   function PAUSE_MENU_STATS_LIST()
   {
      super();
      this.dbgID = "PAUSE_MENU_STATS_LIST";
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
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,maskHeight:430 - this.titleHeight,titleHeight:this.titleHeight,container:this.scrollableContent,linkage:["statsListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.LOCKED_SELECTSTYLE});
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.helpMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.helpMC.helpTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.CONTENT.helpMC.helpTF.wordWrap = true;
      this.CONTENT.helpMC.helpTF.autoSize = true;
      this.CONTENT.helpMC._visible = false;
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
   function SET_TITLE(str, highlightTitle)
   {
   }
   function SET_DESCRIPTION(helpStr)
   {
      if(helpStr != undefined)
      {
         this.CONTENT.helpMC.helpTF.text = helpStr;
      }
      this.CONTENT.helpMC._visible = helpStr != "";
      var _loc4_ = 27;
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsView)this.model.getCurrentView();
      this.CONTENT.helpMC._y = _loc3_.dataList.length * _loc4_;
      this.CONTENT.helpMC.bgMC._height = this.CONTENT.helpMC.helpTF.textHeight + 12;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsView)this.model.getCurrentView(0).itemList.length;
      var _loc5_ = 2;
      var _loc4_ = 25;
      this.bgMC._height = (_loc3_ - 1) * _loc5_ + _loc3_ * _loc4_;
      if(this.canMouseNav)
      {
         this.SEND_COLUMN_PARAMS();
      }
   }
   function SET_FOCUS(isFocused)
   {
      super.SET_FOCUS(isFocused);
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            this.model.prevItem();
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            this.model.nextItem();
      }
   }
}
