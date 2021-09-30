class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_PLAYER_MODEL extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MP_MENU_PLAYER_MODEL()
   {
      super();
      this.dbgID = "PAUSE_MP_MENU_PLAYER_MODEL";
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
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,container:this.CONTENT,linkage:["verticalMenuListItem"],visibleItems:15,selectstyle:com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
      this.CONTENT.bountyMC._alpha = 0;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      if(itemIndex == undefined)
      {
         itemIndex = 0;
      }
      this.model.displayView(viewIndex,itemIndex);
      var _loc4_ = this.model.getCurrentView().viewContainer;
      var _loc3_ = 2;
      if(_loc4_._height == 0)
      {
         _loc3_ = 0;
      }
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
   }
   function SET_TITLE(str)
   {
      var _loc3_ = arguments[1];
      var _loc4_ = false;
      if(typeof _loc3_ == "number")
      {
         if(_loc3_ >= 1 && _loc3_ <= 2)
         {
            _loc4_ = true;
            this.CONTENT.hintsMC.iconMC.gotoAndStop(_loc3_ + 1);
         }
         else if(_loc3_ == 0)
         {
            _loc4_ = false;
            this.CONTENT.hintsMC.iconMC.gotoAndStop(1);
         }
      }
      var _loc5_ = false;
      var _loc9_ = arguments[2];
      if(str != "" && str != undefined)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.hintsMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
         com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.hintsMC.titleTF,str);
         _loc5_ = true;
      }
      this.CONTENT.hintsMC.iconMC._visible = _loc4_;
      this.CONTENT.hintsMC.titleTF._x = !_loc4_?5:24;
      this.CONTENT.hintsMC._alpha = !_loc5_?0:100;
      this.CONTENT.bountyMC._alpha = !_loc9_?0:100;
      var _loc7_ = arguments[3];
      var _loc6_ = arguments[4];
      if(_loc7_ != undefined && _loc6_ != undefined)
      {
         this.ADD_TXD_REF(_loc7_,_loc6_);
      }
      else if(this.crewImage.isLoaded == true)
      {
         this.crewImage.removeTxdRef();
      }
   }
   function ADD_TXD_REF(txd, txn)
   {
      if(this.crewImage == undefined)
      {
         this.crewImage = (com.rockstargames.ui.media.ImageLoaderMC)this.CONTENT.attachMovie("GenericImageLoader","crewEmblemImageMC",this.CONTENT.getNextHighestDepth(),{_x:214,_y:10});
      }
      if(this.crewImage.isLoaded == true)
      {
         this.crewImage.removeTxdRef();
      }
      this.crewImage.init("PAUSE_MENU_SP_CONTENT",txd,txn,64,64);
      var _loc3_ = 2;
      var _loc2_ = String(this.crewImage).split(".");
      var _loc4_ = _loc2_.slice(_loc2_.length - _loc3_).join(".");
      this.crewImage.addTxdRef(_loc4_);
   }
   function ON_DESTROY()
   {
      if(this.crewImage.isLoaded == true)
      {
         this.crewImage.removeTxdRef();
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            this.model.prevItem();
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            this.model.nextItem();
      }
   }
}
