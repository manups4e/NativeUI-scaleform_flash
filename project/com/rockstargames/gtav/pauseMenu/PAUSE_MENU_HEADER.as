class com.rockstargames.gtav.pauseMenu.PAUSE_MENU_HEADER extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var detailsXPositions = [868,822,775];
   var showChar = false;
   var showCrew = false;
   var bgLoaderList = new Array();
   var imgSize = 46;
   var dbgOn = false;
   var detailsShown = true;
   var detailsCoronaLayout = false;
   function PAUSE_MENU_HEADER()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      _global.gfxExtensions = true;
      this.menubar = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_BAR)this.CONTENT.attachMovie("menu","menuMC",this.CONTENT.getNextHighestDepth(),{_y:60});
      this.menubar.INITIALISE();
      this.detailsMC = this.CONTENT.headerMC.alldetailsMC.detailsMC;
      this.charMC = this.CONTENT.headerMC.alldetailsMC.charMC;
      this.crewMC = this.CONTENT.headerMC.alldetailsMC.crewMC;
      var _loc6_ = 48;
      var _loc8_ = {_visible:false,_xscale:_loc6_,_yscale:_loc6_,_y:0,_x:-32};
      this.charMC._visible = false;
      this.crewMC._visible = false;
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
      if(this.detailsMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.detailsMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
      }
      if(this.CONTENT.headerMC.titleMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.headerMC.titleMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
      }
      var _loc5_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc5_);
      com.rockstargames.ui.utils.Colour.Colourise(this.crewMC.bgMC,_loc5_.r,_loc5_.g,_loc5_.b,_loc5_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.charMC.bgMC,_loc5_.r,_loc5_.g,_loc5_.b,_loc5_.a);
      this.CONTENT.headerMC.bgMC._visible = false;
      this.CONTENT.headerMC.bgMC.coronaMC._visible = false;
   }
   function SHOW_DEBUG(b)
   {
      this.dbgOn = b;
   }
   function dbg(dbgStr)
   {
      if(this.dbgOn)
      {
         var _loc2_ = "  " + dbgStr;
         com.rockstargames.ui.utils.Debug.log(_loc2_);
      }
   }
   function LOCK_MOUSE_SUPPORT(_mClickOn, _mRollOverOn)
   {
      com.rockstargames.ui.utils.Debug.log("LOCK_MOUSE_SUPPORT _mClickOn: " + _mClickOn + " _mRollOverOn: " + _mRollOverOn);
      this.menubar.LOCK_MOUSE_SUPPORT(_mClickOn,_mRollOverOn);
   }
   function IS_CHAR_SELECT(_charSelectOn)
   {
      com.rockstargames.ui.utils.Debug.log("IN_CHAR_SELECT _charSelectOn: " + _charSelectOn);
      this.menubar.IS_CHAR_SELECT(_charSelectOn);
   }
   function SET_TEXT_SIZE(isAsian, sizeOverride)
   {
      var _loc5_ = 16;
      var _loc3_ = 13;
      if(isAsian != undefined && isAsian == true)
      {
         _loc3_ = _loc5_;
      }
      if(sizeOverride != undefined)
      {
         if(sizeOverride > 18)
         {
            sizeOverride = 18;
         }
         if(sizeOverride < 13)
         {
            sizeOverride = 13;
         }
         _loc3_ = sizeOverride;
      }
      com.rockstargames.ui.utils.UIText.SIZE = _loc3_;
      if(isAsian)
      {
         this.shrinkAsianDetails(this.detailsMC.details1TF,this.detailsMC.details2TF,this.detailsMC.details3TF,this.detailsMC.timeTF);
      }
   }
   function shrinkAsianDetails()
   {
      var _loc2_ = 0;
      var _loc5_ = arguments.length;
      while(_loc2_ < _loc5_)
      {
         var _loc3_ = arguments[_loc2_];
         var _loc4_ = _loc3_.getNewTextFormat();
         _loc4_.size = 12;
         _loc3_.setNewTextFormat(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_HEADER_TITLE(title, verified, description, isChallenge)
   {
      var _loc2_ = this.CONTENT.headerMC.titleMC;
      var _loc9_ = false;
      if(description == "" || description == undefined)
      {
         _loc9_ = true;
      }
      if(_loc9_ == true)
      {
         if(title != undefined)
         {
            _loc2_.headingTF.autoSize = "left";
            _loc2_.headingTF.multiline = false;
            _loc2_.headingTF.htmlText = title;
         }
         _loc2_._y = 16;
      }
      else
      {
         var _loc3_ = 34;
         var _loc5_ = 13;
         var _loc10_ = 65;
         _loc2_.headingTF.multiline = true;
         _loc2_.headingTF.wordWrap = true;
         _loc2_.headingTF.autoSize = "left";
         var _loc4_ = description.length;
         var _loc7_ = title.length;
         var _loc6_ = -1.6;
         if(_loc4_ < 146)
         {
            if(_loc7_ < 49)
            {
               _loc3_ = 36;
            }
            else
            {
               _loc3_ = 31;
            }
         }
         else if(_loc4_ > 146 && _loc4_ <= 219)
         {
            if(_loc7_ < 49)
            {
               _loc3_ = 32;
            }
            else
            {
               _loc3_ = 28;
            }
            _loc5_ = 12;
         }
         else if(_loc4_ > 219 && _loc4_ <= 316)
         {
            if(_loc7_ < 49)
            {
               _loc3_ = 32;
            }
            else
            {
               _loc3_ = 28;
            }
            _loc5_ = 12;
            _loc6_ = -2;
         }
         else if(_loc4_ > 316 && _loc4_ <= 430)
         {
            _loc3_ = 26;
            _loc5_ = 12;
            _loc6_ = -2.2;
         }
         else if(_loc4_ > 430)
         {
            _loc3_ = 26;
            _loc5_ = 11;
            _loc6_ = -3;
         }
         if(isChallenge)
         {
            _loc3_ = Math.max(com.rockstargames.gtav.utils.GTAVUIUtils.getFontSizeToFitSingle(title,_loc2_.headingTF),13);
         }
         _loc2_.headingTF.leading = _loc6_;
         _loc2_.headingTF.htmlText = "<font face=\'$Font2_cond_NOT_GAMERNAME\' size=\'" + _loc3_ + "\'>" + title + "</font><br><font face=\'$Font2\' size=\'" + _loc5_ + "\'>" + description + "</font>";
         if(this.detailsCoronaLayout)
         {
            _loc10_ = 37;
         }
         _loc2_._y = Math.max(-8,_loc10_ - _loc2_.headingTF.textHeight / 2);
      }
   }
   function SHIFT_CORONA_DESC(shiftDesc, hideTabs)
   {
      this.detailsCoronaLayout = shiftDesc;
      var _loc4_ = 60;
      var _loc5_ = 5;
      if(shiftDesc)
      {
         _loc4_ = 72;
      }
      this.menubar._y = _loc4_;
      var _loc2_ = 0;
      while(_loc2_ < this.menubar.menuItemList.length)
      {
         this.menubar.menuItemList[_loc2_].tabMC._visible = hideTabs;
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.headerMC.bgMC._height = this.menubar._y + _loc5_;
   }
   function setDescWidth()
   {
      var _loc2_ = 868;
      this.CONTENT.headerMC.titleMC.headingTF._width = _loc2_;
   }
   function SET_HEADING_DETAILS(str1, str2, str3, isSingleplayer)
   {
      var _loc2_ = this.detailsMC;
      _loc2_.details1TF.autoSize = _loc2_.details1condTF.autoSize = "left";
      _loc2_.details1TF.wordWrap = _loc2_.details1condTF.wordWrap = false;
      _loc2_.details1TF.multiline = _loc2_.details1condTF.multiline = false;
      if(isSingleplayer)
      {
         _loc2_.details1condTF.text = "";
         _loc2_.details1TF.text = str1.toUpperCase();
      }
      else
      {
         _loc2_.details1condTF.text = "";
         _loc2_.details1TF.text = str1;
      }
      _loc2_.details1TF._x = - _loc2_.details1TF._width;
      _loc2_.details1condTF._x = - _loc2_.details1condTF._width;
      if(str2 != undefined)
      {
         var _loc7_ = str2.split(":").length > 1;
         if(!_loc7_)
         {
            _loc2_.details2TF.text = str2;
            _loc2_.details2TF.autoSize = "left";
            _loc2_.details2TF.wordWrap = false;
            _loc2_.details2TF.multiline = false;
            _loc2_.details2TF._x = - _loc2_.details2TF._width;
            _loc2_.timeTF.text = "";
         }
         else
         {
            var _loc3_ = str2.split(" ");
            var _loc5_ = _loc3_[_loc3_.length - 1];
            _loc3_.pop();
            var _loc6_ = _loc3_.join(" ");
            _loc2_.timeTF.text = _loc5_;
            _loc2_.timeTF.autoSize = "left";
            _loc2_.timeTF.wordWrap = false;
            _loc2_.timeTF.multiline = false;
            _loc2_.timeTF._x = - _loc2_.timeTF._width;
            _loc2_.details2TF.text = _loc6_;
            _loc2_.details2TF.autoSize = "left";
            _loc2_.details2TF.wordWrap = false;
            _loc2_.details2TF.multiline = false;
            _loc2_.details2TF._x = _loc2_.timeTF._x - _loc2_.details2TF._width;
         }
      }
      if(str3 != undefined)
      {
         _loc2_.details3TF.text = str3;
         _loc2_.details3TF.autoSize = "left";
         _loc2_.details3TF.wordWrap = false;
         _loc2_.details3TF.multiline = false;
         _loc2_.details3TF._x = - _loc2_.details3TF._width;
      }
      if(this.detailsShown)
      {
         this.setDescWidth();
      }
   }
   function SHOW_HEADING_DETAILS(bool)
   {
      this.CONTENT.headerMC.alldetailsMC._visible = this.detailsShown = bool;
      if(!this.detailsShown)
      {
         this.setDescWidth();
      }
   }
   function SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank)
   {
   }
   function SET_HEADER_BG_IMG(txd, bgTexturePath, xPos)
   {
      this.storedBGTxd = txd;
      var _loc2_ = this.CONTENT.headerMC.bgcontainerMC;
      if(txd != "")
      {
         if(this.bgImgLoaderMC == undefined)
         {
            this.bgImgLoaderMC = (com.rockstargames.ui.media.ImageLoaderMC)_loc2_.attachMovie("txdLoader","bgImageMC",_loc2_.getNextHighestDepth(),{_x:868 * xPos});
         }
         if(this.bgImgLoaderMC.isLoaded == true)
         {
            this.bgImgLoaderMC.removeTxdRef();
         }
         this.bgImgLoaderMC.init("PAUSE_MENU_HEADER",txd,bgTexturePath);
         var _loc4_ = 2;
         var _loc3_ = String(this.bgImgLoaderMC).split(".");
         var _loc5_ = _loc3_.slice(_loc3_.length - _loc4_).join(".");
         this.bgImgLoaderMC.requestTxdRef(_loc5_,false,this.loadedBgImg,this);
      }
   }
   function loadedBgImg()
   {
      this.bgLoaderList.push(this.bgImgLoaderMC);
      var _loc2_ = this.CONTENT.headerMC.bgcontainerMC;
      _loc2_._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.2,{_alpha:100});
   }
   function SET_CREW_IMG(txd, crewTexturePath, show)
   {
      this.showCrew = show;
      if(this.showCrew)
      {
         if(txd != "")
         {
            if(this.crewImgLoaderMC == undefined)
            {
               this.crewImgLoaderMC = (com.rockstargames.ui.media.ImageLoaderMC)this.crewMC.attachMovie("txdLoader","crewsImageMC",this.crewMC.getNextHighestDepth(),{_x:- this.imgSize});
            }
            if(this.crewImgLoaderMC.isLoaded == true)
            {
               this.crewImgLoaderMC.removeTxdRef();
            }
            this.crewImgLoaderMC.init("PAUSE_MENU_HEADER",txd,crewTexturePath,this.imgSize,this.imgSize);
            var _loc3_ = 3;
            var _loc2_ = String(this.crewImgLoaderMC).split(".");
            var _loc4_ = _loc2_.slice(_loc2_.length - _loc3_).join(".");
            this.crewImgLoaderMC.addTxdRef(_loc4_,this.loadedCrewImg,this);
            this.crewImgLoaderMC._alpha = 0;
         }
         this.crewMC._visible = true;
      }
      else
      {
         this.crewMC._visible = false;
      }
      this.adjustHeaderPositions();
   }
   function loadedCrewImg()
   {
      var _loc2_ = 0.2;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.crewImgLoaderMC,_loc2_,{_alpha:100});
   }
   function SET_CHAR_IMG(txd, charTexturePath, show)
   {
      this.showChar = show;
      if(this.showChar)
      {
         if(txd != "")
         {
            if(this.charImgLoaderMC == undefined)
            {
               this.charImgLoaderMC = (com.rockstargames.ui.media.ImageLoaderMC)this.charMC.attachMovie("txdLoader","charImageMC",this.charMC.getNextHighestDepth(),{_x:- this.imgSize});
            }
            if(this.charImgLoaderMC.isLoaded == true)
            {
               this.charImgLoaderMC.removeTxdRef();
            }
            this.charImgLoaderMC.init("PAUSE_MENU_HEADER",txd,charTexturePath,this.imgSize,this.imgSize);
            var _loc3_ = 3;
            var _loc2_ = String(this.charImgLoaderMC).split(".");
            var _loc4_ = _loc2_.slice(_loc2_.length - _loc3_).join(".");
            this.charImgLoaderMC.addTxdRef(_loc4_,this.loadedCharImg,this);
            this.charImgLoaderMC._alpha = 0;
         }
         this.charMC._visible = true;
      }
      else
      {
         this.charMC._visible = false;
      }
      this.adjustHeaderPositions();
   }
   function loadedCharImg()
   {
      var _loc2_ = 0.2;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.charImgLoaderMC,_loc2_,{_alpha:100});
   }
   function adjustHeaderPositions()
   {
      var _loc2_ = 4;
      if(this.showChar == false && this.showCrew == false)
      {
         this.detailsMC._x = this.detailsXPositions[0];
      }
      else if(this.showChar == false && this.showCrew == true)
      {
         this.crewMC._x = this.detailsXPositions[0];
         this.detailsMC._x = this.detailsXPositions[1] - _loc2_;
      }
      else if(this.showChar == true && this.showCrew == false)
      {
         this.charMC._x = this.detailsXPositions[0];
         this.detailsMC._x = this.detailsXPositions[1] - _loc2_;
      }
      else if(this.showChar == true && this.showCrew == true)
      {
         this.charMC._x = this.detailsXPositions[0];
         this.crewMC._x = this.detailsXPositions[1];
         this.detailsMC._x = this.detailsXPositions[2] - _loc2_;
      }
   }
   function BUILD_MENU()
   {
      this.menubar.BUILD_MENU(arguments);
      var _loc3_ = 5;
      this.CONTENT.headerMC.bgMC._height = this.menubar._y + _loc3_;
   }
   function REMOVE_MENU(clearForRestart)
   {
      this.dbg("REMOVE_MENU ||||||||||||||||||||||||||||||||||||||||||||||||||||| " + clearForRestart);
      this.CLEAR_TXDS();
      if(clearForRestart)
      {
         this.menubar.REMOVE_MENU();
         this.SET_ALL_HIGHLIGHTS(false);
         this.menubar.SET_HEADER_ARROWS_VISIBLE(false,false);
      }
   }
   function CLEAR_TXDS()
   {
      com.rockstargames.ui.utils.Debug.log("CLEAR_TXDS ----- ");
      if(this.bgImgLoaderMC.isLoaded)
      {
         this.bgImgLoaderMC.removeTxdRef();
      }
      if(this.charImgLoaderMC.isLoaded)
      {
         this.charImgLoaderMC.removeTxdRef();
      }
      if(this.crewImgLoaderMC.isLoaded)
      {
         this.crewImgLoaderMC.removeTxdRef();
      }
   }
   function SET_MENU_HEADER_TEXT_BY_INDEX(menuIndex, label, widthSpan, forceUpper)
   {
      if(forceUpper != undefined)
      {
         if(forceUpper == true)
         {
            label = label.toUpperCase();
         }
      }
      this.menubar.SET_MENU_HEADER_TEXT_BY_INDEX(menuIndex,label,widthSpan);
   }
   function WEIGHT_MENU()
   {
      var _loc8_ = arguments.length;
      var _loc3_ = 0;
      while(_loc3_ < this.menubar.menuItemList.length)
      {
         var _loc4_ = this.menubar.menuItemList[_loc3_];
         var _loc6_ = arguments[_loc3_];
         _loc4_.resizeTabPx(_loc6_);
         _loc4_.width = _loc4_.mc.bgMC._width;
         if(_loc3_ > 0)
         {
            var _loc5_ = this.menubar.menuItemList[_loc3_ - 1];
            var _loc7_ = 2;
            _loc4_._x = _loc5_._x + _loc5_.mc.bgMC._width + _loc7_;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function SET_MENU_ITEM_COLOUR(menuindex, colourEnum)
   {
      this.menubar.SET_MENU_COLOUR(menuindex,colourEnum);
   }
   function LOCK_MENU_ITEM(menuindex, isLocked)
   {
      this.menubar.LOCK_MENU_ITEM(menuindex,isLocked);
   }
   function SET_MENU_ITEM_ALERT(menuindex, warnStr, col)
   {
      this.menubar.SET_MENU_ITEM_ALERT(menuindex,warnStr,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
   }
   function SCROLL_MENU_IN_DIR(dir)
   {
      this.menubar.SCROLL_MENU_IN_DIR([dir]);
   }
   function HIGHLIGHT_MENU(index)
   {
      this.menubar.HIGHLIGHT_MENU(index);
   }
   function SET_ALL_HIGHLIGHTS(allHighlights, _colourID)
   {
      if(allHighlights)
      {
         this.CONTENT.headerMC.bgMC.coronaMC._visible = true;
      }
      else
      {
         this.CONTENT.headerMC.bgMC.coronaMC._visible = false;
      }
      var _loc2_ = 0;
      if(_colourID != undefined && _colourID != NaN && _colourID >= 0)
      {
         _loc2_ = _colourID;
      }
      else
      {
         _loc2_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE_DARK;
      }
      this.menubar.SET_ALL_HIGHLIGHTS(allHighlights,_loc2_);
   }
   function SHOW_MENU(bool)
   {
      this.menubar._visible = bool;
   }
   function ADD_TXD_REF_RESPONSE(txd, strRef, success)
   {
      if(success == true)
      {
         var pMC = this.CONTENT.headerMC;
         var il = (com.rockstargames.ui.media.ImageLoaderMC)eval(pMC + "." + strRef);
         if(pMC != undefined)
         {
            il.displayTxdResponse(txd);
         }
      }
   }
   function TXD_HAS_LOADED(txd, success, strRef)
   {
      if(success == true)
      {
         var pMC = this.CONTENT.headerMC;
         var il = (com.rockstargames.ui.media.ImageLoaderMC)eval(pMC + "." + strRef);
         if(pMC != undefined)
         {
            il.displayTxdResponse(txd,success);
         }
      }
   }
   function TXD_ALREADY_LOADED(txd, strRef)
   {
      var pMC = this.CONTENT.headerMC;
      var il = (com.rockstargames.ui.media.ImageLoaderMC)eval(pMC + "." + strRef);
      if(pMC != undefined)
      {
         il.displayTxdResponse(txd,true);
      }
   }
}
