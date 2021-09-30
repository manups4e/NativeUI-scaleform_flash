class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   function PauseMenuTextListItem()
   {
      super();
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.snapBGGrid(this.bgMC);
      this.bgMC._visible = false;
      return this.__get__data();
   }
   function snapBGGrid(bgMC)
   {
      var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
      bgMC._height = _loc2_ * 27 - 2;
   }
   function __set__highlighted(_h)
   {
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
