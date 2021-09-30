class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_GALLERY extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_GALLERY()
   {
      super();
      this.dbgID = "PAUSE_MENU_GALLERY";
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
      this.CONTENT.descMC._visible = false;
      this.CONTENT.linesMC._visible = false;
      this.CONTENT.textContainerMC._visible = false;
      this.CONTENT.mapDimmerMc._visible = true;
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel();
      this.model.createView(0,{id:0,rowSpacing:2,columnSpacing:2,batchCols:4,batchRows:3,batchW:143,document:this,container:this.CONTENT,linkage:["spGalleryItem"],visibleItems:18,selectstyle:com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
      this.maxImgMC = this.CONTENT.maxImgMC;
      this.maxImgMC._visible = false;
      this.maxILMC = (com.rockstargames.ui.media.ImageLoaderMC)this.maxImgMC.imgMC.attachMovie("GenericImageLoader","il",this.maxImgMC.imgMC.getNextHighestDepth());
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.descMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.maxImgMC.maxDefaultMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.maxImgMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.mapDimmerMc,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.mapBG,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.textContainerMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.preloadTxds = true;
   }
   function getKeys()
   {
      if(Key.isDown(37))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADLEFT);
      }
      else if(Key.isDown(39))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADRIGHT);
      }
      else if(Key.isDown(38))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
      }
      else if(Key.isDown(40))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
      }
      else if(Key.isDown(32))
      {
         this.SET_DATA_SLOT_EMPTY(0);
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)this.model.getCurrentView().moveVert(-1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)this.model.getCurrentView().moveHorz(1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)this.model.getCurrentView().moveVert(1);
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)this.model.getCurrentView().moveHorz(-1);
      }
   }
   function getTxdData()
   {
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)(com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel)this.model.getCurrentView(0);
      var _loc2_ = {};
      _loc2_.txd = _loc3_.dataList[0][6];
      return _loc2_;
   }
   function SET_DESCRIPTION(max, date, location, track, visible)
   {
      this.CONTENT.descMC._visible = visible;
      this.CONTENT.linesMC._visible = visible;
      this.CONTENT.textContainerMC._visible = visible;
      var _loc5_ = arguments[0];
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel)this.model.initMaxGalleryItems(_loc5_);
      var _loc3_ = this.CONTENT.textContainerMC;
      if(date != undefined && date != "")
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.titleHeadingTF,"RP_PLAYER_MADE_TITLE");
         com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.titleHeadingTF,_loc3_.titleHeadingTF.text,true);
      }
      else
      {
         com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.titleHeadingTF,"");
      }
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.dateTF,date == undefined?"":date,true);
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.locationTF,location == undefined?"":location,true);
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.trackTF,track == undefined?"":track,true);
   }
   function SET_TITLE(txd, txn, state)
   {
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel)this.model.getCurrentView().viewContainer;
      switch(state)
      {
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_LOADED:
            this.maxImgMC.spinnerMC.stop();
            this.maxImgMC.spinnerMC._visible = false;
            this.CONTENT.frameMC._visible = true;
            this.ADD_TXD_REF(txd,txn);
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_TRANSITION:
            this.maxImgMC.spinnerMC.gotoAndPlay(this.maxImgMC.spinnerMC._currentframe == 1?2:this.maxImgMC.spinnerMC._currentframe);
            this.maxImgMC.spinnerMC._visible = true;
            this.CONTENT.frameMC._visible = false;
            if(this.maxILMC.isLoaded)
            {
               this.maxILMC.removeTxdRef();
            }
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_LOADING:
            this.maxImgMC.spinnerMC.gotoAndPlay(this.maxImgMC.spinnerMC._currentframe == 1?2:this.maxImgMC.spinnerMC._currentframe);
            this.maxImgMC.spinnerMC._visible = true;
            this.CONTENT.frameMC._visible = true;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_EMPTY:
         default:
            _loc2_._visible = true;
            this.maxImgMC._visible = false;
            this.CONTENT.frameMC._visible = false;
            if(this.maxILMC.isLoaded)
            {
               this.maxILMC.removeTxdRef();
            }
            return undefined;
      }
      _loc2_._visible = false;
      this.maxImgMC._visible = true;
   }
   function ADD_TXD_REF(txd, txn)
   {
      if(this.maxILMC.isLoaded)
      {
         this.maxILMC.removeTxdRef();
      }
      this.maxILMC.init("PAUSE_MENU_SP_CONTENT",txd,txn,578,322);
      var _loc3_ = 4;
      var _loc2_ = String(this.maxILMC).split(".");
      var _loc4_ = _loc2_.slice(_loc2_.length - _loc3_).join(".");
      this.maxILMC.addTxdRef(_loc4_);
   }
   function CLEAR_SLOT()
   {
      var _loc3_ = arguments[0];
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel)this.model.removeTxdFromSlot(_loc3_);
   }
   function ON_DESTROY()
   {
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)this.model.getCurrentView().clearDescription();
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel)this.model.onDestroy();
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      this.ON_DESTROY();
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
   }
   function SET_HIGHLIGHT(highlightIndex, staticClear)
   {
      this.CLEAR_HIGHLIGHT();
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)this.model.getCurrentView();
      _loc3_.highlightedItem = highlightIndex;
      super.SET_FOCUS(true);
      _loc3_.__set__index(highlightIndex);
      var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem)_loc3_.itemList[_loc3_.__get__index()];
      _loc4_.__set__highlighted(true);
      _loc3_.setDescription();
   }
   function SET_COMPONENT_HIDDEN()
   {
      var _loc3_ = arguments[1];
      this.CONTENT.mapDimmerMC._visible = _loc3_;
   }
   function SET_FOCUS(isFocused)
   {
      super.SET_FOCUS(isFocused);
      if(isFocused)
      {
         var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)this.model.getCurrentView();
         var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem)_loc3_.itemList[_loc3_.__get__index()];
         _loc4_.__set__highlighted(true);
         _loc3_.setDescription();
      }
   }
}
