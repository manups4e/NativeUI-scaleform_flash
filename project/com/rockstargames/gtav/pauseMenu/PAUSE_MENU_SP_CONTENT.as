class com.rockstargames.gtav.pauseMenu.PAUSE_MENU_SP_CONTENT extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuContentBase
{
   var columnWidth = 288;
   var canHeaderAdvance = true;
   var isLoggedSC = false;
   var mOn = true;
   var mClickOn = true;
   var mRollOverOn = true;
   var mScrollType = 0;
   var debugCol = false;
   var debugColIndex = 0;
   var isAsianLang = false;
   var secondClickCancel = true;
   var canHighlightAll = true;
   var footerScrollOverride = 99;
   var sendClickEventOnly = false;
   function PAUSE_MENU_SP_CONTENT()
   {
      super();
      this.dbgID = "PAUSE_MENU_SP_CONTENT";
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.dbgOn = Boolean(0);
      this.__set__debug(Boolean(0));
      var _loc3_ = this.CONTENT.createEmptyMovieClip("clickRepeatMC",this.CONTENT.getNextHighestDepth());
      this.clickRepeat = new com.rockstargames.gtav.pauseMenu.pauseComponents.ClickRepeat(_loc3_);
      this.INIT_M_AUX();
   }
   function SET_MENU_LEVEL(_menuLevel)
   {
      this.menuLevel = _menuLevel;
   }
   function DEBUG_ALL()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.currentPage.columnList.length)
      {
         var _loc3_ = this.GET_COLUMN(_loc2_);
         _loc3_.debug();
         _loc2_ = _loc2_ + 1;
      }
   }
   function SHOW_DEBUG(b)
   {
      this.dbgOn = b;
   }
   function __set__debug(d)
   {
      this.debugCol = d;
      return this.__get__debug();
   }
   function __get__debug()
   {
      return this.debugCol;
   }
   function dbgColVisible()
   {
      var _loc2_ = this.currentPage.columnList[this.debugColIndex];
      _loc2_._visible = !_loc2_._visible?true:false;
   }
   function dbgColDebug()
   {
      var _loc2_ = this.currentPage.columnList[this.debugColIndex];
      _loc2_.debug();
      this.dbg("DEBUG debugColIndex: " + this.debugColIndex);
      this.dbg("DEBUG " + _loc2_);
      this.dbg("DEBUG debug" + _loc2_.debug);
   }
   function dbgColLeft()
   {
      var _loc2_ = 0;
      var _loc3_ = this.currentPage.columnList.length;
      if(this.debugColIndex <= _loc2_)
      {
         §§push(this.debugColIndex = _loc2_);
      }
      else
      {
         this.debugColIndex = this.debugColIndex - 1;
         §§push(this.debugColIndex);
      }
      §§pop();
      this.dbg("LEFT " + this.debugColIndex);
   }
   function dbgColRight()
   {
      var _loc3_ = 0;
      var _loc2_ = this.currentPage.columnList.length;
      if(this.debugColIndex >= _loc2_)
      {
         §§push(this.debugColIndex = _loc2_);
      }
      else
      {
         this.debugColIndex = this.debugColIndex + 1;
         §§push(this.debugColIndex);
      }
      §§pop();
      this.dbg("RIGHT " + this.debugColIndex);
   }
   function localLoad()
   {
   }
   function DEBUG_INIT_MOUSE_EVENTS()
   {
      this.mOn = true;
   }
   function INIT_MOUSE_EVENTS()
   {
      this.mOn = true;
   }
   function SET_TEXT_SIZE(isAsian, sizeOverride)
   {
      var _loc6_ = 16;
      var _loc4_ = 13;
      if(isAsian != undefined && isAsian == true)
      {
         _loc4_ = _loc6_;
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
         _loc4_ = sizeOverride;
      }
      this.isAsianLang = isAsian;
      com.rockstargames.ui.utils.UIText.SIZE = _loc4_;
      if(isAsian)
      {
         this.headerMethod("SET_TEXT_SIZE",arguments);
      }
   }
   function INSTRUCTIONAL_BUTTONS(func)
   {
      var _loc2_ = arguments.slice(1);
      com.rockstargames.ui.game.GameInterface.call("CALL_METHOD_ON_MOVIE",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"PAUSE_MENU_INSTRUCTIONAL_BUTTONS",func,_loc2_ != undefined?_loc2_:[]);
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
   function INIT_M_AUX()
   {
      if(this.mOn)
      {
         if(this.mListener)
         {
            Mouse.removeListener(this.mListener);
            this.mListener = null;
         }
         this.mListener = new Object();
         this.mListener.ref = this;
         this.mListener.onMouseWheel = function(delta, target)
         {
            this.ref.DELTA_MOUSE_WHEEL(delta);
         };
         this.mListener.onMouseUp = function()
         {
            this.ref.clickRepeat.repeatStop();
         };
         Mouse.addListener(this.mListener);
      }
   }
   function DELTA_MOUSE_WHEEL(delta)
   {
      var _loc5_ = this.menuLevel - 1;
      var _loc2_ = this.GET_COLUMN(_loc5_);
      if(!_loc2_)
      {
         return undefined;
      }
      var _loc4_ = _loc2_.columnIsFocused;
      if(_loc4_ && _loc2_.canWheelScroll)
      {
         switch(this.mScrollType)
         {
            case 0:
               this.MENU_INTERACTION(delta <= 0?com.rockstargames.ui.game.GamePadConstants.DPADDOWN:com.rockstargames.ui.game.GamePadConstants.DPADUP,false);
               com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET");
               break;
            case 1:
               var _loc3_ = this.GET_COLUMN(this.mScrollType);
               _loc3_.SET_INPUT_EVENT.apply(_loc3_,[delta <= 0?9:8]);
         }
      }
      if(this.inContext)
      {
         this.MENU_INTERACTION(delta <= 0?com.rockstargames.ui.game.GamePadConstants.DPADDOWN:com.rockstargames.ui.game.GamePadConstants.DPADUP,false);
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET");
      }
   }
   function MOUSE_COLUMN_SHIFT(_mScrollType)
   {
      this.mScrollType = _mScrollType;
   }
   function PRESS_SHIFT_DEPTH(dir)
   {
      com.rockstargames.ui.utils.Debug.log("PRESS_SHIFT_DEPTH " + dir + " : mClickOn: " + this.mClickOn);
      if(!this.mOn)
      {
         return undefined;
      }
      if(!this.mClickOn)
      {
         return undefined;
      }
      if(dir == 1)
      {
         if(this.__get__inTopMenu())
         {
            this.MENU_SHIFT_DEPTH(1,false,false);
         }
      }
   }
   function M_OVER_EVENT(index, colID, pmb)
   {
      if(this.lastHoveredItem != undefined && this.lastHoveredItem.onMouseMove != undefined)
      {
         delete this.lastHoveredItem.onMouseMove;
      }
      this.lastHoveredItem = pmb;
      this.lastHoveredItem.onMouseMove = com.rockstargames.ui.utils.DelegateStar.create(this.lastHoveredItem,this.lastHoveredItem.mOver);
      this.FILTER_M_EVENT(index,colID,0,false,pmb);
   }
   function M_OUT_EVENT(index, colID)
   {
      if(this.lastHoveredItem != undefined && this.lastHoveredItem.onMouseMove != undefined)
      {
         delete this.lastHoveredItem.onMouseMove;
      }
      this.FILTER_M_EVENT(index,colID,-1,false);
   }
   function M_PRESS_EVENT(index, colID, advance, bIgnoreStateChange)
   {
      this.FILTER_M_EVENT(index,colID,1,advance,undefined,bIgnoreStateChange);
   }
   function FILTER_M_EVENT(index, colID, action, advance, pmb, bIgnoreStateChange)
   {
      if(!this.mOn)
      {
         return undefined;
      }
      if(!this.__get__inTopMenu())
      {
         var _loc6_ = this.menuLevel - 1;
         var _loc4_ = this.GET_COLUMN(_loc6_);
         if(this.canHighlightAll)
         {
            _loc4_ = this.GET_COLUMN(colID);
         }
         if(this.inContext)
         {
            _loc4_ = this.context;
         }
         if(!_loc4_)
         {
            return undefined;
         }
         var _loc8_ = _loc4_.columnIsFocused;
         var _loc10_ = _loc4_.canMouseNav;
         this.dbg("---->FILTER_M_EVENT <---- action: " + action);
         this.dbg("Column ID: " + colID + " == Menu Level: " + _loc6_);
         this.dbg(" ");
         if(this.secondClickCancel)
         {
            if(_loc10_ && action == 1)
            {
               var _loc5_ = colID - _loc6_;
               this.dbg("diff : " + _loc5_);
               this.dbg("************************ MENU STATE " + this.menuState);
               this.dbg("sendClickEventOnly " + this.sendClickEventOnly);
               if(_loc5_ == -1)
               {
                  if(!this.sendClickEventOnly)
                  {
                     this.restartInteractState();
                     this.MENU_SHIFT_DEPTH(-1,false,false);
                     this.restartInteractState();
                     this.MENU_INTERACTION(com.rockstargames.ui.game.GamePadConstants.DPADUP,true,index);
                  }
                  this.CLICK_PAUSE_MENU_ITEM(index,colID);
                  com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BACK","HUD_FRONTEND_DEFAULT_SOUNDSET");
                  return undefined;
               }
               if(_loc5_ == 1)
               {
                  if(!this.sendClickEventOnly)
                  {
                     this.restartInteractState();
                     this.MENU_SHIFT_DEPTH(1,false,false);
                     this.restartInteractState();
                     this.MENU_INTERACTION(com.rockstargames.ui.game.GamePadConstants.DPADUP,true,index);
                  }
                  this.CLICK_PAUSE_MENU_ITEM(index,colID);
                  return undefined;
               }
               if(_loc5_ != 0 && Math.abs(_loc5_) > 1)
               {
                  if(this.menuState == com.rockstargames.gtav.constants.PauseMenuLUT.MISSION_CREATOR_CATEGORY || this.menuState == com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_LIST)
                  {
                     this.dbg("column to column click over a greater span");
                     this.CLICK_PAUSE_MENU_ITEM(index,colID);
                     return undefined;
                  }
               }
               this.dbg("colID " + colID);
               if(this.inContext && colID != 99)
               {
                  this.dbg("Close submenu");
                  com.rockstargames.ui.game.GameInterface.call("FRIENDITEM_SUBMENU_CLOSE",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE);
                  this.inContext = false;
                  this.restartInteractState();
                  this.MENU_INTERACTION(com.rockstargames.ui.game.GamePadConstants.DPADUP,true,index);
                  return undefined;
               }
            }
         }
         var _loc7_ = _loc8_ && colID == _loc6_ && !this.inContext || this.inContext && colID == 99;
         if(this.canHighlightAll)
         {
            _loc7_ = !this.inContext || this.inContext && colID == 99;
         }
         this.dbg("menuLevel? : " + this.menuLevel);
         this.dbg("colID? : " + colID);
         this.dbg("colFocused? : " + _loc8_);
         this.dbg("progress? : " + _loc7_);
         if(_loc7_)
         {
            switch(action)
            {
               case -1:
                  if(!this.mRollOverOn)
                  {
                     return undefined;
                  }
                  this.MENU_ROLLOVER_HIGHLIGHT(_loc4_,false,index);
                  com.rockstargames.ui.game.GameInterface.call("HOVER_PAUSE_MENU_ITEM",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,-1,-1,-1);
                  break;
               case 0:
                  if(!this.mRollOverOn)
                  {
                     return undefined;
                  }
                  this.MENU_ROLLOVER_HIGHLIGHT(_loc4_,false,index);
                  pmb.mouseOver(true);
                  com.rockstargames.ui.game.GameInterface.call("HOVER_PAUSE_MENU_ITEM",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,pmb.index,pmb.menuID,pmb.__get__uniqueID());
                  break;
               case 1:
                  if(!this.mClickOn)
                  {
                     return undefined;
                  }
                  if(this.isTopMenu)
                  {
                     com.rockstargames.ui.game.GameInterface.call("SET_NAVIGATING_CONTENT_FOCUS",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,true);
                  }
                  if(!advance)
                  {
                     this.MENU_INTERACTION(com.rockstargames.ui.game.GamePadConstants.DPADUP,true,index,bIgnoreStateChange);
                     com.rockstargames.ui.game.GameInterface.call("SET_MOUSE_OVER_PARAMS",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,index);
                     com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET");
                  }
                  else
                  {
                     this.MENU_SHIFT_DEPTH(1,false,false);
                  }
                  break;
            }
         }
      }
   }
   function CLICK_PAUSE_MENU_ITEM(index, colID)
   {
      com.rockstargames.ui.utils.Debug.log("---->CLICK_PAUSE_MENU_ITEM <----");
      var _loc4_ = this.GET_COLUMN(colID);
      var _loc3_ = _loc4_.model.getCurrentView().itemList[index];
      com.rockstargames.ui.utils.Debug.log(" CLICK_PAUSE_MENU_ITEM ------------------------- args: " + arguments);
      com.rockstargames.ui.utils.Debug.log(" pmb -------------------------  " + _loc3_);
      if(_loc3_)
      {
         if(_loc3_.menuID != undefined && _loc3_.__get__uniqueID() != undefined)
         {
            com.rockstargames.ui.utils.Debug.log(" ------------------------- pmb.menuID: " + _loc3_.menuID);
            com.rockstargames.ui.utils.Debug.log(" ------------------------- pmb.uniqueID: " + _loc3_.__get__uniqueID());
            com.rockstargames.ui.game.GameInterface.call("CLICK_PAUSE_MENU_ITEM",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,index,_loc3_.menuID,_loc3_.__get__uniqueID());
         }
      }
   }
   function CLICK_SCROLL_COLUMN_ARROW(scrollDirEnum, colID)
   {
      com.rockstargames.ui.utils.Debug.log(" ");
      com.rockstargames.ui.utils.Debug.log(" CLICK_SCROLL_COLUMN_ARROW ------------------------- args: " + arguments);
      var _loc3_ = this.menuLevel - 1;
      com.rockstargames.ui.utils.Debug.log(" colLevel " + _loc3_ + " = colID: " + colID);
      if(_loc3_ == colID || colID == this.footerScrollOverride)
      {
         com.rockstargames.ui.game.GameInterface.call("HANDLE_SCROLL_CLICK",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,scrollDirEnum,colID);
      }
   }
   function CLEAR_ALL_HOVER()
   {
      var _loc4_ = this.currentPage.columnList.length;
      if(_loc4_ != undefined && _loc4_ > 0)
      {
         var _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            var _loc3_ = this.GET_COLUMN(_loc2_);
            this.MENU_ROLLOVER_HIGHLIGHT(_loc3_,false,-1);
            _loc2_ = _loc2_ + 1;
         }
      }
      com.rockstargames.ui.game.GameInterface.call("HOVER_PAUSE_MENU_ITEM",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,-1,-1,-1);
   }
   function BLOCK_HEADER_ADVANCE(b)
   {
      this.canHeaderAdvance = !b;
   }
   function BUILD_MENU()
   {
      this.menuList = arguments;
      this.dbg("BUILD_MENU " + arguments);
      this.headerMethod("BUILD_MENU",arguments);
   }
   function BUILD_MENU_GFX_FILES()
   {
      this.menuGFXList = arguments;
      this.dbg("BUILD_MENU_GFX_FILES " + arguments);
      this.headerMethod("BUILD_MENU_GFX_FILES",arguments);
   }
   function SET_HEADER_TITLE()
   {
      this.headerMethod("SET_HEADER_TITLE",arguments);
   }
   function SET_HEADING_DETAILS()
   {
      this.headerMethod("SET_HEADING_DETAILS",arguments);
   }
   function SET_MENU_HEADER_TEXT_BY_INDEX()
   {
      this.headerMethod("SET_MENU_HEADER_TEXT_BY_INDEX",arguments);
   }
   function SET_MENU_ITEM_COLOUR()
   {
      this.headerMethod("SET_MENU_ITEM_COLOUR",arguments);
   }
   function SET_CHAR_IMG()
   {
      this.headerMethod("SET_CHAR_IMG",arguments);
   }
   function SET_CREW_IMG()
   {
      this.headerMethod("SET_CREW_IMG",arguments);
   }
   function SET_CREW_TAG()
   {
      this.headerMethod("SET_CREW_TAG",arguments);
   }
   function SCROLL_MENU_IN_DIR()
   {
      this.headerMethod("SCROLL_MENU_IN_DIR",arguments);
   }
   function HIGHLIGHT_MENU()
   {
      this.headerMethod("HIGHLIGHT_MENU",arguments);
   }
   function LOCK_MENU_ITEM()
   {
      this.headerMethod("LOCK_MENU_ITEM",arguments);
   }
   function SET_CONTENT_SCALED(isScaled, tlx, tly, brx, bry)
   {
      this.currentPage.setScaledContent(true,tlx,tly,brx,bry);
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen)
   {
      this.currentPage.setDisplayConfig(_screenWidthPixels,_screenHeightPixels,_safeTopPercent,_safeBottomPercent,_safeLeftPercent,_safeRightPercent,_isWideScreen);
   }
   function SET_INPUT_EVENT(inputID)
   {
      if(this.__get__inTopMenu())
      {
         return undefined;
      }
      this.dbg("inputID " + inputID);
      if(this.__get__debug())
      {
         switch(inputID)
         {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
               this.dbgColVisible();
               break;
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
               this.dbgColDebug();
               break;
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
               this.dbgColLeft();
               break;
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
               this.dbgColRight();
         }
      }
      else
      {
         switch(inputID)
         {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
         }
         this.MENU_INTERACTION(inputID);
      }
   }
   function SET_COLUMN_INPUT_EVENT()
   {
      var _loc5_ = arguments[0];
      var _loc4_ = arguments[1];
      var _loc3_ = this.GET_COLUMN(_loc5_);
      this.dbg("SET_COLUMN_INPUT_EVENT columnMC: " + _loc3_ + " | inputID: " + _loc4_);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_INPUT_EVENT.apply(_loc3_,arguments.slice(1));
      }
   }
   function GET_COLUMN_SELECTION()
   {
      var _loc4_ = arguments[0];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("GET_COLUMN_SELECTION columnMC: " + _loc3_ + " | selection: " + _loc3_.model.getCurrentSelection());
      if(_loc3_ != undefined)
      {
         return _loc3_.model.getCurrentSelection();
      }
   }
   function SET_COLUMN_TITLE()
   {
      var _loc4_ = arguments[0];
      var _loc5_ = arguments[1];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("SET_COLUMN_TITLE columnMC: " + _loc3_ + " | columnTitle params: " + arguments);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_TITLE.apply(_loc3_,arguments.slice(1));
      }
   }
   function SET_DESCRIPTION()
   {
      var _loc4_ = arguments[0];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("SET_DESCRIPTION columnIndex: " + _loc4_ + " | description params: " + arguments);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_DESCRIPTION.apply(_loc3_,arguments.slice(1));
      }
   }
   function SET_COLUMN_FOCUS()
   {
      var _loc10_ = arguments[0];
      var _loc4_ = true;
      var _loc12_ = false;
      var _loc8_ = true;
      if(arguments[1] != undefined)
      {
         _loc4_ = arguments[1];
      }
      if(arguments[2] != undefined)
      {
         _loc12_ = arguments[2];
      }
      if(arguments[3] != undefined)
      {
         _loc8_ = arguments[3];
      }
      this.dbg("columnIndex " + _loc10_);
      this.dbg("highlighted " + _loc4_);
      this.dbg("moveFocus " + _loc12_);
      this.dbg("prevHightlight " + _loc8_);
      var _loc5_ = this.GET_COLUMN(_loc10_);
      if(_loc5_ != undefined)
      {
         _loc5_.SET_FOCUS.apply(_loc5_,[_loc4_]);
         if(_loc12_)
         {
            var _loc9_ = this.menuState;
            var _loc14_ = this.menuLevel;
            var _loc15_ = _loc10_ + 1;
            if(!_loc8_)
            {
               this.MENU_SET_FOCUS(false);
            }
            this.menuLevel = _loc15_;
            this.MENU_SET_FOCUS(_loc4_);
            var _loc6_ = -1;
            _loc5_ = this.GET_COLUMN(this.menuLevel - 1);
            this.MENU_CHANGE_STATE(_loc5_);
            if(_loc5_ != undefined)
            {
               var _loc3_ = this.getSelectedMenuItem(_loc5_);
               _loc6_ = _loc3_.uniqueID;
            }
            this.dbg("----------------------------------- ");
            this.dbg("oldMenuState " + _loc9_);
            this.dbg("oldMenuLevel " + _loc14_);
            this.dbg("targetLevel " + _loc15_);
            this.dbg("uniqueID " + _loc6_);
            this.dbg("----------------------------------- ");
            if(_loc6_ != undefined)
            {
               this.menuUniqueID = _loc6_;
               var _loc7_ = this.menuLevel - _loc14_;
               this.dbg("DIRECTION AFTER SET COLUMN FOCUS " + _loc7_);
               if(_loc7_ > 0)
               {
                  var _loc11_ = this.getSelectedMenuItem(this.GET_COLUMN(this.menuLevel));
                  var _loc13_ = -1;
                  if(_loc11_.menuID != undefined || _loc11_.menuID != null)
                  {
                     _loc13_ = _loc11_.menuID;
                  }
                  _loc3_ = this.getSelectedMenuItem(_loc5_);
                  if(_loc3_ != undefined)
                  {
                     com.rockstargames.ui.game.GameInterface.call("TRIGGER_PAUSE_MENU_EVENT",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,_loc3_.menuID,_loc3_.__get__uniqueID(),_loc13_);
                     this.dbg("TRIGGER_PAUSE_MENU_EVENT | currMenuItem.menuID: " + _loc3_.menuID + " | currMenuItem.uniqueID: " + _loc3_.__get__uniqueID() + " nextMenuID: " + _loc13_);
                  }
               }
               else
               {
                  com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,_loc9_,this.menuState,this.menuUniqueID,_loc7_);
                  this.dbg("---->LAYOUT_CHANGED oldMenuState: " + _loc9_ + " | menuState: " + this.menuState + " | menuUniqueID: " + this.menuUniqueID + " | dir: " + _loc7_);
               }
               com.rockstargames.ui.game.GameInterface.call("IS_NAVIGATING_CONTENT",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,true);
            }
            this.menuLevelOld = this.menuLevel;
         }
      }
   }
   function SET_COLUMN_HIGHLIGHT()
   {
      var _loc7_ = arguments[0];
      var _loc6_ = arguments[1];
      var _loc9_ = false;
      var _loc4_ = false;
      if(arguments[3] != undefined)
      {
         _loc4_ = arguments[3];
      }
      var _loc5_ = false;
      if(arguments[4] != undefined)
      {
         _loc5_ = arguments[4];
      }
      var _loc3_ = this.GET_COLUMN(_loc7_);
      this.dbg("SET_COLUMN_HIGHLIGHT " + arguments);
      this.dbg("SET_COLUMN_HIGHLIGHT columnIndex: " + _loc7_);
      this.dbg("SET_COLUMN_HIGHLIGHT highlightIndex: " + _loc6_);
      this.dbg("SET_COLUMN_HIGHLIGHT scriptSetUnqID " + _loc4_);
      this.dbg("SET_COLUMN_HIGHLIGHT scriptSetMenuState " + _loc5_);
      this.dbg("SET_COLUMN_HIGHLIGHT ____> columnMC: " + _loc3_);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_HIGHLIGHT.apply(_loc3_,[_loc6_]);
         _loc3_.SEND_COLUMN_PARAMS();
         var _loc8_ = this.getSelectedMenuItem(_loc3_);
         if(_loc4_ == true)
         {
            this.menuUniqueID = _loc8_.uniqueID;
            this.dbg("*****************");
            this.dbg("menuUniqueID set to " + this.menuUniqueID);
            this.dbg("*****************");
         }
         if(_loc5_ == true)
         {
            this.menuState = _loc8_.menuID;
            this.dbg("*****************");
            this.dbg("menuState set to " + this.menuUniqueID);
            this.dbg("*****************");
         }
      }
   }
   function INIT_COLUMN_SCROLL()
   {
      var _loc4_ = arguments[0];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("INIT_COLUMN_SCROLL ____> arguments: " + arguments);
      if(_loc3_ != undefined)
      {
         _loc3_.INIT_SCROLL_BAR.apply(_loc3_,arguments.slice(1));
      }
   }
   function SET_COLUMN_SCROLL()
   {
      var _loc4_ = arguments[0];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("SET_COLUMN_SCROLL ____> arguments: " + arguments);
      this.dbg("SET_COLUMN_SCROLL ____> columnMC: " + _loc3_);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_SCROLL_BAR.apply(_loc3_,arguments.slice(1));
      }
   }
   function SET_COLUMN_CAN_JUMP()
   {
      var _loc5_ = arguments[0];
      var _loc4_ = arguments[1];
      var _loc3_ = this.GET_COLUMN(_loc5_);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_COLUMN_CAN_JUMP.apply(_loc3_,[_loc4_]);
      }
   }
   function ALLOW_CLICK_FROM_COLUMN()
   {
      var _loc5_ = arguments[0];
      var _loc3_ = arguments[1];
      this.dbg("---->ALLOW_CLICK_FROM_COLUMN <---- " + arguments);
      if(_loc3_ != undefined)
      {
         if(_loc3_)
         {
            this.sendClickEventOnly = true;
         }
         else
         {
            this.sendClickEventOnly = false;
         }
      }
      var _loc4_ = this.GET_COLUMN(_loc5_);
      if(_loc4_ != undefined)
      {
         _loc4_.canMouseNav = _loc3_;
      }
   }
   function SET_DATA_SLOT()
   {
      var _loc4_ = arguments[0];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("SET_DATA_SLOT " + arguments);
      this.dbg("SET_DATA_SLOT ____> columnMC: " + _loc3_);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_DATA_SLOT.apply(_loc3_,arguments.slice(1));
      }
   }
   function UPDATE_SLOT()
   {
      var _loc4_ = arguments[0];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("UPDATE_SLOT" + arguments);
      this.dbg("UPDATE_SLOT columnMC: " + _loc3_);
      if(_loc3_ != undefined)
      {
         _loc3_.UPDATE_SLOT.apply(_loc3_,arguments.slice(1));
      }
   }
   function ADD_SLOT()
   {
      var _loc4_ = arguments[0];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("ADD_SLOT" + arguments);
      this.dbg("ADD_SLOT columnMC: " + _loc3_);
      if(_loc3_ != undefined)
      {
         _loc3_.ADD_SLOT.apply(_loc3_,arguments.slice(1));
      }
   }
   function DISPLAY_DATA_SLOT()
   {
      var _loc4_ = arguments[0];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("DISPLAY_DATA_SLOT : " + arguments);
      this.dbg("DISPLAY_DATA_SLOT columnMC: " + _loc3_);
      if(_loc3_ != undefined)
      {
         _loc3_.DISPLAY_VIEW.apply(_loc3_,[0]);
      }
      if(!this.isReadyToRender)
      {
         com.rockstargames.ui.game.GameInterface.call("PAUSE_MENU_READY_TO_RENDER",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE);
         this.isReadyToRender = true;
      }
   }
   function SET_DATA_SLOT_EMPTY()
   {
      var _loc4_ = arguments[0];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("SET_DATA_SLOT_EMPTY " + arguments);
      this.dbg("SET_DATA_SLOT_EMPTY _____> columnMC: " + _loc3_);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_DATA_SLOT_EMPTY.apply(_loc3_,[0]);
      }
   }
   function SHOW_COLUMN()
   {
      var _loc4_ = arguments[0];
      var _loc3_ = this.GET_COLUMN(_loc4_);
      this.dbg("SHOW_COLUMN " + arguments);
      this.dbg("SHOW_COLUMN _____> columnMC: " + _loc3_);
      if(_loc3_ != undefined)
      {
         _loc3_.SHOW_COLUMN.apply(_loc3_,arguments.slice(1));
      }
   }
   function SHOW_AND_CLEAR_COLUMNS()
   {
      var _loc6_ = arguments.length;
      if(_loc6_ % 2 != 0)
      {
         this.dbg("AN IMPROPER NUMBER OF ARGUMENTS WAS PASSED INTO SHOW_AND_CLEAR_COLUMNS");
         return undefined;
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         var _loc4_ = arguments[_loc3_];
         var _loc5_ = arguments[_loc3_ + 1];
         this.SET_DATA_SLOT_EMPTY(_loc4_);
         this.SHOW_COLUMN(_loc4_,_loc5_);
         _loc3_ = _loc3_ + 2;
      }
   }
   function KILL_PAGE()
   {
      this.dbg("KILL_PAGE " + this.currentPage);
      this.dbg("pageLoaderObject._mc " + this.pageLoaderObject._mc);
      this.SHOW_WARNING_MESSAGE(false);
      if(this.errorImgMC.isLoaded)
      {
         this.errorImgMC.removeTxdRef();
      }
      this.SHOW_CONTEXT_MENU(false);
      if(this.pageLoaderObject._mc != undefined)
      {
         this.currentPage.onPageExit();
         this.pageLoaderObject._mc.removeMovieClip();
      }
      this.pageLoaderObject = null;
      this.currentPage = null;
   }
   function SHOW_CONTEXT_MENU(bool)
   {
      this.dbg("SHOW_CONTEXT_MENU " + bool);
      if(this.context != undefined)
      {
         this.context.removeMovieClip();
      }
      if(bool)
      {
         var _loc3_ = arguments[1];
         this.context = (com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)this.contextMenu.attachMovie("verticalMenuList","verticalMenuListMC",this.contextMenu.getNextHighestDepth());
         this.context.INITIALISE();
         this.context.__set__columnID(99);
         this.context.SEND_COLUMN_PARAMS();
         this.context.canMouseNav = true;
         this.context.canWheelScroll = true;
         this.context._x = (this.columnWidth + 2) * _loc3_;
         this.inContext = true;
      }
      else
      {
         this.inContext = false;
      }
   }
   function SET_CONTEXT_SLOT()
   {
      if(this.context != undefined)
      {
         this.context.SET_DATA_SLOT.apply(this.context,arguments.slice(1));
      }
   }
   function SET_CONTEXT_EMPTY()
   {
      if(this.context != undefined)
      {
         this.context.SET_DATA_SLOT_EMPTY.apply(this.context,[0]);
      }
   }
   function DISPLAY_CONTEXT_SLOT()
   {
      if(this.context != undefined)
      {
         this.context.DISPLAY_VIEW.apply(this.context,[0]);
      }
      this.context.SET_FOCUS(true);
   }
   function SHOW_WARNING_MESSAGE(bShow, columnIndex, numCols, bodyStr, titleStr, bgHeight, txd, txn, imgAlignment, footerStr, bRequestTXD)
   {
      var _loc29_ = 0;
      var _loc16_ = 1;
      var _loc19_ = 2;
      var _loc11_ = 3;
      this.bFullMenuWarningScreen = false;
      if(this.errorMsg == undefined)
      {
         this.errorMsg = this.CONTENT.attachMovie("errorMessage","errorMessageMC",this.CONTENT.getNextHighestDepth(),{_visible:false});
         this.errorMsg.titleTF.textAutoSize = "shrink";
         this.errorMsg.footerTF.textAutoSize = "shrink";
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.errorMsg.tileBGMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.errorMsg.titleBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.errorMsg.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      if(bShow && arguments[1] != undefined)
      {
         this.errorMsg._x = (this.columnWidth + 2) * columnIndex;
         if(numCols == undefined || numCols <= 0)
         {
            numCols = 1;
         }
         var _loc25_ = this.columnWidth * numCols + 2 * (numCols - 1);
         this.errorMsg.tileBGMC.bgMC._width = this.errorMsg.titleBGMC._width = _loc25_;
         if(bgHeight > 10)
         {
            this.errorMsg.tileBGMC.bgMC._height = bgHeight;
         }
         else
         {
            this.errorMsg.tileBGMC.bgMC._height = 430;
         }
         this.errorMsg.titleBGMC._visible = false;
         var _loc17_ = 85;
         var _loc13_ = 111;
         var _loc5_ = undefined;
         var _loc6_ = undefined;
         var _loc7_ = this.errorMsg.titleTF.getTextFormat();
         if(numCols == 1)
         {
            _loc5_ = 12;
            _loc6_ = 240;
            _loc7_.size = 35;
         }
         else
         {
            _loc5_ = 21;
            _loc6_ = 530;
            _loc7_.size = 55;
            if(numCols == 3)
            {
               this.bFullMenuWarningScreen = true;
               this.setIsNavigatingContent(false);
               this.FOCUS_CONTENT(true);
            }
         }
         if(imgAlignment == _loc16_)
         {
            _loc17_ = 156;
            _loc13_ = 165;
            _loc5_ = 7;
            _loc6_ = 570;
            _loc7_.size = 15;
            this.errorMsg.titleTF.multiline = true;
            this.errorMsg.titleTF.wordWrap = true;
            this.errorMsg.titleTF.textAutoSize = "none";
            this.errorMsg.titleTF.verticalAlign = "center";
         }
         else if(imgAlignment == _loc11_)
         {
            _loc13_ = 70;
            _loc5_ = 20;
            _loc6_ = 270;
            _loc7_.size = 36;
            this.errorMsg.titleTF.multiline = false;
            this.errorMsg.titleTF.wordWrap = false;
            this.errorMsg.titleTF.textAutoSize = "shrink";
            this.errorMsg.titleTF.verticalAlign = "center";
         }
         else
         {
            this.errorMsg.titleTF.multiline = false;
            this.errorMsg.titleTF.wordWrap = false;
            this.errorMsg.titleTF.textAutoSize = "shrink";
         }
         this.errorMsg.titleTF.setNewTextFormat(_loc7_);
         this.errorMsg.titleTF.text = arguments[4] != undefined?arguments[4]:"";
         this.errorMsg.titleTF._width = _loc6_;
         this.errorMsg.titleTF._x = _loc5_;
         this.errorMsg.titleTF._y = _loc17_ - this.errorMsg.titleTF.textHeight - (this.errorMsg.titleTF._height - this.errorMsg.titleTF.textHeight) * 0.5;
         if(imgAlignment == _loc11_)
         {
            this.errorMsg.titleTF._x = 20;
            this.errorMsg.titleTF._y = 0;
            this.errorMsg.titleTF._width = 538;
            this.errorMsg.titleTF._height = 70;
         }
         if(txd != undefined && txn != undefined && txd != "" && txn != "")
         {
            if(!this.errorImgMC)
            {
               this.errorImgMC = (com.rockstargames.ui.media.ImageLoaderMC)this.errorMsg.imgContainerMC.attachMovie("errorImgMC","errorImgMC",this.errorMsg.imgContainerMC.getNextHighestDepth());
            }
            var _loc9_ = undefined;
            var _loc10_ = undefined;
            if(imgAlignment == _loc16_)
            {
               _loc9_ = 578;
               _loc10_ = 160;
               this.errorImgMC._x = 0;
               this.errorImgMC._y = 0;
               this.errorMsg.titleBGMC._visible = true;
               this.errorMsg.titleBGMC._height = this.errorMsg.titleTF.textHeight + 8;
               this.errorMsg.titleBGMC._y = 160 - this.errorMsg.titleBGMC._height;
               var _loc20_ = this.errorMsg.titleBGMC._alpha;
               this.errorMsg.titleBGMC._alpha = 0;
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.errorMsg.titleBGMC,com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION,{_alpha:_loc20_});
            }
            else if(imgAlignment == _loc19_)
            {
               _loc9_ = 288;
               _loc10_ = 430;
               this.errorImgMC._x = this.errorMsg.tileBGMC.bgMC._width - _loc9_;
               this.errorImgMC._y = 0;
            }
            else if(imgAlignment == _loc11_)
            {
               _loc9_ = 280;
               _loc10_ = 360;
               this.errorImgMC._x = 298;
               this.errorImgMC._y = 70;
            }
            var _loc23_ = false;
            if(this.errorImgMC.textureDict == txd && this.errorImgMC.textureFilename == txn)
            {
               _loc23_ = true;
            }
            else if(this.errorImgMC.isLoaded)
            {
               this.errorImgMC.removeTxdRef();
            }
            this.errorImgMC.init("pause_menu_sp_content",txd,txn,_loc9_,_loc10_);
            if(bRequestTXD)
            {
               this.errorImgMC.requestTxdRef("errorImgMC",true,this.onWarningImgLoaded,this);
            }
            else
            {
               this.errorImgMC.addTxdRef("errorImgMC",this.onWarningImgLoaded,this);
            }
         }
         else
         {
            if(this.errorImgMC.isLoaded)
            {
               this.errorImgMC.removeTxdRef();
            }
            this.removeErrorImgMC();
         }
         this.errorMsg.bodyTF._x = _loc5_;
         this.errorMsg.bodyTF._y = _loc13_;
         this.errorMsg.bodyTF._width = _loc6_;
         if(this.blipLayer)
         {
            this.blipLayer.removeMovieClip();
         }
         this.blipLayer = this.errorMsg.createEmptyMovieClip("blipLayer",1000);
         var _loc28_ = new com.rockstargames.ui.utils.Text();
         _loc28_.setTextWithIcons("~HUD_COLOUR_WHITE~" + arguments[3],this.blipLayer,this.errorMsg.bodyTF,0,com.rockstargames.ui.utils.UIText.SIZE,4,false);
         var _loc12_ = this.errorMsg.bodyTF.getTextFormat();
         _loc12_.font = com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_FONT;
         _loc12_.size = com.rockstargames.ui.utils.UIText.SIZE;
         this.errorMsg.bodyTF.setTextFormat(_loc12_);
         this.errorMsg.footerTF._x = _loc5_;
         this.errorMsg.footerTF._width = _loc6_;
         this.errorMsg.footerTF.text = !footerStr?"":footerStr;
         var _loc3_ = 0;
         while(_loc3_ < 3)
         {
            this.errorMsg.tileBGMC["col" + _loc3_ + "MC"]._visible = _loc3_ < numCols;
            _loc3_ = _loc3_ + 1;
         }
      }
      else if(!bShow)
      {
         var _loc21_ = this.errorMsg._visible;
         var _loc14_ = this.errorMsg.tileBGMC;
         var _loc27_ = _loc14_.col0MC._visible;
         var _loc26_ = _loc14_.col1MC._visible;
         var _loc24_ = _loc14_.col2MC._visible;
         if(_loc21_ && _loc27_ && _loc26_ && _loc24_ && this.menuceptionDepth == 0)
         {
            this.FOCUS_CONTENT(false);
         }
      }
      this.errorMsg._visible = bShow;
   }
   function removeErrorImgMC()
   {
      this.errorImgMC.removeMovieClip();
      this.errorImgMC = null;
   }
   function setIsNavigatingContent(bIsNavigatingContent)
   {
      super.setIsNavigatingContent(bIsNavigatingContent && !this.bFullMenuWarningScreen);
      if(!bIsNavigatingContent)
      {
         this.CLEAR_ALL_HOVER();
      }
   }
   function SET_SC_LOGGED(logged)
   {
      this.dbg("SET_SC_LOGGED | logged: " + logged);
      this.isLoggedSC = logged;
   }
   function SET_CONTROL_LABELS()
   {
      var _loc3_ = this.GET_COLUMN(1);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_CONTROL_LABELS.apply(_loc3_,arguments);
      }
   }
   function SET_CONTROL_IMAGE()
   {
      var _loc3_ = this.GET_COLUMN(1);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_CONTROL_IMAGE.apply(_loc3_,arguments);
      }
   }
   function SET_VIDEO_MEMORY_BAR()
   {
      var _loc3_ = this.GET_COLUMN(1);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_VIDEO_MEMORY_BAR.apply(_loc3_,arguments);
      }
   }
   function SET_DISPLAY_MICS()
   {
      var _loc3_ = this.GET_COLUMN(1);
      if(_loc3_ != undefined)
      {
         _loc3_.DISPLAY_MIC.apply(_loc3_,arguments);
      }
   }
   function SET_PLAYERLIST_ICON()
   {
      var _loc3_ = this.GET_COLUMN(1);
      if(_loc3_ != undefined)
      {
         _loc3_.SET_ICON.apply(_loc3_,arguments);
      }
   }
   function MENU_STATE(id)
   {
      var _loc3_ = this.menuState;
      this.dbg("--- DYNAMIC EXTERNAL LOAD FROM XML --- menuLevel: " + this.menuLevel);
      this.storedMenuState = id;
      var _loc4_ = true;
      if(this.menuLevel == 0)
      {
         var _loc2_ = this.GET_PAGE(this.storedMenuState);
         if(_loc2_ != "")
         {
            this.LOAD_PAGE(_loc2_);
         }
         else
         {
            this.menuState = this.menuList[this.menuIndex];
            this.MENU_STATE_LOAD(_loc3_);
         }
         _loc4_ = false;
      }
      if(_loc4_)
      {
         this.currentPage.stateChanged(this.storedMenuState);
         this.MENU_STATE_LOAD(_loc3_);
      }
   }
   function LOAD_CHILD_PAGE(gfxFilePath, _menustate, inceptDir)
   {
      this.dbg("LOAD_CHILD_PAGE: " + arguments);
      this.KILL_PAGE();
      this.menuLevel = 0;
      if(inceptDir > 0)
      {
         this.menuceptionDepth = this.menuceptionDepth + inceptDir;
      }
      this.storedMenuState = _menustate;
      this.LOAD_PAGE(gfxFilePath);
   }
   function LOADED_PAGE()
   {
      super.LOADED_PAGE();
      this.PAGE_FADE_IN();
   }
   function PAGE_FADE_IN()
   {
      this.errorMsg._alpha = this.content._alpha = this.context._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.errorMsg,0.3,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.content,0.3,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.context,0.3,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
   }
   function MENU_SECTION_JUMP(mindex, loadContent, scriptLayoutChange)
   {
      if(this.isExitBlocked)
      {
         return undefined;
      }
      if(loadContent == undefined)
      {
         loadContent = true;
      }
      this.dbg("MENU SECTION JUMP mindex: " + mindex + " : " + loadContent + " " + scriptLayoutChange);
      this.menuLevel = 0;
      this.menuceptionDepth = 0;
      this.menuIndex = mindex;
      if(this.menuIndex < 0)
      {
         this.menuIndex = 0;
      }
      if(this.menuIndex > this.menuList.length - 1)
      {
         this.menuIndex = this.menuList.length - 1;
      }
      this.headerMethod("HIGHLIGHT_MENU",[this.menuIndex]);
      var _loc2_ = this.menuList[this.menuIndex];
      var _loc3_ = this.menuState;
      this.dbg("** CHANGE ** menuList: " + this.menuList);
      this.dbg("** CHANGE ** menustateID: " + _loc2_);
      if(loadContent)
      {
         this.KILL_PAGE();
         this.menuLevel = 0;
         this.dbg("** SET menuLevel ** " + this.menuLevel);
         this.MENU_STATE(_loc2_);
      }
      if(scriptLayoutChange == undefined)
      {
         scriptLayoutChange = false;
      }
      if(scriptLayoutChange)
      {
         this.menuState = _loc2_;
         com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED_FOR_SCRIPT_ONLY",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,_loc3_,this.menuState,-1,0);
         this.dbg("LAYOUT_CHANGED_FOR_SCRIPT_ONLY mindex: " + _loc3_ + " : " + this.menuState + " " + " -1 " + " 0 ");
      }
   }
   function FRONTEND_CONTEXT_PRESS()
   {
      var _loc3_ = this.menuState;
      if(arguments.length > 0)
      {
         _loc3_ = arguments[0];
      }
      switch(_loc3_)
      {
         case com.rockstargames.gtav.constants.PauseMenuLUT.MAP_LEGEND:
            var _loc4_ = this.GET_COLUMN(0);
            _loc4_.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.FRONTEND_CONTEXT_BUTTON);
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_LIST:
            this.menuLevel = 1;
            this.MENU_STATE(com.rockstargames.gtav.constants.PauseMenuLUT.CREW);
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_OPTIONS:
            this.menuLevel = 2;
            this.menuUniqueID = -1000;
            this.MENU_STATE(com.rockstargames.gtav.constants.PauseMenuLUT.CREWS);
      }
   }
   function MENU_KEY_PRESS_ACTIONS(dir)
   {
      this.dbg("---->MENU_KEY_PRESS_ACTIONS <----- menu state : " + this.menuState);
      var _loc4_ = true;
      if(!this.canHeaderAdvance)
      {
         this.TRIGGER_PAUSE_MENU_EVENT();
         return false;
      }
      var _loc3_ = !this.inContext?this.GET_COLUMN(this.menuLevel - 1):this.context;
      var _loc2_ = this.getSelectedMenuItem(_loc3_);
      if(this.menuLevel > 0 && dir > 0)
      {
         if(_loc2_.checkSelectable() == false)
         {
            return false;
         }
      }
      this.dbg("COLUMN canJump? " + _loc3_.canJump);
      this.dbg("currMenuItem.isSelectable ? " + _loc2_.isSelectable);
      this.dbg("checkSelectable " + _loc2_.checkSelectable());
      if(_loc3_.canJump == false)
      {
         if(dir > 0)
         {
            this.TRIGGER_PAUSE_MENU_EVENT();
         }
         return false;
      }
      if(!this.isLoggedSC && this.menuState == com.rockstargames.gtav.constants.PauseMenuLUT.SOCIALCLUB)
      {
         this.KILL_PAGE();
         com.rockstargames.ui.game.GameInterface.call("ENTER_SC_MENU",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE);
         return false;
      }
      if(this.inContext)
      {
         if(dir > 0 && _loc2_.isSelectable != false)
         {
            this.TRIGGER_PAUSE_MENU_EVENT();
         }
         return false;
      }
      var _loc5_ = com.rockstargames.gtav.constants.PauseMenuLookup.lookUp(this.menuState).menuAdvance;
      this.dbg("LIST ADVANCE: " + _loc5_);
      if(_loc5_ == false && dir > 0)
      {
         _loc4_ = false;
         this.TRIGGER_PAUSE_MENU_EVENT();
      }
      return _loc4_;
   }
   function MENU_STATE_LOAD(oldMenuState)
   {
      this.dbg("------->MENU_STATE_LOAD with, menuState: " + this.menuState + " oldMenuState: " + oldMenuState);
      if(this.localdebug)
      {
         this.localLoad();
      }
      else
      {
         var _loc3_ = 1;
         this.dbg("******** CALL -- LAYOUT_CHANGED with oldMenuState: " + oldMenuState + " menuState: " + this.menuState + " menuUniqueID: " + this.menuUniqueID + " dir");
         if(this.menuUniqueID == undefined)
         {
            this.menuUniqueID = -1;
            this.dbg("********  menuUniqueID was undefined so chnaged to " + this.menuUniqueID);
         }
         com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,oldMenuState,this.menuState,this.menuUniqueID,_loc3_);
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      this.dbg("TXD_HAS_LOADED textureDict: " + textureDict + " success: " + success + " uniqueID: " + uniqueID);
      if(success)
      {
         if(uniqueID == "errorImgMC")
         {
            if(this.errorImgMC)
            {
               this.errorImgMC.displayTxdResponse(textureDict);
            }
         }
         else
         {
            var pMC = this.pageLoaderObject._mc;
            var il = (com.rockstargames.ui.media.ImageLoaderMC)eval(pMC + ".pageMC." + uniqueID);
            this.dbg("******************COMPARE******************");
            this.dbg("pageLoaderObject._mc:: pMC\t\t" + pMC);
            this.dbg("pageLoaderObject._mc:: il\t" + il);
            this.dbg("pageLoaderObject._mc:: fucntion\t\t" + il.displayTxdResponse);
            this.dbg("***********************************************");
            if(il != undefined)
            {
               il.displayTxdResponse(textureDict,success);
            }
         }
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      this.dbg("TXD_ALREADY_LOADED textureDict: " + textureDict + " uniqueID: " + uniqueID);
      if(uniqueID == "errorImgMC")
      {
         if(this.errorImgMC)
         {
            this.errorImgMC.displayTxdResponse(textureDict);
         }
      }
      else
      {
         var pMC = this.pageLoaderObject._mc;
         var il = (com.rockstargames.ui.media.ImageLoaderMC)eval(pMC + ".pageMC." + uniqueID);
         this.dbg("******************COMPARE******************");
         this.dbg("pageLoaderObject._mc:: pMC\t\t" + pMC);
         this.dbg("pageLoaderObject._mc:: il\t" + il);
         this.dbg("pageLoaderObject._mc:: fucntion\t\t" + il.displayTxdResponse);
         this.dbg("***********************************************");
         if(il != undefined)
         {
            il.displayTxdResponse(textureDict,true);
         }
      }
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      this.dbg("ADD_TXD_REF_RESPONSE textureDict: " + textureDict + " uniqueID: " + uniqueID + " success: " + success);
      if(success)
      {
         if(uniqueID == "errorImgMC")
         {
            if(this.errorImgMC)
            {
               this.errorImgMC.displayTxdResponse(textureDict);
            }
         }
         else
         {
            var pMC = this.pageLoaderObject._mc;
            var il = (com.rockstargames.ui.media.ImageLoaderMC)eval(pMC + ".pageMC." + uniqueID);
            this.dbg("******************COMPARE******************");
            this.dbg("pageLoaderObject._mc:: pMC\t\t" + pMC);
            this.dbg("pageLoaderObject._mc:: il\t" + il);
            this.dbg("pageLoaderObject._mc:: function\t\t" + il.displayTxdResponse);
            this.dbg("***********************************************");
            if(il)
            {
               il.displayTxdResponse(textureDict);
            }
         }
      }
   }
   function onWarningImgLoaded()
   {
      this.errorImgMC._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.errorImgMC,com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION,{_alpha:100});
   }
}
