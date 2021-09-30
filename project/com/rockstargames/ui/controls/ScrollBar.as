class com.rockstargames.ui.controls.ScrollBar extends MovieClip
{
   var fadeOutDuration = 2.5;
   function ScrollBar()
   {
      super();
      gfx.motion.Tween.init();
   }
   function construct(container, scrubberID, gutterID, newX, newY, Height)
   {
      this.originX = newX;
      this.originY = newY;
      this.scrollBarContainer.removeMovieClip();
      this.scrollBarContainer = container.createEmptyMovieClip("scrollBarContainer",container.getNextHighestDepth());
      this.gutter = this.scrollBarContainer.attachMovie(gutterID,"gutter",this.scrollBarContainer.getNextHighestDepth(),{_x:this.originX,_y:this.originY});
      if(Height != undefined)
      {
         this.gutter._height = Height;
      }
      this.scrubber = this.scrollBarContainer.attachMovie(scrubberID,"scrubber",this.scrollBarContainer.getNextHighestDepth(),{_x:this.gutter._x,_y:this.gutter._y});
   }
   function scrollToPercentage(percentage)
   {
      var _loc2_ = (this.gutter._height - this.scrubber._height) / 100;
      var _loc3_ = percentage * _loc2_;
      this.scrubber._y = this.originY + _loc3_;
   }
   function SHOW()
   {
      this.scrollBarContainer.tweenEnd(true);
      this.scrollBarContainer._alpha = 100;
   }
   function HIDE()
   {
      this.scrollBarContainer.tweenTo(this.fadeOutDuration,{_alpha:0},mx.transitions.easing.Strong.easeIn);
   }
}
