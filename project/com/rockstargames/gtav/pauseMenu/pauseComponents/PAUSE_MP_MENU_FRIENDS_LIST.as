class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_FRIENDS_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   static var ICON_START_INDEX = 9;
   function PAUSE_MP_MENU_FRIENDS_LIST()
   {
      super();
      this.dbgID = "PAUSE_MP_MENU_FRIENDS_LIST";
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,container:this.CONTENT,linkage:["mpFriendsListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
      this.CONTENT.joiningMC._visible = false;
   }
   function UPDATE_SLOT(_viewIndex, _slotIndex)
   {
      this.parseIcons(arguments);
      this.model.updateSlot(0,_viewIndex,arguments);
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      this.parseIcons(arguments);
      this.model.addDataToView(0,_viewIndex,arguments);
   }
   function parseIcons(args)
   {
      var _loc1_ = com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_FRIENDS_LIST.ICON_START_INDEX;
      while(_loc1_ < com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_FRIENDS_LIST.ICON_START_INDEX + 3)
      {
         var _loc2_ = args[_loc1_];
         if(_loc2_ == undefined)
         {
            _loc2_ = 0;
         }
         var _loc3_ = com.rockstargames.gtav.constants.MPIconLabels.lookUp(_loc2_)[1];
         args[_loc1_] = _loc3_;
         _loc1_ = _loc1_ + 1;
      }
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      if(viewIndex == undefined)
      {
         viewIndex = 0;
      }
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      if(this.canMouseNav)
      {
         this.SEND_COLUMN_PARAMS();
      }
   }
   function SET_DESCRIPTION(joiningStr, yPos)
   {
      var _loc2_ = joiningStr != "";
      this.CONTENT.joiningMC._visible = _loc2_;
      this.CONTENT.joiningMC.titleTF.text = joiningStr;
      this.CONTENT.joiningMC.spinnerMC.gotoAndStop(!_loc2_?1:"loop");
      this.CONTENT.joiningMC._y = yPos;
   }
   function SET_HIGHLIGHT(i)
   {
      this.model.getCurrentView().__set__index(i);
   }
   function SET_INPUT_EVENT(direction)
   {
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         this.model.prevItem();
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         this.model.nextItem();
      }
   }
   function ON_DESTROY()
   {
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListView)this.model.getCurrentView().animateKickOut();
   }
}
