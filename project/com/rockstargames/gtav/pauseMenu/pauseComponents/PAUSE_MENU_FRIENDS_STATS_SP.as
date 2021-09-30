class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FRIENDS_STATS_SP extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_FRIENDS_STATS_SP()
   {
      super();
      this.dbgID = "PAUSE_MENU_FRIENDS_STATS_SP";
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
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:0,columnSpacing:0,maskHeight:430,container:this.CONTENT,linkage:["mpFriendsStatsListItem"],visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
   }
   function debug()
   {
      var _loc2_ = new Object();
      _loc2_.onKeyDown = mx.utils.Delegate.create(this,this.getKeys);
      Key.addListener(_loc2_);
      this.SET_DATA_SLOT(0,999,0,0,"Menu item 0 this is an example of text going way over the length");
      this.SET_DATA_SLOT(1,999,0,0,"Menu item 1 this is an example of text going way over the length and a little more here maybe going over 3 lines");
      this.SET_DATA_SLOT(2,999,0,0,"Menu item 2");
      this.SET_DATA_SLOT(3,999,0,0,"Menu item 3");
      this.SET_DATA_SLOT(4,999,0,0,"Menu item 4");
      this.DISPLAY_VIEW(0);
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      var _loc3_ = arguments;
      this.model.addDataToView(0,_viewIndex,_loc3_);
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      this.model.displayView(0);
   }
   function getKeys()
   {
      if(Key.isDown(38))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
      }
      else if(Key.isDown(40))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
      }
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
}
