class com.rockstargames.ui.controls.ScrollingList extends com.rockstargames.ui.core.PhoneUIComponent
{
   var _numberOfVisibleRows = 0;
   var defaultRowHeight = 45;
   var offScreenX = 480;
   var arrayStartPoint = 0;
   var offStateAlpha = 60;
   var gutterHeight = 240;
   var scrollerX = 250;
   var scrollamount = 20;
   var inputDelay = 0;
   function ScrollingList()
   {
      super();
   }
   function construct(parentContainer, linkageID, params)
   {
      this.listItem = linkageID;
      this.setScrollBarVisibility(false);
      this.row = 1;
      if(params.isLandscape)
      {
         this.isLandscape = params.isLandscape;
      }
      if(this.dataProviderUI.length > 0)
      {
         if(this.numberOfVisibleRows > this.dataProviderUI.length)
         {
            this.numberOfVisibleRows = this.dataProviderUI.length;
         }
         this.currentSelection = 0;
      }
      else
      {
         this.numberOfVisibleRows = 0;
         this.currentSelection = -1;
      }
      super.construct(parentContainer,linkageID,params);
      this.scrollBar.construct(this.container,"scrubber","gutter",this.scrollerX,this.offsetY,this.gutterHeight);
      this.scrollBar.scrollBarContainer._alpha = 0;
      this.scrollBar.scrollBarContainer._visible = true;
      this.scrollBar.scrollBarContainer.swapDepths(this.scrollBar.scrollBarContainer.getDepth() + 20);
      this.container._x = 0;
      this.renderContainers();
   }
   function renderContainers()
   {
      if(this.currentID == undefined)
      {
         this.currentID = 0;
      }
      if(this.currentID >= this.dataProviderUI.length)
      {
         this.currentID = this.dataProviderUI.length - 1;
      }
      var _loc5_ = undefined;
      var _loc6_ = undefined;
      _loc5_ = this.offsetY;
      if(this.arrayStartPoint == undefined)
      {
         this.arrayStartPoint = 0;
      }
      var _loc9_ = this.arrayStartPoint;
      var _loc8_ = this.numberOfVisibleRows - 1 + this.arrayStartPoint;
      if(this.currentID > _loc8_ || this.currentID < _loc9_)
      {
         var _loc7_ = this.currentID - (this.numberOfVisibleRows - 1);
         if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         this.arrayStartPoint = _loc7_;
      }
      var _loc3_ = 0;
      while(_loc3_ < this.numberOfVisibleRows)
      {
         var _loc2_ = "listItem" + this.row;
         if(this.container[_loc2_] != undefined)
         {
            this.container[_loc2_].removeMovieClip();
         }
         this.container[_loc2_] = this.container.attachMovie(this.listItem,_loc2_,this.container.getNextHighestDepth());
         this.container[_loc2_]._name = _loc2_;
         this.container[_loc2_]._x = this.container._x + this.offsetX;
         var _loc4_ = _loc3_ + this.arrayStartPoint;
         if(_loc4_ == this.currentID)
         {
            this.currentItem = this.container[_loc2_];
            this.setState(this.currentItem,true);
            this.currentSelection = this.currentID;
            _loc6_ = this.container[_loc2_];
         }
         else
         {
            this.setState(this.container[_loc2_],false);
         }
         this.container[_loc2_]._y = _loc5_;
         _loc5_ = _loc5_ + (this.defaultRowHeight + this.rowSpace);
         _loc6_ = this.container[_loc2_];
         this.row = this.row + 1;
         _loc3_ = _loc3_ + 1;
      }
      this.populateContent();
   }
   function navigate(direction)
   {
      if(this.inputDelay == 0)
      {
         this.setState(this.currentItem,false);
         this.previousItem = this.currentItem;
         var _loc3_ = this.currentItem._name.split("listItem");
         var _loc2_ = Number(_loc3_[1]);
         var _loc4_ = _loc2_;
         switch(direction)
         {
            case "UP":
               _loc2_ = _loc4_ - 1;
               this.setScrollBarVisibility(true);
               if(_loc2_ < 1)
               {
                  if(this.arrayStartPoint < 1)
                  {
                     _loc2_ = this.numberOfVisibleRows;
                     this.arrayStartPoint = this.dataProviderUI.length - this.numberOfVisibleRows;
                     this.populateContent();
                  }
                  else
                  {
                     this.arrayStartPoint = this.arrayStartPoint - 1;
                     _loc2_ = _loc2_ + 1;
                     this.populateContent();
                  }
               }
               break;
            case "DOWN":
               _loc2_ = _loc4_ + 1;
               this.setScrollBarVisibility(true);
               if(_loc2_ > this.numberOfVisibleRows)
               {
                  if(this.arrayStartPoint >= this.dataProviderUI.length - this.numberOfVisibleRows)
                  {
                     _loc2_ = 1;
                     this.arrayStartPoint = 0;
                     this.populateContent();
                  }
                  else
                  {
                     this.arrayStartPoint = this.arrayStartPoint + 1;
                     _loc2_ = _loc2_ - 1;
                     this.populateContent();
                  }
               }
         }
         this.currentItem = this.container["listItem" + _loc2_];
         _loc3_ = this.currentItem._name.split("listItem");
         var _loc5_ = Number(_loc3_[1]) + this.arrayStartPoint;
         this.currentSelection = _loc5_ - 1;
         var _loc6_ = this.getRowAsPercentage(_loc5_);
         this.scrollBar.scrollToPercentage(_loc6_);
         this.setState(this.currentItem,true);
         this.inputDelay = 1;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.container,0.1,{onComplete:this.inputDelayReset,onCompleteScope:this});
      }
   }
   function inputDelayReset()
   {
      this.inputDelay = 0;
   }
   function getRowAsPercentage(rowNumber)
   {
      var _loc2_ = undefined;
      if(rowNumber > 1)
      {
         _loc2_ = rowNumber / this.dataProviderUI.length * 100;
      }
      else
      {
         _loc2_ = 0;
      }
      return _loc2_;
   }
   function setState(item, isActive)
   {
      if(isActive)
      {
         com.rockstargames.ui.utils.Colour.Colourise(item.background,0,153,255);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(item.background,0,0,0);
      }
   }
   function removeList()
   {
      this.container.removeMovieClip();
   }
   function setScrollBarVisibility(isVisible)
   {
      if(isVisible)
      {
         this.scrollBar.SHOW();
         clearInterval(this.scrollBarTimeout);
         this.scrollBarTimeout = setInterval(this,"setScrollBarVisibility",300,false);
      }
      else
      {
         this.scrollBar.HIDE();
         clearInterval(this.scrollBarTimeout);
      }
   }
}
