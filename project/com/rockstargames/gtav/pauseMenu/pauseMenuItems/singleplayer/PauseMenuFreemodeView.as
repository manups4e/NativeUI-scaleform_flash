class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   var TEXT_FADE_DURATION = 0.75;
   var TEXT_FADE_MIN_A = 60;
   var TEXT_FADE_MAX_A = 100;
   var TEXT_FADE_A_RANGE = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView.prototype.TEXT_FADE_MAX_A - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView.prototype.TEXT_FADE_MIN_A;
   var BG_FADE_MIN_A = 40;
   var BG_FADE_MAX_A = 75;
   var TAB_FADE_MIN_A = 5;
   var TAB_FADE_MAX_A = 35;
   function PauseMenuFreemodeView()
   {
      super();
      this.isFadingOut = true;
      this.itemTextA = 100;
      this.itemBGA = 50;
      this.itemTabA = 0;
      this.isTweening = false;
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc4_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc2_._y = this.itemY;
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem)_loc2_;
      _loc3_.__set__data(_dataArray);
      _loc3_.__set__isLastVisibleItem(false);
      if(_dataArray[12])
      {
         if(!this.isTweening)
         {
            this.isTweening = true;
            this.itemMC = _loc3_;
            this.beginLeftTextFade();
         }
      }
      else if(this.itemMC)
      {
         if(this.itemMC == _loc2_)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.itemMC.itemTextLeft);
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.itemMC.bgMC);
            this.itemMC.itemTextLeft._alpha = this.itemTextA = 100;
            this.itemMC.bgMC._alpha = 50;
            this.isFadingOut = false;
         }
      }
      this.itemList[i] = _loc3_;
      this.itemY = this.itemY + (_loc2_.bgMC._height + this.rowSpacing);
   }
   function scrollHighlightStyle(targetIndex)
   {
      targetIndex = Math.max(0,Math.min(targetIndex,this.dataList.length - 1));
      var _loc2_ = 0;
      var _loc6_ = 0;
      var _loc7_ = true;
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
         _loc7_ = false;
      }
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         _loc3_ = this.itemList[_loc2_];
         if(_loc7_)
         {
            _loc3_.__set__data(this.dataList[_loc6_ + _loc2_]);
         }
         _loc4_ = targetIndex == _loc2_;
         if(_loc3_.__get__highlighted() != _loc4_)
         {
            _loc3_.__set__highlighted(_loc4_);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.highlightedItem = targetIndex;
   }
   function fadeLeftText()
   {
      this.isFadingOut = !this.isFadingOut;
      var _loc4_ = !this.isFadingOut?this.TEXT_FADE_MAX_A:this.TEXT_FADE_MIN_A;
      var _loc2_ = !this.isFadingOut?this.BG_FADE_MAX_A:this.BG_FADE_MIN_A;
      var _loc3_ = !this.isFadingOut?this.TAB_FADE_MIN_A:this.TAB_FADE_MAX_A;
      var _loc7_ = com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.itemMC.bgMC,this.TEXT_FADE_DURATION,{_alpha:_loc2_,onCompleteScope:this,onComplete:this.fadeLeftText,ease:_loc7_});
   }
   function beginLeftTextFade()
   {
      this.itemMC.itemTextLeft._alpha = this.itemTextA;
      this.itemMC.bgMC._alpha = this.itemBGA;
      var _loc2_ = !this.isFadingOut?this.TEXT_FADE_MAX_A:this.TEXT_FADE_MIN_A;
      var _loc4_ = !this.isFadingOut?this.BG_FADE_MAX_A:this.BG_FADE_MIN_A;
      var _loc6_ = !this.isFadingOut?this.TAB_FADE_MIN_A:this.TAB_FADE_MAX_A;
      var _loc3_ = Math.abs(_loc2_ - this.itemTextA);
      var _loc5_ = this.TEXT_FADE_DURATION * (_loc3_ / this.TEXT_FADE_A_RANGE);
      var _loc9_ = com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.itemMC.bgMC,_loc5_,{_alpha:_loc4_,ease:_loc9_,onCompleteScope:this,onComplete:this.fadeLeftText,ease:_loc9_});
   }
   function destroy()
   {
      if(this.isTweening)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.itemMC.itemTextLeft);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.itemMC.bgMC);
         this.itemTextA = this.itemMC.itemTextLeft._alpha;
         this.itemBGA = this.itemMC.bgMC._alpha;
         this.itemMC.itemTextLeft._alpha = 100;
         this.itemMC.bgMC._alpha = 50;
         this.itemMC = null;
         this.isTweening = false;
      }
      super.destroy();
   }
}
