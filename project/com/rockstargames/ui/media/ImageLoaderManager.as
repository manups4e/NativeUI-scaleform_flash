class com.rockstargames.ui.media.ImageLoaderManager
{
   var isBatchLoading = false;
   var batchIndex = 0;
   var batchList = new Array();
   var txdList = new Array();
   var loaderList = new Array();
   static var GET_TXD = 0;
   static var LOAD_TXD = 1;
   static var DYNAMIC_TXD = 2;
   function ImageLoaderManager()
   {
      this.clearLists();
   }
   function addLoader(_gfxName, _texDict, _texFilename, _texHolder, _setMethod)
   {
      var _loc2_ = new com.rockstargames.ui.media.ImageLoader();
      _loc2_.init(_gfxName,_texDict,_texFilename,_texHolder,_setMethod);
      this.loaderList.push(_loc2_);
   }
   function filterBatch()
   {
      var _loc7_ = 0;
      while(_loc7_ < this.loaderList.length)
      {
         var _loc9_ = this.loaderList[_loc7_];
         var _loc2_ = _loc9_.textureDict;
         if(_loc2_ != "" && _loc2_ != undefined)
         {
            var _loc8_ = false;
            var _loc6_ = undefined;
            var _loc4_ = 0;
            while(_loc4_ < this.txdList.length)
            {
               _loc6_ = this.txdList[_loc4_];
               if(_loc2_ == _loc6_)
               {
                  _loc8_ = true;
                  break;
               }
               _loc4_ = _loc4_ + 1;
            }
            if(!_loc8_)
            {
               this.txdList.push(_loc2_);
            }
            var _loc3_ = 0;
            while(_loc3_ < this.loaderList.length)
            {
               var _loc5_ = this.loaderList[_loc3_];
               if(_loc2_ == _loc5_.textureDict)
               {
                  if(this.batchList[_loc2_] == undefined)
                  {
                     this.batchList[_loc2_] = [];
                  }
                  this.batchList[_loc2_].push(_loc5_);
                  break;
               }
               _loc3_ = _loc3_ + 1;
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      this.batchIndex = this.txdList.length;
   }
   function startBatchLoadAll()
   {
      if(this.loaderList.length > 0)
      {
         this.processBatch(this.loaderList);
      }
   }
   function startBatchLoadOn(i)
   {
      var _loc2_ = this.getBatch(i);
      if(_loc2_ != undefined)
      {
         this.processBatch(_loc2_);
      }
   }
   function processBatch(list)
   {
      var _loc2_ = 0;
      while(_loc2_ < list.length)
      {
         var _loc1_ = list[_loc2_];
         switch(_loc1_.textureMethod)
         {
            case com.rockstargames.ui.media.ImageLoaderManager.GET_TXD:
               com.rockstargames.ui.utils.Debug.log("get " + _loc1_.textureDict);
               _loc1_.getImage();
               break;
            case com.rockstargames.ui.media.ImageLoaderManager.LOAD_TXD:
               _loc1_.loadImage();
               break;
            case com.rockstargames.ui.media.ImageLoaderManager.DYNAMIC_TXD:
               _loc1_.setImageInMemory();
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function getBatch(i)
   {
      var _loc2_ = this.txdList[i];
      return this.batchList[_loc2_];
   }
   function flushBatch()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.txdList.length)
      {
         this.flushBatchOn(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function flushBatchOn(i)
   {
      var _loc2_ = this.getBatch(i);
      if(_loc2_.length > 0)
      {
         var _loc3_ = _loc2_[0];
         com.rockstargames.ui.utils.Debug.log("remove " + _loc3_.textureDict);
         _loc3_.deleteImage();
      }
   }
   function clearLists()
   {
      this.loaderList = [];
      this.batchList = [];
      this.txdList = [];
   }
}
