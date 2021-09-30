class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var textureDict = "";
   var textureFilename = "";
   function PauseMPMenuAwardsItem()
   {
      super();
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.highlightMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.labelMC._visible = false;
      this.highlightMC._visible = false;
      this.awardsbarMC._visible = false;
      this.bar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.awardsbarMC);
      this.bgMC._visible = false;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.textureDict = this.__get__data()[2];
      this.textureFilename = this.__get__data()[3];
      this.colour = this.__get__data()[4];
      var _loc4_ = this.__get__data()[5];
      this.lockMC._visible = this.initialIndex == 1;
      if(this.textureDict != undefined && this.textureFilename != undefined)
      {
         this.ADD_TXD_REF(this.textureDict,this.textureFilename);
      }
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      if(this.colour != undefined)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(this.colour,_loc3_);
         this.bar.init(this.colour);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE,_loc3_);
         this.bar.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE);
      }
      if(this.imageMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.imageMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      if(_loc4_ == undefined || _loc4_ == -1)
      {
         this.awardsbarMC._visible = false;
      }
      else if(_loc4_ >= 100)
      {
         this.awardsbarMC._visible = false;
         this.labelMC._visible = true;
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.labelMC.completionTF,"AWARD_COMPLETE",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,false);
      }
      else
      {
         this.bar.percent(_loc4_);
         this.awardsbarMC._visible = true;
         this.labelMC._visible = false;
      }
      var _loc5_ = 0.4;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,_loc5_,{_alpha:100});
      return this.__get__data();
   }
   function ADD_TXD_REF(txd, txn)
   {
      if(this.imgLoader == undefined)
      {
         this.imgLoader = (com.rockstargames.ui.media.ImageLoaderMC)this.imageMC.attachMovie("GenericImageLoader","gMC",this.imageMC.getNextHighestDepth());
      }
      this.REMOVE_TXD_REF();
      this.imgLoader.init("PAUSE_MENU_SP_CONTENT",txd,txn);
      var _loc3_ = 5;
      var _loc2_ = String(this.imgLoader).split(".");
      var _loc4_ = _loc2_.slice(_loc2_.length - _loc3_).join(".");
      this.imgLoader.addTxdRef(_loc4_,this.TXD_LOADED,this);
   }
   function TXD_LOADED()
   {
      this.imgLoader._xscale = this.imgLoader._yscale = 65;
      this.imgLoader._x = 71.5 - this.imgLoader._width / 2;
      this.imgLoader._y = 45 - this.imgLoader._height / 2;
   }
   function ON_DESTROY()
   {
      this.REMOVE_TXD_REF();
   }
   function REMOVE_TXD_REF()
   {
      if(this.imgLoader.isLoaded)
      {
         this.imgLoader.removeTxdRef();
      }
   }
   function __set__highlighted(_h)
   {
      this.highlightMC._visible = _h;
      if(this.initialIndex == 1)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.lockMC,!_h?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE:com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      }
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
