class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpView extends com.rockstargames.ui.components.GUIView
{
   var SCROLL_DURATION = 0.2;
   var SCROLL_DY = 27;
   var titleHeight = 25;
   var scrollJumpVal = 25;
   var scrollYPos = 0;
   function PauseMenuMissionHelpView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc3_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc3_,_loc3_ + i + "MC",i);
      _loc2_._y = this.itemY;
      var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpListItem)_loc2_;
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
   function scrollToBottom()
   {
      var _loc2_ = 430;
      var _loc3_ = this.viewContainer._height;
      if(_loc3_ > _loc2_)
      {
         this.viewContainer._y = - _loc3_ - _loc2_;
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
      var _loc4_ = this.direction(targetIndex);
      var _loc3_ = this.viewContainer._height;
      if(_loc4_ != 0 && _loc3_ > this.viewMaskHeight)
      {
         var _loc2_ = this.viewContainer._y;
         _loc2_ = _loc2_ - this.SCROLL_DY * _loc4_;
         var _loc5_ = - _loc3_ + this.viewMaskHeight;
         if(_loc2_ < _loc5_)
         {
            _loc2_ = _loc5_;
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
