class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_HERITAGE_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var hasTitle = true;
   function PAUSE_MENU_HERITAGE_CARD()
   {
      super();
      this.dbgID = "PAUSE_MENU_HERITAGE_CARD";
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
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardModel();
      this.model.createView(0,{id:0,x:0,y:this.CONTENT.titleMC._height,rowSpacing:0,columnSpacing:0,container:this.CONTENT,linkage:["heritageCardItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
      this.TextWithBlips = new com.rockstargames.ui.utils.Text();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.helpMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.CONTENT.helpMC.helpTF.wordWrap = true;
      this.CONTENT.helpMC.helpTF.autoSize = true;
      this.CONTENT.helpMC._visible = false;
      this.charTitleMC = this.CONTENT.titleMC;
      this.charTitleMC._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.bgsubMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.headingMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.subMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc2_ = 0;
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         this.model.prevItem();
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         this.model.nextItem();
      }
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = (com.rockstargames.ui.components.GUIView)this.model.getCurrentView();
      _loc2_.__set__index(i);
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      super.SET_DATA_SLOT.apply(this,arguments);
      this.getVisibleHeight();
   }
   function SET_TITLE(titleStr, desc)
   {
      this.charTitleMC.headingMC.titleTF.text = titleStr;
      this.charTitleMC.headingMC.titleTF.textAutoSize = "shrink";
      com.rockstargames.ui.utils.UIText.setSizedText(this.charTitleMC.subMC.subtitleTF,desc,true,false);
      this.charTitleMC._visible = true;
   }
   function SET_DESCRIPTION(helpStr, flashHelp)
   {
      if(this.blipLayer)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.CONTENT.helpMC.createEmptyMovieClip("blipLayer",1000);
      this.TextWithBlips.setTextWithIcons(helpStr,this.blipLayer,this.CONTENT.helpMC.helpTF,0,13,2,false);
      this.TextWithBlips.setTextWithIcons(helpStr,this.blipLayer,this.CONTENT.helpMC.helpTF,0,13,2,false);
      this.CONTENT.helpMC._visible = helpStr != "";
      if(!this.CONTENT.helpMC._visible)
      {
         this.CONTENT.helpMC.iMC.gotoAndStop(1);
      }
      else if(flashHelp)
      {
         if(this.CONTENT.helpMC.iMC._currentframe == 1)
         {
            this.CONTENT.helpMC.iMC.gotoAndPlay(2);
         }
      }
      else
      {
         this.CONTENT.helpMC.iMC.gotoAndStop(1);
      }
      var _loc3_ = 0;
      if(this.hasTitle)
      {
         _loc3_ = this.CONTENT.titleMC._height;
      }
      var _loc2_ = this.model.getCurrentView(0);
      var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem)_loc2_.itemList[_loc2_.itemList.length - 1];
      var _loc5_ = 2;
      this.CONTENT.helpMC._y = _loc3_ + _loc4_._y + _loc4_.bgMC._height + _loc5_;
      this.CONTENT.helpMC.bgMC._height = this.CONTENT.helpMC.helpTF.textHeight + 12;
      this.getVisibleHeight();
   }
   function getVisibleHeight()
   {
      return !this.CONTENT.helpMC._visible?this.model.getCurrentView().itemList.length * 27 - 2:this.CONTENT.helpMC._y + this.CONTENT.helpMC._height;
   }
   function ON_DESTROY()
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem)_loc3_[_loc2_].ON_DESTROY();
         _loc2_ = _loc2_ + 1;
      }
   }
}
