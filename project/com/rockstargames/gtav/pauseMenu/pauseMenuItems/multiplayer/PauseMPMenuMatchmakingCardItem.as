class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var _isStandalone = true;
   var txdCallbackDepth = -1;
   static var VEHICLE_ITEM = 0;
   static var PLAYER_BET_ITEM = 1;
   static var PLAYER_ITEM = 2;
   function PauseMPMenuMatchmakingCardItem()
   {
      super();
      this.hBGColour = new com.rockstargames.ui.utils.HudColour();
      this.leftIconColour = new com.rockstargames.ui.utils.HudColour();
      this.rightIconColour = new com.rockstargames.ui.utils.HudColour();
      this.selectAlpha = 100;
      this.nonSelectAlpha = 30;
      this.kickAnim = 0;
      this.isAnimating = false;
      _global.gfxExtensions = true;
      this.labelMC.nameTF.textAutoSize = "shrink";
      this.rankNumTF.textAutoSize = "shrink";
      this.oddsTF.textAutoSize = "shrink";
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      var _loc6_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc6_);
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc6_.r,_loc6_.g,_loc6_.b,50);
      if(this.__get__data()[0] == "")
      {
         this.__get__data()[0] = "-";
      }
      this.labelMC.titleTF.text = this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.VEHICLE_ITEM?this.__get__data()[0]:"";
      this.labelMC.nameTF.text = this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.VEHICLE_ITEM?"":this.__get__data()[0];
      this.groupBGMC._visible = false;
      this.groupNumTF._visible = false;
      this.colourIconL._visible = this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.VEHICLE_ITEM;
      this.colourIconR._visible = this.colourIconL._visible;
      this.colourStrokeMC._visible = false;
      this.eyeMC._visible = false;
      if(this.crewTagMC)
      {
         this.crewTagMC._visible = false;
      }
      var _loc3_ = this.__get__data()[1];
      if(_loc3_ == undefined)
      {
         _loc3_ = 1;
      }
      if(_loc3_ == 1 || _loc3_ == 0)
      {
         var _loc7_ = !Boolean(_loc3_)?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED:com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE;
         com.rockstargames.ui.utils.Colour.setHudColour(_loc7_,this.hBGColour);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.hostMC,_loc7_);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(_loc3_,this.hBGColour);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.hostMC,_loc3_);
      }
      var _loc5_ = this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.PLAYER_BET_ITEM;
      this.setIcon(!_loc5_?this.__get__data()[2]:0,this.icon1MC);
      this.betMC._visible = _loc5_;
      this.setIcon(!_loc5_?this.__get__data()[3]:0,this.icon2MC);
      this.oddsTF._visible = _loc5_;
      if(!this.isAnimating)
      {
         this.setIcon(this.__get__data()[4],this.icon3MC);
      }
      var _loc4_ = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.carIconBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      switch(this.type)
      {
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.VEHICLE_ITEM:
            com.rockstargames.ui.utils.Colour.Colourise(this.colourIconL,this.__get__data()[5],this.__get__data()[6],this.__get__data()[7],100);
            com.rockstargames.ui.utils.Colour.Colourise(this.colourIconR,this.__get__data()[8],this.__get__data()[9],this.__get__data()[10],100);
            this.colourStrokeMC._alpha = 30;
            this.colourStrokeMC._visible = true;
            if(this.__get__data()[11])
            {
               if(isNaN(this.__get__data()[11]))
               {
                  this.labelMC.titleTF.text = "";
                  this.labelMC.nameTF.text = this.__get__data()[11];
                  this.setCrewTag(this.__get__data()[12]);
                  this.formatNameTF();
                  if(this.__get__data()[0] > 0)
                  {
                     this.setGroupedBG(this.__get__data()[0]);
                  }
               }
               else if(this.__get__data()[11] > 0)
               {
                  this.setGroupedBG(this.__get__data()[11]);
               }
            }
            _loc4_ = true;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.PLAYER_BET_ITEM:
            if(this.__get__data()[2])
            {
               this.betMC.labelMC.itemTF.text = this.__get__data()[2];
               this.betMC.bgMC._width = this.betMC.labelMC.itemTF.textWidth + 10;
               this.betMC.bgMC._x = 145 - this.betMC.bgMC._width;
            }
            else
            {
               this.betMC._visible = false;
            }
            if(this.__get__data()[3])
            {
               this.oddsTF.text = this.__get__data()[3];
            }
            else
            {
               this.oddsTF._visible = false;
            }
            var _loc8_ = Boolean(this.isSelectable);
            if(_loc8_)
            {
               this.betMC.bgMC._visible = true;
               com.rockstargames.ui.utils.Colour.ApplyHudColour(this.betMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
            }
            else
            {
               this.betMC.bgMC._visible = false;
            }
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.betMC.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            if(this.__get__data()[10])
            {
               this.eyeMC._visible = Boolean(this.__get__data()[10]);
            }
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.PLAYER_ITEM:
            if(this.__get__data()[9] > 0)
            {
               this.setGroupedBG(this.__get__data()[9]);
            }
            if(isNaN(this.__get__data()[5]))
            {
               this.setAvatarImg(this.__get__data()[5],this.__get__data()[6]);
               _loc4_ = true;
            }
            else
            {
               this.rankingTF.text = this.__get__data()[5];
               this.rankingTF._visible = this.__get__data()[5] >= 0;
               _loc4_ = this.__get__data()[5] != -1;
               if(_loc4_)
               {
                  com.rockstargames.ui.utils.Colour.ApplyHudColour(this.carIconBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
               }
               this.scoreTF.text = this.__get__data()[6];
            }
            this.setCrewTag(this.__get__data()[7]);
            this.formatNameTF();
      }
      this.rankNumTF.text = this.initialIndex;
      this.rankBGMC._visible = false;
      this.carIconBGMC._visible = _loc4_;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.__set__highlighted(this._highlighted);
      return this.__get__data();
   }
   function setGroupedBG(numMembers)
   {
      this.groupBGMC._visible = true;
      this.groupNumTF._visible = true;
      this.groupBGMC._height = 27 * numMembers - 2;
      this.groupNumTF.text = String(this.uniqueID);
      this.groupNumTF._y = this.groupBGMC._height * 0.5 - this.groupNumTF._height * 0.5;
   }
   function setIcon(iconEnum, iconMC)
   {
      if(iconEnum == undefined)
      {
         iconEnum = 0;
      }
      var _loc2_ = com.rockstargames.gtav.constants.MPIconLabels.lookUp(iconEnum)[1];
      iconMC.gotoAndStop(_loc2_);
      if(_loc2_ == "RANK_FREEMODE")
      {
         com.rockstargames.gtav.utils.GTAVUIUtils.colourRankIcon(iconMC.rankMC);
      }
      if(iconMC.animIcon)
      {
         iconMC.animIcon.play();
      }
   }
   function setAvatarImg(txd, txn)
   {
      if(txd != undefined && txn != undefined)
      {
         if(txd != "" && txn != "")
         {
            this.ADD_TXD_REF(txd,txn);
         }
      }
   }
   function setCrewTag(crewTagStr)
   {
      if(crewTagStr && crewTagStr != "")
      {
         if(!this.crewTagMC)
         {
            this.crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",this.getNextHighestDepth(),{_y:5,_xscale:70,_yscale:70});
         }
         this.crewTagMC.UNPACK_CREW_TAG(crewTagStr);
         this.crewTagMC._visible = true;
      }
   }
   function formatNameTF()
   {
      var _loc2_ = 210 - (!this.crewTagMC._visible?0:this.crewTagMC._width) - (!this.betMC._visible?0:this.betMC.bgMC._width);
      this.labelMC.nameTF._width = _loc2_;
      this.crewTagMC._x = this.labelMC._x + this.labelMC.nameTF._x + this.labelMC.nameTF.textWidth + 10;
   }
   function animateKick(doAnimate)
   {
      if(doAnimate)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.rankNumTF,1,{onCompleteScope:this,onComplete:this.kickflip});
         this.isAnimating = true;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.rankNumTF);
         this.isAnimating = false;
      }
   }
   function kickflip()
   {
      if(this.kickAnim < 1)
      {
         this.kickAnim = this.kickAnim + 1;
         §§push(this.kickAnim);
      }
      else
      {
         §§push(this.kickAnim = 0);
      }
      §§pop();
      if(this.kickAnim)
      {
         this.icon3MC.gotoAndStop("KICK");
         this.icon3MC.numTF.text = this.__get__data()[8];
         this.rankNumTF._visible = false;
      }
      else
      {
         this.icon3MC.gotoAndStop(this.__get__data()[3][2]);
         this.rankNumTF._visible = true;
      }
      this.animateKick(true);
   }
   function __set__highlighted(_h)
   {
      var _loc2_ = !_h?this.nonSelectAlpha:this.selectAlpha;
      com.rockstargames.ui.utils.Colour.Colourise(this.highlightBGMC,this.hBGColour.r,this.hBGColour.g,this.hBGColour.b,_loc2_);
      if(this.groupBGMC._visible)
      {
         this.groupNumTF._alpha = _loc2_ + 25;
         com.rockstargames.ui.utils.Colour.Colourise(this.groupBGMC,this.hBGColour.r,this.hBGColour.g,this.hBGColour.b,_loc2_);
      }
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function __set__isStandalone(_s)
   {
      this._isStandalone = _s;
      return this.__get__isStandalone();
   }
   function __get__isStandalone()
   {
      return this._isStandalone;
   }
   function ADD_TXD_REF(txd, txn)
   {
      if(this.avatarImg == undefined)
      {
         this.avatarImg = (com.rockstargames.ui.media.ImageLoaderMC)this.attachMovie("avatarImage","a",this.getNextHighestDepth(),{_x:25,_y:0});
      }
      var _loc4_ = !this.__get__isStandalone()?"PAUSE_MENU_SP_CONTENT":"mp_matchmaking_card";
      if(this.avatarImg.textureDict == txd)
      {
         if(this.avatarImg.isLoaded)
         {
            if(this.avatarImg.textureFilename != txn)
            {
               this.avatarImg.init(_loc4_,txd,txn,25,25);
               this.avatarImg.displayTxdResponse(txd);
            }
         }
      }
      else
      {
         if(this.avatarImg.isLoaded)
         {
            this.avatarImg.removeTxdRef();
         }
         this.avatarImg.init(_loc4_,txd,txn,25,25);
         var _loc2_ = !this.__get__isStandalone()?4:3;
         if(this.txdCallbackDepth != -1)
         {
            _loc2_ = this.txdCallbackDepth;
         }
         var _loc5_ = this.avatarImg.splitPath(String(this.avatarImg),_loc2_);
         this.avatarImg.requestTxdRef(_loc5_,true);
      }
   }
   function ON_DESTROY()
   {
      this.animateKick(false);
      if(this.avatarImg != undefined && this.avatarImg.isLoaded)
      {
         this.avatarImg.removeTxdRef();
      }
   }
   function mOver()
   {
   }
   function mOut()
   {
   }
   function mPress()
   {
   }
}
