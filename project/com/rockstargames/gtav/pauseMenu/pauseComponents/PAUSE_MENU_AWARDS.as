class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_AWARDS extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var maxGridItems = 12;
   function PAUSE_MENU_AWARDS()
   {
      super();
      this.dbgID = "PAUSE_MENU_AWARDS";
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
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsModel();
      this.model.createView(0,{id:0,rowSpacing:2,columnSpacing:2,batchCols:4,batchRows:3,batchW:143,container:this.CONTENT,linkage:["mpAwardsItem"],visibleItems:9,selectstyle:com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descMC.descbgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descMC.gridMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.CONTENT.descMC._visible = false;
   }
   function SET_DESCRIPTION()
   {
      var _loc3_ = arguments[0];
      var _loc4_ = arguments[1];
      com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.descMC.titleTF,_loc3_);
      com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.descMC.descTF,_loc4_);
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)this.model.getCurrentView().moveVert(-1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)this.model.getCurrentView().moveHorz(1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)this.model.getCurrentView().moveVert(1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)this.model.getCurrentView().moveHorz(-1);
      }
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc3_ = this.model.getCurrentView();
      if(i == -1)
      {
         i = 0;
         while(i < _loc3_.itemList.length)
         {
            _loc3_.itemList[i].highlighted = false;
            i = i + 1;
         }
      }
      else
      {
         i = Math.max(0,Math.min(i,this.maxGridItems - 1));
         _loc3_.index = i;
      }
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      this.CONTENT.descMC._visible = true;
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)this.model.getCurrentView().setDescription();
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      this.ON_DESTROY();
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)this.model.getCurrentView().setDescription(-1);
   }
   function ON_DESTROY()
   {
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsModel)this.model.onDestroy();
   }
}
