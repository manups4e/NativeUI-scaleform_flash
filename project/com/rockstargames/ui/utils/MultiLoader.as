class com.rockstargames.ui.utils.MultiLoader
{
   function MultiLoader(scope, gfxName)
   {
      gfx.events.EventDispatcher.initialize(this);
      this._scope = scope;
      this._gfxName = gfxName;
      this._clips = new Array();
      this._loaders = new Array();
      this._falseTotal = true;
   }
   function addClip(url, target, handlers)
   {
      this._clips.push(new Object());
      var _loc2_ = this._clips.length - 1;
      this._clips[_loc2_].url = url;
      this._clips[_loc2_].target = target;
      this._clips[_loc2_].handlers = handlers;
   }
   function loadClips()
   {
      var _loc2_ = 0;
      var _loc3_ = "";
      _loc2_ = 0;
      while(_loc2_ < this._clips.length)
      {
         var _loc4_ = new Object();
         this._loaders[_loc2_] = new MovieClipLoader();
         for(var _loc3_ in this._clips[_loc2_].handlers)
         {
            _loc4_[_loc3_] = this._clips[_loc2_].handlers[_loc3_];
         }
         this._loaders[_loc2_]._scope = this._scope;
         this._loaders[_loc2_]._listener = _loc4_;
         this._loaders[_loc2_].addListener(_loc4_);
         this._loaders[_loc2_].loadClip(this._clips[_loc2_].url,this._clips[_loc2_].target);
         _loc2_ = _loc2_ + 1;
      }
      this._id = setInterval(this,"getGroupProgress",1000);
   }
   function getGroupProgress()
   {
      var _loc4_ = 0;
      var _loc3_ = 0;
      var _loc2_ = 0;
      var _loc5_ = this._clips.length;
      _loc2_ = 0;
      while(_loc2_ < this._clips.length)
      {
         _loc4_ = _loc4_ + this._loaders[_loc2_].getProgress(this._clips[_loc2_].target).bytesLoaded;
         _loc3_ = _loc3_ + this._loaders[_loc2_].getProgress(this._clips[_loc2_].target).bytesTotal;
         _loc2_ = _loc2_ + 1;
      }
      if(this._falseTotal)
      {
         if(_loc4_ <= _loc3_)
         {
            this._falseTotal = false;
         }
      }
      else
      {
         this.dispatchEvent({type:"onGroupProgress",target:this,groupBytesLoaded:_loc4_,groupBytesTotal:_loc3_});
         if(_loc4_ >= _loc3_)
         {
            clearInterval(this._id);
            this.dispatchEvent({type:"onGroupLoadInit",target:this,groupBytesLoaded:_loc4_,groupBytesTotal:_loc3_,scope:this._scope});
            this.cleanUp();
         }
      }
   }
   function cleanUp(forceGarbageCollection)
   {
      var _loc2_ = 0;
      while(_loc2_ < this._loaders.length)
      {
         this._loaders[_loc2_].removeListener(this._loaders[_loc2_]._listener);
         this._loaders[_loc2_] = null;
         _loc2_ = _loc2_ + 1;
      }
      this._loaders = [];
      if(forceGarbageCollection)
      {
         flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION",0,this._gfxName);
      }
   }
}
