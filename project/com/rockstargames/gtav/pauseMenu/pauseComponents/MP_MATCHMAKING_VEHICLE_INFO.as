class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_VEHICLE_INFO extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var TOP_ROW_PADDING = 5;
   function MP_MATCHMAKING_VEHICLE_INFO()
   {
      super();
      this.dbgID = "MP_MATCHMAKING_VEHICLE_INFO";
      _global.gfxExtensions = true;
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
      this.CONTENT.innerMC._visible = false;
      this.CONTENT.innerMC.nameTF.textAutoSize = "shrink";
      this.CONTENT.innerMC.classTF.textAutoSize = "shrink";
      this.SET_DESCRIPTION("");
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.innerMC.nameTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.innerMC.statusMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.innerMC.statusMC.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.innerMC.oddsMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.innerMC.oddsMC.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.innerMC.betMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.innerMC.betMC.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
   }
   function SET_TITLE(nameStr, classStr, eAlignment)
   {
      this.m_eAlignment = Number(eAlignment);
      if(nameStr != undefined)
      {
         this.CONTENT.innerMC.nameTF.text = nameStr;
      }
      if(classStr != undefined)
      {
         this.CONTENT.innerMC.classTF.text = classStr;
      }
      var _loc2_ = this.CONTENT.innerMC.nameTF.getTextFormat();
      switch(this.m_eAlignment)
      {
         case -1:
            _loc2_.align = "left";
            this.CONTENT.innerMC.nameTF.setTextFormat(_loc2_);
            this.CONTENT.innerMC.nameTF._x = -250;
            this.CONTENT.innerMC.classTF._x = this.CONTENT.innerMC.nameTF._x + this.CONTENT.innerMC.nameTF._width - this.CONTENT.innerMC.classTF._width - 210;
            break;
         case 0:
            _loc2_.align = "center";
            this.CONTENT.innerMC.nameTF.setTextFormat(_loc2_);
            this.CONTENT.innerMC.nameTF._x = -25;
            this.CONTENT.innerMC.classTF._x = this.CONTENT.innerMC.nameTF._x + this.CONTENT.innerMC.nameTF._width - this.CONTENT.innerMC.classTF._width - 100;
            break;
         case 1:
            _loc2_.align = "right";
            this.CONTENT.innerMC.nameTF.setTextFormat(_loc2_);
            this.CONTENT.innerMC.nameTF._x = 265;
            this.CONTENT.innerMC.classTF._x = this.CONTENT.innerMC.nameTF._x + this.CONTENT.innerMC.nameTF._width - this.CONTENT.innerMC.classTF._width - 100;
      }
      this.CONTENT.innerMC._visible = true;
      this.centerTopRow();
   }
   function SET_DESCRIPTION(statusStr, eStatusBGColour, oddsStr, eOddsBGColour, betStr, eBetBGColour)
   {
      this.setTextWithBG(this.CONTENT.innerMC.statusMC,statusStr,eStatusBGColour);
      this.setTextWithBG(this.CONTENT.innerMC.oddsMC,oddsStr,eOddsBGColour);
      this.setTextWithBG(this.CONTENT.innerMC.betMC,betStr,eBetBGColour);
      this.centerTopRow();
   }
   function setTextWithBG(mc, str, eBGColour)
   {
      if(str && str != "")
      {
         mc._visible = true;
         mc.labelMC.itemTF.text = str;
         mc.bgMC._width = mc.labelMC.itemTF.textWidth + 10;
         mc.bgMC._x = 145 - mc.bgMC._width;
         if(eBGColour != undefined && typeof eBGColour == "number")
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(mc.bgMC,eBGColour);
         }
      }
      else
      {
         mc._visible = false;
      }
   }
   function centerTopRow()
   {
      var _loc4_ = 144;
      switch(this.m_eAlignment)
      {
         case -1:
            _loc4_ = -110;
            break;
         case 0:
            _loc4_ = 144;
            break;
         case 1:
            _loc4_ = 434;
      }
      var _loc3_ = this.CONTENT.innerMC.statusMC;
      var _loc2_ = this.CONTENT.innerMC.oddsMC;
      var _loc5_ = this.CONTENT.innerMC.betMC;
      var _loc6_ = (!_loc3_._visible?0:_loc3_.bgMC._width + this.TOP_ROW_PADDING) + (!_loc2_._visible?0:_loc2_.bgMC._width + this.TOP_ROW_PADDING) + (!_loc5_._visible?0:_loc5_.bgMC._width + this.TOP_ROW_PADDING);
      _loc3_._x = _loc4_ - _loc6_ * 0.5 - _loc3_.bgMC._x;
      _loc2_._x = this.getRightEdge(_loc3_) - _loc2_.bgMC._x;
      _loc5_._x = this.getRightEdge(_loc2_) - _loc5_.bgMC._x;
   }
   function getRightEdge(mc)
   {
      return mc._x + (!mc._visible?0:mc._width + this.TOP_ROW_PADDING);
   }
}
