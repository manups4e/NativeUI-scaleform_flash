class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var rowOffset = 27;
   var titleHeight = 27;
   var isStandalone = true;
   static var MAX_TITLE_WIDTH = 189;
   static var VERIFIED_CHAR_SHORT = 247;
   static var VERIFIED_CHAR_LONG = 166;
   function MP_MATCHMAKING_CARD()
   {
      super();
      this.dbgID = "MP_MATCHMAKING_CARD";
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
         this.isStandalone = false;
      }
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      this.title = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTitleItem)this.CONTENT.attachMovie("mpMMCardTitle","mpMMCardTitleMC",0,{_x:25,_y:0,_visible:false});
      com.rockstargames.ui.utils.Colour.Colourise(this.title.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,64);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descriptionMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.helpMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.CONTENT.descriptionMC._visible = false;
      this.CONTENT.helpMC._visible = false;
      var _loc5_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_NORTH_BLUE,_loc5_);
      com.rockstargames.ui.utils.Colour.Colourise(this.title.verifiedMC,_loc5_.r,_loc5_.g,_loc5_.b,_loc5_.a);
      var _loc6_ = 363;
      var _loc7_ = 430;
      var _loc4_ = this.CONTENT.createEmptyMovieClip("maskMC",this.CONTENT.getNextHighestDepth());
      _loc4_.beginFill(0);
      _loc4_.moveTo(0,0);
      _loc4_.lineTo(_loc6_,0);
      _loc4_.lineTo(_loc6_,_loc7_);
      _loc4_.lineTo(0,_loc7_);
      _loc4_.endFill();
      var _loc8_ = this.CONTENT.createEmptyMovieClip("containerMC",this.CONTENT.getNextHighestDepth());
      _loc8_.setMask(_loc4_);
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardModel();
      this.model.createView(0,{id:0,x:1,y:this.titleHeight,rowSpacing:2,columnSpacing:0,container:_loc8_,isStandalone:this.isStandalone,linkage:["mpMMCardItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
   }
   function SET_TITLE(str, verified)
   {
      var _loc2_ = this.title.itemTextLeft;
      if(str == undefined || str == "")
      {
         _loc2_.htmlText = "";
         this.title._visible = false;
         this.model.getCurrentView().viewContainer._y = 0;
      }
      else
      {
         this.title.__set__data([0,0,0,0,0,0,str]);
         _loc2_.textAutoSize = "shrink";
         _loc2_.autoSize = false;
         _loc2_._width = !verified?270:255;
         this.title.verifiedMC._visible = verified;
         this.title.verifiedBGMC._visible = verified;
         this.title._visible = true;
         this.model.getCurrentView().viewContainer._y = this.titleHeight;
         if(verified && this.title.verifiedMC.verifiedTF)
         {
            var _loc4_ = _loc2_.textWidth < com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_CARD.MAX_TITLE_WIDTH?com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_CARD.VERIFIED_CHAR_LONG:com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_CARD.VERIFIED_CHAR_SHORT;
            this.title.verifiedMC.verifiedTF.text = String.fromCharCode(_loc4_);
            this.title.verifiedBGMC._width = this.title.verifiedMC.verifiedTF.textWidth + 1;
            this.title.verifiedBGMC._x = 288 - this.title.verifiedBGMC._width;
         }
      }
   }
   function SET_ICON(index, iconEnum, rank)
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc4_ = _loc3_[index];
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem)_loc4_;
      if(iconEnum != undefined)
      {
         if(_loc2_)
         {
            _loc2_.setIcon(iconEnum,_loc2_.icon3MC);
            _loc2_.rankNumTF.text = rank == undefined?"":String(rank);
         }
      }
   }
   function DISPLAY_MIC()
   {
      var _loc8_ = arguments;
      var _loc9_ = this.model.getCurrentView().itemList;
      var _loc4_ = 0;
      while(_loc4_ < 16)
      {
         var _loc6_ = _loc8_[0] * 16 + _loc4_;
         var _loc7_ = _loc9_[_loc6_];
         var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem)_loc7_;
         var _loc5_ = _loc8_[_loc6_ + 1];
         if(_loc5_ != undefined)
         {
            if(_loc3_)
            {
               _loc3_.setIcon(_loc5_,_loc3_.icon2MC);
               _loc3_.rankNumTF.text = "";
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function COLLAPSE(collapse)
   {
      this.CONTENT._x = !collapse?0:-25;
   }
   function SET_ROW_SPACING(_rowSpacing)
   {
      this.model.getCurrentView().updateParams({rowSpacing:_rowSpacing});
   }
   function SET_DESCRIPTION(cashStr, totalBetsStr, betsOnYouStr, helpStr)
   {
      if(cashStr == "" || cashStr == undefined)
      {
         this.CONTENT.descriptionMC._visible = false;
      }
      else
      {
         this.CONTENT.descriptionMC._visible = true;
         var _loc2_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE,_loc2_);
         var _loc3_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED,_loc3_);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.descriptionMC.yourCashTF,"YOUR_CASH");
         this.CONTENT.descriptionMC.cashMC.itemTF.text = cashStr;
         this.CONTENT.descriptionMC.cashMC.bgMC._width = this.CONTENT.descriptionMC.cashMC.itemTF.textWidth + 10;
         this.CONTENT.descriptionMC.cashMC.bgMC._x = 145 - this.CONTENT.descriptionMC.cashMC.bgMC._width;
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descriptionMC.cashMC.bgMC,_loc2_.r,_loc2_.g,_loc2_.b,30);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.descriptionMC.yourTotalTF,"TOTAL_PLACED");
         this.CONTENT.descriptionMC.totalBetsMC.itemTF.text = totalBetsStr;
         this.CONTENT.descriptionMC.totalBetsMC.bgMC._width = this.CONTENT.descriptionMC.totalBetsMC.itemTF.textWidth + 10;
         this.CONTENT.descriptionMC.totalBetsMC.bgMC._x = 145 - this.CONTENT.descriptionMC.totalBetsMC.bgMC._width;
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descriptionMC.totalBetsMC.bgMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.descriptionMC.betsOnYouTF,"BETS_ON_YOU");
         this.CONTENT.descriptionMC.betsOnYouMC.itemTF.text = betsOnYouStr;
         this.CONTENT.descriptionMC.betsOnYouMC.bgMC._width = this.CONTENT.descriptionMC.betsOnYouMC.itemTF.textWidth + 10;
         this.CONTENT.descriptionMC.betsOnYouMC.bgMC._x = 145 - this.CONTENT.descriptionMC.betsOnYouMC.bgMC._width;
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.descriptionMC.betsOnYouMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      if(helpStr == "" || helpStr == undefined)
      {
         this.CONTENT.helpMC._visible = false;
      }
      else
      {
         this.CONTENT.helpMC.helpTF.text = helpStr;
         this.CONTENT.helpMC.helpTF.autoSize = "left";
         var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardView)this.model.getCurrentView();
         var _loc6_ = _loc4_.viewContainer._y;
         this.CONTENT.helpMC._y = _loc6_ + _loc4_.dataList.length * this.rowOffset;
         this.CONTENT.helpMC.bgMC._height = this.CONTENT.helpMC.helpTF.textHeight + 12;
         this.CONTENT.helpMC._visible = true;
      }
      currView.params = {};
      var currView = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardView)this.model.getCurrentView();
      this.CONTENT.descriptionMC._y = currView.viewContainer._y + currView.dataList.length * 27;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      if(viewIndex == undefined)
      {
         viewIndex = 0;
      }
      super.DISPLAY_VIEW(viewIndex,itemIndex);
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      this.ON_DESTROY();
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      this.model.getCurrentView().topEdge = 0;
   }
   function SET_HIGHLIGHT(i)
   {
      this.model.getCurrentView().__set__index(i);
   }
   function SET_STATE(i, _txdLevelOverride)
   {
      if(_txdLevelOverride != undefined)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardView)this.model.getCurrentView().overrideTxdLevel(_txdLevelOverride,i);
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         this.model.prevItem();
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         this.model.nextItem();
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         var il = (com.rockstargames.ui.media.ImageLoaderMC)eval(this.CONTENT + "." + uniqueID);
         il.displayTxdResponse(textureDict);
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      var il = (com.rockstargames.ui.media.ImageLoaderMC)eval(this.CONTENT + "." + uniqueID);
      il.displayTxdResponse(textureDict);
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      if(success == true)
      {
         var il = (com.rockstargames.ui.media.ImageLoaderMC)eval(this.CONTENT + "." + uniqueID);
         il.displayTxdResponse(textureDict);
      }
   }
   function ON_DESTROY()
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem)_loc3_[_loc2_].ON_DESTROY();
         _loc2_ = _loc2_ + 1;
      }
   }
}
