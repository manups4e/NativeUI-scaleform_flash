class gfx.motion.Tween extends MovieClip
{
   static var _instance = new gfx.motion.Tween();
   function Tween()
   {
      super();
      MovieClip.prototype.tweenTo = this.tweenTo;
      MovieClip.prototype.tweenFrom = this.tweenFrom;
      MovieClip.prototype.tweenEnd = this.tweenEnd;
      MovieClip.prototype.tween__run = this.tween__run;
      MovieClip.prototype.tween__to = this.tween__to;
      MovieClip.prototype.tween__start = this.tween__start;
      _global.ASSetPropFlags(MovieClip.prototype,"tween__start,tween__to,tween__run",1);
   }
   function tweenTo(duration, props, ease)
   {
      var _loc2_ = {};
      for(var _loc4_ in props)
      {
         _loc2_[_loc4_] = this[_loc4_];
      }
      this.tween__start(duration,props,ease,_loc2_);
   }
   function tweenFrom(duration, props, ease)
   {
      var _loc3_ = {};
      for(var _loc4_ in props)
      {
         _loc3_[_loc4_] = props[_loc4_];
         props[_loc4_] = this[_loc4_];
         this[_loc4_] = _loc3_[_loc4_];
      }
      this.tween__start(duration,props,ease,_loc3_);
   }
   function tweenEnd(jumpToEnd)
   {
      if(jumpToEnd)
      {
         this.tween__to(1);
      }
      delete this.tween__props;
      delete this.tween__ease;
      delete this.tween__startProps;
      delete this.tween__startTime;
      delete this.tween__duration;
      delete this.onEnterFrame;
   }
   function tween__start(duration, props, ease, startProps)
   {
      this.tween__props = props;
      this.tween__startProps = startProps;
      this.tween__ease = ease == null?gfx.motion.Tween.linearEase:ease;
      this.tween__startTime = getTimer();
      this.tween__duration = duration;
      this.onEnterFrame = this.tween__run;
   }
   function tween__to(position)
   {
      var _loc3_ = this.tween__props;
      var _loc2_ = this.tween__startProps;
      for(var _loc4_ in _loc3_)
      {
         this[_loc4_] = position * (_loc3_[_loc4_] - _loc2_[_loc4_]) + _loc2_[_loc4_];
      }
   }
   function tween__run()
   {
      var _loc2_ = (getTimer() - this.tween__startTime) / (this.tween__duration * 1000);
      if(_loc2_ >= 1)
      {
         this.tweenEnd(true);
         if(this.onTweenComplete)
         {
            this.onTweenComplete();
         }
      }
      else
      {
         this.tween__to(this.tween__ease(_loc2_,0,1,1));
      }
   }
   static function linearEase(t, b, c, d)
   {
      return c * t / d + b;
   }
   static function init()
   {
      if(gfx.motion.Tween._instance != null)
      {
         return false;
      }
      gfx.motion.Tween._instance = new gfx.motion.Tween();
   }
}
