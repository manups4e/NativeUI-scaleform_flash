class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CHAR_MOM_DAD extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   function PAUSE_MENU_PAGES_CHAR_MOM_DAD()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("freemodeList",1,0);
      this.column2 = this.addColumn("freemodeList",2,0);
      this.column3 = this.addColumn("heritageCard",3,0);
      this.column4 = this.addColumn("bodyConfigList",4,0);
      this.column5 = this.addColumn("characterStatsCard",5,0);
      this.column6 = this.addColumn("mpPlayerCard",6,0);
      this.column7 = this.addColumn("freemodeList",7,0);
      this.column8 = this.addColumn("hairColourList",8,0);
      this.setupColumns(this.column1,this.column2,this.column3,this.column4,this.column5,this.column6,this.column7,this.column8);
      this.column1.SET_STATE(1);
      this.column2.SET_STATE(2,this.column4);
      this.column7.SET_STATE(2,this.column8);
      this.showColumns();
   }
   function setupColumns()
   {
      var _loc3_ = 0;
      while(_loc3_ < arguments.length)
      {
         var _loc4_ = arguments[_loc3_];
         _loc4_.INITIALISE();
         this.columnList[_loc3_] = _loc4_;
         _loc3_ = _loc3_ + 1;
      }
   }
   function stateChanged(id)
   {
   }
}
