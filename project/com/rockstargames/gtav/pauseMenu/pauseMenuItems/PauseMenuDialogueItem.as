class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   static var DEFAULT_ITEM_HEIGHT = 52;
   static var IMAGE_X = 8;
   static var IMAGE_Y = 6;
   static var IMAGE_W = 40;
   static var IMAGE_H = 40;
   function PauseMenuDialogueItem()
   {
      super();
      this.sizeText = false;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.bgMC._visible = false;
      if(this.blipLayer != undefined)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.labelMC.createEmptyMovieClip("blipLayer",1000);
      this.itemTextLeft.autoSize = true;
      var _loc6_ = new com.rockstargames.ui.utils.Text();
      _loc6_.setTextWithIcons(this._data[0],this.blipLayer,this.itemTextLeft,0,13,4.5,false);
      var _loc3_ = this.__get__data()[1];
      var _loc4_ = this.__get__data()[2];
      if(_loc3_ == undefined && _loc4_ == undefined || _loc3_ == "" && _loc4_ == "")
      {
         if(this.charImage)
         {
            this.charImage.removeTxdRef();
         }
         this.labelMC._x = 5;
      }
      else
      {
         if(this.charImage == undefined)
         {
            this.charImage = (com.rockstargames.ui.media.ImageLoaderMC)this.attachMovie("GenericImageLoader","dMC",this.getNextHighestDepth(),{_x:com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_X,_y:com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_Y});
         }
         if(this.charImage.textureDict == _loc3_)
         {
            if(this.charImage.isLoaded)
            {
               this.charImage.init("PAUSE_MENU_SP_CONTENT",_loc3_,_loc4_,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_W,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_H);
               this.charImage.displayTxdResponse(_loc3_);
               this.fadeImgIn();
            }
         }
         else
         {
            if(this.charImage.isLoaded)
            {
               this.charImage.removeTxdRef();
            }
            this.charImage.init("PAUSE_MENU_SP_CONTENT",_loc3_,_loc4_,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_W,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.IMAGE_H);
            var _loc5_ = this.charImage.splitPath(String(this.charImage),5);
            this.charImage.requestTxdRef(_loc5_,true,this.fadeImgIn,this);
         }
      }
      return this.__get__data();
   }
   function fadeImgIn()
   {
      this.charImage._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.charImage,com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION,{_alpha:100});
   }
   function getHeight()
   {
      return Math.max(com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem.DEFAULT_ITEM_HEIGHT,this.labelMC._y + this.labelMC.titleTF.textHeight);
   }
   function onDestroy()
   {
      if(this.charImage.isLoaded)
      {
         this.charImage.removeTxdRef();
      }
   }
}
