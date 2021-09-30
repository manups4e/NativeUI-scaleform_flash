class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_WEAPONS extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuGalleryBase
{
   function PAUSE_MENU_WEAPONS()
   {
      super();
      this.dbgID = "PAUSE_MENU_WEAPONS";
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
      this.txdList = [];
      this.batchList = [];
      this.maxGridItems = 9;
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsModel();
      this.model.createView(0,{id:0,rowSpacing:2,columnSpacing:2,batchCols:3,batchRows:3,batchW:288,container:this.CONTENT,linkage:["mpWeaponsItem"],visibleItems:this.maxGridItems,selectstyle:com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
      var _loc6_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc6_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bgMC,_loc6_.r,_loc6_.g,_loc6_.b,_loc6_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descMC,_loc6_.r,_loc6_.g,_loc6_.b,_loc6_.a);
      var _loc5_ = _level0.TIMELINE.isAsianLang;
      var _loc3_ = this.CONTENT.textStatsMC;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.killsTF,"PM_KILLS_WITH");
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.killsTF,_loc3_.killsTF.text,_loc5_);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.deathsTF,"PM_DEATHS_BY");
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.deathsTF,_loc3_.deathsTF.text,_loc5_);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.headshotsTF,"PM_HEADSHOTS");
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.headshotsTF,_loc3_.headshotsTF.text,_loc5_);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.kdRatioTF,"PM_KD_RATIO");
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.kdRatioTF,_loc3_.kdRatioTF.text,_loc5_);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.accuracyTF,"PM_MY_ACCURACY");
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.accuracyTF,_loc3_.accuracyTF.text,_loc5_);
      var _loc4_ = this.CONTENT.progStatsMC;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4_.damageTF,"PM_DAMAGE");
      com.rockstargames.ui.utils.UIText.setSizedText(_loc4_.damageTF,_loc4_.damageTF.text,_loc5_);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4_.fireRateTF,"PM_FIRERATE");
      com.rockstargames.ui.utils.UIText.setSizedText(_loc4_.fireRateTF,_loc4_.fireRateTF.text,_loc5_);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4_.accuracyTF,"PM_ACCURACY");
      com.rockstargames.ui.utils.UIText.setSizedText(_loc4_.accuracyTF,_loc4_.accuracyTF.text,_loc5_);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4_.rangeTF,"PM_RANGE");
      com.rockstargames.ui.utils.UIText.setSizedText(_loc4_.rangeTF,_loc4_.rangeTF.text,_loc5_);
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4_.clipSizeTF,"PM_CLIPSIZE");
      com.rockstargames.ui.utils.UIText.setSizedText(_loc4_.clipSizeTF,_loc4_.clipSizeTF.text,_loc5_);
   }
   function SET_TITLE(str, id)
   {
      var _loc5_ = this.CONTENT.textStatsMC;
      var _loc6_ = this.CONTENT.progStatsMC;
      var _loc4_ = ["damageTF","fireRateTF","accuracyTF","rangeTF","clipSizeTF","killsTF","deathsTF","headshotsTF","kdRatioTF","accuracyTF"];
      var _loc2_ = _loc4_[id];
      if(_loc2_ != undefined)
      {
         var _loc3_ = _loc6_[_loc2_];
         if(id > 4)
         {
            _loc3_ = _loc5_[_loc2_];
         }
         com.rockstargames.ui.utils.UIText.setSizedText(_loc3_,str);
      }
   }
   function SET_DESCRIPTION()
   {
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsView)this.model.getCurrentView().setDescription(arguments);
   }
   function SET_HIGHLIGHT(i)
   {
      super.SET_HIGHLIGHT(i);
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
      }
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsView)(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsModel)this.model.getCurrentView();
      _loc3_.setDescription();
   }
   function UPDATE_DATA_SLOT(_viewIndex, _slotIndex)
   {
      var _loc3_ = arguments;
      this.model.updateSlot(0,_viewIndex,_loc3_);
   }
}
