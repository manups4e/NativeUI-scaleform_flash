class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CREWS_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var currItemIndex = 0;
   function PAUSE_MENU_CREWS_CARD()
   {
      super();
      this.dbgID = "PAUSE_MENU_CREWS_CARD";
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc, collapse)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      var _loc5_ = !collapse?"statItem":"playerComparisonItem";
      this.statsList = [];
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.infoMC.foundedTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.infoMC.statusTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.infoMC.membersTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.infoMC.descTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.infoMC.membersIconMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.containerMC = this.CONTENT.createEmptyMovieClip("containerMC",0);
      this.containerMC._y = this.CONTENT.bgMC.listItemBGMC._y;
      if(this.CONTENT.bgMC)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      }
      if(this.CONTENT.titleBGMC != undefined)
      {
         this.CONTENT.titleBGMC = com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.titleBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      }
      if(this.CONTENT.titleColourBarMC == undefined)
      {
         this.CONTENT.titleColourBarMC = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.CONTENT.titleColourBarMC);
      }
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewsCardModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,container:this.containerMC,visibleItems:5,linkage:["crewsCardItem"],viewMaskHeight:430,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE,collapse:collapse});
      var _loc3_ = 0;
      while(_loc3_ < 2)
      {
         var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem)this.CONTENT.attachMovie(_loc5_,_loc5_ + _loc3_ + "MC",this.CONTENT.getNextHighestDepth());
         _loc4_.bgMC._height = 52;
         this.statsList.push(_loc4_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      var _loc5_ = this.model.getCurrentView().dataList.length * 27 - 2;
      this.CONTENT.bgMC.listItemBGMC._height = _loc5_;
      var _loc4_ = this.CONTENT.bgMC.listItemBGMC._y + _loc5_ + 2;
      var _loc3_ = 0;
      while(_loc3_ < 2)
      {
         this.statsList[_loc3_]._y = _loc4_;
         if(this.statsList[_loc3_]._visible)
         {
            _loc4_ = _loc4_ + 54;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.CONTENT.bgMC.descBGMC._y = _loc4_;
      this.CONTENT.infoMC.descTF._y = _loc4_ + 6;
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      if(_slotIndex == -1)
      {
         this.model.addDataToView(0,this.currItemIndex,arguments);
         this.currItemIndex = this.currItemIndex + 1;
      }
      else
      {
         var _loc3_ = this.statsList[_viewIndex];
         if(arguments[7] != -1)
         {
            _loc3_._visible = true;
            _loc3_.init(arguments);
         }
         else
         {
            _loc3_._visible = false;
         }
      }
   }
   function SET_TITLE(titleStr)
   {
      com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.titleTF,titleStr,true);
      var _loc5_ = arguments[1];
      this.emblemImageMC = this.loadCardTexture(this.emblemImageMC,"emblemImg",_loc5_,_loc5_,6,31,70,70);
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      if(arguments[2] != undefined)
      {
         _loc4_.r = arguments[2];
         _loc4_.g = arguments[3];
         _loc4_.b = arguments[4];
         _loc4_.a = 100;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.statsList.length)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem)this.statsList[_loc3_].setCustomColour(_loc4_);
         _loc3_ = _loc3_ + 1;
      }
      if(this.CONTENT.titleColourBarMC != undefined)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)this.CONTENT.titleColourBarMC.initCustom(_loc4_);
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)this.CONTENT.titleColourBarMC.percent(0);
      }
      com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.infoMC.foundedTF,!arguments[5]?"":arguments[5],true);
      com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.infoMC.statusTF,!arguments[6]?"":arguments[6],true);
      if(arguments[7] != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.infoMC.membersTF,!arguments[7]?"":arguments[7],false,true);
         var _loc9_ = 6;
         this.CONTENT.infoMC.membersTF._x = 288 - this.CONTENT.infoMC.membersTF._width - _loc9_;
         var _loc11_ = this.CONTENT.infoMC.membersTF._x;
         var _loc6_ = this.CONTENT.infoMC.membersTF._width;
         var _loc8_ = this.CONTENT.infoMC.membersTF.textWidth;
         var _loc7_ = this.CONTENT.infoMC.membersIconMC._width;
         var _loc10_ = 5;
         this.CONTENT.infoMC.membersIconMC._x = _loc11_ + _loc6_ - _loc8_ - _loc7_ - _loc10_;
      }
      this.CONTENT.infoMC.crewTypeMC.gotoAndStop(!arguments[8]?1:arguments[8]);
   }
   function loadCardTexture(loaderMC, name, txd, txn, x, y, w, h)
   {
      if(txd == undefined || txn == undefined || txd == "" || txn == "")
      {
         if(loaderMC)
         {
            loaderMC.removeTxdRef();
         }
         loaderMC.isLoaded = false;
         this.CONTENT.infoMC.tempLogoMC._visible = true;
      }
      else
      {
         this.CONTENT.infoMC.tempLogoMC._visible = false;
         if(loaderMC == undefined)
         {
            loaderMC = (com.rockstargames.ui.media.ImageLoaderMC)this.CONTENT.infoMC.attachMovie("GenericImageLoader",name,this.CONTENT.infoMC.getNextHighestDepth(),{_x:x,_y:y});
         }
         if(loaderMC.textureDict == txd && loaderMC.isLoaded)
         {
            loaderMC.init("PAUSE_MENU_SP_CONTENT",txd,txn,w,h);
            loaderMC.displayTxdResponse(txd);
         }
         else
         {
            if(loaderMC.isLoaded)
            {
               loaderMC.removeTxdRef();
            }
            loaderMC.init("PAUSE_MENU_SP_CONTENT",txd,txn,w,h);
            loaderMC.addTxdRefWithPath(String(loaderMC),3);
         }
      }
      return loaderMC;
   }
   function ON_DESTROY()
   {
      if(this.emblemImageMC.isLoaded)
      {
         this.emblemImageMC.removeTxdRef();
      }
      if(this.typeImageMC.isLoaded)
      {
         this.typeImageMC.removeTxdRef();
      }
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      this.currItemIndex = 0;
   }
   function SET_DESCRIPTION(descStr)
   {
      com.rockstargames.ui.utils.UIText.setDescText(this.CONTENT.infoMC.descTF,descStr);
      this.CONTENT.infoMC.crewTagMC.SET_CREW_TAG(arguments[3],arguments[4],arguments[5],arguments[6]);
   }
   function getKeys()
   {
      if(Key.isDown(38))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
      }
      else if(Key.isDown(40))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         this.model.prevItem();
      }
      else if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         this.model.nextItem();
      }
   }
}
