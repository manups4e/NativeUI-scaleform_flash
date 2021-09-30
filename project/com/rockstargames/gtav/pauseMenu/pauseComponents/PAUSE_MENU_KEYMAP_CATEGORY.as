class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_KEYMAP_CATEGORY extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var hasCustomScrollPos = false;
   var rowOffset = 27;
   var isCharSelect = false;
   var charSelectHeight = 25;
   function PAUSE_MENU_KEYMAP_CATEGORY()
   {
      super();
      this.dbgID = "PAUSE_MENU_KEYMAP_CATEGORY";
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
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuKeymapCategoryModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,container:this.CONTENT,linkage:["categoryListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.helpMC.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.CONTENT.helpMC.helpTF.wordWrap = true;
      this.CONTENT.helpMC.helpTF.autoSize = true;
      this.CONTENT.helpMC._visible = false;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW.apply(this,arguments);
      this.dependentColumnMC.onDisplayUpdate();
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
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuKeymapCategoryView)this.model.getCurrentView();
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
      this.model.getCurrentView().visibleItems = 16;
      this.model.getCurrentView().viewContainer._y = 0;
   }
   function SET_DESCRIPTION(helpStr, flashHelp)
   {
      if(this.blipLayer)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.CONTENT.helpMC.createEmptyMovieClip("blipLayer",1000);
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
      var _loc2_ = this.getHelpY();
      if(this.scrollBase != undefined && this.hasCustomScrollPos == true)
      {
         _loc2_ = _loc2_ + (this.scrollBase._height + 2);
      }
      this.CONTENT.helpMC._y = _loc2_;
      this.CONTENT.helpMC.bgMC._height = this.CONTENT.helpMC.helpTF.textHeight + 12;
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
      var _loc6_ = 0;
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuKeymapCategoryView)this.model.getCurrentView();
      var _loc4_ = _loc3_.visibleItems;
      var _loc2_ = !this.isCharSelect?this.rowOffset:this.charSelectHeight;
      var _loc5_ = !this.isCharSelect?0:2;
      return _loc6_ + _loc4_ * _loc2_ + _loc5_;
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
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuKeymapCategoryModel)this.model.highlightNext();
      }
      else
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuKeymapCategoryModel)this.model.clearHighlight();
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
