class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   var titleHeight = 25;
   var scrollJumpVal = 25;
   var scrollYPos = 0;
   var animatingKick = false;
   var kickAnim = 0;
   function PauseMPMenuFriendsListView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc4_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc2_._y = this.itemY;
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem)_loc2_;
      _loc3_.setView(this);
      _loc3_.__set__data(_dataArray);
      this.itemList[i] = _loc3_;
      this.itemY = this.itemY + (_loc2_.bgMC._height + this.rowSpacing);
   }
   function startKick(begin)
   {
      if(!this.animatingKick && begin == true)
      {
         this.animateKickIn();
         this.animatingKick = true;
      }
      var _loc2_ = 0;
      var _loc4_ = true;
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem)this.itemList[_loc2_];
         if(_loc3_.kick >= 1)
         {
            _loc4_ = false;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc4_)
      {
         this.animateKickOut();
         this.animatingKick = false;
      }
   }
   function animateKickIn()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.viewContainer,1,{onCompleteScope:this,onComplete:this.kickflip});
   }
   function animateKickOut()
   {
      this.kickAnim = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.viewContainer);
   }
   function kickflip()
   {
      if(this.kickAnim < 1)
      {
         this.kickAnim = this.kickAnim + 1;
         §§push(this.kickAnim);
      }
      else
      {
         §§push(this.kickAnim = 0);
      }
      §§pop();
      var _loc2_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem)this.itemList[_loc2_];
         if(_loc3_.kick >= 1)
         {
            _loc3_.kickflip(this.kickAnim);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.animateKickIn();
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
