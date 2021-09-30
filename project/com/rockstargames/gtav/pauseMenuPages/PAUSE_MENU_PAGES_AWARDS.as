class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_AWARDS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   function PAUSE_MENU_PAGES_AWARDS()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("verticalMenuList",1,0);
      this.column2 = this.addColumn("mpAwards",2,290);
      this.setupColumns(this.column1,this.column2);
      this.setupColMouseNav([this.column1,this.column2],[true,true]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1,this.column2];
      this.showColumns();
   }
   function onPageExit()
   {
      this.column2.ON_DESTROY();
   }
}
