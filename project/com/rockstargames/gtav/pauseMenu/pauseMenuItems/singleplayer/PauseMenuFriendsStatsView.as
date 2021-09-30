class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   function PauseMenuFriendsStatsView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc3_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc3_,_loc3_ + i + "MC",i);
      _loc2_._y = this.itemY;
      var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsItem)_loc2_;
      _loc4_.__set__data(_dataArray);
      this.itemList[i] = _loc4_;
      this.itemY = this.itemY + (_loc2_.bgMC._height + this.rowSpacing);
   }
}
