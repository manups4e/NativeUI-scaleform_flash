class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsModel extends com.rockstargames.ui.components.GUIModel
{
   function PauseMPMenuAwardsModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.__set__params(_params);
      this.viewList[_viewIndex] = _loc2_;
   }
   function onDestroy()
   {
      var _loc3_ = this.viewList[0];
      var _loc4_ = _loc3_.itemList.length;
      var _loc2_ = 0;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsItem)_loc3_.itemList[_loc2_].ON_DESTROY();
         _loc2_ = _loc2_ + 1;
      }
   }
}
