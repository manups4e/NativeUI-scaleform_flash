class com.rockstargames.ui.utils.textfieldAutoScroll extends MovieClip
{
   var direction = -1;
   var delay = 0;
   var delayTimeout = 150;
   function textfieldAutoScroll()
   {
      super();
      var _loc3_ = this;
      this.targetTF = _loc3_.txtString;
      this.prevMaxscr = this.targetTF.maxhscroll;
   }
   function onEnterFrame()
   {
      this.maxscr = this.targetTF.maxhscroll;
      if(this.prevMaxscr != this.maxscr)
      {
         this.targetTF.hscroll = 0;
         this.direction = -1;
         this.delay = 0;
         this.prevMaxscr = this.maxscr;
      }
      if(this.maxscr > 4)
      {
         this.targetTF.hscroll = this.targetTF.hscroll + this.direction;
         var _loc2_ = this.targetTF.hscroll;
         if(_loc2_ == this.maxscr || _loc2_ == 0)
         {
            this.delay = this.delay + 1;
         }
         if(this.delay > this.delayTimeout)
         {
            this.direction = - this.direction;
            this.delay = 0;
         }
      }
   }
   function resetDelay()
   {
      this.delay = 0;
   }
   function setDelayTimeout(newDelayTimeout)
   {
      this.delayTimeout = newDelayTimeout;
   }
}
