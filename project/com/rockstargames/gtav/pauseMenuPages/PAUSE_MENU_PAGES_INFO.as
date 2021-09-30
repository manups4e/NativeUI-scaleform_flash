class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_INFO extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   function PAUSE_MENU_PAGES_INFO()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column1 = this.addColumn("verticalMenuList",1,0);
      this.column2 = this.addColumn("missionHelpList",2,290);
      this.column3 = this.addColumn("rockstarNewswire",3,290);
      this.column4 = this.addColumn("dialogueList",4,290);
      this.column5 = this.addColumn("feedList",5,290);
      this.setupColumns(this.column1,this.column2,this.column3,this.column4,this.column5);
      this.setupColScroll([this.column1,this.column2,this.column3,this.column4,this.column5],[true,true,true,true,true]);
      this.setupColFooterScroll([this.column1,this.column2,this.column3,this.column4,this.column5],[-1,this.footerScrollOverride,this.footerScrollOverride,this.footerScrollOverride,this.footerScrollOverride]);
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      switch(id)
      {
         case com.rockstargames.gtav.constants.PauseMenuLUT.HOME_BRIEF:
            this.columnList = [this.column1,this.column4];
            this.column5.ON_DESTROY();
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.HOME_FEED:
            this.columnList = [this.column1,this.column5];
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.HOME_NEWSWIRE:
            this.columnList = [this.column1,this.column3];
            this.column5.ON_DESTROY();
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.HOME_MISSION:
         default:
         case com.rockstargames.gtav.constants.PauseMenuLUT.HOME_HELP:
         default:
         case com.rockstargames.gtav.constants.PauseMenuLUT.INFO:
         default:
            this.columnList = [this.column1,this.column2];
            this.column5.ON_DESTROY();
      }
      this.showColumns();
   }
}
