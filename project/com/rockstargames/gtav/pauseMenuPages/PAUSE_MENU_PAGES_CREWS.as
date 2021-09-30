class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CREWS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var inCrewMembers = false;
   function PAUSE_MENU_PAGES_CREWS()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.colCrewListLeft = this.addColumn("crewsList",1,0);
      this.colCrewListMid = this.addColumn("crewsList",7,290);
      this.colCrewCard = this.addColumn("crewsCard",3,580);
      this.colCrewRanks = this.addColumn("crewRanks",2,580);
      this.colCrewCompare1 = this.addColumn("crewComparisonCard",8,580);
      this.colCrewCompare2 = this.addColumn("crewComparisonCard",9,725);
      this.colFriendsList = this.addColumn("mpFriendsList",4,0);
      this.colPlayerModel = this.addColumn("mpPlayerModel",5,290);
      this.setupColumns(this.colCrewListLeft,this.colCrewListMid,this.colCrewCard,this.colFriendsList,this.colPlayerModel,this.colCrewRanks,this.colCrewCompare1,this.colCrewCompare2);
      this.setupColScroll([this.colCrewListLeft,this.colCrewListMid,this.colCrewCard,this.colFriendsList,this.colPlayerModel,this.colCrewRanks,this.colCrewCompare1,this.colCrewCompare2],[true,false,false,false,false,false,false,false]);
      this.setupColMouseNav([this.colCrewListLeft,this.colCrewListMid,this.colCrewCard,this.colFriendsList,this.colPlayerModel,this.colCrewRanks,this.colCrewCompare1,this.colCrewCompare2],[true,true,false,false,false,false,false,false]);
      var _loc4_ = this.colCrewRanks.model.getCurrentView();
      var _loc3_ = this.colCrewListMid.model.getCurrentView();
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListView)_loc3_.__set__sidecarColumn((com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase)_loc4_);
      (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CREW_RANKS)this.colCrewRanks.SET_LINKED_LEADERBOARD((com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CREWS_LIST)this.colCrewListMid);
   }
   function stateChanged(id)
   {
      if(id == com.rockstargames.gtav.constants.PauseMenuLUT.CREW_LIST)
      {
         return undefined;
      }
      super.stateChanged(id);
      switch(id)
      {
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREW:
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREWS_FILTER:
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_OPTIONS:
            if(!this.inCrewMembers)
            {
               this.inCrewMembers = true;
               this.colCrewListMid.SET_DATA_SLOT_EMPTY(0);
               this.colCrewRanks.SET_DATA_SLOT_EMPTY(0);
               this.colCrewCompare1.SET_DATA_SLOT_EMPTY(0);
               this.colCrewCompare2.SET_DATA_SLOT_EMPTY(0);
            }
            this.columnList = [this.colFriendsList,this.colPlayerModel,this.colCrewCard];
            (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CREWS_LIST)this.colCrewListMid.SET_HOVER_WIDTH(false);
            break;
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREWS:
         default:
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREWS_CATEGORY:
         default:
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_MINE:
         default:
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_ROCKSTAR:
         default:
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_FRIENDS:
         default:
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_INVITES:
         default:
         case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_LEADERBOARDS:
         default:
            if(this.inCrewMembers)
            {
               this.inCrewMembers = false;
               this.colFriendsList.SET_DATA_SLOT_EMPTY(0);
               this.colPlayerModel.SET_DATA_SLOT_EMPTY(0);
            }
            this.columnList = [this.colCrewListLeft,this.colCrewListMid,this.colCrewCard,this.colCrewRanks,this.colCrewCompare1,this.colCrewCompare2];
            (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CREWS_LIST)this.colCrewListMid.SET_HOVER_WIDTH(id != com.rockstargames.gtav.constants.PauseMenuLUT.CREW_LEADERBOARDS?false:true);
      }
      this.showColumns();
      this.colCrewCard.SHOW_COLUMN(false);
      this.colCrewRanks.SHOW_COLUMN(false);
      this.colCrewCompare1.SHOW_COLUMN(false);
      this.colCrewCompare2.SHOW_COLUMN(false);
   }
   function onPageExit()
   {
      this.colCrewCard.ON_DESTROY();
      this.colCrewCompare1.ON_DESTROY();
      this.colCrewCompare2.ON_DESTROY();
   }
}
