class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CHAR_SELECT extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   function PAUSE_MENU_PAGES_CHAR_SELECT()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.timelineMC = mc;
      this.columnList = new Array();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("characterSelect",1,0);
      this.column2 = this.addColumn("playerComparisonCard",2,0);
      this.column1.SET_STATE(0,this.column2);
      this.setupColumns(this.column1,this.column2);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1,this.column2];
      this.showColumns();
      this.column2.SHOW_COLUMN(false);
   }
}
