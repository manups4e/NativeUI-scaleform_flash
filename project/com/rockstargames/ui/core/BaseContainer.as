class com.rockstargames.ui.core.BaseContainer extends MovieClip
{
   var NEEDS_BIGGER_HELP_AND_SUBTITLES = false;
   var screenWidth = 1280;
   var screenHeight = 720;
   var safeTop = 96;
   var safeBottom = 96;
   var safeLeft = 54;
   var safeRight = 54;
   var isWideScreen = true;
   var isHiDef = true;
   var MP_IS_ACTIVE = false;
   var HIGHEST_DEPTH_IN_XML = 0;
   static var NOT_IN_LIST = -1;
   static var NOT_LOADED = 0;
   static var STREAMING = 1;
   static var LOADING = 2;
   static var LOAD_IN_PROGRESS = 3;
   static var LOAD_COMPLETE = 4;
   static var LOADED = 5;
   static var LOAD_ERROR = 6;
   static var ONSCREEN = 7;
   static var HIDDEN = 8;
   static var DEACTIVATED = 9;
   function BaseContainer()
   {
      super();
      _global.gfxExtensions = true;
      this.COMPONENT_ARRAY = [];
      this.mcPrefix = "COMP_";
      this.loadedCompPrefix = "lc_";
      this.MAX_HUD_COMPONENTS = com.rockstargames.gtav.constants.HudComponentConstants.MAX_HUD_COMPONENTS;
      this.isWeaponWheelActive = false;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.TOGGLE_SAFEZONE_DEBUG(false);
   }
   function CONTAINER_METHOD()
   {
      var _loc4_ = [];
      _loc4_ = arguments;
      var _loc6_ = _loc4_[0];
      var _loc3_ = this.checkForCompInfo(_loc6_);
      var _loc5_ = _loc3_._status;
      if(_loc5_ == undefined)
      {
         _loc3_.sanitise();
         _loc5_ = _loc3_._status;
      }
      switch(_loc5_)
      {
         case com.rockstargames.ui.core.BaseContainer.NOT_LOADED:
            if(_loc4_[1].split("CLEAR_").length <= 1)
            {
               _loc3_._status = com.rockstargames.ui.core.BaseContainer.STREAMING;
               _loc3_._functionCache.push(_loc4_.slice(1));
               this.ACTIVATE_COMPONENT(_loc6_);
            }
            break;
         case com.rockstargames.ui.core.BaseContainer.LOADED:
         case com.rockstargames.ui.core.BaseContainer.ONSCREEN:
         case com.rockstargames.ui.core.BaseContainer.HIDDEN:
            var _loc7_ = _loc4_[1];
            _loc3_._mc.TIMELINE.register7(_loc4_.slice(2));
            break;
         case com.rockstargames.ui.core.BaseContainer.STREAMING:
         case com.rockstargames.ui.core.BaseContainer.LOADING:
            _loc3_._functionCache.push(_loc4_.slice(1));
            break;
         case com.rockstargames.ui.core.BaseContainer.DEACTIVATED:
            _loc3_._mc._visible = _loc3_._intendedVisibleState;
            if(_loc3_._intendedVisibleState)
            {
               _loc3_._status = com.rockstargames.ui.core.BaseContainer.ONSCREEN;
            }
            else
            {
               _loc3_._status = com.rockstargames.ui.core.BaseContainer.HIDDEN;
            }
            _loc7_ = _loc4_[1];
            _loc3_._mc.TIMELINE.register7(_loc4_.slice(2));
            com.rockstargames.ui.game.GameInterface.call("SET_ACTIVE_STATE",com.rockstargames.ui.game.GameInterface.HUD_TYPE,_loc3_._enumId,true);
            this.reorderList(_loc3_._displayList);
      }
   }
   function ACTIVATE_COMPONENT(componentID)
   {
      com.rockstargames.ui.game.GameInterface.call("ACTIVATE_COMPONENT",com.rockstargames.ui.game.GameInterface.HUD_TYPE,componentID);
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isNonLatin)
   {
      this.NEEDS_BIGGER_HELP_AND_SUBTITLES = _isNonLatin;
      this.safeLeft = _safeLeftPercent * _screenWidthPixels;
      this.safeRight = (1 - _safeRightPercent) * _screenWidthPixels;
      this.safeTop = _safeTopPercent * _screenHeightPixels;
      this.safeBottom = (1 - _safeBottomPercent) * _screenHeightPixels;
      this.screenWidth = _screenWidthPixels;
      this.screenHeight = _screenHeightPixels;
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      this.REPOSITION_HUD_FOR_CONFIG_CHANGE();
      this.TIMELINE.frameMC._x = this.safeLeft;
      this.TIMELINE.frameMC._y = this.safeTop;
      this.TIMELINE.frameMC._width = this.screenWidth - (this.safeLeft + this.safeRight);
      this.TIMELINE.frameMC._height = this.screenHeight - (this.safeTop + this.safeBottom);
   }
   function SET_COMPONENT_VALUES(componentID, filesMemoryAddress, alignX, alignY, W, H, r, g, b, a, d, listId, listPriority, hasGfx, posX, posY)
   {
      var _loc2_ = this.checkForCompInfo(componentID);
      _loc2_._size = [W,H];
      _loc2_._colour = [r,g,b,a];
      _loc2_._depth = d;
      _loc2_._displayList = listId;
      _loc2_._displayListPriority = listPriority;
      _loc2_._hasGfx = hasGfx;
      if(typeof alignX == "string")
      {
         _loc2_._position = [alignX,alignY,posX,posY];
      }
      else
      {
         _loc2_._position = ["","",alignX,alignY];
      }
      if(hasGfx)
      {
         this.loadComponent(componentID,filesMemoryAddress);
      }
      else
      {
         this.createComponentMovieClip(_loc2_);
      }
   }
   function HIDE(componentID)
   {
      var _loc2_ = this.COMPONENT_ARRAY[componentID];
      _loc2_._intendedVisibleState = false;
      if(_loc2_._status == com.rockstargames.ui.core.BaseContainer.ONSCREEN)
      {
         _loc2_._mc._visible = false;
         _loc2_._status = com.rockstargames.ui.core.BaseContainer.HIDDEN;
      }
   }
   function SHOW(componentID)
   {
      var _loc2_ = this.COMPONENT_ARRAY[componentID];
      _loc2_._intendedVisibleState = true;
      if(_loc2_._status == com.rockstargames.ui.core.BaseContainer.HIDDEN)
      {
         _loc2_._mc._visible = true;
         _loc2_._status = com.rockstargames.ui.core.BaseContainer.ONSCREEN;
      }
   }
   function SET_COMPONENT_RELATIVE_TO_TARGET(isInFront, componentID, componentTargetID)
   {
      var _loc3_ = undefined;
      var _loc9_ = undefined;
      var _loc5_ = this.COMPONENT_ARRAY[componentID];
      var _loc8_ = this.COMPONENT_ARRAY[componentTargetID];
      var _loc4_ = _loc5_._mc;
      var _loc6_ = _loc8_._mc;
      var _loc2_ = _loc6_.getDepth();
      if(isInFront)
      {
         _loc2_ = _loc2_ + 1;
      }
      else
      {
         _loc2_ = _loc2_ - 1;
      }
      var _loc7_ = this.TIMELINE.getInstanceAtDepth(_loc2_);
      if(_loc7_ != undefined)
      {
         _loc4_.swapDepths(_loc2_);
         _loc3_ = true;
      }
      else
      {
         _loc3_ = false;
      }
      return _loc3_;
   }
   function SET_COMPONENT_TO_FRONT(componentID)
   {
      var _loc8_ = this.HIGHEST_DEPTH_IN_XML;
      var _loc3_ = undefined;
      var _loc5_ = this.COMPONENT_ARRAY[componentID];
      var _loc4_ = _loc5_._mc;
      var _loc6_ = this.TIMELINE.getNextHighestDepth();
      var _loc2_ = Math.max(_loc8_,_loc6_);
      _loc2_ = _loc2_ + 1;
      var _loc7_ = this.TIMELINE.getInstanceAtDepth(_loc2_);
      if(_loc7_ != undefined)
      {
         _loc4_.swapDepths(_loc2_);
         _loc3_ = true;
      }
      else
      {
         _loc3_ = false;
      }
      return _loc3_;
   }
   function SET_COMPONENT_TO_BACK(componentID)
   {
      var _loc2_ = 10;
      var _loc3_ = undefined;
      var _loc6_ = this.COMPONENT_ARRAY[componentID];
      var _loc5_ = _loc6_._mc;
      _loc2_ = _loc2_ - 1;
      var _loc4_ = this.TIMELINE.getInstanceAtDepth(_loc2_);
      if(_loc4_ != undefined)
      {
         _loc5_.swapDepths(_loc2_);
         _loc3_ = true;
      }
      else
      {
         _loc3_ = false;
      }
      return _loc3_;
   }
   function GET_COMPONENT_STATUS(componentID)
   {
      var _loc2_ = undefined;
      var _loc3_ = this.COMPONENT_ARRAY[componentID];
      if(_loc3_ != undefined)
      {
         _loc2_ = _loc3_._status;
      }
      else
      {
         _loc2_ = com.rockstargames.ui.core.BaseContainer.NOT_LOADED;
      }
      return _loc2_;
   }
   function SET_WIDESCREEN(isWidescreen)
   {
   }
   function MULTIPLAYER_IS_ACTIVE(isActive)
   {
      this.MP_IS_ACTIVE = isActive;
   }
   function SET_HIGHEST_DEPTH_FROM_XML(highestStoredDepth)
   {
      this.HIGHEST_DEPTH_IN_XML = highestStoredDepth;
   }
   function REMOVE_HUD_ITEM(componentID)
   {
      var _loc2_ = this.COMPONENT_ARRAY[componentID];
      var _loc3_ = this.mcPrefix + _loc2_._enumId;
      _loc2_._status = com.rockstargames.ui.core.BaseContainer.NOT_LOADED;
      this.TIMELINE[_loc3_].removeMovieClip();
      com.rockstargames.ui.game.GameInterface.call("SET_HUD_COMPONENT_AS_NO_LONGER_NEEDED",com.rockstargames.ui.game.GameInterface.HUD_TYPE,_loc2_._enumId);
      _loc2_.sanitise();
   }
   function OVERIDE_POSITION(componentID, w, h, x, y)
   {
      var _loc3_ = this.COMPONENT_ARRAY[componentID];
      var _loc2_ = false;
      if(_loc3_ == undefined)
      {
         _loc2_ = false;
      }
      else
      {
         _loc2_ = true;
         _loc3_._position = [x,y];
         _loc3_._size = [w,h];
      }
      return _loc2_;
   }
   function OVERRIDE_COMPONENT_POSITION(componentID, newX, newY)
   {
      var _loc2_ = this.COMPONENT_ARRAY[componentID];
      var _loc6_ = _loc2_._mc;
      if(newX == -1)
      {
         newX = _loc2_._position[2];
      }
      if(newY == -1)
      {
         newY = _loc2_._position[3];
      }
      this.SET_COMPONENT_POSITION(componentID,_loc2_._size[0],_loc2_._size[1],_loc2_._position[0],_loc2_._position[1],newX,newY);
   }
   function OVERRIDE_COMPONENT_POSITION_PIXELS(componentID, newX, newY)
   {
      var _loc2_ = this.COMPONENT_ARRAY[componentID];
      var _loc3_ = _loc2_._mc;
      _loc3_._x = newX;
      _loc3_._y = newY;
      _loc2_._position[0] = newX / this.screenWidth;
      _loc2_._position[1] = newY / this.screenHeight;
   }
   function SET_COMPONENT_COLOUR(componentID, r, g, b, a)
   {
      var _loc3_ = false;
      var _loc2_ = this.COMPONENT_ARRAY[componentID];
      if(_loc2_ == undefined)
      {
         _loc3_ = false;
      }
      if(_loc2_._status == com.rockstargames.ui.core.BaseContainer.ONSCREEN || _loc2_._status == com.rockstargames.ui.core.BaseContainer.HIDDEN)
      {
         var _loc7_ = _loc2_._mc;
         _loc2_._colour[0] = r;
         _loc2_._colour[1] = g;
         _loc2_._colour[2] = b;
         _loc2_._colour[3] = a;
         if(r != undefined && g != undefined && b != undefined && a != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc7_.CONTENT,r,g,b,a);
            _loc3_ = true;
         }
         else
         {
            _loc3_ = false;
         }
      }
      else
      {
         _loc3_ = false;
      }
      return _loc3_;
   }
   function SET_COMPONENT_POSITION(componentID, w, h, alignX, alignY, offsetX, offsetY)
   {
      var _loc6_ = this.COMPONENT_ARRAY[componentID];
      var _loc4_ = _loc6_._mc;
      var _loc3_ = 0;
      var _loc2_ = 0;
      var _loc7_ = w * this.screenWidth;
      var _loc5_ = h * this.screenHeight;
      switch(alignX)
      {
         case "L":
            _loc3_ = this.safeLeft;
            break;
         case "R":
            _loc3_ = this.screenWidth - this.safeRight - _loc7_;
            break;
         case "C":
            _loc3_ = this.screenWidth / 2 - _loc7_ / 2;
            break;
         case "I":
            _loc3_ = 0;
      }
      if(offsetX != undefined)
      {
         var _loc8_ = offsetX * this.screenWidth;
         _loc3_ = _loc3_ + _loc8_;
      }
      switch(alignY)
      {
         case "T":
            _loc2_ = this.safeTop;
            break;
         case "B":
            _loc2_ = this.screenHeight - this.safeBottom - _loc5_;
            break;
         case "C":
            _loc2_ = this.screenHeight / 2 - _loc5_ / 2;
            break;
         case "I":
            _loc2_ = 0;
      }
      if(offsetY != undefined)
      {
         var _loc9_ = offsetY * this.screenHeight;
         _loc2_ = _loc2_ + _loc9_;
      }
      if(_loc6_._displayList == -2)
      {
         _loc2_ = _loc2_ - _loc6_._displayListPriority * (_loc5_ + 8);
      }
      switch(componentID)
      {
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_1:
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_2:
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_HELP_TEXT:
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_ICON:
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_RETICLE:
            _loc4_._x = Math.round(_loc3_);
            _loc4_._y = Math.round(_loc2_);
            break;
         default:
            _loc4_._width = Math.round(_loc7_);
            _loc4_._height = Math.round(_loc5_);
            _loc4_._x = Math.round(_loc3_);
            _loc4_._y = Math.round(_loc2_);
      }
   }
   function SET_HUD_COMPONENT_RANGE(weaponStart, scriptedHudCompStart)
   {
      this.WEAPON_HUD_COMPONENTS_START = weaponStart;
      this.SCRIPT_HUD_COMPONENTS_START = scriptedHudCompStart;
   }
   function loadComponent(componentID, filesMemoryAddress)
   {
      var thisObj = this;
      var _loc2_ = this.COMPONENT_ARRAY[componentID];
      _loc2_._status = com.rockstargames.ui.core.BaseContainer.LOADING;
      var _loc5_ = _loc2_._depth;
      var _loc4_ = this.mcPrefix + _loc2_._enumId;
      _loc2_._mc = this.TIMELINE.createEmptyMovieClip(_loc4_,_loc5_);
      _loc2_._loader = new MovieClipLoader();
      _loc2_._listener = new Object();
      _loc2_._loader.addListener(_loc2_._listener);
      _loc2_._listener.thisObj = thisObj;
      _loc2_._listener.componentID = componentID;
      _loc2_._listener.onLoadInit = function(target_mc)
      {
         var _loc2_ = this.thisObj.COMPONENT_ARRAY[this.componentID];
         _loc2_._status = 5;
         _loc2_._mc._visible = false;
         this.thisObj.setupComponent(this.componentID);
         _loc2_._loader.removeListener(_loc2_._listener);
         com.rockstargames.ui.game.GameInterface.call("SET_COMPONENT_LOADED",com.rockstargames.ui.game.GameInterface.HUD_TYPE,_loc2_._enumId,true);
      };
      _loc2_._loader.loadClip(filesMemoryAddress,_loc2_._mc);
   }
   function setupComponent(componentID)
   {
      var _loc2_ = this.COMPONENT_ARRAY[componentID];
      _loc2_._mc.TIMELINE.SET_HUD(_level0.HUD);
      if(_loc2_._intendedVisibleState)
      {
         _loc2_._status = com.rockstargames.ui.core.BaseContainer.ONSCREEN;
      }
      else
      {
         _loc2_._status = com.rockstargames.ui.core.BaseContainer.HIDDEN;
      }
      var _loc4_ = _loc2_._mc;
      var _loc7_ = _loc2_._enumId;
      var _loc6_ = _loc2_._size;
      var _loc5_ = _loc2_._position;
      var _loc3_ = _loc2_._colour;
      this.SET_COMPONENT_POSITION(componentID,_loc6_[0],_loc6_[1],_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3]);
      if(_loc3_[0] != undefined && _loc3_[1] != undefined && _loc3_[2] != undefined && _loc3_[3] != undefined && typeof _loc4_.CONTENT == "movieclip")
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc4_.CONTENT,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3]);
      }
      if(_loc4_.TIMELINE.firstRunFlag)
      {
         _loc4_.TIMELINE.READY(_loc7_);
         _loc4_.TIMELINE.firstRunFlag = false;
      }
      _loc2_._mc.TIMELINE.MP_IS_ACTIVE = this.MP_IS_ACTIVE;
      _loc4_._visible = _loc2_._intendedVisibleState;
      this.callCachedMethods(componentID);
   }
   function callCachedMethods(componentID)
   {
      var _loc5_ = this.COMPONENT_ARRAY[componentID];
      var _loc2_ = 0;
      var _loc6_ = _loc5_._functionCache.length;
      var _loc4_ = undefined;
      var _loc3_ = [];
      _loc3_ = _loc5_._functionCache;
      _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         _loc4_ = _loc3_[_loc2_][0];
         _loc5_._mc.TIMELINE.register4(_loc3_[_loc2_].slice(1));
         _loc2_ = _loc2_ + 1;
      }
      _loc5_._functionCache = new Array();
   }
   function reorderList(listID)
   {
   }
   function checkForCompInfo(componentID)
   {
      var _loc2_ = undefined;
      if(this.COMPONENT_ARRAY[componentID] != undefined)
      {
         _loc2_ = this.COMPONENT_ARRAY[componentID];
      }
      else
      {
         _loc2_ = new com.rockstargames.ui.core.BaseComponentInfo(componentID);
         this.COMPONENT_ARRAY[componentID] = _loc2_;
      }
      return _loc2_;
   }
   function createComponentMovieClip(currentComp)
   {
   }
   function SET_MAX_HUD_COMPONENTS(max)
   {
      this.MAX_HUD_COMPONENTS = max;
   }
   function REPOSITION_HUD_FOR_CONFIG_CHANGE()
   {
      var _loc3_ = undefined;
      var _loc2_ = 0;
      var _loc5_ = undefined;
      var _loc7_ = undefined;
      var _loc6_ = undefined;
      var _loc4_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.constants.HudComponentConstants.MAX_SCRIPTED_HUD_COMPONENTS)
      {
         if(this.COMPONENT_ARRAY[_loc2_] != undefined)
         {
            _loc3_ = this.COMPONENT_ARRAY[_loc2_];
            _loc5_ = _loc3_._enumId;
            _loc7_ = _loc3_._size[0];
            _loc6_ = _loc3_._size[1];
            _loc4_ = _loc3_._position;
            this.SET_COMPONENT_POSITION(_loc5_,_loc7_,_loc6_,_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3]);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.reorderAllKnownLists();
   }
   function reorderAllKnownLists()
   {
   }
   function SHOW_BOUNDING_BOX(componentID)
   {
      var _loc3_ = 0;
      var _loc4_ = undefined;
      _loc3_ = 0;
      while(_loc3_ < this.MAX_HUD_COMPONENTS)
      {
         _loc4_ = super.checkForCompInfo(_loc3_ + 1);
         _loc4_._mc.BOUNDING_BOX._visible = true;
         _loc3_ = _loc3_ + 1;
      }
   }
   function TOGGLE_SAFEZONE_DEBUG(isVisible)
   {
      this.TIMELINE.frameMC._visible = isVisible;
   }
}
