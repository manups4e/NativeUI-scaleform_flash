class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_NEWSWIRE extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_NEWSWIRE()
   {
      super();
      this.dbgID = "PAUSE_MENU_NEWSWIRE";
   }
   function INITIALISE()
   {
      this.mouseWheelObj = new com.rockstargames.ui.mouse.MouseBtn();
      this.mouseWheelObj._name = "mouseWheelObj";
      this.mouseWheelObj.dispose();
      this.mouseWheelObj.setupGenericMouseInterface(0);
      this.CONTENT = this;
      this.CONTENT.bgMC.onRollOver = this.rollOver;
      this.CONTENT.bgMC.onRollOut = this.rollOut;
      this.CONTENT.bgMC.onDragOut = this.rollOut;
   }
   function rollOver()
   {
      _level0.TIMELINE.MOUSE_COLUMN_SHIFT(1);
   }
   function rollOut()
   {
      _level0.TIMELINE.MOUSE_COLUMN_SHIFT(0);
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case 8:
            this.mouseWheelObj.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_WHEEL_UP);
            break;
         case 9:
            this.mouseWheelObj.sendMouseEvent(com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_WHEEL_DOWN);
      }
   }
}
