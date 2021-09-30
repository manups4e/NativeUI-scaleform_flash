class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_MAP extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
   var dx = 0;
   var dy = 430;
   var inFullscreenMode = false;
   function PAUSE_MENU_PAGES_MAP()
   {
      super();
   }
   function setupPage()
   {
      super.setupPage();
      this.column0 = this.addColumn("mapLegend",10,0);
      this.column1 = this.addColumn("mapLegend",1,0);
      this.column2 = this.addColumn("freemodeDetails",2,0);
      this.setupColumns(this.column1,this.column2);
      this.setupColScroll([this.column1,this.column2],[false,false]);
      this.column0.INITIALISE();
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)this.column1;
      this.dx = _loc3_.details._x;
      this.dy = _loc3_.details._y;
   }
   function setDisplayConfig(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen)
   {
      var _loc3_ = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)this.column0;
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)this.column1;
      var _loc5_ = _loc3_.model.getCurrentView().viewContainer;
      var _loc4_ = _loc2_.model.getCurrentView().viewContainer;
      _screenWidthPixels = 1280;
      _screenHeightPixels = 720;
      if(this.inFullscreenMode)
      {
         var _loc7_ = Math.round(_safeTopPercent * _screenHeightPixels);
         var _loc11_ = Math.round(_safeBottomPercent * _screenHeightPixels);
         var _loc6_ = Math.round(_safeLeftPercent * _screenWidthPixels);
         var _loc9_ = Math.round(_safeRightPercent * _screenWidthPixels);
         _loc3_.details._x = _loc2_.details._x = _loc6_;
         _loc3_.details._y = _loc2_.details._y = _loc11_;
         _loc5_._x = _loc4_._x = _loc9_;
         _loc5_._y = _loc4_._y = _loc7_;
         this.column2._x = _loc6_;
         this.column2._y = _loc7_;
      }
      else
      {
         _loc3_.details._x = _loc2_.details._x = this.dx;
         _loc3_.details._y = _loc2_.details._y = this.dy;
         _loc5_._x = _loc4_._x = 868;
         _loc5_._y = _loc4_._y = 0;
         this.column2._x = this.column2._y = 0;
      }
      _loc2_.scrollBase._visible = false;
      _loc2_.updateScroll();
   }
   function setScaledContent()
   {
      this.inFullscreenMode = arguments[0];
      for(var _loc3_ in this.columnList)
      {
         this.columnList[_loc3_]._visible = this.inFullscreenMode;
      }
   }
   function stateChanged(id)
   {
      super.stateChanged(id);
      this.columnList = [this.column1,this.column2,this.column0];
      this.showColumns();
      if(!this.inFullscreenMode)
      {
         for(var _loc3_ in this.columnList)
         {
            this.columnList[_loc3_]._visible = false;
         }
      }
      var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)this.column1;
      _loc4_.scrollBase._visible = false;
      _loc4_.updateScroll();
   }
}
