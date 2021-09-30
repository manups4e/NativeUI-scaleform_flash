class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsModel extends com.rockstargames.ui.components.GUIModel
{
   function PauseMenuStatsModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsView();
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
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsView)this.getCurrentView();
   }
   function nextItem()
   {
      var _loc2_ = this.getCurrentView();
      var _loc3_ = _loc2_.__get__index() + 1;
      var _loc4_ = _loc2_.dataList.length - _loc2_.itemList.length;
      if(_loc3_ >= _loc4_)
      {
         _loc3_ = _loc4_;
      }
      this.setItem(_loc2_,_loc3_);
   }
   function prevItem()
   {
      var _loc3_ = this.getCurrentView();
      var _loc2_ = _loc3_.__get__index() - 1;
      if(_loc2_ < 0)
      {
         _loc2_ = 0;
      }
      this.setItem(_loc3_,_loc2_);
   }
}
