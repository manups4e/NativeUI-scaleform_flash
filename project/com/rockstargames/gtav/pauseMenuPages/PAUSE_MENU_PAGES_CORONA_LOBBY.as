class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CORONA_LOBBY extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var firstRun = false;
   function PAUSE_MENU_PAGES_CORONA_LOBBY()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("freemodeList",1,0);
      this.column2 = this.addColumn("mpFriendsList",2,290);
      this.column3 = this.addColumn("characterCard",3,580);
      this.column4 = this.addColumn("playerComparisonCard",4,725);
      this.setupColumns(this.column1,this.column2,this.column3,this.column4);
      this.setupColScroll([this.column1,this.column2,this.column3,this.column4],[true,false,false,false]);
   }
   function stateChanged(id)
   {
      if(!this.firstRun)
      {
         super.stateChanged(id);
         this.columnList = [this.column1,this.column2,this.column3,this.column4];
         this.showColumns();
         this.column4.SHOW_COLUMN(false);
         this.firstRun = true;
      }
   }
}
