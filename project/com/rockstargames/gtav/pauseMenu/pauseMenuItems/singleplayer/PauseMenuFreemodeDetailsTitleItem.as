class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsTitleItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var height = 28;
   function PauseMenuFreemodeDetailsTitleItem()
   {
      super();
      _global.gfxExtensions = true;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this.__get__data()[0],true,false,0,23);
      com.rockstargames.ui.utils.UIText.setSizedText(this.labelMC.titleshadowTF,this.__get__data()[0],true,false,0,23);
      this.snapBGGrid(this.bgMC);
      return this.__get__data();
   }
   function snapBGGrid(bgMC)
   {
      bgMC._height = this.height;
   }
   function getHeight()
   {
      return this.height;
   }
   function highlightTitle(_h)
   {
      if(_h)
      {
         this.bgMC._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      else
      {
         this.bgMC._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         this.bgMC._alpha = 50;
      }
      this._highlighted = _h;
   }
}
