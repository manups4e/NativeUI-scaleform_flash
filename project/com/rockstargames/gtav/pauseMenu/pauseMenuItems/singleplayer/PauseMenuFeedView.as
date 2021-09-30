class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFeedView extends com.rockstargames.ui.components.GUIView
{
   var SCROLL_DURATION = 0.2;
   var SCROLL_DY = 27;
   function PauseMenuFeedView()
   {
      super();
   }
   function displayView()
   {
      this.viewHeight = 0;
      super.displayView();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc3_ = this.viewLinkageList[0];
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem)this.viewContainer.attachMovie(_loc3_,"feedItem" + i + "MC",i);
      _loc2_._y = this.itemY;
      _loc2_.__set__data(_dataArray);
      this.itemList[i] = _loc2_;
      this.itemY = this.itemY + (_loc2_.getHeight() + this.rowSpacing);
      this.viewHeight = this.itemY;
   }
   function scrollToBottom()
   {
      if(this.viewHeight > this.viewMaskHeight)
      {
         this.viewContainer._y = - this.viewHeight - this.viewMaskHeight;
      }
   }
   function destroy()
   {
      super.destroy();
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.viewContainer);
   }
   function scrollAllHighlightStyle(targetIndex, tween)
   {
      if(tween == undefined)
      {
         tween = true;
      }
      var _loc3_ = this.direction(targetIndex);
      if(_loc3_ != 0 && this.viewHeight > this.viewMaskHeight)
      {
         var _loc2_ = this.viewContainer._y;
         _loc2_ = _loc2_ - this.SCROLL_DY * _loc3_;
         var _loc4_ = this.viewMaskHeight - this.viewHeight;
         if(_loc2_ < _loc4_)
         {
            _loc2_ = _loc4_;
         }
         else if(_loc2_ > 0)
         {
            _loc2_ = 0;
         }
         this.highlightedItem = targetIndex;
         if(tween)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.viewContainer,this.SCROLL_DURATION,{_y:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT});
         }
         else
         {
            this.viewContainer._y = _loc2_;
         }
      }
   }
}
