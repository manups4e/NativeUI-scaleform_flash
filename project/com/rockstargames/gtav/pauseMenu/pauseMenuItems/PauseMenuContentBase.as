class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuContentBase extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var inContext = false;
   var isReadyToRender = false;
   var columnList = new Array();
   var menuUniqueID = -1;
   var menuState = 0;
   var storedMenuState = 0;
   var menuIndex = 0;
   var menuList = new Array();
   var menuGFXList = new Array();
   var menuLevel = 0;
   var menuLevelOld = 0;
   var menuceptionDepth = 0;
   var interact_idle = 0;
   var interact_active = 1;
   var lastActionTaken = -1000;
   var pageLoaderObject = new Object();
   var localdebug = false;
   var isTopMenu = true;
   var isDimmable = true;
   var isExitBlocked = false;
   var dbgID = "";
   var dbgOn = true;
   function PauseMenuContentBase()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.content = this.CONTENT.createEmptyMovieClip("contentMC",this.CONTENT.getNextHighestDepth());
      this.contextMenu = this.CONTENT.createEmptyMovieClip("contextMC",this.CONTENT.getNextHighestDepth());
      this.columnList = [];
      this.__set__debug(this.localdebug);
   }
   function dbg(dbgStr)
   {
      if(this.dbgOn)
      {
         var _loc2_ = "  " + dbgStr;
         com.rockstargames.ui.utils.Debug.log(_loc2_);
         if(this.localdebug)
         {
            trace(_loc2_);
         }
      }
   }
   function __set__debug(d)
   {
      return this.__get__debug();
   }
   function getKeys()
   {
      if(Key.isDown(50))
      {
         this.MENU_SECTION_JUMP(1);
      }
      else if(Key.isDown(49))
      {
         this.MENU_SECTION_JUMP(-1);
      }
      else if(Key.isDown(38))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
      }
      else if(Key.isDown(40))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
      }
      else if(Key.isDown(37))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADLEFT);
      }
      else if(Key.isDown(39))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADRIGHT);
      }
      else if(Key.isDown(32))
      {
         this.MENU_SHIFT_DEPTH(1);
      }
      else if(Key.isDown(16))
      {
         this.MENU_SHIFT_DEPTH(-1);
      }
      else if(!Key.isDown(88))
      {
         if(!Key.isDown(90))
         {
         }
      }
   }
   function setDebug(params)
   {
      this.__set__debug(params[0]);
   }
   function SET_INPUT_EVENT(inputID)
   {
   }
   function MENU_SECTION_JUMP(dir)
   {
   }
   function MENU_SECTION_MOVE(dir)
   {
      this.menuIndex = this.menuIndex + dir;
      this.dbg("** CONTENT ** MENU_SECTION_MOVE | dir: " + dir + " menuIndex: " + this.menuIndex);
      if(this.menuIndex < 0)
      {
         this.menuIndex = this.menuIndex + this.menuList.length;
      }
      if(this.menuIndex > this.menuList.length - 1)
      {
         this.menuIndex = this.menuIndex - this.menuList.length;
      }
      this.headerMethod("HIGHLIGHT_MENU",[this.menuIndex]);
      this.KILL_PAGE();
      var _loc2_ = this.menuList[this.menuIndex];
      this.dbg("** CHANGE ** menuList: " + this.menuList);
      this.dbg("** CHANGE ** menustateID: " + _loc2_);
      this.menuLevel = 0;
      this.dbg("** SET menuLevel ** " + this.menuLevel);
      this.MENU_STATE(_loc2_);
   }
   function __get__inTopMenu()
   {
      this.menuLevel != 0?this.isTopMenu = false:this.isTopMenu = true;
      this.dbg("isTopMenu " + this.isTopMenu + " menuLevel: " + this.menuLevel);
      return this.isTopMenu;
   }
   function BEGIN_EXIT_PAUSE_MENU()
   {
      this.dbg("DELETE mListener: " + this.mListener);
      if(this.mListener)
      {
         Mouse.removeListener(this.mListener);
         this.mListener = null;
         this.dbg(" mListener SET TO NULL " + this.mListener);
      }
      this.CLEAN_UP_PAUSE_MENU("EXIT_PAUSE_MENU");
   }
   function BEGIN_RESTART_PAUSE_MENU()
   {
      this.isReadyToRender = false;
      this.dbg("################ BEGIN_RESTART_PAUSE_MENU ################");
      this.dbg("menuUniqueID " + this.menuUniqueID);
      this.dbg("menuState " + this.menuState);
      this.menuUniqueID = -1;
      this.menuState = 0;
      this.isExitBlocked = false;
      this.CLEAN_UP_PAUSE_MENU("RESTART_PAUSE_MENU");
   }
   function CLEAN_UP_PAUSE_MENU(codeAction)
   {
      this.dbg("----> clean up dangling header refs <---- ");
      this.headerMethod("REMOVE_MENU",[codeAction != "RESTART_PAUSE_MENU"?false:true]);
      this.dbg("----> clean up dangling refs <---- ");
      this.KILL_PAGE();
      this.dbg("----> " + codeAction + " <---- ");
      com.rockstargames.ui.game.GameInterface.call(codeAction,com.rockstargames.ui.game.GameInterface.PAUSE_TYPE);
   }
   function SET_DIMMABLE(d)
   {
      this.isDimmable = d;
   }
   function FOCUS_CONTENT(f)
   {
      com.rockstargames.ui.utils.Debug.log("===FOCUS_CONTENT " + f);
      if(this.isDimmable)
      {
         var _loc5_ = 1;
         var _loc7_ = 1;
         if(!f)
         {
            var _loc6_ = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_DESELECT,_loc6_);
            _loc5_ = _loc6_.r / 100;
            _loc7_ = Math.round(_loc6_.a) / 100;
         }
         var _loc8_ = new flash.geom.Transform(this.CONTENT);
         var _loc9_ = new flash.geom.ColorTransform(_loc5_,_loc5_,_loc5_,_loc7_,0,0,0,0);
         _loc8_.colorTransform = _loc9_;
         var _loc3_ = this.currentPage.columnList.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            (com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)this.currentPage.columnList[_loc2_].ON_FOCUS_PAGE_CONTENT(f);
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function restartInteractState()
   {
      var _loc2_ = this.CONTENT.frameDelayMC;
      _loc2_.gotoAndStop(1);
   }
   function startInteraction(action)
   {
      var _loc2_ = this.CONTENT.frameDelayMC;
      this.dbg("\tstart Throttling interactivity  ");
      if(this.menuInteractState(action) == this.interact_idle)
      {
         this.dbg("START THROTTLING with frame MC: " + _loc2_);
         _loc2_.gotoAndPlay(2);
         this.lastActionTaken = action;
      }
      else
      {
         this.dbg("DON\'T THROTTLE, Ready for Interactivity ");
      }
   }
   function menuInteractState(action)
   {
      var _loc3_ = this.CONTENT.frameDelayMC;
      var _loc2_ = 0;
      this.dbg("\ttest for Throttling interactivity  ");
      this.dbg("\t=========== fMC._currentframe: " + _loc3_._currentframe + " action: " + action + ", last Action: " + this.lastActionTaken);
      if(action == this.lastActionTaken || _loc3_._currentframe <= 1)
      {
         _loc2_ = this.interact_idle;
         this.dbg("\t\t\tI\'m Interacting  ");
      }
      else
      {
         _loc2_ = this.interact_active;
         this.dbg("\t\t\tI\'m NOT Interacting!  ");
      }
      return _loc2_;
   }
   function MENU_SHIFT_DEPTH(dir, DontFallOff, SkipChecks)
   {
      com.rockstargames.ui.game.GameInterface.call("MENU_SHIFT_DEPTH_PROCESSED",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE);
      if(this.menuInteractState(dir) == this.interact_idle || SkipChecks)
      {
         if(dir < 0 && (this.menuLevel == 0 || this.menuLevel == 1 && this.menuceptionDepth > 0))
         {
            if(this.menuceptionDepth > 0)
            {
               com.rockstargames.ui.game.GameInterface.call("MENUCEPTION_KICK",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE);
               this.menuceptionDepth = this.menuceptionDepth - 1;
               return undefined;
            }
            if(!DontFallOff)
            {
               this.isExitBlocked = true;
               this.BEGIN_EXIT_PAUSE_MENU();
            }
            return undefined;
         }
         var _loc14_ = this.MENU_KEY_PRESS_ACTIONS(dir);
         if(_loc14_)
         {
            var _loc12_ = this.menuState;
            this.dbg("MENU_SHIFT_DEPTH | direction=(1/-1): " + dir);
            if(dir > 0 && !SkipChecks)
            {
               this.TRIGGER_PAUSE_MENU_EVENT();
            }
            var _loc7_ = this.menuLevel + dir;
            var _loc11_ = this.currentPage.getMaxColumns();
            if(_loc7_ < 0)
            {
               _loc7_ = 0;
            }
            if(_loc7_ > _loc11_)
            {
               _loc7_ = _loc11_;
            }
            this.dbg("MENU_SHIFT_DEPTH | targetLevel: " + _loc7_);
            var _loc18_ = undefined;
            var _loc9_ = undefined;
            var _loc16_ = this.menuState != com.rockstargames.gtav.constants.PauseMenuLUT.MAP && (SkipChecks == undefined || SkipChecks == false);
            if(dir < 0)
            {
               this.dbg("MENU_SHIFT_DEPTH | focus going back");
               this.MENU_SET_FOCUS(false);
               _loc18_ = this.GET_COLUMN(this.menuLevel - 1);
            }
            else if(_loc16_)
            {
               _loc9_ = this.GET_COLUMN(_loc7_ - 1);
               if(_loc9_ == undefined)
               {
                  this.dbg("No column there! Bailing!");
                  return undefined;
               }
               if(!_loc9_._visible)
               {
                  this.dbg("Column isn\'t visible; assuming there\'s a warning up or something!");
                  return undefined;
               }
               var _loc6_ = _loc9_.model.getCurrentView().itemList;
               if(_loc6_ == undefined)
               {
                  this.dbg("Couldn\'t get a model/view/itemlist out of it, so bailing!");
                  return undefined;
               }
               var _loc5_ = _loc6_.length;
               if(_loc5_ == undefined || _loc5_ <= 0)
               {
                  this.dbg("No viewlist/length/insufficient items (" + _loc5_ + "), bailing!");
                  return undefined;
               }
               var _loc8_ = false;
               var _loc2_ = 0;
               while(_loc2_ < _loc5_)
               {
                  var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem)_loc6_[_loc2_];
                  if(_loc3_ != undefined && _loc3_.isSelectable >= 1)
                  {
                     _loc8_ = true;
                     break;
                  }
                  _loc2_ = _loc2_ + 1;
               }
               if(!_loc8_)
               {
                  this.dbg("No selectable items! Bailing!");
                  return undefined;
               }
               this.dbg("Passed sufficient-stuff-having checks!");
            }
            this.menuLevel = _loc7_;
            this.dbg("MENU_SHIFT_DEPTH | focus going forwards " + this.menuLevel);
            this.MENU_SET_FOCUS(true);
            var _loc10_ = -1;
            if(this.menuLevel == 0)
            {
               var _loc15_ = this.menuList[this.menuIndex];
               this.menuState = _loc15_;
               this.setIsNavigatingContent(false);
               this.FOCUS_CONTENT(false);
            }
            else
            {
               this.MENU_CHANGE_STATE(_loc9_);
               this.setIsNavigatingContent(true);
               this.FOCUS_CONTENT(true);
            }
            if(_loc9_ != undefined)
            {
               var _loc17_ = this.getSelectedMenuItem(_loc9_);
               _loc10_ = _loc17_.uniqueID;
            }
            if(_loc10_ != undefined)
            {
               this.menuUniqueID = _loc10_;
               if(dir < 0)
               {
                  com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,_loc12_,this.menuState,this.menuUniqueID,dir);
                  this.dbg("---->LAYOUT_CHANGED oldMenuState: " + _loc12_ + " | menuState: " + this.menuState + " | menuUniqueID: " + this.menuUniqueID + " | dir: " + dir);
               }
            }
            this.menuLevelOld = this.menuLevel;
            this.startInteraction(dir);
            if(dir < 0)
            {
               this.MENU_ROLLOVER_HIGHLIGHT(_loc18_,false,0);
            }
         }
      }
   }
   function MENU_KEY_PRESS_ACTIONS()
   {
      this.dbg("---->MENU_KEY_PRESS_ACTIONS <----- ");
      var _loc2_ = true;
      return _loc2_;
   }
   function MENU_SET_FOCUS(isFocused, clearAll)
   {
      var _loc2_ = this.GET_COLUMN(this.menuLevel - 1);
      _loc2_.SET_FOCUS.apply(_loc2_,[isFocused,clearAll]);
      this.dbg("MENU_SET_FOCUS | columnID " + _loc2_.__get__columnID() + " columnMC: " + _loc2_ + " isFocused: " + isFocused);
      this.MENU_CHANGE_STATE(_loc2_);
      this.dbg("MENU_SET_FOCUS | menuState " + this.menuState);
   }
   function SET_ROLLOVER_HIGHLIGHT(columnIndex, isHighlighting, index)
   {
      var _loc3_ = this.GET_COLUMN(columnIndex);
      this.dbg("SET_ROLLOVER_HIGHLIGHT " + arguments);
      this.dbg("Highlight columnMC target: " + _loc3_);
      this.dbg("currentPage.columnList: " + this.currentPage.columnList);
      this.dbg("currentPage.columnList.length: " + this.currentPage.columnList.length);
      this.MENU_ROLLOVER_HIGHLIGHT(_loc3_,isHighlighting,index);
   }
   function MENU_ROLLOVER_HIGHLIGHT(columnMC, isHighlighting, index)
   {
      var _loc5_ = (com.rockstargames.ui.components.GUIView)columnMC.model.getCurrentView();
      this.dbg("MENU_ROLLOVER_HIGHLIGHT " + arguments + " || currView: " + _loc5_);
      if(_loc5_)
      {
         this.dbg("  currView.itemList.length " + _loc5_.itemList.length);
         var _loc3_ = 0;
         while(_loc3_ < _loc5_.itemList.length)
         {
            var _loc4_ = _loc5_.itemList[_loc3_];
            if(isHighlighting)
            {
               _loc4_.mouseOver(index != _loc3_?false:true);
            }
            else
            {
               _loc4_.mouseOver(false);
            }
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function MENU_INTERACTION(inputID, mPress, pressID, bIgnoreStateChange)
   {
      var _loc4_ = inputID == com.rockstargames.ui.game.GamePadConstants.NO_BUTTON_PRESSED;
      if(this.menuInteractState(inputID) == this.interact_idle || _loc4_)
      {
         var _loc3_ = undefined;
         if(inputID == com.rockstargames.ui.game.GamePadConstants.NO_BUTTON_PRESSED)
         {
            _loc3_ = this.GET_COLUMN(0);
         }
         else if(this.inContext)
         {
            _loc3_ = this.context;
         }
         else
         {
            _loc3_ = this.GET_COLUMN(this.menuLevel - 1);
         }
         var _loc9_ = this.getSelectedMenuItem(_loc3_);
         var _loc15_ = _loc9_.menuID;
         var _loc14_ = _loc9_.__get__uniqueID();
         var _loc16_ = _loc9_.index;
         if(mPress == false || mPress == undefined)
         {
            _loc3_.SET_INPUT_EVENT.apply(_loc3_,[inputID]);
         }
         else
         {
            _loc3_.SET_HIGHLIGHT.apply(_loc3_,[pressID]);
            this.MENU_ROLLOVER_HIGHLIGHT(_loc3_,false,pressID);
         }
         if(inputID == com.rockstargames.ui.game.GamePadConstants.DPADDOWN || inputID == com.rockstargames.ui.game.GamePadConstants.DPADUP || _loc4_)
         {
            this.dbg("");
            this.dbg("MENU_INTERACTION");
            this.dbg("columnMC " + _loc3_);
            var _loc2_ = this.getSelectedMenuItem(_loc3_);
            this.dbg("currMenuItem:: " + _loc2_);
            this.dbg("currMenuItem:index: " + _loc2_.index);
            this.dbg("currMenuItem:type: " + _loc2_.type);
            this.dbg("currMenuItem:menuID: " + _loc2_.menuID);
            this.dbg("currMenuItem:uniqueID: " + _loc2_.__get__uniqueID());
            this.dbg("currMenuItem:initialIndex: " + _loc2_.initialIndex);
            this.dbg("---------------------- ");
            this.dbg("menuState is differnt " + (_loc2_.menuID != this.menuState));
            this.dbg("unique is differnt " + (_loc2_.__get__uniqueID() != this.menuUniqueID));
            this.dbg("---------------------- ");
            this.dbg("MOVING TO : ");
            this.dbg("currMenuItem.menuID:: " + _loc2_.menuID);
            if(_loc2_.menuID != undefined)
            {
               this.dbg("currMenuItem.uniqueID " + _loc2_.__get__uniqueID());
               this.dbg("FROM : ");
               this.dbg("menuState " + this.menuState);
               this.dbg("menuUniqueID " + this.menuUniqueID);
               this.dbg("---------------------- ");
               if(_loc2_.menuID != this.menuState || _loc2_.__get__uniqueID() != this.menuUniqueID)
               {
                  var _loc11_ = 0;
                  this.dbg("In Context menu:" + this.inContext);
                  if(this.inContext)
                  {
                     com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,this.menuState,_loc2_.menuID,_loc2_.__get__uniqueID(),_loc11_);
                     this.menuUniqueID = _loc2_.uniqueID;
                     this.dbg(" ");
                     this.dbg("*****************");
                     this.dbg("INCONTEXT menuUniqueID changed to " + this.menuUniqueID);
                     this.dbg("*****************");
                     this.dbg(" ");
                     return undefined;
                  }
                  this.dbg("Try to clear layout based on this ID ! " + _loc2_.menuID);
                  var _loc6_ = com.rockstargames.gtav.constants.PauseMenuLookup.lookUp(_loc2_.menuID);
                  var _loc12_ = _loc6_.menuChanged;
                  var _loc13_ = _loc6_.clearRootColumns;
                  var _loc7_ = _loc6_.callImmediately;
                  var _loc8_ = !_loc7_ && !bIgnoreStateChange;
                  this.dbg("LIST MOVE: clearRootColumns: " + _loc13_ + " menuChanged: " + _loc12_ + " callImmediately: " + _loc7_ + " wantsMenuStateChange: " + _loc8_);
                  if(!_loc4_ && _loc13_)
                  {
                     this.REMOVE_ROOT_COLUMNS();
                     this.dbg("DID call remove root columns!");
                  }
                  else
                  {
                     this.dbg("DIDN\'T call remove root columns!");
                  }
                  var _loc10_ = this.menuUniqueID;
                  this.dbg("old menuUniqueID " + _loc10_);
                  this.menuUniqueID = _loc2_.uniqueID;
                  this.dbg(" ");
                  this.dbg("*****************");
                  this.dbg("menuUniqueID changed to " + this.menuUniqueID);
                  this.dbg("*****************");
                  this.dbg(" ");
                  if(_loc12_)
                  {
                     if(_loc4_)
                     {
                        this.dbg("CHANGE ------------------- LAYOUT_CHANGE_INITIAL_FILL : menuState: " + this.menuState + " new menu state: " + _loc2_.menuID + " menuUniqueID: " + this.menuUniqueID + " old menuUniqueID: " + _loc10_);
                        com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGE_INITIAL_FILL",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,this.menuState,_loc2_.menuID,this.menuUniqueID,_loc11_,_loc8_);
                     }
                     else if(_loc15_ != _loc2_.menuID || _loc14_ != _loc2_.__get__uniqueID() || _loc16_ != _loc2_.index)
                     {
                        this.dbg("CHANGE ------------------- LAYOUT_CHANGED : menuState: " + this.menuState + " new menu state: " + _loc2_.menuID + " menuUniqueID: " + this.menuUniqueID + " old menuUniqueID: " + _loc10_ + " AND onComplete:MENU_INTERACTION_RESPONSE");
                        com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,this.menuState,_loc2_.menuID,this.menuUniqueID,_loc11_,_loc8_);
                     }
                     else
                     {
                        this.dbg("NO CHANGE ---------------- OLD MENU ITEM WAS THE SAME AS THE NEW ONE");
                     }
                  }
                  if(!_loc4_)
                  {
                     this.menuState = _loc2_.menuID;
                     this.dbg("Not InitialFill, so menuState here ! " + this.menuState);
                  }
                  if(_loc7_)
                  {
                     this.currentPage.stateChanged(this.menuState);
                     this.dbg("trying to call stateChanged on the currentPage with  ------------ MENU_STATE: " + _loc2_.menuID);
                  }
               }
            }
         }
         if(!_loc4_)
         {
            this.startInteraction(inputID);
         }
      }
   }
   function MENU_INTERACTION_RESPONSE(codeMenuState)
   {
      this.dbg("go, I\'ve got it a response ------------------- MENU_STATE: " + this.menuState + " currentPage " + this.currentPage);
      if(codeMenuState != undefined)
      {
         this.currentPage.stateChanged(codeMenuState);
      }
      else
      {
         this.currentPage.stateChanged(this.menuState);
      }
   }
   function MENU_CHANGE_STATE(columnMC)
   {
      var _loc2_ = this.getSelectedMenuItem(columnMC);
      if(_loc2_.menuID != -1 && _loc2_.menuID != undefined)
      {
         this.menuState = _loc2_.menuID;
      }
   }
   function MENU_STATE(id)
   {
   }
   function MENU_STATE_LOAD(oldMenuState)
   {
   }
   function TRIGGER_PAUSE_MENU_EVENT()
   {
      this.dbg("TRIGGER_PAUSE_MENU_EVENT menuLevel: " + this.menuLevel);
      var _loc3_ = -1;
      var _loc7_ = -1;
      var _loc2_ = undefined;
      if(this.menuLevel > 0)
      {
         var _loc6_ = undefined;
         if(this.inContext)
         {
            _loc6_ = this.context;
         }
         else
         {
            _loc6_ = this.GET_COLUMN(this.menuLevel - 1);
         }
         this.dbg("TRIGGER_PAUSE_MENU_EVENT columnMC: " + _loc6_ + " len: " + this.columnList.length);
         if(_loc6_ != undefined)
         {
            var _loc4_ = this.getSelectedMenuItem(_loc6_);
            _loc2_ = this.getSelectedMenuItem(this.GET_COLUMN(this.menuLevel));
            if(_loc2_.menuID != undefined || _loc2_.menuID != null)
            {
               _loc3_ = _loc2_.menuID;
            }
            if(_loc2_.__get__uniqueID() != undefined || _loc2_.__get__uniqueID() != null)
            {
               _loc7_ = _loc2_.uniqueID;
            }
            if(_loc4_ != undefined)
            {
               com.rockstargames.ui.game.GameInterface.call("TRIGGER_PAUSE_MENU_EVENT",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,_loc4_.menuID,_loc4_.__get__uniqueID(),_loc3_,_loc7_);
               this.dbg("TRIGGER_PAUSE_MENU_EVENT | currMenuItem.menuID: " + _loc4_.menuID + " | currMenuItem.uniqueID: " + _loc4_.__get__uniqueID() + " nextMenuID: " + _loc3_);
            }
         }
      }
      else
      {
         var _loc5_ = this.menuList[this.menuIndex];
         this.dbg("TRIGGER_PAUSE_MENU_EVENT | from top: menuEnum" + _loc5_ + " menuIndex " + this.menuIndex);
         _loc2_ = this.getSelectedMenuItem(this.GET_COLUMN(this.menuLevel));
         if(_loc2_.menuID != undefined || _loc2_.menuID != null)
         {
            _loc3_ = _loc2_.menuID;
         }
         if(_loc2_.__get__uniqueID() != undefined || _loc2_.__get__uniqueID() != null)
         {
            _loc7_ = _loc2_.uniqueID;
         }
         if(_loc5_ != com.rockstargames.gtav.constants.PauseMenuLUT.SAVE_GAME)
         {
            com.rockstargames.ui.game.GameInterface.call("TRIGGER_PAUSE_MENU_EVENT",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,_loc5_,0,_loc3_,_loc7_);
            this.dbg("TRIGGER_PAUSE_MENU_EVENT | currMenuItem.menuID: " + _loc5_ + " | currMenuItem.uniqueID: 0 nextMenuID: " + _loc3_);
         }
      }
   }
   function setIsNavigatingContent(bIsNavigatingContent)
   {
      this.dbg("IS_NAVIGATING_CONTENT | called " + bIsNavigatingContent);
      com.rockstargames.ui.game.GameInterface.call("IS_NAVIGATING_CONTENT",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,bIsNavigatingContent);
   }
   function getSelectedMenuItem(columnMC)
   {
      var _loc1_ = columnMC.model.getCurrentView(0).highlightedItem;
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem)columnMC.model.getCurrentView().itemList[_loc1_];
      return _loc2_;
   }
   function SHOW_WARNING_MESSAGE(show)
   {
   }
   function SHOW_CONTEXT_MENU(bool)
   {
   }
   function GET_PAGE(menuEnum)
   {
      var _loc4_ = false;
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < this.menuList.length)
      {
         if(menuEnum == this.menuList[_loc2_])
         {
            _loc3_ = this.menuGFXList[_loc2_];
            _loc4_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.dbg("GET_PAGE to LOAD " + _loc3_);
      if(_loc3_ == undefined || _loc3_ == false)
      {
         _loc3_ = "";
         this.dbg("GET_PAGE | gfxfilePath ID not found");
      }
      this.dbg("found " + _loc4_);
      if(!_loc4_)
      {
         _loc3_ = "";
         this.dbg("GET_PAGE | menu ID not found");
      }
      return _loc3_;
   }
   function LOAD_PAGE(gfxfile)
   {
      this.dbg("--------------LOAD_PAGE--------> " + gfxfile);
      var thisObj = this;
      this.pageLoaderObject = new Object();
      this.pageLoaderObject._path = gfxfile;
      this.pageLoaderObject._mc = this.content.createEmptyMovieClip("pageContainerMC",this.content.getNextHighestDepth());
      this.pageLoaderObject._loader = new MovieClipLoader();
      this.pageLoaderObject._listener = new Object();
      this.pageLoaderObject._loader.addListener(this.pageLoaderObject._listener);
      this.pageLoaderObject._listener.thisObj = thisObj;
      this.pageLoaderObject._listener.onLoadInit = function(target_mc)
      {
         var _loc2_ = this.thisObj.pageLoaderObject;
         _loc2_._loader.removeListener(_loc2_._listener);
         _loc2_._loader = null;
      };
      this.pageLoaderObject._loader.loadClip(gfxfile,this.pageLoaderObject._mc);
   }
   function LOADED_PAGE()
   {
      this.dbg("LOADED_PAGE PAGE LOADED " + this.pageLoaderObject._path);
      var _loc2_ = this.menuState;
      this.menuState = this.storedMenuState;
      this.dbg("menuState " + this.menuState + " :: oldMenuState" + _loc2_);
      this.currentPage = this.pageLoaderObject._mc.TIMELINE;
      this.currentPage.setupPage();
      this.currentPage.stateChanged(this.menuState);
      this.dbg("### CURRENT PAGE IS:" + this.currentPage);
      this.MENU_STATE_LOAD(_loc2_);
      this.FOCUS_CONTENT(false);
   }
   function KILL_PAGE()
   {
   }
   function ADD_COLUMN(columnIndex, columnStrID)
   {
      var _loc3_ = [0,290,580];
      var _loc4_ = this.content.attachMovie(columnStrID,columnStrID + "MC",this.content.getNextHighestDepth(),{_x:_loc3_[columnIndex]});
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)_loc4_;
      _loc2_.INITIALISE();
      this.columnList[columnIndex] = _loc2_;
   }
   function REMOVE_COLUMN(columnIndex)
   {
      var _loc2_ = this.GET_COLUMN(columnIndex);
      _loc2_.SET_DATA_SLOT_EMPTY(0);
      _loc2_.CLEAR_HIGHLIGHT();
   }
   function REMOVE_ROOT_COLUMNS()
   {
      this.dbg("menuLevel: " + this.menuLevel);
      this.dbg("currentPageList: " + this.currentPage.columnList);
      var _loc2_ = this.menuLevel;
      while(_loc2_ < this.currentPage.columnList.length)
      {
         this.REMOVE_COLUMN(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function REMOVE_ALL_COLUMNS()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.currentPage.columnList.length)
      {
         this.REMOVE_COLUMN(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function GET_COLUMN(columnIndex)
   {
      var _loc2_ = this.currentPage.getColumn(columnIndex);
      return _loc2_;
   }
   function headerMethod(func, params)
   {
      this.dbg("HEADER METHOD CALLED  : " + func + "  ====   " + params);
      com.rockstargames.ui.game.GameInterface.call("CALL_METHOD_ON_MOVIE",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,com.rockstargames.gtav.constants.PauseMenuComponentLUT.SP_HEADER[1],func,params != undefined?params:[]);
   }
   function REQUEST_TXD(txd, filename)
   {
      com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,filename,txd);
   }
   function TXD_HAS_LOADED(txd, hasLoaded)
   {
   }
}
