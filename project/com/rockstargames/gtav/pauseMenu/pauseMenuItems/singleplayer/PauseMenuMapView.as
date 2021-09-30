class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   function PauseMenuMapView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc4_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc2_._y = this.itemY;
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapItem)_loc2_;
      _loc3_.initStoreMethod(this.storeDataChange,this);
      _loc3_.__set__data(_dataArray);
      this.itemList[i] = _loc3_;
      this.itemY = this.itemY + (_loc2_.bgMC._height + this.rowSpacing);
   }
   function storeDataChange(dataIndex, paramIndex, value)
   {
      this.dataList[dataIndex][paramIndex] = value;
   }
   function addDisplayItemOnce(i, _dataArray)
   {
      if(this.itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE)
      {
         if(this.dataList.length > this.visibleItems && this.dataList.length <= this.maxVisibleItems)
         {
            this.visibleItems = this.dataList.length;
         }
      }
      if(this.itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE)
      {
         this.visibleItems = this.dataList.length;
      }
      this.addDisplayItem(i,this.dataList[i]);
   }
   function jumpTo(targetIndex)
   {
      this._index = targetIndex;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         _loc4_ = this.itemList[_loc2_];
         _loc3_ = targetIndex == _loc2_;
         if(_loc4_.__get__highlighted() != _loc3_)
         {
            _loc4_.__set__highlighted(_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function scrollHighlightStyle(targetIndex)
   {
      targetIndex = Math.max(0,Math.min(targetIndex,this.dataList.length - 1));
      var _loc2_ = 0;
      var _loc6_ = 0;
      if(targetIndex > this.topEdge + this.visibleItems - 1)
      {
         _loc6_ = _loc6_ + (targetIndex - (this.visibleItems - 1));
         this.topEdge = _loc6_;
         targetIndex = this.visibleItems - 1;
      }
      else if(targetIndex < this.topEdge)
      {
         _loc6_ = targetIndex;
         this.topEdge = _loc6_;
         targetIndex = 0;
      }
      else
      {
         _loc6_ = this.topEdge;
         targetIndex = targetIndex - this.topEdge;
      }
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         _loc3_ = this.itemList[_loc2_];
         _loc3_.__set__data(this.dataList[_loc6_ + _loc2_]);
         _loc4_ = targetIndex == _loc2_;
         if(_loc3_.__get__highlighted() != _loc4_)
         {
            _loc3_.__set__highlighted(_loc4_);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.highlightedItem = targetIndex;
   }
}
