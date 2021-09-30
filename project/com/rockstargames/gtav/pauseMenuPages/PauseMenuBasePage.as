class com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage extends MovieClip
{
   var columnList = new Array();
   var footerScrollOverride = 99;
   function PauseMenuBasePage()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.timelineMC = mc;
      this.columnList = new Array();
   }
   function setupPage()
   {
      if(this.pageMC != undefined)
      {
         this.pageMC.removeMovieClip();
      }
      this.pageMC = this.timelineMC.createEmptyMovieClip("pageMC",1);
   }
   function setupColumns()
   {
      var _loc3_ = 0;
      while(_loc3_ < arguments.length)
      {
         var _loc4_ = arguments[_loc3_];
         _loc4_.INITIALISE();
         this.columnList[_loc3_] = _loc4_;
         _loc3_ = _loc3_ + 1;
      }
      this.hideColumns();
   }
   function setupColScroll(colList, canScrollList)
   {
      var _loc1_ = 0;
      while(_loc1_ < colList.length)
      {
         if(canScrollList[_loc1_] != undefined)
         {
            var _loc2_ = colList[_loc1_];
            _loc2_.canWheelScroll = canScrollList[_loc1_];
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   function setupColMouseNav(colList, canNavList)
   {
      var _loc1_ = 0;
      while(_loc1_ < colList.length)
      {
         if(canNavList[_loc1_] != undefined)
         {
            var _loc2_ = colList[_loc1_];
            _loc2_.canMouseNav = canNavList[_loc1_];
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   function setupColFooterScroll(colList, overrideScrollList)
   {
      var _loc1_ = 0;
      while(_loc1_ < colList.length)
      {
         if(overrideScrollList[_loc1_] != undefined)
         {
            var _loc2_ = colList[_loc1_];
            _loc2_.footerScrollOverrideIndex = overrideScrollList[_loc1_];
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   function setScaledContent()
   {
   }
   function setDisplayConfig()
   {
   }
   function setupScroll(visible, columnIndex, columns, scrollType, arrowPosition, override, columnXOffset)
   {
      var _loc2_ = this["column" + columnIndex];
      _loc2_.INIT_SCROLL_BAR(visible,columns,scrollType,arrowPosition,override,columnXOffset);
   }
   function stateChanged(id)
   {
      this.hideColumns();
   }
   function addColumn(linkageID, depth, xpos)
   {
      var _loc2_ = this.pageMC.attachMovie(linkageID,"c" + depth + "MC",depth,{_x:xpos});
      return (com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)_loc2_;
   }
   function getColumn(i)
   {
      return (com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)this.columnList[i];
   }
   function getMaxColumns()
   {
      return this.columnList.length;
   }
   function hideColumns()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.columnList.length)
      {
         var _loc3_ = this.columnList[_loc2_];
         _loc3_._visible = false;
         _loc3_.__set__columnID(-1);
         _loc2_ = _loc2_ + 1;
      }
      this.columnList = [];
   }
   function showColumns()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.columnList.length)
      {
         var _loc3_ = this.columnList[_loc2_];
         _loc3_._visible = true;
         _loc3_.__set__columnID(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function onPageExit()
   {
      var _loc3_ = this.columnList.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)this.columnList[_loc2_].ON_DESTROY();
         _loc2_ = _loc2_ + 1;
      }
   }
}
