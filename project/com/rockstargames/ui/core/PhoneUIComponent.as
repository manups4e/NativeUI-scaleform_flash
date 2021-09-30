class com.rockstargames.ui.core.PhoneUIComponent extends MovieClip
{
   var rowSpace = 0;
   var currentSelection = -1;
   var _UIColours = new Array();
   var columnSpace = 0;
   var isLandscape = false;
   var phoneWidth = 256;
   var offSCreenLeftX = -256;
   var offSCreenRightX = 256;
   var onSCreenX = 0;
   var phoneHeight = 344;
   function PhoneUIComponent()
   {
      super();
      this.dataProviderUI = new Array();
   }
   function construct(parentContainer, linkageID, params)
   {
      this.linkageKey = linkageID;
      if(this.container)
      {
         this.removeMovieClip();
      }
      this.container = parentContainer.createEmptyMovieClip("container",1000);
      if(this.header)
      {
         this.header.removeMovieClip();
      }
      this.header = this.container.attachMovie("header","header",1100);
      this.headerTextfield = this.header.headerText;
      this.container._x = 0;
      if(params.numberOfColumns)
      {
         this.numberOfColumns = params.numberOfColumns;
      }
      if(params.numberOfVisibleRows)
      {
         this.numberOfVisibleRows = params.numberOfVisibleRows;
      }
      if(params.rowSpace)
      {
         this.rowSpace = params.rowSpace;
      }
      if(params.dataProviderUI)
      {
         this.dataProviderUI = params.dataProviderUI;
      }
      if(params.offsetX)
      {
         this.offsetX = params.offsetX;
      }
      if(params.offsetY)
      {
         this.offsetY = params.offsetY;
      }
      if(params.levelDepth)
      {
         this.levelDepth = params.levelDepth;
      }
      if(params.columnSpace)
      {
         this.columnSpace = params.columnSpace;
      }
      if(params.isLandscape)
      {
         this.isLandscape = params.isLandscape;
      }
      if(this.numberOfVisibleRows >= this.dataProviderUI.length)
      {
         this.numberOfVisibleRows = this.dataProviderUI.length;
         this.needsScrollbars = false;
      }
      else
      {
         this.needsScrollbars = true;
      }
   }
   function renderContainers()
   {
   }
   function update()
   {
   }
   function populateContent()
   {
   }
   function navigate(direction)
   {
   }
   function SET_HEADER(headerText, X, Y, Col)
   {
      this.header._x = X;
      this.header._y = Y;
      this.headerTextfield.text = headerText;
   }
   function TXD_HAS_LOADED()
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
   function REMOVE()
   {
      this.dataProviderUI = [];
      for(var _loc2_ in this.container)
      {
         if(typeof this.container[_loc2_] == "movieclip")
         {
            this.container[_loc2_].removeMovieClip();
         }
         else
         {
            delete this.container.register2;
         }
      }
      this.container.removeMovieClip();
   }
   function CLEAN_UP_DATA()
   {
      this.dataProviderUI = [];
   }
   function GET_CURRENT_SELECTION()
   {
      return this.currentSelection;
   }
}
