class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   var titleHeight = 25;
   var scrollJumpVal = 25;
   var scrollYPos = 0;
   var txdLevelOverride = false;
   var txdCallbackDepth = 0;
   function PauseMPMenuMatchmakingCardView()
   {
      super();
   }
   function overrideTxdLevel(isOverride, newDepth)
   {
      this.txdLevelOverride = isOverride;
      this.txdCallbackDepth = newDepth;
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc4_ = this.viewLinkageList[0];
      var _loc3_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc3_._y = this.itemY;
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem)_loc3_;
      var _loc6_ = this.__get__params().isStandalone;
      _loc2_.__set__isStandalone(_loc6_);
      if(this.txdLevelOverride)
      {
         _loc2_.txdCallbackDepth = this.txdCallbackDepth;
      }
      _loc2_.__set__data(_dataArray);
      this.itemList[i] = _loc2_;
      this.itemY = this.itemY + (_loc3_.bgMC._height + this.rowSpacing);
   }
   function scrollHighlightStyle(targetIndex)
   {
      targetIndex = Math.max(0,Math.min(targetIndex,this.dataList.length - 1));
      var _loc2_ = 0;
      var _loc4_ = 0;
      if(targetIndex > this.topEdge + this.visibleItems - 1)
      {
         _loc4_ = _loc4_ + (targetIndex - (this.visibleItems - 1));
         this.topEdge = _loc4_;
         targetIndex = this.visibleItems - 1;
      }
      else if(targetIndex < this.topEdge)
      {
         _loc4_ = targetIndex;
         this.topEdge = _loc4_;
         targetIndex = 0;
      }
      else
      {
         _loc4_ = this.topEdge;
         targetIndex = targetIndex - this.topEdge;
      }
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.itemList[_loc2_].data = this.dataList[_loc4_ + _loc2_];
         this.itemList[_loc2_].highlighted = targetIndex == _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      this.highlightedItem = targetIndex;
   }
}
