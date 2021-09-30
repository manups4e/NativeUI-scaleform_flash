class com.rockstargames.ui.core.BrowserUIComponent extends MovieClip
{
   var _rowSpace = 0;
   var _currentSelection = -1;
   var _columnSpace = 0;
   function BrowserUIComponent()
   {
      super();
      this.dataProviderUI = new Array();
   }
   function construct(parentContainer, linkageID, params)
   {
      this.linkageKey = linkageID;
      if(this.container)
      {
         this.container.removeMovieClip();
      }
      this.container = parentContainer.createEmptyMovieClip("container",parentContainer.getNextHighestDepth());
      this.container._x = 0;
      if(params.numberOfColumns)
      {
         this.__set__numberOfColumns(params.numberOfColumns);
      }
      if(params.numberOfVisibleRows)
      {
         this.__set__numberOfVisibleRows(params.numberOfVisibleRows);
      }
      if(params.rowSpace)
      {
         this.__set__rowSpace(params.rowSpace);
      }
      if(params.dataProviderUI)
      {
         this.dataProviderUI = params.dataProviderUI;
      }
      if(params.offsetX)
      {
         this.__set__offsetX(params.offsetX);
      }
      if(params.offsetY)
      {
         this.__set__offsetY(params.offsetY);
      }
      if(params.primaryColour)
      {
         this.__set__primaryColour(params.primaryColour);
      }
      if(params.secondaryColour)
      {
         this.__set__secondaryColour(params.secondaryColour);
      }
      if(params.levelDepth)
      {
         this.__set__levelDepth(params.levelDepth);
      }
      if(params.columnSpace)
      {
         this.__set__columnSpace(params.columnSpace);
      }
   }
   function renderContainers()
   {
   }
   function navigate(direction)
   {
   }
   function setState(item, isActive)
   {
   }
   function SHOW()
   {
      this.container._visible = true;
   }
   function HIDE()
   {
      this.container._visible = false;
   }
   function __get__numberOfColumns()
   {
      return this._numberOfColumns;
   }
   function __set__numberOfColumns(newNumberOfColumns)
   {
      this._numberOfColumns = newNumberOfColumns;
      return this.__get__numberOfColumns();
   }
   function __get__numberOfVisibleRows()
   {
      return this._numberOfVisibleRows;
   }
   function __set__numberOfVisibleRows(newNumberOfVisibleRows)
   {
      this._numberOfVisibleRows = newNumberOfVisibleRows;
      return this.__get__numberOfVisibleRows();
   }
   function __get__rowSpace()
   {
      return this._rowSpace;
   }
   function __set__rowSpace(newRowSpace)
   {
      this._rowSpace = newRowSpace;
      return this.__get__rowSpace();
   }
   function __get__offsetX()
   {
      return this._offsetX;
   }
   function __set__offsetX(newOffsetX)
   {
      this._offsetX = newOffsetX;
      return this.__get__offsetX();
   }
   function __get__offsetY()
   {
      return this._offsetY;
   }
   function __set__offsetY(newOffsetY)
   {
      this._offsetY = newOffsetY;
      return this.__get__offsetY();
   }
   function __get__primaryColour()
   {
      return this._primaryColour;
   }
   function __set__primaryColour(newPrimaryColour)
   {
      this._primaryColour = newPrimaryColour;
      return this.__get__primaryColour();
   }
   function __get__secondaryColour()
   {
      return this._secondaryColour;
   }
   function __set__secondaryColour(newSecondaryColour)
   {
      this._secondaryColour = newSecondaryColour;
      return this.__get__secondaryColour();
   }
   function __get__levelDepth()
   {
      return this._levelDepth;
   }
   function __set__levelDepth(newLevelDepth)
   {
      this._levelDepth = newLevelDepth;
      return this.__get__levelDepth();
   }
   function __get__columnSpace()
   {
      return this._columnSpace;
   }
   function __set__columnSpace(newColumnSpace)
   {
      this._columnSpace = newColumnSpace;
      return this.__get__columnSpace();
   }
   function __get__currentSelection()
   {
      return this._currentSelection;
   }
   function __set__currentSelection(newCurrentSelection)
   {
      this._currentSelection = newCurrentSelection;
      return this.__get__currentSelection();
   }
}
