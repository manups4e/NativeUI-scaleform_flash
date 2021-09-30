class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase extends com.rockstargames.ui.components.GUIView
{
   var maxVisibleItems = 16;
   function PauseMenuViewBase()
   {
      super();
   }
   function __set__params(_p)
   {
      super.__set__params(_p);
      this.maxVisibleItems = this.visibleItems;
      return this.__get__params();
   }
   function displayView()
   {
      this.visibleItems = this.maxVisibleItems;
      super.displayView();
   }
}
