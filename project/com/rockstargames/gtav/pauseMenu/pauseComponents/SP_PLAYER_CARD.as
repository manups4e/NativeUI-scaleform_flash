class com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   static var PI_OVER_180 = 0.017453292519943295;
   static var NUM_STAT_ITEMS = 5;
   static var BG_FILL_ALPHA = 20;
   function SP_PLAYER_CARD()
   {
      super();
      this.menuList = new Array(com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.NUM_STAT_ITEMS);
      this.currAngle = 0;
      this.statsMaxDegrees = [180,45,45,45,45];
      this.dbgID = "SP_PLAYER_CARD";
      _global.gfxExtensions = true;
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
      if(this.CONTENT.titleBGMC)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.titleBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.headerBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.bodyBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.statWheelMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.statWheelMC.bgFillMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.CONTENT.statWheelMC.bgFillMC._alpha = com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.BG_FILL_ALPHA;
      var _loc6_ = 135;
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.NUM_STAT_ITEMS)
      {
         var _loc5_ = this.getMovieID();
         var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuSPCardItem)this.CONTENT.attachMovie(_loc5_,_loc5_ + _loc3_ + "MC",this.CONTENT.getNextHighestDepth());
         _loc4_._y = _loc6_ + _loc4_._height * _loc3_;
         _loc4_._visible = false;
         this.menuList[_loc3_] = _loc4_;
         _loc3_ = _loc3_ + 1;
      }
      this.wheelRadius = this.CONTENT.statWheelMC.bgFillMC._width * 0.5;
      this.CONTENT.statWheelMC.createEmptyMovieClip("wheelMC",this.getNextHighestDepth(),{_x:0,_y:0});
      this.CONTENT.statWheelMC.wheelMC.setMask(this.CONTENT.statWheelMC.maskMC);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.pctTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.CONTENT.pctTF.textAutoSize = "shrink";
   }
   function getMovieID()
   {
      return "spPlayerCardStatItem";
   }
   function SET_TITLE(titleStr, crewTagStr, hudColourEnum)
   {
      this.CONTENT.titleTF.text = titleStr;
      if(crewTagStr == "")
      {
         if(this.CONTENT.crewTagMC)
         {
            this.CONTENT.crewTagMC._visible = false;
         }
      }
      else
      {
         if(!this.CONTENT.crewTagMC)
         {
            this.CONTENT.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",this.CONTENT.getNextHighestDepth(),{_y:4,_xscale:70,_yscale:70});
         }
         this.CONTENT.crewTagMC._visible = true;
         this.CONTENT.crewTagMC.UNPACK_CREW_TAG(crewTagStr);
         this.CONTENT.crewTagMC._x = this.CONTENT.titleTF._x + this.CONTENT.titleTF.textWidth + 10;
      }
      if(this.CONTENT.titleBGMC)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.titleBGMC,hudColourEnum);
      }
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      if(_viewIndex == 0)
      {
         this.CONTENT.pctTF.text = arguments[2];
         var _loc6_ = 3;
         if(arguments[_loc6_])
         {
            var _loc3_ = 0;
            while(_loc3_ < _loc6_ + com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.NUM_STAT_ITEMS)
            {
               var _loc4_ = this.CONTENT["stat" + _loc3_ + "TF"];
               if(_loc4_ != undefined)
               {
                  var _loc5_ = arguments[_loc6_ + _loc3_];
                  com.rockstargames.ui.utils.UIText.setSizedText(_loc4_,_loc5_,true);
               }
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      else
      {
         if(_viewIndex == 1)
         {
            this.currAngle = 0;
            this.CONTENT.statWheelMC.wheelMC.clear();
         }
         var _loc7_ = this.menuList[_viewIndex - 1];
         _loc7_.init(arguments);
         _loc7_._visible = true;
         this.updateStatWheel(_viewIndex - 1,arguments[8],arguments[9]);
      }
   }
   function updateStatWheel(index, pctComplete, statColourEnum)
   {
      if(pctComplete > 0)
      {
         var _loc2_ = this.statsMaxDegrees[index] * pctComplete;
         this.drawArc(this.currAngle,this.currAngle + _loc2_,statColourEnum);
         this.currAngle = this.currAngle + _loc2_;
      }
   }
   function drawArc(startAngle, endAngle, colourId)
   {
      endAngle = Math.min(endAngle,360);
      var _loc5_ = this.CONTENT.statWheelMC.wheelMC;
      var _loc6_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(colourId,_loc6_);
      _loc5_.moveTo(0,0);
      _loc5_.beginFill(com.rockstargames.ui.utils.Colour.RGBToHex(_loc6_.r,_loc6_.g,_loc6_.b),100);
      var _loc2_ = startAngle;
      var _loc4_ = 0.25;
      while(_loc2_ <= endAngle)
      {
         this.lineToPtOnWheel(_loc2_);
         _loc2_ = _loc2_ + _loc4_;
      }
      if(_loc2_ < endAngle + _loc4_)
      {
         this.lineToPtOnWheel(endAngle);
      }
      _loc5_.lineTo(0,0);
      _loc5_.endFill();
   }
   function lineToPtOnWheel(angle)
   {
      this.CONTENT.statWheelMC.wheelMC.lineTo(Math.sin(angle * com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.PI_OVER_180) * this.wheelRadius,(- Math.cos(angle * com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.PI_OVER_180)) * this.wheelRadius);
   }
   function SET_DATA_SLOT_EMPTY()
   {
      this.currAngle = 0;
      this.CONTENT.statWheelMC.wheelMC.clear();
      var _loc2_ = 0;
      while(_loc2_ < this.menuList.length)
      {
         this.menuList[_loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
}
