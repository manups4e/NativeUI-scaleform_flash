class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_MISSIONCREATOR extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   function PAUSE_MENU_PAGES_MISSIONCREATOR()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("freemodeList",1,0);
      this.column2 = this.addColumn("freemodeList",2,290);
      this.column3 = this.addColumn("freemodeDetails",3,580);
      this.column4 = this.addColumn("freemodeList",4,580);
      this.column5 = this.addColumn("settingsList",5,290);
      this.setupColumns(this.column1,this.column2,this.column3,this.column4,this.column5);
      this.setupColScroll([this.column1,this.column2,this.column3,this.column4,this.column5],[true,true,false,true,true]);
      this.setupColMouseNav([this.column1,this.column2,this.column3,this.column4,this.column5],[true,false,false,false,true]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1,this.column2,this.column3,this.column4,this.column5];
      this.showColumns();
   }
}
