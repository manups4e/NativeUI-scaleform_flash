class com.rockstargames.ui.core.UICanvas extends com.rockstargames.ui.core.BaseScriptUI
{
   var CANVAS = null;
   var stageResizeListener = new Object();
   function UICanvas()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      var _loc3_ = this.CONTENT.createEmptyMovieClip("canvas",this.CONTENT.getNextHighestDepth());
      this.CANVAS = new com.rockstargames.ui.core.UICanvasBounds(_loc3_);
      this.addStageResizeListener();
   }
   function addStageResizeListener()
   {
      this.stageResizeListener = new Object();
      this.stageResizeListener.onResize = com.rockstargames.ui.utils.DelegateStar.create(this,this.onStageResize);
      Stage.addListener(this.stageResizeListener);
   }
   function removeStageResizeListener()
   {
      Stage.removeListener(this.stageResizeListener);
   }
   function onStageResize()
   {
      var _loc2_ = Stage.visibleRect;
      var _loc3_ = Stage.safeRect;
      this.CANVAS.update(_loc2_,_loc3_);
   }
}
