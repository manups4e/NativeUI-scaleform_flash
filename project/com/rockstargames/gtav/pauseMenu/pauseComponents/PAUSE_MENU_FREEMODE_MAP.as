class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_MAP extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_FREEMODE_MAP()
   {
      super();
      this.dbgID = "PAUSE_MENU_FREEMODE_MAP";
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
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_ORANGELIGHT,_loc4_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.detailsMC.titleMC.titleBGMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.detailsMC.infoMC.infoBGMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.CONTENT.detailsMC._visible = false;
   }
   function SET_TITLE()
   {
      this.CONTENT.detailsMC._visible = true;
      var _loc6_ = arguments[0];
      var _loc4_ = arguments[1];
      var _loc5_ = arguments[2];
      var _loc3_ = this.CONTENT.detailsMC;
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.titleMC.titleTF,_loc6_,true);
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.infoMC.nameTF,_loc4_,true);
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.infoMC.timeTF,_loc5_,true);
   }
}
