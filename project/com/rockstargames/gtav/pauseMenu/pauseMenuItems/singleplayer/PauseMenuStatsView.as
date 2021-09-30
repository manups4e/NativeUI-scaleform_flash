class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   var titleHeight = 25;
   var scrollJumpVal = 25;
   var scrollYPos = 0;
   function PauseMenuStatsView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc3_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc3_,_loc3_ + i + "MC",i);
      _loc2_._y = this.itemY;
      var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsListItem)_loc2_;
      _loc4_.__set__data(_dataArray);
      this.itemList[i] = _loc4_;
      this.itemY = this.itemY + (_loc2_.bgMC._height + this.rowSpacing);
   }
   function __set__params(_p)
   {
      super.__set__params(_p);
      if(_p.titleHeight != undefined)
      {
         this.titleHeight = _p.titleHeight;
      }
      this.scrollJumpVal = this.titleHeight;
      return this.__get__params();
   }
   function lockedHighlightStyle(targetIndex)
   {
      var _loc6_ = this.direction(targetIndex);
      if(_loc6_ != 0)
      {
         var _loc3_ = undefined;
         var _loc2_ = undefined;
         var _loc4_ = Math.min(targetIndex,this.dataList.length - this.itemList.length);
         _loc2_ = 0;
         while(_loc2_ < targetIndex + this.itemList.length)
         {
            _loc3_ = this.itemList[_loc2_];
            _loc3_.__set__data(this.dataList[_loc2_ + _loc4_]);
            _loc2_ = _loc2_ + 1;
         }
      }
   }
}
