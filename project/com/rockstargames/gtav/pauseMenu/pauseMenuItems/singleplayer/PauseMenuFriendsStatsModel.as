class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsModel extends com.rockstargames.ui.components.GUIModel
{
   function PauseMenuFriendsStatsModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.__set__params(_params);
      this.viewList[_viewIndex] = _loc2_;
   }
}
