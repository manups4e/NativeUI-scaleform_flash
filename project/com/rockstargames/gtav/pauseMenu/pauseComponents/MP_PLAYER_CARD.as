class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_PLAYER_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var DESC_TYPE_TXT = 0;
   var DESC_TYPE_SC = 1;
   var DESC_TYPE_INV_SENT = 2;
   var startStatLabelAnim = false;
   var delay = 3;
   function MP_PLAYER_CARD()
   {
      super();
      this.dbgID = "MP_PLAYER_CARD";
      _global.gfxExtensions = true;
   }
   function DISPLAY_VIEW()
   {
   }
   function INITIALISE(mc, bCollapse)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      this.statMCs = [];
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.headerBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.statsBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.item0TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.item1TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.item2TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      var _loc3_ = this.CONTENT.vehiclePanelMC;
      _loc3_.titleTF.textAutoSize = "shrink";
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(_loc3_.titleTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.wrapperMC.vehicleMC1,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.wrapperMC.vehicleMC2,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.wrapperMC.vehicleMC3,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.wrapperMC.vehicleMC4,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      if(_loc3_.wrapperMC.micMC)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.wrapperMC.micMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.crewInfoMC.crewNameTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.crewInfoMC.rankNameTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      if(bCollapse)
      {
         this.RANK_TEXT_CENTER_X = 69;
         this.RANK_TEXT_DEFAULT_WIDTH = 46;
         this.RANK_TEXT_MAX_HEIGHT = 46;
         this.RANK_TEXT_HEIGHT_MULTIPLIER = 15;
         this.RANK_TEXTFIELD_MAX_WIDTH = 65;
         this.statID = "playerComparisonItem";
      }
      else
      {
         this.RANK_TEXT_CENTER_X = 46;
         this.RANK_TEXT_DEFAULT_WIDTH = 60;
         this.RANK_TEXT_MAX_HEIGHT = 46;
         this.RANK_TEXT_HEIGHT_MULTIPLIER = 15;
         this.RANK_TEXTFIELD_MAX_WIDTH = 70;
         this.statID = "statItem";
      }
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3_.titleTF,"VEH_ACCESS",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,false);
      com.rockstargames.ui.utils.UIText.setSizedText(_loc3_.titleTF,_loc3_.titleTF.text,true);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.descMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      this.CONTENT.descMC._visible = false;
      this.CONTENT.rankNumTF.textAutoSize = "shrink";
      this.CONTENT.crewInfoMC.crewRankTF.textAutoSize = "shrink";
      this.CONTENT.crewInfoMC._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.crewInfoMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
   }
   function SET_TITLE(title)
   {
      com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.titleTF,title,true,false,18,18);
      this.playerColourEnum = arguments[2];
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.titleBGMC,this.playerColourEnum);
      if(arguments[1] == "" || arguments[1] == undefined)
      {
         this.CONTENT.crewInfoMC._visible = false;
         this.CONTENT.crewTagMC._visible = false;
      }
      else
      {
         this.CONTENT.crewTagMC.UNPACK_CREW_TAG(arguments[5]);
         this.CONTENT.crewTagMC._x = this.CONTENT.titleTF._x + this.CONTENT.titleTF.textWidth + 10;
         this.CONTENT.crewTagMC._visible = true;
         this.CONTENT.crewInfoMC.crewTagMC.UNPACK_CREW_TAG(arguments[5]);
         var _loc4_ = arguments[6];
         var _loc3_ = arguments[7];
         if(_loc4_ && _loc3_)
         {
            com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.crewInfoMC.crewNameTF,arguments[1],true);
            com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.crewInfoMC.rankNameTF,arguments[4],true);
            this.CONTENT.crewInfoMC.crewRankTF.text = arguments[8] == undefined?"":arguments[8];
            if(!this.crewEmblemMC)
            {
               var _loc6_ = 41;
               if(this.CONTENT.vehiclePanelMC._width > 150)
               {
                  _loc6_ = 10;
               }
               this.crewEmblemMC = this.CONTENT.crewInfoMC.cMC.attachMovie("GenericImageLoader","playerCardCrewEmblemMC",this.CONTENT.crewInfoMC.getNextHighestDepth(),{_x:_loc6_,_y:9});
            }
            if(this.crewEmblemMC.textureFilename != _loc3_ && this.crewEmblemMC.textureDict != _loc4_)
            {
               if(this.crewEmblemMC.isLoaded)
               {
                  this.crewEmblemMC.removeTxdRef();
               }
               this.crewEmblemMC.init("PAUSE_MENU_SP_CONTENT",_loc4_,_loc3_,61,61);
               var _loc7_ = 4;
               var _loc5_ = String(this.crewEmblemMC).split(".");
               var _loc8_ = _loc5_.slice(_loc5_.length - _loc7_).join(".");
               com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.crewEmblemMC);
               this.crewEmblemMC._alpha = 100;
               this.crewEmblemMC.addTxdRef(_loc8_,this.txdloaded,this);
            }
            if(arguments[9] != undefined)
            {
               if(this.CONTENT.crewInfoMC.rankBGMC)
               {
                  com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.crewInfoMC.rankBGMC,arguments[9],arguments[10],arguments[11],100);
               }
               this.CONTENT.crewInfoMC._visible = true;
            }
         }
      }
      com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.titleValTF,!arguments[13]?"":arguments[13]);
      if(this.CONTENT.crewInfoMC._visible)
      {
         this.CONTENT.descMC._visible = false;
      }
   }
   function ON_DESTROY()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.crewEmblemMC);
      this.startStatLabelAnim = true;
   }
   function txdloaded()
   {
      this.crewEmblemMC._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.crewEmblemMC,0.2,{_alpha:100});
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      if(_viewIndex == 0)
      {
         var _loc15_ = this.CONTENT.vehiclePanelMC.wrapperMC;
         var _loc19_ = arguments[4];
         if(_loc19_ > 0 && _loc15_.micMC)
         {
            _loc15_.micMC.gotoAndStop(_loc19_ + 1);
         }
         _loc15_.vehicleMC1._alpha = !arguments[5]?30:100;
         _loc15_.vehicleMC2._alpha = !arguments[6]?30:100;
         _loc15_.vehicleMC3._alpha = !arguments[7]?30:100;
         _loc15_.vehicleMC4._alpha = !arguments[8]?30:100;
         var _loc20_ = arguments[9];
         this.CONTENT.rankNumTF._width = this.RANK_TEXT_DEFAULT_WIDTH * 0.5;
         this.CONTENT.rankNumTF.text = _loc20_;
         this.CONTENT.rankNumTF._width = Math.min(this.RANK_TEXTFIELD_MAX_WIDTH,this.RANK_TEXT_DEFAULT_WIDTH + (this.RANK_TEXT_MAX_HEIGHT / this.CONTENT.rankNumTF.textHeight - 1) * this.RANK_TEXT_HEIGHT_MULTIPLIER) * 0.5;
         this.CONTENT.rankNumTF._x = this.RANK_TEXT_CENTER_X - this.CONTENT.rankNumTF._width * 0.5;
         if(this.CONTENT.rankEmblemMC)
         {
            var _loc21_ = com.rockstargames.ui.utils.HudColour.getGlobeColID(_loc20_);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.rankEmblemMC,_loc21_);
         }
         var _loc13_ = arguments.length;
         var _loc4_ = 10;
         var _loc6_ = 0;
         while(_loc4_ < _loc13_)
         {
            var _loc5_ = this.CONTENT["item" + _loc6_ + "TF"];
            if(_loc5_ != undefined)
            {
               var _loc9_ = arguments[_loc4_] == undefined?"":arguments[_loc4_];
               com.rockstargames.ui.utils.UIText.setSizedText(_loc5_,_loc9_,true);
            }
            var _loc8_ = arguments[_loc4_ + 1];
            var _loc7_ = this.CONTENT["icon" + _loc6_ + "MC"];
            _loc7_.gotoAndStop(com.rockstargames.gtav.constants.MPIconLabels.lookUp(_loc8_)[1]);
            if(_loc8_ != com.rockstargames.gtav.constants.MPIconLabels.EMPTY[0])
            {
               _loc5_._x = 82;
               if(_loc7_)
               {
                  com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc7_,arguments[_loc4_ + 2]);
               }
            }
            _loc4_ = _loc4_ + 3;
            _loc6_ = _loc6_ + 1;
         }
         this.startStatLabelAnim = false;
      }
      else
      {
         var _loc14_ = _viewIndex - 1;
         var _loc12_ = undefined;
         if(!this.statMCs[_loc14_])
         {
            _loc12_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem)this.CONTENT.attachMovie(this.statID,this.statID + _loc14_ + "MC",_loc14_);
            _loc12_.bgMC._visible = false;
            _loc12_._y = this.CONTENT.headerBGMC._y + this.CONTENT.headerBGMC._height + 2 + _loc14_ * _loc12_._height;
            this.statMCs[_loc14_] = _loc12_;
            var _loc23_ = _loc12_.__get__isCompareWidth();
            var _loc11_ = this.statMCs.length;
            var _loc10_ = 200 / _loc11_;
            var _loc18_ = 5;
            if(_loc11_ > _loc18_)
            {
               var _loc16_ = 4 - 2 * (_loc11_ - _loc18_);
               var _loc17_ = 26 - 2 * (_loc11_ - _loc18_);
               var _loc24_ = 26 - 2 * (_loc11_ - _loc18_);
               _loc4_ = 0;
               while(_loc4_ < _loc11_)
               {
                  var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem)this.statMCs[_loc4_];
                  _loc3_.innerMC.titleTF._y = _loc3_.innerMC.valTF._y = _loc16_;
                  _loc3_.innerMC.progressBarMC._y = _loc17_;
                  _loc3_.bgMC._height = _loc10_;
                  _loc3_._y = this.CONTENT.headerBGMC._y + this.CONTENT.headerBGMC._height + 2 + _loc4_ * _loc10_;
                  _loc4_ = _loc4_ + 1;
               }
            }
         }
         else
         {
            _loc12_ = this.statMCs[_loc14_];
         }
         _loc12_._visible = true;
         _loc12_.setColour(this.playerColourEnum);
         _loc12_.init(arguments);
         this.CONTENT.vehiclePanelMC._y = Math.round(_loc12_._y + _loc12_._height);
         this.CONTENT.crewInfoMC._y = this.CONTENT.vehiclePanelMC._y + 43;
         this.CONTENT.descMC._y = this.CONTENT.crewInfoMC._y;
         this.CONTENT.statsBGMC._height = this.CONTENT.crewInfoMC._y - 2 - this.CONTENT.statsBGMC._y;
         this.setOffBlinking(_viewIndex);
      }
   }
   function setOffBlinking(i)
   {
      if(i == 5 && !this.startStatLabelAnim)
      {
         var _loc2_ = this.statMCs[0];
         if(_loc2_.__get__isCompareWidth())
         {
            this.showStatCat();
            this.startStatLabelAnim = true;
         }
      }
   }
   function showStatCat()
   {
      var _loc4_ = this.statMCs.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.statMCs[_loc2_];
         _loc3_.blinkText(_loc3_.lbl);
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.delay,{onComplete:this.showStatVal,onCompleteScope:this});
   }
   function showStatVal()
   {
      var _loc4_ = this.statMCs.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.statMCs[_loc2_];
         _loc3_.blinkText(_loc3_.val);
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.delay,{onComplete:this.showStatCat,onCompleteScope:this});
   }
   function SET_DESCRIPTION(descStr, descType, crewTagStr, bCollapse)
   {
      if(descStr != "")
      {
         var _loc2_ = this.CONTENT.descMC;
         if(this.btnLayer)
         {
            this.btnLayer.removeMovieClip();
         }
         this.btnLayer = _loc2_.createEmptyMovieClip("btnLayer",1000);
         _loc2_.crewUpIconMC._visible = descType == this.DESC_TYPE_SC;
         _loc2_.crewTagMC._visible = descType == this.DESC_TYPE_INV_SENT;
         if(descType == this.DESC_TYPE_TXT)
         {
            _loc2_.descTF._x = 5;
            _loc2_.descTF._width = 278;
         }
         else
         {
            _loc2_.descTF._x = 54;
            _loc2_.descTF._width = 225;
            if(descType == this.DESC_TYPE_INV_SENT)
            {
               _loc2_.crewTagMC.UNPACK_CREW_TAG(crewTagStr);
            }
         }
         var _loc4_ = new com.rockstargames.ui.utils.Text();
         _loc4_.setTextWithIcons(descStr,this.btnLayer,_loc2_.descTF,0,13,6,false);
         if(bCollapse)
         {
            _loc2_.descTF._width = _loc2_.descTF._width - 144;
         }
         _loc2_.bgMC._width = !bCollapse?288:143;
         _loc2_.bgMC._height = 79;
         _loc2_._visible = !this.CONTENT.crewInfoMC._visible;
      }
      else
      {
         _loc2_._visible = false;
      }
   }
   function SET_DATA_SLOT_EMPTY()
   {
      var _loc3_ = this.statMCs.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (MovieClip)this.statMCs[_loc2_].removeMovieClip();
         this.statMCs[_loc2_] = null;
         _loc2_ = _loc2_ + 1;
      }
      if(this.CONTENT.descMC)
      {
         this.CONTENT.descMC._visible = false;
      }
      this.ON_DESTROY();
      this.CONTENT.crewInfoMC._visible = false;
   }
}
