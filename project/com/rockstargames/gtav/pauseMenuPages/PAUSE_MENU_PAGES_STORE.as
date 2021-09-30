class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_STORE extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   function PAUSE_MENU_PAGES_STORE()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.storeNewsColumn = this.addColumn("storeNews",1,0);
      this.setupColumns(this.storeNewsColumn);
   }
   function stateChanged(id)
   {
      this.columnList = [this.storeNewsColumn];
      this.showColumns();
   }
}
