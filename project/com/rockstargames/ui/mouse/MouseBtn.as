class com.rockstargames.ui.mouse.MouseBtn extends MovieClip implements com.rockstargames.ui.mouse.MouseBtnInterface
{
   var optionalMouseArgs = new Array();
   var _isMouseEnabled = true;
   function MouseBtn()
   {
      super();
      this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
      this.init();
   }
   function setupMouseInterface(_uiID, _interfaceID, _optionalMouseArgs)
   {
      if(_uiID != undefined)
      {
         this.MOUSE_EVT.__set__UI_MOVIE(_uiID);
      }
      if(_interfaceID != undefined)
      {
         this.MOUSE_EVT.__set__INTERFACE_TYPE(_interfaceID);
      }
      if(_optionalMouseArgs != undefined)
      {
         this.optionalMouseArgs = _optionalMouseArgs;
      }
   }
   function setupGenericMouseInterface(_itemID, _itemContext, _callback, _callbackArgs)
   {
      if(_itemContext == undefined)
      {
         _itemContext = -1;
      }
      this.setupMouseInterface(com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_GENERIC,undefined,[_itemID,_itemContext]);
      if(_callback)
      {
         this.callback = _callback;
         if(_callbackArgs)
         {
            this.callbackArgs = _callbackArgs;
         }
      }
   }
   function set _isMouseEnabled(b)
   {
      this._isMouseEnabled = b;
      return this._isMouseEnabled();
   }
   function get _isMouseEnabled()
   {
      return this._isMouseEnabled;
   }
   function init()
   {
      this.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this,this.sendMouseEvent,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER);
      this.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this,this.sendMouseEvent,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT);
      this.onDragOver = com.rockstargames.ui.utils.DelegateStar.create(this,this.sendMouseEvent,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_DRAG_OVER);
      this.onDragOut = com.rockstargames.ui.utils.DelegateStar.create(this,this.sendMouseEvent,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_DRAG_OUT);
      this.onPress = com.rockstargames.ui.utils.DelegateStar.create(this,this.sendMouseEvent,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_PRESS);
      this.onRelease = com.rockstargames.ui.utils.DelegateStar.create(this,this.sendMouseEvent,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE);
      this.onReleaseOutside = com.rockstargames.ui.utils.DelegateStar.create(this,this.sendMouseEvent,com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE_OUTSIDE);
   }
   function sendMouseEvent(id)
   {
      var _loc4_ = [id,this._name];
      var _loc3_ = this.optionalMouseArgs.length;
      if(_loc3_ > 0)
      {
         var _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_.push(this.optionalMouseArgs[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
      }
      if(this.__get__isMouseEnabled())
      {
         if(this.callback)
         {
            this.callback.apply(this,[id,this,this.callbackArgs]);
         }
         this.MOUSE_EVT.triggerEvent(_loc4_);
      }
   }
   function dispose()
   {
      if(this.onRollOver)
      {
         delete this.onRollOver;
         delete this.onRollOut;
         delete this.onDragOver;
         delete this.onDragOut;
         delete this.onPress;
         delete this.onRelease;
         delete this.onReleaseOutside;
      }
   }
}
