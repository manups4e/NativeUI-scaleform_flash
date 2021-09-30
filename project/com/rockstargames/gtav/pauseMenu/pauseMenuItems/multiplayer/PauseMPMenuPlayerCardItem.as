class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem extends MovieClip
{
   static var TYPE_NUMERIC_STAT = 1;
   function PauseMPMenuPlayerCardItem()
   {
      super();
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      this.innerMC.progressBarMC.barMC = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.innerMC.progressBarMC.barMC);
      _global.gfxExtensions = true;
   }
   function init(_data)
   {
      var _loc5_ = _data[3];
      var _loc3_ = _data.slice(6);
      this.lbl = _loc3_[0];
      this.val = _loc3_[1];
      var _loc2_ = 15;
      if(this.lbl.length > _loc2_ && this.__get__isCompareWidth())
      {
         this.lbl = this.lbl.substr(0,_loc2_) + "...";
      }
      if(this.val.length > _loc2_ && this.__get__isCompareWidth())
      {
         this.val = this.val.substr(0,_loc2_) + "...";
      }
      com.rockstargames.ui.utils.UIText.setSizedText(this.innerMC.titleTF,this.lbl,true);
      com.rockstargames.ui.utils.UIText.setSizedText(this.innerMC.valTF,this.val,true);
      if(this.innerMC.titleTF)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.innerMC.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      if(this.innerMC.valTF)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.innerMC.valTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      if(_loc5_ == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem.TYPE_NUMERIC_STAT)
      {
         this.innerMC.titleTF._y = (this.bgMC._height - this.innerMC.valTF.textHeight) * 0.5;
         this.innerMC.valTF._y = this.innerMC.titleTF._y;
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)this.innerMC.progressBarMC.barMC.mc._visible = false;
      }
      else
      {
         var _loc4_ = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(_loc3_[2],53,2,5);
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)this.innerMC.progressBarMC.barMC.percent(_loc4_);
      }
   }
   function __get__isCompareWidth()
   {
      return this.bgMC._width < 200;
   }
   function blinkText(_lbl)
   {
      if(this.__get__isCompareWidth())
      {
         if(_lbl != undefined && _lbl != "")
         {
            var _loc3_ = 15;
            if(_lbl.length > _loc3_)
            {
               _lbl = _lbl.substr(0,_loc3_) + "...";
            }
            com.rockstargames.ui.utils.UIText.setSizedText(this.innerMC.titleTF,_lbl,true);
         }
      }
   }
   function setColour(colourEnum)
   {
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)this.innerMC.progressBarMC.barMC.init(colourEnum);
   }
   function setCustomColour(hudColour)
   {
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)this.innerMC.progressBarMC.barMC.initCustom(hudColour);
   }
}
