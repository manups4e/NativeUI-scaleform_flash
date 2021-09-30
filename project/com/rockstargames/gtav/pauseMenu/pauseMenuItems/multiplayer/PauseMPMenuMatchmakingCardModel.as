class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardModel extends com.rockstargames.ui.components.GUIModel
{
   function PauseMPMenuMatchmakingCardModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.__set__params(_params);
      this.viewList[_viewIndex] = _loc2_;
   }
   function removeDataFromSlot(_viewIndex, _slotIndex)
   {
      var _loc2_ = this.viewList[_viewIndex];
      _loc2_.destroy();
      this.viewIndex = 0;
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardView)this.getCurrentView();
   }
}
