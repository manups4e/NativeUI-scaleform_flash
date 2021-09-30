class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuKeymapCategoryItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   function PauseMenuKeymapCategoryItem()
   {
      super();
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.warningMC._visible = this.initialIndex == 1;
      return this.__get__data();
   }
}
