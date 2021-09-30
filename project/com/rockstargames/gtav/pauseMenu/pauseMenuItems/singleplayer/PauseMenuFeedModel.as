class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFeedModel extends com.rockstargames.ui.components.GUIModel
{
   function PauseMenuFeedModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFeedView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.__set__params(_params);
      this.viewList[_viewIndex] = _loc2_;
   }
}
