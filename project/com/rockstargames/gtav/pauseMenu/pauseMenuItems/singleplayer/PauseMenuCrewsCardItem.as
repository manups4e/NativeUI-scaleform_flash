class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewsCardItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var TYPE_WORLD_RANKING = 1;
   function PauseMenuCrewsCardItem()
   {
      super();
      this.itemTextRight = this.labelMC.valueTF;
      this.colourIconMC._visible = false;
      this.rankIconMC._visible = false;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      if(this.__get__data()[1] != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.__get__data()[1],true);
      }
      if(this.__get__data()[2] != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.colourIconMC,this.__get__data()[2],this.__get__data()[3],this.__get__data()[4],100);
         this.colourIconMC._visible = true;
      }
      if(this.type == this.TYPE_WORLD_RANKING)
      {
         this.rankIconMC._visible = true;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rankIconMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      return this.__get__data();
   }
   function collapse(isCollapsed)
   {
      if(isCollapsed)
      {
         this.colourIconMC._x = 143 - this.colourIconMC._width - 6;
         this.itemTextRight._x = 143 - this.itemTextRight._width - 6;
      }
      else
      {
         this.colourIconMC._x = 288 - this.colourIconMC._width - 6;
         this.itemTextRight._x = 288 - this.itemTextRight._width - 6;
      }
   }
}
