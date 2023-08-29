class com.rockstargames.gtav.minimap.minimap_txd_loader extends MovieClip
{
   function minimap_txd_loader()
   {
      super();
   }
   function SET_BITMAP_MAP_ON(txd, xpos, ypos)
   {
      this.TXDmc = this.createEmptyMovieClip(txd,this.getNextHighestDepth(),{_x:0,y:0});
      this.LOADCLIP(txd,this.TXDmc);
   }
   function LOADCLIP(textureDict, targetMC)
   {
      this.txd_loader = new MovieClipLoader();
      this.txd_loader.addListener(this);
      var _loc2_ = "img://" + textureDict + "/" + textureDict;
      this.txd_loader.loadClip(_loc2_,targetMC);
   }
   function onLoadInit(targetMC)
   {
      targetMC._width = 3834;
      targetMC._height = 3834;
      this.txd_loader.removeListener(this);
      this.txd_loader = null;
   }
}
