class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var barIndex = 1;
   var barStep = 1;
   var multiListIndex = 0;
   var multiListItems = new Array();
   static var TYPE_MAIN_CHAR_SELECTOR = 0;
   static var TYPE_DOMINANCE_SLIDER = 1;
   static var TYPE_TEXT_ROTATOR = 2;
   static var TYPE_GRANDPARENTS_FRAME = 3;
   function PauseMenuHeritageCardItem()
   {
      super();
      this.itemTextRight = this.labelMC.valueTF;
      this.isAdjustable = true;
      this.rankBarMC = this.attachMovie("GenericColourBar","rankBarMC",this.getNextHighestDepth(),{_x:158,_y:9});
      this.rankBarMC._visible = false;
      this.barlinebgMC.swapDepths(this.getNextHighestDepth());
      this.barlineMC.swapDepths(this.getNextHighestDepth());
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.highlightMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      this.mdHighlightMC._visible = false;
      this.bgMC._visible = false;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0],true);
      var _loc9_ = 25;
      var _loc7_ = 25;
      switch(this.type)
      {
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_MAIN_CHAR_SELECTOR:
            if(this.__get__data()[1] != undefined && this.__get__data()[1] != "")
            {
               com.rockstargames.ui.utils.UIText.setSizedText(this.labelMC.midtitleTF,this.__get__data()[1],true,false,19,19);
               this.highlightMC._visible = true;
            }
            else
            {
               this.labelMC.midtitleTF.htmlText = "";
               this.itemTextRight.htmlText = "";
               this.highlightMC._visible = false;
            }
            _loc7_ = 133;
            this.rightArrowMC._y = _loc0_ = 89;
            this.leftArrowMC._y = _loc0_;
            this.barlinebgMC._visible = _loc0_ = false;
            this.barlineMC._visible = _loc0_;
            this.rankBarMC._visible = _loc0_;
            this.rightArrowMC._visible = _loc0_ = true;
            this.leftArrowMC._visible = _loc0_;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            this.grandparentsMC._visible = false;
            var _loc10_ = this.__get__data()[2] == true;
            this.mdHighlightMC._visible = _loc10_;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_DOMINANCE_SLIDER:
            if(this.__get__data()[1] != undefined)
            {
               this.rankBarMC.init(this.__get__data()[1],108,6);
               this.rankBarMC.mc.baralphaMC._alpha = 30;
               this.rankBarMC.mc.blackMC._alpha = 80;
               this.rankBarMC.percent(50);
            }
            this.labelMC.maleMC._alpha = _loc0_ = 100;
            this.labelMC.femaleMC._alpha = _loc0_;
            this.__set__barscale(this.initialIndex);
            this.barlinebgMC._visible = _loc0_ = true;
            this.barlineMC._visible = _loc0_;
            this.rankBarMC._visible = _loc0_;
            this.rightArrowMC._visible = _loc0_ = false;
            this.leftArrowMC._visible = _loc0_;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            this.grandparentsMC._visible = false;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_TEXT_ROTATOR:
            this.multiListItems = this.__get__data().slice(1);
            this.__set__textIndex(this.initialIndex);
            this.barlinebgMC._visible = _loc0_ = false;
            this.barlineMC._visible = _loc0_;
            this.rankBarMC._visible = _loc0_;
            this.rightArrowMC._visible = _loc0_ = false;
            this.leftArrowMC._visible = _loc0_;
            this.labelMC.lMC._visible = _loc0_ = this.__get__data()[2];
            this.labelMC.rMC._visible = _loc0_;
            this.grandparentsMC._visible = false;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_GRANDPARENTS_FRAME:
            if(this.__get__data()[1] != undefined && this.__get__data()[1] != "")
            {
               com.rockstargames.ui.utils.UIText.setSizedText(this.labelMC.midtitleTF,this.__get__data()[1],true,false,19,19);
               this.highlightMC._visible = true;
            }
            else
            {
               this.labelMC.midtitleTF.htmlText = "";
               this.itemTextRight.htmlText = "";
               this.highlightMC._visible = false;
            }
            _loc7_ = 79;
            this.rightArrowMC._y = _loc0_ = 89;
            this.leftArrowMC._y = _loc0_;
            this.barlinebgMC._visible = _loc0_ = false;
            this.barlineMC._visible = _loc0_;
            this.rankBarMC._visible = _loc0_;
            this.rightArrowMC._visible = _loc0_ = true;
            this.leftArrowMC._visible = _loc0_;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            this.grandparentsMC._visible = true;
            var _loc4_ = 1;
            while(_loc4_ <= 4)
            {
               var _loc6_ = this.grandparentsMC["c" + _loc4_ + "MC"];
               var _loc5_ = 2 + (_loc4_ - 1);
               var _loc3_ = this.__get__data()[_loc5_];
               if(_loc3_ == false)
               {
                  _loc3_ = 1;
               }
               else if(_loc3_ == true)
               {
                  _loc3_ = 2;
               }
               _loc6_.gotoAndStop(_loc3_);
               _loc4_ = _loc4_ + 1;
            }
            var _loc8_ = this.__get__data()[6];
            if(_loc8_ == undefined)
            {
               _loc8_ = 0;
            }
            if(_loc8_ == 0)
            {
               this.grandparentsMC.highlightMC._visible = false;
            }
            else
            {
               this.grandparentsMC.highlightMC._visible = true;
               this.grandparentsMC.highlightMC._x = 72 * (_loc8_ - 1);
            }
      }
      this.labelMC._y = _loc0_ = _loc7_ - _loc9_;
      this.highlightMC._y = _loc0_;
      this.bgMC._height = _loc7_;
      this.__set__highlighted(this._highlighted);
      return this.__get__data();
   }
   function initStoreMethod(func, scope)
   {
      this.storeFunc = func;
      this.storeScope = scope;
   }
   function __set__barscale(bi)
   {
      this.barIndex = bi;
      this.selectedIndex = this.barIndex;
      this.selectedValue = this.barIndex;
      this.rankBarMC.setFillX(54 * (this.selectedValue / 100));
      return this.__get__barscale();
   }
   function __set__textIndex(ti)
   {
      this.multiListIndex = ti;
      this.selectedIndex = this.multiListIndex;
      this.selectedValue = this.multiListItems[this.multiListIndex];
      var _loc2_ = this.selectedValue;
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,_loc2_);
      this.itemTextRight.autoSize = true;
      if(this.itemTextRight._width > 128)
      {
         this.itemTextRight.autoSize = false;
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,_loc2_,true);
         this.itemTextRight._width = 128;
      }
      this.itemTextRight._x = this.labelMC.rMC._x - this.itemTextRight._width - 2;
      this.labelMC.lMC._x = this.itemTextRight._x - 2;
      return this.__get__textIndex();
   }
   function stepVal(dir)
   {
      switch(this.type)
      {
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_DOMINANCE_SLIDER:
            this.barIndex = this.barIndex + dir * this.barStep;
            if(this.barIndex < 1)
            {
               this.barIndex = 1;
            }
            if(this.barIndex > 100)
            {
               this.barIndex = 100;
            }
            this.__set__barscale(this.barIndex);
            this.storeFunc.apply(this.storeScope,[this.index,this.barIndex]);
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_TEXT_ROTATOR:
            this.multiListIndex = this.multiListIndex + dir;
            if(this.multiListIndex < 0)
            {
               this.multiListIndex = this.multiListItems.length - 1;
            }
            if(this.multiListIndex > this.multiListItems.length - 1)
            {
               this.multiListIndex = 0;
            }
            this.__set__textIndex(this.multiListIndex);
            this.storeFunc.apply(this.storeScope,[this.index,this.multiListIndex]);
      }
   }
   function __set__highlighted(_h)
   {
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      if(_h)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc3_);
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_MAIN_CHAR_SELECTOR)
         {
            this.leftArrowMC._alpha = this.rightArrowMC._alpha = 100;
         }
         else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_TEXT_ROTATOR)
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = this.__get__data()[2];
            this.itemTextRight._x = this.labelMC.rMC._x - this.itemTextRight._width - 2;
            this.labelMC.lMC._x = this.itemTextRight._x - 2;
         }
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc2_);
         if(this.isSelectable == 1)
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_GREY,_loc3_);
         }
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_MAIN_CHAR_SELECTOR)
         {
            this.leftArrowMC._alpha = this.rightArrowMC._alpha = 0;
         }
         else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_TEXT_ROTATOR)
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
            this.itemTextRight._x = 282 - this.itemTextRight._width;
         }
      }
      if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_MAIN_CHAR_SELECTOR || this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem.TYPE_GRANDPARENTS_FRAME)
      {
         _loc2_.r = _loc2_.g = _loc2_.b = 0;
         _loc2_.a = 100;
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.highlightMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
