class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CREW_RANKS extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_CREW_RANKS()
   {
      super();
      this.dbgID = "PAUSE_MENU_CREW_RANKS";
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
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewRanksModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,maskHeight:430 - this.titleHeight,titleHeight:this.titleHeight,container:this.scrollableContent,linkage:["crewRankItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
   }
   function SET_LINKED_LEADERBOARD(_crewsList)
   {
      this.crewsList = _crewsList;
   }
   function SHOW_COLUMN(bool)
   {
      super.SHOW_COLUMN(bool);
      if(this.crewsList != undefined)
      {
         this.crewsList.SET_HOVER_WIDTH(bool);
         this.crewsList.ADJUST_HOVER_WIDTH(bool);
      }
   }
   function SET_FOCUS(isFocused)
   {
      this.columnIsFocused = isFocused;
      this.SEND_COLUMN_PARAMS();
      if(isFocused)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewRanksModel)this.model.highlightNext();
      }
      else
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewRanksModel)this.model.clearHighlight();
      }
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
