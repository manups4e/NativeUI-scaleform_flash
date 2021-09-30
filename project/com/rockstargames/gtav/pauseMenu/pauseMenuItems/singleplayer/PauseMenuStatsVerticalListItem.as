class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsVerticalListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem
{
   function PauseMenuStatsVerticalListItem()
   {
      super();
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      if((var _loc0_ = this.type) !== 1)
      {
         this.labelMC.lMC._visible = _loc0_ = false;
         this.labelMC.rMC._visible = _loc0_;
      }
      else
      {
         this.multiListItems = this.__get__data().slice(1);
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0]);
         this.__set__textIndex(this.initialIndex);
         this.itemTextRight._visible = true;
         this.labelMC.lMC._visible = _loc0_ = true;
         this.labelMC.rMC._visible = _loc0_;
      }
      this.__set__highlighted(this._highlighted);
      return this.__get__data();
   }
   function __set__textIndex(ti)
   {
      this.multiListIndex = ti;
      this.selectedIndex = this.multiListIndex;
      this.selectedValue = this.multiListItems[this.multiListIndex];
      if(this.selectedValue != undefined || this.selectedValue != "")
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.selectedValue,false,true);
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0]);
         this.itemTextRight._x = this.labelMC.rMC._x - this.itemTextRight._width - 2;
         this.labelMC.lMC._x = this.itemTextRight._x - 2;
         this.labelMC.rMC._visible = this.labelMC.lMC._visible = true;
      }
      return this.__get__textIndex();
   }
   function __set__highlighted(_h)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      if(_h)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
         if(this.type == 1)
         {
            this.itemTextRight._x = this.labelMC.rMC._x - this.itemTextRight._width - 2;
            this.labelMC.lMC._x = this.itemTextRight._x - 2;
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = true;
            this.itemTextRight._visible = true;
         }
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         if(this.type == 1)
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
            this.itemTextRight._visible = false;
         }
      }
      if(this.bgMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      if(this.labelMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      }
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
