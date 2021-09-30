class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuNextJobListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem
{
   function PauseMPMenuNextJobListItem()
   {
      super();
      this.IS_NEXT_JOB_LIST = true;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.setAvatarImg(this.__get__data()[10],this.__get__data()[11]);
      return this.__get__data();
   }
   function setIcon(frameStr, fMC)
   {
      super.setIcon(frameStr,fMC);
      var _loc3_ = this.__get__data()[3];
      this.labelMC.icon2MC.gotoAndStop(_loc3_);
      if(this.labelMC.icon2MC.animIcon)
      {
         this.labelMC.icon2MC.animIcon.play();
      }
   }
   function setAvatarImg(txd, txn)
   {
      if(txd && txn)
      {
         if(!this.avatarImgMC)
         {
            this.avatarImgMC = (com.rockstargames.ui.media.ImageLoaderMC)this.attachMovie("GenericImageLoader","avatarImgMC",this.getNextHighestDepth());
         }
         this.avatarImgMC.loadWithValidation("MP_NEXT_JOB_SELECTION",txd,txn,5,25,25);
         this.itemTextLeft._x = 30;
         this.tabMC._x = 27;
      }
   }
}
