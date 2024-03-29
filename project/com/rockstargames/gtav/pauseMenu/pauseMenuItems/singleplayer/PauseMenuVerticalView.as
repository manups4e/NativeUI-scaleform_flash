﻿class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   function PauseMenuVerticalView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc4_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc2_._y = this.itemY;
      var _loc3_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem(_loc2_);
      _loc3_.initStoreMethod(this.storeDataChange,this);
      _loc3_.__set__data(_dataArray);
      this.itemList[i] = _loc3_;
      this.itemY = this.itemY + (_loc2_._height + this.rowSpacing);
   }
   function storeDataChange(dataIndex, value)
   {
      var _loc2_ = 3;
      this.dataList[dataIndex][_loc2_] = value;
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
