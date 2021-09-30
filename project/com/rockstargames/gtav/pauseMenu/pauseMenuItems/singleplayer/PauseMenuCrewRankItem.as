class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewRankItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   function PauseMenuCrewRankItem()
   {
      super();
      _global.gfxExtensions = true;
      this.itemTextLeft = this.labelMC.rankTF;
      this.itemTextRight = this.labelMC.xpTF;
      this.itemTextRight.textAutoSize = "shrink";
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.itemTextLeft.text = this._data[0];
      this.itemTextLeft.autoSize = "right";
      this.itemTextRight.text = this.__get__data()[2];
      this.rpMC._visible = this.labelMC._visible = this.itemTextLeft.text != "" || this.itemTextRight.text != "";
      this.snapBGGrid(this.bgMC);
      this.__set__highlighted(this._highlighted);
      return this.__get__data();
   }
   function __set__highlighted(_h)
   {
      super.__set__highlighted(_h);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rpMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      if(this.bgMC)
      {
         var _loc3_ = new com.rockstargames.ui.utils.HudColour();
         if(_h)
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         }
         if(this.type == 3)
         {
            _loc3_.a = 20;
         }
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      return this.__get__highlighted();
   }
   function snapBGGrid(bgMC)
   {
      bgMC._width = 290;
      bgMC._x = -2;
   }
}
