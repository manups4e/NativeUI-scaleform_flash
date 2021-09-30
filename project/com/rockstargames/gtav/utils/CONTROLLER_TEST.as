class com.rockstargames.gtav.utils.CONTROLLER_TEST
{
   var MASTER_DELAY = 0.01;
   function CONTROLLER_TEST()
   {
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.CONTENT._xscale = 80;
      this.CONTENT._yscale = 80;
      this.CONTENT._x = 0;
      this.CONTENT._y = 0;
      this.stringArray = new Array();
   }
   function restDpad()
   {
      this.CONTENT.DPAD.gotoAndStop("OFF");
   }
   function resetIcon()
   {
      var _loc2_ = arguments[0];
      _loc2_._xscale = 60;
      _loc2_._yscale = 60;
   }
   function growIcon(mc)
   {
      mc._xscale = 100;
      mc._yscale = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mc,this.MASTER_DELAY,{onComplete:this.resetIcon,onCompleteScope:this,onCompleteArgs:[mc]});
   }
   function SET_INPUT_EVENT(direction)
   {
      var _loc3_ = " ";
      switch(direction)
      {
         case com.rockstargames.ui.game.GamePadConstants.LEFTSHOULDER1:
            this.growIcon(this.CONTENT.LEFTSHOULDER1);
            _loc3_ = "<img src=\'button_34\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.LEFTSHOULDER2:
            this.growIcon(this.CONTENT.LEFTSHOULDER2);
            _loc3_ = "<img src=\'button_35\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.RIGHTSHOULDER1:
            this.growIcon(this.CONTENT.RIGHTSHOULDER1);
            _loc3_ = "<img src=\'button_36\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.RIGHTSHOULDER2:
            this.growIcon(this.CONTENT.RIGHTSHOULDER2);
            _loc3_ = "<img src=\'button_37\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            this.CONTENT.DPAD.gotoAndStop("UP");
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.DPAD,this.MASTER_DELAY,{onComplete:this.restDpad,onCompleteScope:this});
            _loc3_ = "<img src=\'button_4\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            this.CONTENT.DPAD.gotoAndStop("DOWN");
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.DPAD,this.MASTER_DELAY,{onComplete:this.restDpad,onCompleteScope:this});
            _loc3_ = "<img src=\'button_5\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            this.CONTENT.DPAD.gotoAndStop("LEFT");
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.DPAD,this.MASTER_DELAY,{onComplete:this.restDpad,onCompleteScope:this});
            _loc3_ = "<img src=\'button_6\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            this.CONTENT.DPAD.gotoAndStop("RIGHT");
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.DPAD,this.MASTER_DELAY,{onComplete:this.restDpad,onCompleteScope:this});
            _loc3_ = "<img src=\'button_7\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.START:
            this.growIcon(this.CONTENT.START);
            _loc3_ = "<img src=\'button_38\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.SELECT:
            this.growIcon(this.CONTENT.SELECT);
            _loc3_ = "<img src=\'button_39\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.SQUARE:
            this.growIcon(this.CONTENT.SQUARE);
            _loc3_ = "<img src=\'button_32\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.TRIANGLE:
            this.growIcon(this.CONTENT.TRIANGLE);
            _loc3_ = "<img src=\'button_33\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.CROSS:
            this.growIcon(this.CONTENT.CROSS);
            _loc3_ = "<img src=\'button_30\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.CIRCLE:
            this.growIcon(this.CONTENT.CIRCLE);
            _loc3_ = "<img src=\'button_31\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.LEFTSHOCK:
            this.growIcon(this.CONTENT.LEFTSTICK);
            _loc3_ = "<img src=\'button_17\' height=\'25\' width=\'25\'/><br/>";
            break;
         case com.rockstargames.ui.game.GamePadConstants.RIGHTSHOCK:
            this.growIcon(this.CONTENT.RIGHTSTICK);
            _loc3_ = "<img src=\'button_26\' height=\'25\' width=\'25\'/><br/>";
      }
      if(_loc3_ != " ")
      {
         if(this.stringArray.length > 19)
         {
            this.stringArray.shift();
         }
         this.stringArray.push(_loc3_);
         this.stringArray.reverse();
         var _loc2_ = 0;
         var _loc4_ = "";
         _loc2_ = 0;
         while(_loc2_ < this.stringArray.length)
         {
            _loc4_ = _loc4_ + this.stringArray[_loc2_];
            _loc2_ = _loc2_ + 1;
         }
         this.stringArray.reverse();
         this.CONTENT.outputTF.htmlText = _loc4_;
      }
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, mouseX, mouseY)
   {
      if(isLeftStick == 1)
      {
         this.CONTENT.LeftXvalue.text = mouseX;
         this.CONTENT.LeftYvalue.text = mouseY;
      }
      if(isLeftStick == 0)
      {
         this.CONTENT.RightXvalue.text = mouseX;
         this.CONTENT.RightYvalue.text = mouseY;
      }
   }
}
