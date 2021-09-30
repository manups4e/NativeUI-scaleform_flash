class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var bgA = 100;
   function PauseMenuStatsListItem()
   {
      super();
      this.itemTextRight = this.labelMC.valueTF;
      this.__set__highlighted(false);
      this.bar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.barMC);
      delete this.bMC.onRelease;
      delete this.bMC.onRollOver;
      delete this.bMC.onRollOut;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc3_);
      if(this.index % 2 == 1)
      {
         this.bgA = 20;
      }
      else
      {
         this.bgA = 0;
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,this.bgA);
      switch(this.type)
      {
         case 0:
            if(this.__get__data()[1] != undefined && this.__get__data()[1] != "")
            {
               com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.__get__data()[1]);
            }
            this.barMC._visible = false;
            break;
         case 1:
            var _loc4_ = this.__get__data()[2];
            if(_loc4_ == undefined)
            {
               _loc4_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
            }
            this.bar.init(_loc4_,158);
            if(this.__get__data()[1] != undefined && this.__get__data()[1] != "")
            {
               var _loc5_ = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(this.__get__data()[1],30,2,5);
               this.bar.percent(_loc5_,false);
            }
            this.barMC._visible = true;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.__set__highlighted(this._highlighted);
      return this.__get__data();
   }
   function snapBGGrid(bgMC)
   {
      var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
      bgMC._height = _loc2_ * 27 - 2;
   }
   function __set__highlighted(_h)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc4_ = 100;
      if(_h)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         _loc4_ = this.bgA;
      }
      if(this.bgMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc4_);
      }
      if(this.labelMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      }
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function mOver()
   {
   }
   function mOut()
   {
   }
   function mPress()
   {
   }
}
