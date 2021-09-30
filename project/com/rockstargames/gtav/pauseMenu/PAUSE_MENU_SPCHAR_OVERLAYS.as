class com.rockstargames.gtav.pauseMenu.PAUSE_MENU_SPCHAR_OVERLAYS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   function PAUSE_MENU_SPCHAR_OVERLAYS()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function debug(id)
   {
      var _loc3_ = ["pause_menu_overlay_franklin","pause_menu_overlay_michael","pause_menu_overlay_trevor"];
      var _loc2_ = id != undefined?id:1;
      this.LOAD_IMAGE(_loc3_[_loc2_],200);
   }
   function LOAD_IMAGE(txd, xpos)
   {
      var _loc2_ = txd;
      this.createTexture(txd,_loc2_);
      this.imgLdr._x = xpos;
   }
   function createTexture(txD, txN, txX, txY, txW, txH)
   {
      if(this.imgLdr == undefined)
      {
         this.imgLdr = (com.rockstargames.ui.media.ImageLoaderMC)this.CONTENT.attachMovie("GenericImageLoader","imgLdr",this.CONTENT.getNextHighestDepth(),{_x:txX,_y:txY});
      }
      if(!this.imgLdr.isLoaded && this.imgLdr.textureDict != txD && this.imgLdr.textureFilename != txN)
      {
         if(this.imgLdr.isLoaded)
         {
            this.textureClear();
         }
         this.imgLdr.init("PAUSE_MENU_SPCHAR_OVERLAYS",txD,txN,!txW?512:txW,!txH?745:txH);
         (com.rockstargames.ui.media.ImageLoaderMC)this.imgLdr.requestTxdRef(txD,true,this.textureLoaded,this);
      }
   }
   function textureClear()
   {
      if(this.imgLdr == undefined)
      {
         this.imgLdr._alpha = 100;
         com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(this.imgLdr);
         this.imgLdr.removeTxdRef();
      }
   }
   function textureLoaded()
   {
      this.imgLdr.isLoaded = false;
      this.imgLdr._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgLdr,0.1,{_alpha:100});
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         if(this.imgLdr != undefined)
         {
            this.imgLdr.displayTxdResponse(textureDict,success);
         }
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      if(this.imgLdr != undefined)
      {
         this.imgLdr.displayTxdResponse(textureDict,true);
      }
   }
}
