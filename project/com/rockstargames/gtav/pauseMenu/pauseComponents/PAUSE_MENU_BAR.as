class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_BAR extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var visibleItems = 6;
   var menuIndex = 0;
   var startIndex = 0;
   var totalMenuWidth = 868;
   var scrollingMenuWidth = 725;
   var menuItemWidth = 143;
   var menuItemSpacing = 2;
   var menuItemList = new Array();
   var allHighlightsOn = false;
   var mClickOn = true;
   var mRollOverOn = true;
   var charSelectOn = false;
   function PAUSE_MENU_BAR()
   {
      super();
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
      this.menuContainer = this.CONTENT.createEmptyMovieClip("menuContainerMC",this.CONTENT.getNextHighestDepth());
   }
   function BUILD_MENU(params)
   {
      var _loc6_ = params;
      if(this.menuItemList.length > 0)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.menuItemList.length)
         {
            this.menuItemList[_loc2_].removeMovieClip();
            _loc2_ = _loc2_ + 1;
         }
      }
      this.menuItemList = [];
      var _loc5_ = _loc6_.length;
      this.getMenuWidth(_loc5_);
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         var _loc3_ = this.menuContainer.attachMovie("menuItem","menuItem" + _loc2_ + "MC",_loc5_ - _loc2_);
         _loc3_._x = _loc2_ * (this.menuItemWidth + this.menuItemSpacing);
         var _loc4_ = "";
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)_loc3_.__set__menuenum(_loc6_[_loc2_]);
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)_loc3_.__set__label(String(_loc4_));
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)_loc3_.__set__width(this.menuItemWidth);
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)_loc3_.mInit(this,_loc2_);
         this.menuItemList.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      if(_loc5_ > 1)
      {
         this.leftArrowMouseCatcherMC = this.createArrowMouseCatcher(-20 - this.menuItemSpacing,8,20,20,this.onLeftArrowClick);
         this.rightArrowMouseCatcherMC = this.createArrowMouseCatcher((this.menuItemWidth + this.menuItemSpacing) * this.visibleItems,8,20,20,this.onRightArrowClick);
      }
      this.HIGHLIGHT_MENU(0);
   }
   function createArrowMouseCatcher(x, y, w, h, mPress)
   {
      var _loc2_ = this.CONTENT.createEmptyMovieClip("arrowCatcherMC" + this.CONTENT.getNextHighestDepth(),this.CONTENT.getNextHighestDepth());
      _loc2_.beginFill(16711935,100);
      _loc2_.moveTo(0,0);
      _loc2_.lineTo(w,0);
      _loc2_.lineTo(w,h);
      _loc2_.lineTo(0,h);
      _loc2_.lineTo(0,0);
      _loc2_.endFill();
      _loc2_._alpha = 0;
      _loc2_._x = x;
      _loc2_._y = y;
      _loc2_.onRelease = mx.utils.Delegate.create(this,mPress);
      return _loc2_;
   }
   function removeArrowMouseCatcher(arrowCatcherMC)
   {
      delete arrowCatcherMC.onRelease;
      arrowCatcherMC.removeMovieClip();
   }
   function onLeftArrowClick()
   {
      var _loc2_ = (this.menuIndex <= 0?this.menuItemList.length:this.menuIndex) - 1;
      this.SET_CODE_MENU_INDEX(_loc2_);
   }
   function onRightArrowClick()
   {
      var _loc2_ = (this.menuIndex + 1) % this.menuItemList.length;
      this.SET_CODE_MENU_INDEX(_loc2_);
   }
   function LOCK_MOUSE_SUPPORT(_mClickOn, _mRollOverOn)
   {
      if(_mClickOn != undefined)
      {
         this.mClickOn = _mClickOn;
      }
      if(_mRollOverOn != undefined)
      {
         this.mRollOverOn = _mRollOverOn;
      }
   }
   function IS_CHAR_SELECT(_charSelectOn)
   {
      if(_charSelectOn != undefined)
      {
         this.charSelectOn = _charSelectOn;
      }
   }
   function REMOVE_MENU()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.menuItemList.length)
      {
         var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)this.menuItemList[_loc2_];
         _loc3_.removeMouse();
         _loc3_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.removeArrowMouseCatcher(this.leftArrowMouseCatcherMC);
      this.removeArrowMouseCatcher(this.rightArrowMouseCatcherMC);
      this.menuIndex = 0;
      this.startIndex = 0;
      this.visibleItems = 6;
      this.menuContainer._x = 0;
      this.menuItemList = [];
   }
   function SET_ALL_HIGHLIGHTS(hOn, colourID)
   {
      this.allHighlightsOn = hOn;
      var _loc2_ = 0;
      while(_loc2_ < this.menuItemList.length)
      {
         var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)this.menuItemList[_loc2_];
         if(this.allHighlightsOn)
         {
            _loc3_.__set__highlight(true);
         }
         else
         {
            _loc3_.__set__highlight(this.menuIndex == _loc2_);
         }
         if(colourID != undefined)
         {
            _loc3_.__set__bespokeColour(colourID);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_MENU_HEADER_TEXT_BY_INDEX(menuIndex, label, widthSpan)
   {
      var _loc2_ = this.menuItemList[menuIndex];
      _loc2_.__set__label(label);
      _loc2_.realignText(widthSpan);
   }
   function SET_MENU_ITEM_ALERT(menuindex, warnStr, col)
   {
      var _loc2_ = this.menuItemList[menuindex];
      if(_loc2_ != undefined)
      {
         _loc2_.setAlertText(warnStr,col);
      }
   }
   function SET_MENU_COLOUR(menuindex, colourEnum)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(colourEnum,_loc2_);
      var _loc4_ = [colourEnum,_loc2_.r,_loc2_.g,_loc2_.b,100];
      if(_loc4_ != undefined)
      {
         var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)this.menuItemList[menuindex];
         if(_loc3_ != undefined)
         {
            _loc3_.__set__mycolour(_loc4_);
         }
      }
   }
   function LOCK_MENU_ITEM(menuindex, isLocked)
   {
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)this.menuItemList[menuindex];
      if(_loc2_ != undefined)
      {
         _loc2_.__set__locked(isLocked);
      }
   }
   function SCROLL_MENU_IN_DIR(params)
   {
      var _loc3_ = params[0];
      var _loc2_ = this.menuIndex + _loc3_;
      if(_loc2_ < 0)
      {
         _loc2_ = this.menuItemList.length - 1;
      }
      if(_loc2_ > this.menuItemList.length - 1)
      {
         _loc2_ = 0;
      }
      this.HIGHLIGHT_MENU(_loc2_);
   }
   function ROLLOVER_MENU(bool)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.menuItemList.length)
      {
         var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)this.menuItemList[_loc2_];
         if(bool)
         {
            _loc3_.__set__rollover(true);
         }
         else
         {
            _loc3_.__set__rollover(false);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function HIGHLIGHT_MENU(index)
   {
      if(!this.allHighlightsOn)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.menuItemList.length)
         {
            var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)this.menuItemList[_loc2_];
            _loc4_.__set__highlight(_loc2_ == index);
            _loc2_ = _loc2_ + 1;
         }
      }
      var _loc7_ = 0;
      if(this.menuIndex == 0 && index == this.menuItemList.length - 1)
      {
         this.startIndex = this.menuItemList.length - this.visibleItems;
         _loc7_ = - index * (this.menuItemWidth + this.menuItemSpacing) - this.scrollingMenuWidth;
         this.scrollMenu(_loc7_,0.333,com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT);
      }
      if(this.menuIndex == this.menuItemList.length - 1 && index == 0)
      {
         this.startIndex = 0;
         _loc7_ = - index * (this.menuItemWidth + this.menuItemSpacing);
         this.scrollMenu(_loc7_,0.333,com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT);
      }
      if(index >= this.startIndex + this.visibleItems)
      {
         this.startIndex = this.startIndex + 1;
         _loc7_ = - index * (this.menuItemWidth + this.menuItemSpacing) - this.scrollingMenuWidth;
         this.scrollMenu(_loc7_,0.2,com.rockstargames.ui.tweenStar.Ease.CUBIC_OUT);
      }
      if(index < this.startIndex)
      {
         this.startIndex = this.startIndex - 1;
         _loc7_ = - index * (this.menuItemWidth + this.menuItemSpacing);
         this.scrollMenu(_loc7_,0.2,com.rockstargames.ui.tweenStar.Ease.CUBIC_OUT);
      }
      this.menuIndex = index;
      var _loc8_ = this.menuIndex == this.startIndex;
      var _loc9_ = this.menuIndex - this.startIndex == this.visibleItems - 1;
      this.SET_HEADER_ARROWS_VISIBLE(_loc8_,_loc9_);
      _loc2_ = 0;
      while(_loc2_ < this.menuItemList.length)
      {
         var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)this.menuItemList[_loc2_];
         var _loc5_ = _loc2_ < this.startIndex || _loc2_ >= this.startIndex + this.visibleItems;
         if(_loc5_)
         {
            if(_loc3_.hasMouse)
            {
               _loc3_.removeMouse();
            }
         }
         else if(!_loc3_.hasMouse)
         {
            _loc3_.addMouse();
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function getMenuWidth(items)
   {
      if(items != undefined)
      {
         if(items < 6)
         {
            this.visibleItems = items;
         }
         else
         {
            this.visibleItems = 6;
         }
      }
      var _loc2_ = 0;
      if(this.visibleItems > 0)
      {
         _loc2_ = this.visibleItems - 1;
      }
      this.menuItemWidth = (this.totalMenuWidth - this.menuItemSpacing * _loc2_) / this.visibleItems;
      this.scrollingMenuWidth = _loc2_ * (this.menuItemWidth + this.menuItemSpacing);
   }
   function scrollMenu(x, duration, easetype)
   {
      if(!duration || duration == 0)
      {
         duration = 0.2;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.menuContainer,duration,{_x:x,ease:easetype});
   }
   function SET_HEADER_ARROWS_VISIBLE(isLeftArrowVisible, isRightArrowVisible)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_HEADER_ARROW_VISIBLE",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,this.menuItemList.length > this.visibleItems,isLeftArrowVisible,isRightArrowVisible);
   }
   function SET_CODE_MENU_INDEX(rollOverIndex)
   {
      com.rockstargames.ui.utils.Debug.log("SET_CODE_MENU_INDEX " + rollOverIndex);
      if(this.mRollOverOn)
      {
         if(rollOverIndex != this.menuIndex)
         {
            if(!this.charSelectOn)
            {
               this.ROLLOVER_MENU(false);
               com.rockstargames.ui.game.GameInterface.call("SET_CODE_MENU_INDEX",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,rollOverIndex);
            }
            else
            {
               com.rockstargames.ui.utils.Debug.log("menuIndex " + rollOverIndex);
               com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,0,0,rollOverIndex,1);
            }
         }
      }
   }
   function SET_CODE_MENU_SELECT()
   {
      com.rockstargames.ui.utils.Debug.log("SET_CODE_MENU_SELECT " + this.mClickOn);
      if(this.mClickOn)
      {
         com.rockstargames.ui.utils.Debug.log("charSelectOn " + this.charSelectOn);
         if(!this.charSelectOn)
         {
            com.rockstargames.ui.game.GameInterface.call("CALL_METHOD_ON_MOVIE",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"PAUSE_MENU_SP_CONTENT","PRESS_SHIFT_DEPTH",[1]);
         }
         else
         {
            com.rockstargames.ui.utils.Debug.log("menuIndex " + this.menuIndex);
            com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,0,0,this.menuIndex,1);
         }
      }
   }
}
