class com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuGalleryBase extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var isBatchLoading = false;
   var batchIndex = 0;
   var batchList = new Array();
   var txdList = new Array();
   var maxGridItems = 9;
   function PauseMenuGalleryBase()
   {
      super();
      this.galleryLoadManager = new com.rockstargames.ui.media.ImageLoaderManager();
   }
   function removeAllTXDs()
   {
      this.txdList = [];
      this.batchList = [];
      this.batchIndex = 0;
      this.isBatchLoading = false;
   }
   function preloadAllTXDs()
   {
   }
   function SET_HIGHLIGHT(i)
   {
      var _loc3_ = (com.rockstargames.ui.components.GUIView)this.model.getCurrentView();
      if(i == -1)
      {
         i = 0;
         while(i < _loc3_.itemList.length)
         {
            (com.rockstargames.ui.components.GUIMenuItem)_loc3_.itemList[i].__set__highlighted(false);
            i = i + 1;
         }
      }
      else
      {
         i = Math.max(0,Math.min(i,this.maxGridItems - 1));
         _loc3_.__set__index(i);
      }
   }
}
