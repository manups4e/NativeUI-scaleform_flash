class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewsCardView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   var titleHeight = 25;
   var scrollJumpVal = 25;
   var scrollYPos = 0;
   function PauseMenuCrewsCardView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc3_ = this.viewLinkageList[0];
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewsCardItem)this.viewContainer.attachMovie(_loc3_,_loc3_ + i + "MC",i,{_y:this.itemY});
      _loc2_.__set__data(_dataArray);
      _loc2_.collapse(this.__get__params().collapse);
      this.itemList[i] = _loc2_;
      this.itemY = this.itemY + (this.titleHeight + this.rowSpacing);
   }
   function scrollHighlightStyle(targetIndex)
   {
      var _loc6_ = this.direction(targetIndex);
      if(_loc6_ != 0)
      {
         var _loc3_ = targetIndex;
         var _loc2_ = 0;
         var _loc4_ = 0;
         if(_loc6_ > 0)
         {
            if(_loc3_ >= this.topEdge + this.visibleItems)
            {
               this.topEdge = this.topEdge + 1;
               _loc4_ = this.topEdge;
            }
            else
            {
               _loc4_ = this.topEdge;
               if(_loc4_ == this.dataList.length - this.visibleItems && _loc3_ == 0)
               {
                  _loc4_ = 0;
                  this.topEdge = 0;
               }
            }
            _loc3_ = _loc3_ - this.topEdge;
         }
         else
         {
            if(_loc3_ < this.topEdge)
            {
               this.topEdge = this.topEdge - 1;
               _loc4_ = this.topEdge;
            }
            else
            {
               _loc4_ = this.topEdge;
               if(_loc4_ == 0 && _loc3_ == this.dataList.length - 1)
               {
                  _loc4_ = _loc3_ - this.visibleItems + 1;
                  this.topEdge = _loc3_ - this.visibleItems + 1;
               }
            }
            _loc3_ = _loc3_ - this.topEdge;
         }
         _loc2_ = 0;
         while(_loc2_ < this.itemList.length)
         {
            this.itemList[_loc2_].data = this.dataList[_loc4_ + _loc2_];
            this.itemList[_loc2_].highlighted = _loc3_ == _loc2_;
            _loc2_ = _loc2_ + 1;
         }
         this.highlightedItem = _loc3_;
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < this.itemList.length)
         {
            this.itemList[_loc2_].highlighted = targetIndex == _loc2_;
            _loc2_ = _loc2_ + 1;
         }
         this.highlightedItem = targetIndex;
      }
   }
}
