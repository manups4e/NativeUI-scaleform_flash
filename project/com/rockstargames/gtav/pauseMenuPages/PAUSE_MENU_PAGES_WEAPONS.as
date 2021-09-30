class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_WEAPONS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   function PAUSE_MENU_PAGES_WEAPONS()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("mpWeapons",1,0);
      this.setupColumns(this.column1);
      this.setupColMouseNav([this.column1],[true]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1];
      this.showColumns();
   }
}
