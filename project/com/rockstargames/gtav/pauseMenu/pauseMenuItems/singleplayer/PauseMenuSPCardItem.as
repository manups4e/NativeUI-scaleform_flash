class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuSPCardItem extends MovieClip
{
   function PauseMenuSPCardItem()
   {
      super();
      _global.gfxExtensions = true;
      this.progBarMC = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.progBarMC);
      this.bgMC._visible = false;
   }
   function init(_data)
   {
      var _loc2_ = _data.slice(6);
      this.nameTF.textAutoSize = "shrink";
      var _loc3_ = _loc2_[0];
      var _loc4_ = 8;
      if(_loc3_.length > _loc4_ && this.bgMC._width < 200)
      {
         _loc3_ = _loc3_.substr(0,_loc4_) + "...";
      }
      com.rockstargames.ui.utils.UIText.setSizedText(this.nameTF,_loc3_,true);
      com.rockstargames.ui.utils.UIText.setSizedText(this.valueTF,_loc2_[1],true);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.nameTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.valueTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.progBarMC.init(_loc2_[3]);
      this.progBarMC.percentDecimal(_loc2_[2]);
   }
}
