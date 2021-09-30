class com.rockstargames.ui.controls.WebCursor extends MovieClip
{
   var xMove = 0;
   var yMove = 0;
   var yScroll = 0;
   var safeArea = 0;
   function WebCursor()
   {
      super();
      this.browser = _level0.TIMELINE;
   }
   function CursorMove(xval, yval)
   {
      this.xMove = xval;
      this.yMove = yval;
   }
   function ScrollPage(yval)
   {
      if(yval != NaN)
      {
         this.yScroll = yval;
      }
   }
   function onEnterFrame()
   {
      var _loc5_ = 1280;
      var _loc4_ = 720;
      var _loc6_ = this._width;
      var _loc7_ = this._height;
      if(this.browser.keyboardFocus == "")
      {
         if(this.browser.MOUSE_MODE == false)
         {
            var _loc2_ = this._x + this.xMove;
            if(_loc2_ < this.safeArea)
            {
               _loc2_ = this.safeArea;
            }
            if(_loc2_ > _loc5_ - this.safeArea - _loc6_)
            {
               _loc2_ = _loc5_ - this.safeArea - _loc6_;
            }
            this._x = _loc2_;
            var _loc3_ = this._y + this.yMove;
            if(_loc3_ < this.browser.safeFrameY)
            {
               _loc3_ = this.browser.safeFrameY;
            }
            if(_loc3_ > _loc4_ - this.browser.safeFrameY - 8)
            {
               _loc3_ = _loc4_ - this.browser.safeFrameY - 8;
            }
            this._y = _loc3_;
         }
         if(this.yScroll != 0)
         {
            this.browser.SCROLL_WEBPAGE_PIXELS(this.yScroll);
         }
         this.browser.hitTestButtons(this._x,this._y);
      }
      else if(this.browser.MOUSE_MODE == true)
      {
         this.browser.hitTestKeyboardButtons(this._x,this._y);
      }
   }
}
