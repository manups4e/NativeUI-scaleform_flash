class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuCoronaPlayerInfoView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   function PauseMPMenuCoronaPlayerInfoView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc2_ = this.viewLinkageList[0];
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuCoronaPlayerInfoItem)this.viewContainer.attachMovie(_loc2_,_loc2_ + i + "MC",i);
      _loc3_.__set__data(_dataArray);
      this.itemList[i] = _loc3_;
   }
}
