class com.rockstargames.gtav.pauseMenu.pauseComponents.ClickRepeat extends MovieClip
{
   var tweenDelay = 0.4;
   function ClickRepeat(_container)
   {
      super();
      this.container = _container;
   }
   function repeatStart(obj, func, args)
   {
      this.repeatObj = obj;
      this.repeatFunc = func;
      this.repeatArgs = args;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.container);
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.container,this.tweenDelay,{onComplete:this.repeatAction,onCompleteScope:this});
   }
   function repeatStop()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.container);
      this.repeatObj = null;
      this.repeatFunc = null;
      this.repeatArgs = null;
   }
   function repeatAction()
   {
      if(this.repeatFunc != null)
      {
         this.repeatFunc.apply(this.repeatObj,this.repeatArgs);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.container);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.container,this.tweenDelay,{onComplete:this.repeatAction,onCompleteScope:this});
      }
   }
}
