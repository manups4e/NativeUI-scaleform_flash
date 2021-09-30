class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CORONA extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   function PAUSE_MENU_PAGES_CORONA()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("freemodeList",1,0);
      this.column2 = this.addColumn("freemodeDetails",2,580);
      this.column3 = this.addColumn("freemodeMap",3,580);
      this.column4 = this.addColumn("mpFriendsList",4,290);
      this.setupColumns(this.column1,this.column2,this.column3,this.column4);
      this.setupColScroll([this.column1,this.column2,this.column3,this.column4],[true,false,false,false]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1,this.column2,this.column3,this.column4];
      this.showColumns();
   }
   function onPageExit()
   {
      this.column2.ON_DESTROY();
   }
}
