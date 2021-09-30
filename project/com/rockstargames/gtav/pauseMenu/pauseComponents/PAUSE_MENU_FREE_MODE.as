class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREE_MODE extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var hasCustomScrollPos = false;
   var hasTitle = false;
   var rowOffset = 27;
   var isCharSelect = false;
   var charSelectHeight = 25;
   function PAUSE_MENU_FREE_MODE()
   {
      super();
      this.dbgID = "PAUSE_MENU_FREE_MODE";
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
      this.TextWithBlips = new com.rockstargames.ui.utils.Text();
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,container:this.CONTENT,linkage:["freemodeListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.helpMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.ccbgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.CONTENT.helpMC.innerMC.helpTF.wordWrap = true;
      this.CONTENT.helpMC.innerMC.helpTF.autoSize = true;
      this.CONTENT.helpMC._visible = false;
      this.titleMC = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem)this.CONTENT.attachMovie("freemodeListItem","tMC",this.CONTENT.getNextHighestDepth());
      this.titleMC._visible = this.hasTitle = false;
      this.ccbgMC._visible = false;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW.apply(this,arguments);
      this.setCharCreatorItem();
      this.dependentColumnMC.onDisplayUpdate();
      if(this.isCharSelect)
      {
         this.charTitleMC._visible = true;
      }
      var _loc4_ = this.getHelpY();
      this.CONTENT.helpMC._y = _loc4_;
      this.setLinkedMCPos(_loc4_);
      if(this.canMouseNav)
      {
         this.SEND_COLUMN_PARAMS();
      }
   }
   function setColumnDependent(columnMC)
   {
      this.dependentColumnMC = columnMC;
   }
   function setIsLastItem()
   {
      var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)this.model.getCurrentView();
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.itemList.length)
      {
         var _loc3_ = _loc4_.itemList[_loc2_];
         if(_loc2_ == _loc4_.itemList.length - 1)
         {
            _loc3_.dummybgMC._height = 25;
         }
         com.rockstargames.ui.utils.Debug.log("     isLastVisibleItem: " + _loc3_.__get__isLastVisibleItem());
         _loc2_ = _loc2_ + 1;
      }
   }
   function setCharCreatorItem()
   {
      if(this.isCharSelect)
      {
         var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)this.model.getCurrentView();
         var _loc5_ = _loc4_.itemList.length - 1;
         var _loc2_ = 0;
         while(_loc2_ < _loc4_.itemList.length)
         {
            var _loc3_ = _loc4_.itemList[_loc2_];
            _loc3_.__set__isCharCreatorItem(true);
            _loc3_._y = _loc2_ * this.charSelectHeight;
            if(_loc3_.type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.COLOUR_ALL_ITEM)
            {
               _loc5_ = _loc2_;
            }
            if(_loc2_ == _loc4_.itemList.length - 1)
            {
               _loc3_.__set__isLastVisibleItem(true);
            }
            _loc2_ = _loc2_ + 1;
         }
         var _loc6_ = _loc4_.itemList[_loc5_];
         this.ccbgMC._visible = true;
         this.ccbgMC._y = this.charTitleMC._height;
         this.ccbgMC._height = _loc6_._y + this.charSelectHeight;
      }
      else
      {
         this.setIsLastItem();
         this.ccbgMC._visible = false;
      }
   }
   function SET_STATE(i, mc)
   {
      this.linkedMC = mc;
      this.hasCustomScrollPos = false;
      switch(i)
      {
         case 2:
            this.model.getCurrentView().visibleItems = 8;
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)this.model.getCurrentView().maxVisibleItems = 8;
            this.hasCustomScrollPos = true;
            break;
         case 1:
            break;
         default:
      }
      this.isCharSelect = true;
      var _loc2_ = this.CONTENT.tMC;
      if(_loc2_)
      {
         _loc2_._visible = false;
      }
      this.charTitleMC = this.CONTENT.attachMovie("charSelectTitle","csMC",this.CONTENT.getNextHighestDepth());
      this.charTitleMC._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.bgsubMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.headingMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.charTitleMC.subMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      this.model.getCurrentView().viewContainer._y = this.charTitleMC._height;
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)this.model.getCurrentView();
      _loc2_.__set__index(i);
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      super.SET_DATA_SLOT.apply(this,arguments);
      this.getVisibleHeight();
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      this.titleMC._visible = this.charTitleMC._visible = this.hasTitle = false;
      this.ccbgMC._visible = false;
      this.model.getCurrentView().visibleItems = 16;
      if(!this.isCharSelect)
      {
         this.model.getCurrentView().viewContainer._y = 0;
      }
   }
   function SET_TITLE(titleStr, desc, pagination)
   {
      if(this.isCharSelect)
      {
         this.charTitleMC.headingMC.titleTF.text = titleStr;
         this.charTitleMC.headingMC.titleTF.textAutoSize = "shrink";
         com.rockstargames.ui.utils.UIText.setSizedText(this.charTitleMC.subMC.subtitleTF,desc,true,false);
         com.rockstargames.ui.utils.UIText.setSizedText(this.charTitleMC.subMC.pageTF,pagination,true,false);
         this.charTitleMC._visible = true;
      }
      else
      {
         this.titleMC.__set__data([0,999,999,0,0,1,titleStr]);
         this.titleMC.setTitle();
         this.titleMC._visible = this.hasTitle = true;
         this.model.getCurrentView().visibleItems = 15;
         this.model.getCurrentView().viewContainer._y = this.rowOffset;
      }
   }
   function flashHelpIn()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.helpMC.innerMC,1,{_alpha:100,onCompleteScope:this,onComplete:this.flashHelpOut});
   }
   function flashHelpOut()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.helpMC.innerMC,1,{_alpha:0,onCompleteScope:this,onComplete:this.flashHelpIn});
   }
   function SET_DESCRIPTION(helpStr, flashIcon, flashHelp)
   {
      if(this.blipLayer)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.CONTENT.helpMC.innerMC.createEmptyMovieClip("blipLayer",1000);
      this.TextWithBlips.setTextWithIcons(helpStr,this.blipLayer,this.CONTENT.helpMC.innerMC.helpTF,0,13,2,false);
      this.CONTENT.helpMC._visible = helpStr != "";
      if(!this.CONTENT.helpMC._visible)
      {
         this.CONTENT.helpMC.iMC.gotoAndStop(1);
      }
      else if(flashIcon)
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
      if(flashHelp)
      {
         this.flashHelpIn();
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.helpMC);
         this.CONTENT.helpMC._alpha = 100;
      }
      var _loc2_ = this.getHelpY();
      if(this.scrollBase != undefined && this.hasCustomScrollPos == true)
      {
         _loc2_ = _loc2_ + (this.scrollBase._height + 2);
      }
      this.CONTENT.helpMC._y = _loc2_;
      this.CONTENT.helpMC.bgMC._height = this.CONTENT.helpMC.innerMC.helpTF.textHeight + 12;
      this.setLinkedMCPos(_loc2_);
      this.getVisibleHeight();
   }
   function INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, xColOffset)
   {
      super.INIT_SCROLL_BAR(visible,columns,scrollType,arrowPosition,override,xColOffset);
      if(this.scrollBase != undefined && this.hasCustomScrollPos == true)
      {
         var _loc3_ = this.getHelpY();
         this.scrollBase._y = _loc3_;
      }
   }
   function SET_SCROLL_BAR(currentPosition, maxPosition, maxVisible, caption)
   {
      super.SET_SCROLL_BAR(currentPosition,maxPosition,maxVisible,caption);
      if(this.scrollBase != undefined && this.hasCustomScrollPos == true)
      {
         var _loc3_ = this.getHelpY();
         this.scrollBase._y = _loc3_;
      }
   }
   function getHelpY()
   {
      var _loc7_ = 0;
      if(this.hasTitle)
      {
         _loc7_ = this.rowOffset;
      }
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)this.model.getCurrentView();
      var _loc4_ = _loc3_.visibleItems;
      var _loc2_ = !this.isCharSelect?this.rowOffset:this.charSelectHeight;
      var _loc5_ = !this.isCharSelect?0:2;
      var _loc6_ = !this.isCharSelect?0:this.charTitleMC._height;
      com.rockstargames.ui.utils.Debug.log("***FREEMODE ****************************** ");
      com.rockstargames.ui.utils.Debug.log("getHelpY " + this.getHelpY);
      com.rockstargames.ui.utils.Debug.log("currView " + _loc3_);
      com.rockstargames.ui.utils.Debug.log("_visibleItems " + _loc4_);
      com.rockstargames.ui.utils.Debug.log("itemHeight " + _loc2_);
      com.rockstargames.ui.utils.Debug.log("endOverlap " + _loc5_);
      com.rockstargames.ui.utils.Debug.log("charTitleHeight " + _loc6_);
      return _loc7_ + _loc4_ * _loc2_ + _loc6_ + _loc5_;
   }
   function setLinkedMCPos(yOrigin)
   {
      if(this.linkedMC)
      {
         var _loc3_ = yOrigin;
         var _loc2_ = 0;
         if(this.CONTENT.helpMC._visible)
         {
            _loc3_ = this.CONTENT.helpMC._y + this.CONTENT.helpMC.bgMC._height;
            _loc2_ = 4;
         }
         this.linkedMC._x = 0;
         this.linkedMC._y = _loc3_ + _loc2_;
      }
   }
   function SET_FOCUS(isFocused)
   {
      this.columnIsFocused = isFocused;
      this.SEND_COLUMN_PARAMS();
      if(isFocused)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeModel)this.model.highlightNext();
      }
      else
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeModel)this.model.clearHighlight();
      }
      if(this.scrollBase != undefined)
      {
         this.scrollBase.updateScroll();
         this.scrollBase._visible = isFocused && this.scrollBase.displayEnabled();
      }
   }
   function getVisibleHeight()
   {
      return !this.CONTENT.helpMC._visible?this.model.getCurrentView().itemList.length * 27 - 2:this.CONTENT.helpMC._y + this.CONTENT.helpMC._height;
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
}
