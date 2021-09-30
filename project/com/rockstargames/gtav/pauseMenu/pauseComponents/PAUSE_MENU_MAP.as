class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var viewableItems = 19;
   function PAUSE_MENU_MAP()
   {
      super();
      this.dbgID = "PAUSE_MENU_MAP";
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
      this.details = this.CONTENT.mapDetailsMC;
      this.zoom = this.details.zoomMC;
      this.location = this.details.locationMC;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.zoom,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.location.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.location.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapModel();
      this.model.createView(0,{id:0,x:868,y:0,rowSpacing:2,columnSpacing:0,container:this.CONTENT,linkage:["mapLegendItem"],visibleItems:this.viewableItems,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
      this.SET_TITLE();
      this.updateScroll();
   }
   function SET_TITLE(str)
   {
      if(str != undefined && str != "")
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.location.labelMC.locationTF,str.toUpperCase(),false,true);
         this.location.bgMC._width = Math.round(this.location.labelMC._x + this.location.labelMC._width + 10);
         this.location._visible = true;
         this.zoom._visible = true;
      }
      else
      {
         this.location._visible = false;
         this.zoom._visible = false;
      }
      this.updateScroll();
   }
   function SET_DESCRIPTION()
   {
      this.zoom.startTF.autoSize = "left";
      this.zoom.startTF.text = arguments[0];
      this.zoom.endTF.autoSize = "right";
      this.zoom.endTF.text = arguments[1];
      this.updateScroll();
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapView)this.model.getCurrentView();
      _loc2_.__set__index(i);
      this.updateScroll();
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      if(itemIndex == undefined)
      {
         itemIndex = 0;
      }
      this.model.displayView(viewIndex,itemIndex);
      var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapView)this.model.getCurrentView();
      var _loc3_ = _loc4_.highlightedItem;
      if(_loc3_ >= _loc4_.itemList.length)
      {
         var _loc2_ = _loc4_.itemList.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc2_ < _loc3_)
            {
               _loc3_ = _loc2_;
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
      }
      _loc4_.jumpTo(_loc3_);
      _loc4_.highlightedItem = _loc3_;
      this.updateScroll();
   }
   function SET_INPUT_EVENT(input)
   {
      var _loc2_ = this.model.getCurrentView().itemList[this.model.getCurrentView().highlightedItem];
      switch(input)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            this.model.prevItem();
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            this.model.nextItem();
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            _loc2_.stepVal(1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            _loc2_.stepVal(-1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.FRONTEND_CONTEXT_BUTTON:
            _loc2_.__set__showBlips(!_loc2_.__get__showBlips());
      }
      this.updateScroll();
   }
   function SET_DATA_SLOT(sup)
   {
      super.SET_DATA_SLOT.apply(super,arguments);
      this.updateScroll();
   }
   function INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, xColOffset)
   {
      super.INIT_SCROLL_BAR.apply(super,arguments);
      this.updateScroll();
   }
   function SET_SCROLL_BAR(currentPosition, maxPosition, maxVisible, caption)
   {
      super.SET_SCROLL_BAR.apply(super,arguments);
      this.updateScroll();
   }
   function updateScroll()
   {
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapView)this.model.getCurrentView();
      var _loc2_ = _loc3_.viewContainer;
      if(_loc3_.dataList.length > this.viewableItems && _loc2_._visible == true)
      {
         this.scrollBase._visible = this.scrollBase.forceInvisible = false;
         this.scrollBase.scrollPosMC._x = 5;
         this.scrollBase.scrollPosTXT._width = 10;
         this.scrollBase.scrollPosTXT.autoSize = true;
         this.scrollBase.scrollPosTXT.multiline = false;
         var _loc4_ = this.scrollBase.scrollPosTXT.getTextFormat();
         _loc4_.font = "$FixedWidthNumbers";
         this.scrollBase.scrollPosTXT.setNewTextFormat(_loc4_);
         this.scrollBase.updateScroll();
         this.scrollBase.arrowsMC._x = this.scrollBase.scrollPosMC._x + Math.ceil(this.scrollBase.scrollPosTXT._width) + 14;
         this.scrollBase.bgMC._width = Math.round(this.scrollBase.arrowsMC._x + 12);
         this.scrollBase._x = Math.round(_loc2_._x - this.scrollBase.bgMC._width);
         this.scrollBase._y = _loc2_._y + this.viewableItems * 27;
      }
      else
      {
         this.scrollBase.forceInvisible = true;
         this.scrollBase._visible = false;
      }
   }
}
