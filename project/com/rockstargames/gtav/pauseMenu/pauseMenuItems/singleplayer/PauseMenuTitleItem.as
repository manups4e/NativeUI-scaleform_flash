class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTitleItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   function PauseMenuTitleItem()
   {
      super();
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.snapBGGrid(this.bgMC);
      return this.__get__data();
   }
   function snapBGGrid(bgMC)
   {
      var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
      bgMC._height = _loc2_ * 27 - 2;
   }
   function highlightTitle(_h)
   {
      super.__set__highlighted(_h);
   }
}
