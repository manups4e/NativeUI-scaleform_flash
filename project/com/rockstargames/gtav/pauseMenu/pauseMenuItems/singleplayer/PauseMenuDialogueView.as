class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuDialogueView extends com.rockstargames.ui.components.GUIView
{
   static var MAX_ITEMS_ON_SCREEN = 8;
   function PauseMenuDialogueView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc3_ = this.viewLinkageList[0];
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem)this.viewContainer.attachMovie(_loc3_,"dialogueItem" + i + "MC",i);
      _loc2_._y = this.itemY;
      _loc2_.__set__data(_dataArray);
      this.itemList[i] = _loc2_;
      this.itemY = this.itemY + (_loc2_.getHeight() + this.rowSpacing);
   }
   function __set__params(_p)
   {
      super.__set__params(_p);
      return this.__get__params();
   }
   function scrollToBottom()
   {
      if(this.itemList.length > com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuDialogueView.MAX_ITEMS_ON_SCREEN)
      {
         this.scrollAllHighlightStyle(this.itemList.length,false);
      }
   }
   function scrollAllHighlightStyle(targetIndex, tween)
   {
      if(tween == undefined)
      {
         tween = true;
      }
      var _loc6_ = this.direction(targetIndex);
      var _loc5_ = _loc6_ >= 0?1:-1;
      var _loc7_ = this.getHeightOfAllItems();
      if(_loc6_ != 0 && _loc7_ > this.viewMaskHeight)
      {
         var _loc4_ = this.viewContainer._y;
         var _loc2_ = this.__get__index();
         while(_loc2_ != this.__get__index() + _loc6_)
         {
            var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem)this.itemList[_loc2_].getHeight();
            _loc4_ = _loc4_ - (_loc3_ + this.rowSpacing) * _loc5_;
            _loc2_ = _loc2_ + _loc5_;
         }
         var _loc8_ = - _loc7_ + this.viewMaskHeight;
         if(_loc4_ < _loc8_)
         {
            _loc4_ = _loc8_;
         }
         else if(_loc4_ > 0)
         {
            _loc4_ = 0;
         }
         this.highlightedItem = targetIndex;
         if(tween)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.viewContainer,0.2,{_y:_loc4_,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT});
         }
         else
         {
            this.viewContainer._y = _loc4_;
         }
      }
   }
   function getHeightOfAllItems()
   {
      var _loc3_ = 0;
      var _loc4_ = this.itemList.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = _loc3_ + (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem)this.itemList[_loc2_].getHeight();
         if(_loc2_ < _loc4_ - 1)
         {
            _loc3_ = _loc3_ + this.rowSpacing;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
}
