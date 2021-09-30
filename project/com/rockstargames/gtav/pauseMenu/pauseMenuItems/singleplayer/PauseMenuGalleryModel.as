class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel extends com.rockstargames.ui.components.GUIModel
{
   function PauseMenuGalleryModel()
   {
      super();
   }
   function createView(_viewIndex, _params)
   {
      var _loc2_ = this.viewList[_viewIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView();
      }
      _loc2_.viewIndex = _viewIndex;
      _loc2_.__set__params(_params);
      this.viewList[_viewIndex] = _loc2_;
   }
   function initMaxGalleryItems(max)
   {
      var _loc2_ = this.viewList[0];
      _loc2_.maxGalleryItems = max;
   }
   function onDestroy()
   {
      var _loc3_ = this.viewList[0];
      var _loc4_ = _loc3_.itemList.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem)_loc3_.itemList[_loc2_].ON_DESTROY();
         _loc2_ = _loc2_ + 1;
      }
   }
   function removeTxdFromSlot(_index)
   {
      var _loc2_ = this.viewList[0];
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem)_loc2_.itemList[_index].ON_DESTROY();
   }
}
