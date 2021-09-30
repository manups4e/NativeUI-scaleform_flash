class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuBodyConfigItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var padding = 0;
   var mx = 0;
   var my = 0;
   function PauseMenuBodyConfigItem()
   {
      super();
      _global.gfxExtensions = true;
      this.itemTextRight = this.labelMC.valueTF;
      this.isAdjustable = true;
      this.padding = this.dotMC._x - this.gridMC._x;
      this.mx = this.gridMC._width - this.padding * 2;
      this.my = this.gridMC._height - this.padding * 2;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      com.rockstargames.ui.utils.UIText.setSizedText(this.labelMC.upTF,this._data[0],true);
      com.rockstargames.ui.utils.UIText.setSizedText(this.labelMC.rightTF,this._data[1],true);
      com.rockstargames.ui.utils.UIText.setSizedText(this.labelMC.downTF,this._data[2],true);
      com.rockstargames.ui.utils.UIText.setSizedText(this.labelMC.leftTF,this._data[3],true);
      this.dotMC._x = this.gridMC._x + this.padding + this.mx / 100 * this._data[4];
      this.dotMC._y = this.gridMC._y + this.padding + this.my / 100 * this._data[5];
      var _loc3_ = this._data[6];
      var _loc4_ = this._data[7];
      if(_loc3_ != undefined)
      {
         this.gridMC.gotoAndStop(_loc3_ + 1);
      }
      if(_loc4_ != undefined)
      {
         if(_loc4_)
         {
            if(this.dotMC._currentframe != 2)
            {
               this.dotMC.gotoAndStop(2);
            }
         }
         else if(this.dotMC._currentframe != 1)
         {
            this.dotMC.gotoAndStop(1);
         }
      }
      return this.__get__data();
   }
   function __set__highlighted(_h)
   {
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      if(_h)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         if(this.isSelectable == 1)
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY,_loc2_);
         }
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
