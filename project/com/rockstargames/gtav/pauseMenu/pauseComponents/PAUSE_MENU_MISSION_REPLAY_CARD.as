class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MISSION_REPLAY_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var spacing = 2;
   function PAUSE_MENU_MISSION_REPLAY_CARD()
   {
      super();
      this.dbgID = "PAUSE_MENU_MISSION_REPLAY_CARD";
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
         this.CONTENT = this.CONTENT.myMC;
      }
      this.headingHeight = this.CONTENT.headingMC._height;
      this.yOffset = this.CONTENT.headingMC._y;
      this.model = new com.rockstargames.gtav.levelDesign.MissionCompleteModel();
      this.model.createView(0,{id:0,x:0,y:this.yOffset + this.spacing,rowSpacing:this.spacing,columnSpacing:0,selectstyle:2,container:this.CONTENT.viewContainerMC,visibleItems:5,linkage:["missionReplayCardItem"]});
      this.CONTENT.background._height = this.CONTENT.popupMC._y = this.yOffset + this.headingHeight - 1;
      this.CONTENT._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.headingMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.background,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.popupMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.headingMC.colMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.popupMC.groupMC.valueTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
   }
   function SET_DATA_SLOT(_slotIndex)
   {
      var _loc3_ = arguments.splice(1);
      this.model.addDataToView(0,_slotIndex,_loc3_);
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      this.CONTENT._visible = false;
   }
   function UPDATE_DATA_SLOT(_slotIndex)
   {
      var _loc3_ = arguments.splice(1);
      this.model.updateSlot(0,_slotIndex,_loc3_);
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      var _loc3_ = this.model.getCurrentView(0).__get__maxitems();
      this.model.getCurrentView(0).visibleItems = _loc3_;
      if(itemIndex == undefined)
      {
         itemIndex = 0;
      }
      this.model.displayView(viewIndex,itemIndex);
      this.resizeBackground();
      this.CONTENT._visible = true;
      if(this.canMouseNav)
      {
         this.SEND_COLUMN_PARAMS();
      }
   }
   function clampText(textF, labelS, maxVal)
   {
      textF.text = labelS;
      textF.wordWrap = false;
      if(textF._width > maxVal)
      {
         textF._xscale = maxVal / textF._width * 100;
      }
   }
   function SET_TITLE(title, desc)
   {
      var _loc2_ = this.CONTENT.headingMC.colMC.headingTF;
      _loc2_.text = desc;
      _loc2_.textAutoSize = "shrink";
      _loc2_._width = 275;
      this.CONTENT.headingMC.bgMC._height = this.headingHeight;
      this.model.getCurrentView(0).viewContainerY = this.model.getCurrentView(0).viewContainer._y = this.headingHeight + this.spacing;
   }
   function SET_DESCRIPTION(medalColourEnum, totalValue, totalLabel)
   {
      var _loc2_ = this.CONTENT.popupMC.groupMC;
      this.SET_MEDAL(medalColourEnum);
      com.rockstargames.ui.utils.UIText.setSizedText(_loc2_.totalTF,totalLabel,true);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(_loc2_.totalTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.popupMC.underscoreMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      var _loc3_ = "";
      if(totalLabel != -99)
      {
         _loc3_ = totalValue + "%";
      }
      com.rockstargames.ui.utils.UIText.setSizedText(_loc2_.valueTF,_loc3_,false,false,0,13);
   }
   function SET_MEDAL(medalColourEnum)
   {
      if(medalColourEnum == -99)
      {
         this.CONTENT.popupMC._visible = true;
         this.CONTENT.popupMC.groupMC.medalMC._visible = false;
      }
      else if(medalColourEnum == 0)
      {
         this.CONTENT.popupMC._visible = false;
         this.CONTENT.popupMC.groupMC.medalMC._visible = true;
      }
      else
      {
         this.CONTENT.popupMC._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.popupMC.groupMC.medalMC,medalColourEnum);
         this.CONTENT.popupMC.groupMC.medalMC._visible = true;
      }
   }
   function resizeBackground()
   {
      var _loc3_ = this.model.getCurrentView(0).itemList;
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc4_ = _loc4_ + (_loc3_[_loc2_].bgMC._height + this.spacing);
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.background._height = _loc4_;
      this.CONTENT.popupMC._y = this.CONTENT.background._y + this.CONTENT.background._height;
   }
}
