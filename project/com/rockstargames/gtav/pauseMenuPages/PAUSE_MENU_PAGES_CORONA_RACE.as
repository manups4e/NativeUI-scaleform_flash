class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CORONA_RACE extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var firstRun = false;
   function PAUSE_MENU_PAGES_CORONA_RACE()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREE_MODE)this.addColumn("freemodeList",1,0);
      this.column2 = this.addColumn("mpMMCard",2,554);
      this.column3 = this.addColumn("mpPlayerCard",3,580);
      this.column4 = this.addColumn("mpMMVehicleInfo",4,290);
      this.column5 = this.addColumn("playerComparisonCard",5,580);
      this.column6 = this.addColumn("playerComparisonCard",6,725);
      this.column7 = this.addColumn("freemodeList",7,290);
      this.column8 = (com.rockstargames.gtav.pauseMenu.pauseComponents.MP_CORONA_PLAYER_INFO)this.addColumn("playerInfo",0,0);
      this.column9 = this.addColumn("freemodeMap",9,580);
      this.setupColumns(this.column1,this.column2,this.column3,this.column4,this.column5,this.column6,this.column7,this.column8,this.column9);
      this.setupColScroll([this.column1,this.column2,this.column3,this.column4,this.column5,this.column6,this.column7,this.column8,this.column9],[true,false,false,false,false,false,true,false,false]);
      this.setupColMouseNav([this.column1,this.column2,this.column3,this.column4,this.column5,this.column6,this.column7,this.column8,this.column9],[true,false,false,false,false,false,false,false,false]);
      this.column2.SET_STATE(5,true);
      this.column8.setColumnDependent(this.column1);
      this.column1.setColumnDependent(this.column8);
   }
   function stateChanged(id)
   {
      if(!this.firstRun)
      {
         super.stateChanged(id);
         this.columnList = [this.column1,this.column2,this.column3,this.column4,this.column5,this.column6,this.column7,this.column8,this.column9];
         this.showColumns();
         this.column3.SHOW_COLUMN(false);
         this.column5.SHOW_COLUMN(false);
         this.column6.SHOW_COLUMN(false);
         this.column8.SHOW_COLUMN(false);
         this.column9.SHOW_COLUMN(false);
         this.firstRun = true;
      }
   }
}
