class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var IS_SELECTABLE_GAP = 2;
   var IS_SELECTABLE_GAP_ALT = 3;
   var IS_CHARCREATOR_NOGAP = 4;
   var IS_SELECTABLE_NOGAP = -2;
   var modeIcon = 0;
   var _isLastVisibleItem = false;
   var _isCharCreatorItem = false;
   static var CYCLE_OPTION_ITEM = 0;
   static var COLOUR_ALL_ITEM = 2;
   static var PROGRESS_ITEM = 3;
   static var PULSE_ITEM = 4;
   static var ARROW_PADDING = 4;
   static var RIGHT_TXT_BG_PADDING = 3;
   static var RIGHT_TXT_OFFSET = 6;
   function PauseMenuFreemodeItem()
   {
      super();
      _global.gfxExtensions = true;
      this.itemTextRight = this.valueMC.valueTF;
      this.leftTabMC._visible = false;
      this.labelMC.rMC._visible = false;
      this.labelMC.lMC._visible = false;
      this.textBGMC._visible = false;
      this.colourBGMC._visible = false;
      this.statIconMC._visible = false;
      this.labelMC.barMC._visible = false;
      this.labelMC.barMC._visible = false;
      this.checkMC._visible = false;
      this.altMC._visible = false;
      this.isOption = false;
      this.hasIconText = false;
      this.hasRightTextBG = false;
      this.__set__highlighted(false);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
   }
   function setTitle()
   {
      this.itemTextLeft.textAutoSize = "none";
      this.itemTextLeft.autoSize = "left";
      this.itemTextLeft.multiline = false;
      this.itemTextLeft.wordWrap = false;
      this.itemTextLeft._x = 144 - this.itemTextLeft._width / 2;
   }
   function checkSelectable()
   {
      var _loc2_ = true;
      if(this.isSelectable == -1 || this.isSelectable == -2 || this.isSelectable == false)
      {
         _loc2_ = false;
      }
      if(this.isSelectable == this.IS_SELECTABLE_GAP)
      {
         _loc2_ = false;
      }
      return _loc2_;
   }
   function mouseOver(b)
   {
      if(this.checkSelectable() == true)
      {
         if(b)
         {
            if(!this.__get__highlighted())
            {
               this.bMC._alpha = 20;
            }
         }
         else
         {
            this.bMC._alpha = 0;
         }
      }
   }
   function mPress()
   {
      if(this.checkSelectable() == true)
      {
         if(!this.__get__highlighted())
         {
            _level0.TIMELINE.M_PRESS_EVENT(this.index,this.__get__columnID(),false);
         }
         else
         {
            _level0.TIMELINE.M_PRESS_EVENT(this.index,this.__get__columnID(),true);
         }
      }
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      var _loc4_ = this.__get__data()[0];
      if(_loc4_ == undefined)
      {
         _loc4_ = "";
      }
      var _loc12_ = com.rockstargames.gtav.utils.GTAVUIUtils.parseHTMLForFonts(_loc4_,com.rockstargames.ui.utils.UIText.SIZE);
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,_loc12_,true);
      this.topBorderMC._visible = false;
      var _loc11_ = this.__get__data()[1];
      this.modeIcon = this.__get__data()[2];
      var _loc9_ = _loc11_ + 1;
      this.labelMC.verifiedMC.gotoAndStop(_loc9_);
      var _loc3_ = 1;
      if(this.modeIcon != undefined)
      {
         _loc3_ = this.modeIcon + 1;
      }
      this.gamemodeMC.gotoAndStop(_loc3_);
      if(this.modeIcon != 0 && this.__get__data()[3] != undefined)
      {
         if(typeof this.__get__data()[3] == "number")
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.gamemodeMC,this.__get__data()[3]);
         }
      }
      this.checkMC._visible = this.__get__data()[9];
      this.hasRightTextBG = this.initialIndex > 0;
      if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.PULSE_ITEM)
      {
         this.hasRightTextBG = false;
      }
      this.isOption = this.__get__data()[3] != undefined && this.__get__data()[3] != -1 && this.modeIcon == 0;
      if(this.isOption)
      {
         if(this.modeIcon != 0)
         {
            this.itemTextRight.htmlText = "";
         }
         else
         {
            var _loc7_ = com.rockstargames.gtav.utils.GTAVUIUtils.parseHTMLForFonts(this.__get__data()[3],com.rockstargames.ui.utils.UIText.SIZE);
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,_loc7_);
            this.itemTextRight.autoSize = true;
            if(this.itemTextRight._width > 128)
            {
               this.itemTextRight.autoSize = false;
               com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,_loc7_,true);
               this.itemTextRight._width = 128;
            }
            this.itemTextRight._x = Math.round(this.bgMC._width - this.itemTextRight._width - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_OFFSET);
         }
         if(this.hasRightTextBG)
         {
            this.textBGMC._width = this.itemTextRight._width + com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING * 2;
            this.textBGMC._x = this.itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING;
            this.textBGMC._visible = true;
         }
      }
      else
      {
         this.itemTextRight.htmlText = "";
      }
      if(_loc3_ > 1)
      {
         if(this.isOption)
         {
            this.hasIconText = true;
            this.itemTextRight._x = Math.round(250 - this.itemTextRight._width);
         }
         else
         {
            this.itemTextLeft._width = 250;
            this.hasIconText = false;
         }
      }
      else
      {
         this.hasIconText = false;
      }
      this.colourBGMC.gotoAndStop("idle");
      if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.PROGRESS_ITEM)
      {
         if(!this.bar)
         {
            this.labelMC.attachMovie("freemodeItemBar","barMC",this.getNextHighestDepth(),{_x:162,_y:10});
            this.bar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.labelMC.barMC.innerMC);
            this.bar.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE);
         }
         var _loc8_ = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(this.__get__data()[5] * 100,22,2,5);
         this.bar.percent(_loc8_);
      }
      else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.COLOUR_ALL_ITEM)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.leftTabMC,this.__get__data()[4]);
      }
      if(this.__get__data()[7])
      {
         this.topBorderMC._y = -2;
         this.topBorderMC._visible = true;
      }
      this.altMC._visible = false;
      var _loc5_ = this.isSelectable != 0 && this.isSelectable != this.IS_SELECTABLE_NOGAP && this.isSelectable != this.IS_CHARCREATOR_NOGAP;
      if(this.isSelectable == this.IS_SELECTABLE_GAP_ALT)
      {
         _loc5_ = false;
         this.dummybgMC._height = this.altMC._height = 25;
      }
      else
      {
         this.dummybgMC._height = this.altMC._height = 27;
      }
      if(_loc5_)
      {
         this.dummybgMC._visible = false;
      }
      else
      {
         if(this._isCharCreatorItem == false)
         {
            this.dummybgMC._visible = true;
         }
         var _loc6_ = true;
         if(this.isSelectable == this.IS_CHARCREATOR_NOGAP)
         {
            _loc6_ = false;
         }
         if(_loc6_)
         {
            var _loc10_ = this.index % 2 == 0;
            if(!_loc10_)
            {
               com.rockstargames.ui.utils.Colour.ApplyHudColour(this.altMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
               this.altMC._alpha = 20;
               this.altMC._visible = true;
            }
         }
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.dummybgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      }
      if(this._isLastVisibleItem)
      {
         this.dummybgMC._height = 25;
      }
      this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
      this.__set__highlighted(this._highlighted);
      return this.__get__data();
   }
   function __set__isLastVisibleItem(_b)
   {
      this._isLastVisibleItem = _b;
      if(this._isCharCreatorItem == true)
      {
         this.dummybgMC._height = !this._isLastVisibleItem?27:25;
      }
      return this.__get__isLastVisibleItem();
   }
   function __get__isLastVisibleItem()
   {
      return this._isLastVisibleItem;
   }
   function __set__isCharCreatorItem(_b)
   {
      this._isCharCreatorItem = _b;
      if(this._isCharCreatorItem == true)
      {
         this.dummybgMC._visible = false;
      }
      return this.__get__isCharCreatorItem();
   }
   function __get__isCharCreatorItem()
   {
      return this._isCharCreatorItem;
   }
   function __set__highlighted(_h)
   {
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc11_ = 100;
      var _loc7_ = 100;
      if(this.isSelectable < 0 && this.isSelectable != this.IS_SELECTABLE_NOGAP || this.isSelectable == this.IS_SELECTABLE_GAP)
      {
         _loc7_ = !_h?30:60;
      }
      if(_h)
      {
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.PULSE_ITEM)
         {
            this.colourBGMC._visible = true;
            this.colourBGMC.gotoAndStop("idle");
            this.colourBGMC._alpha = 100;
         }
         else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.COLOUR_ALL_ITEM)
         {
            this.colourBGMC._visible = false;
            com.rockstargames.ui.utils.Colour.setHudColour(this.__get__data()[4],_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc4_);
            if(this.hasRightTextBG)
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE,_loc2_);
            }
            else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM && this.__get__data()[5])
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY,_loc2_);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
            }
         }
         var _loc5_ = new com.rockstargames.ui.utils.HudColour();
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc5_);
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC.verifiedMC,_loc5_.r,_loc5_.g,_loc5_.b,_loc5_.a);
         if(this.isOption && this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM || this.isOption && this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.PULSE_ITEM)
         {
            var _loc6_ = this.__get__data()[8];
            var _loc9_ = (!this.hasRightTextBG?0:com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING) + com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.ARROW_PADDING;
            if(_loc6_ == 1)
            {
               this.itemTextRight._x = Math.round(this.labelMC.rMC._x - _loc9_ - this.itemTextRight._width);
               this.labelMC.rMC._visible = true;
               this.labelMC.lMC._visible = false;
            }
            else if(_loc6_ == -1)
            {
               this.itemTextRight._x = 286 - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING - this.itemTextRight._width;
               this.labelMC.rMC._visible = false;
               this.labelMC.lMC._visible = true;
            }
            else if(_loc6_ == undefined || _loc6_ == 0)
            {
               this.itemTextRight._x = Math.round(this.labelMC.rMC._x - _loc9_ - this.itemTextRight._width);
               this.labelMC.rMC._visible = this.labelMC.lMC._visible = true;
            }
            this.textBGMC._x = this.itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING;
            this.labelMC.lMC._x = this.itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.ARROW_PADDING - (!this.hasRightTextBG?0:com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING);
         }
         else
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
         }
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.PULSE_ITEM)
         {
            this.bgMC._visible = false;
         }
         else
         {
            this.bgMC._visible = true;
         }
      }
      else
      {
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.PULSE_ITEM)
         {
            this.colourBGMC._visible = true;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.colourBGMC,this.__get__data()[6]);
            this.colourBGMC.gotoAndPlay("loop");
            this.colourBGMC._alpha = 30;
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         }
         else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.COLOUR_ALL_ITEM)
         {
            this.colourBGMC._visible = true;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.colourBGMC,this.__get__data()[4]);
            this.colourBGMC._alpha = 30;
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
         }
         else
         {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc4_);
            if(this.hasRightTextBG)
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE,_loc2_);
            }
            else if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM && this.__get__data()[5])
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY,_loc2_);
            }
            else
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
            }
         }
         if(this.isOption)
         {
            if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.PULSE_ITEM || this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM)
            {
               this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
               this.itemTextRight._x = Math.round(this.bgMC._width - this.itemTextRight._width - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_OFFSET);
               this.textBGMC._x = this.itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING;
            }
         }
         if(this.hasIconText)
         {
            this.itemTextRight._x = Math.round(262 - this.itemTextRight._width);
         }
         var _loc8_ = this.isSelectable != 0 && this.isSelectable != this.IS_SELECTABLE_NOGAP && this.isSelectable != this.IS_CHARCREATOR_NOGAP;
         if(this.isSelectable == this.IS_SELECTABLE_GAP_ALT)
         {
            _loc8_ = false;
         }
         this.bgMC._visible = _loc8_;
      }
      if(this.modeIcon != 0 && (this.__get__data()[3] == undefined || this.__get__data()[3] == 0))
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.gamemodeMC,!_h?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE:com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      }
      if(this.bgMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      if(this.labelMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc7_);
         com.rockstargames.ui.utils.Colour.Colourise(this.valueMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc7_);
         if(this.hasRightTextBG)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.textBGMC,this.initialIndex);
         }
      }
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
