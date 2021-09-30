class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CORONA_PLAYERS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   function PAUSE_MENU_PAGES_CORONA_PLAYERS()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("mpFriendsList",1,0);
      this.column2 = this.addColumn("mpPlayerModel",2,290);
      this.column3 = this.addColumn("mpPlayerCard",3,580);
      this.column4 = this.addColumn("playerComparisonCard",4,580);
      this.column5 = this.addColumn("playerComparisonCard",5,725);
      this.setupColumns(this.column1,this.column2,this.column3,this.column4,this.column5);
      this.setupColScroll([this.column1,this.column2,this.column3,this.column4,this.column5],[false,false,false,false,false]);
      this.setupColMouseNav([this.column1,this.column2,this.column3,this.column4,this.column5],[true,false,false,false,false]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1,this.column2,this.column3,this.column4,this.column5];
      this.showColumns();
      this.column4.SHOW_COLUMN(false);
      this.column5.SHOW_COLUMN(false);
   }
   function onPageExit()
   {
      this.column3.ON_DESTROY();
   }
}
