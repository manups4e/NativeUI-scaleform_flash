class com.rockstargames.gtav.pauseMenu.GAMEPAD_CALIBRATION extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var ButtonDetails = new Array();
   function GAMEPAD_CALIBRATION()
   {
      super();
      this.CalibrationComplete = false;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.TIMELINE._name = "GAMEPAD_CALIBRATION";
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.ButtonDetails.push(new Array(this.CONTENT.icon_0,"MO_A_BUTTON",this.CONTENT.padControls.crossTF,this.CONTENT.A_Button));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_1,"MO_B_BUTTON",this.CONTENT.padControls.circleTF,this.CONTENT.B_Button));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_2,"MO_X_BUTTON",this.CONTENT.padControls.squareTF,this.CONTENT.X_Button));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_3,"MO_Y_BUTTON",this.CONTENT.padControls.triangleTF,this.CONTENT.Y_Button));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_4,"MO_LEFT_SHOULDER",this.CONTENT.padControls.l1TF,this.CONTENT.LB_Button));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_5,"MO_LEFT_TRIGGER",this.CONTENT.padControls.l2TF,this.CONTENT.LT_Button));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_6,"MO_RIGHT_SHOULDER",this.CONTENT.padControls.r1TF,this.CONTENT.RB_Button));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_7,"MO_RIGHT_TRIGGER",this.CONTENT.padControls.r2TF,this.CONTENT.RT_Button));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_8,"MO_START_BUTTON",this.CONTENT.padControls.startTF,this.CONTENT.Start_Button));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_9,"MO_BACK_BUTTON",this.CONTENT.padControls.selectTF,this.CONTENT.Back_Button));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_10,"MO_DPAD_UP",this.CONTENT.padControls.upTF,this.CONTENT.Dpad_Up));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_11,"MO_DPAD_DOWN",this.CONTENT.padControls.downTF,this.CONTENT.Dpad_Down));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_12,"MO_DPAD_LEFT",this.CONTENT.padControls.leftTF,this.CONTENT.Dpad_Left));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_13,"MO_DPAD_RIGHT",this.CONTENT.padControls.rightTF,this.CONTENT.Dpad_Right));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_14,"MO_LEFT_STICK_PRESS",this.CONTENT.padControls.l3TF,this.CONTENT.L_Stick_Press));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_15,"MO_LEFT_STICK_DIR",this.CONTENT.padControls.lAnalogueTF,this.CONTENT.L_Stick_Move));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_16,"MO_LEFT_STICK_DIR",this.CONTENT.padControls.lAnalogueTF,this.CONTENT.L_Stick_Move));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_17,"MO_RIGHT_STICK_PRESS",this.CONTENT.padControls.r3TF,this.CONTENT.R_Stick_Press));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_18,"MO_RIGHT_STICK_DIR",this.CONTENT.padControls.rAnalogueTF,this.CONTENT.R_Stick_Move));
      this.ButtonDetails.push(new Array(this.CONTENT.icon_19,"MO_RIGHT_STICK_DIR",this.CONTENT.padControls.rAnalogueTF,this.CONTENT.R_Stick_Move));
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"MO_GAMEPAD",this.CONTENT.titleTXT,false);
      var _loc2_ = 0;
      var _loc3_ = 20;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.ButtonDetails[_loc2_][1],this.ButtonDetails[_loc2_][2],false);
         this.ButtonDetails[_loc2_][0]._visible = false;
         this.ButtonDetails[_loc2_][2]._visible = false;
         this.ButtonDetails[_loc2_][3]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      this.CalibrationComplete = false;
      this.CONTENT.bgBar._visible = false;
      this.CONTENT.foreBar._visible = false;
      this.CONTENT.fill1._visible = false;
      this.CONTENT.fill2._visible = false;
   }
   function SHOW_BUTTON(button, showButton, hidePrevious)
   {
      if(hidePrevious)
      {
         var _loc2_ = 0;
         var _loc3_ = 20;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.ButtonDetails[_loc2_][2]._visible = false;
            this.ButtonDetails[_loc2_][3]._visible = false;
            _loc2_ = _loc2_ + 1;
         }
      }
      if(showButton)
      {
         this.ButtonDetails[button][2]._visible = true;
         this.ButtonDetails[button][3]._visible = true;
      }
      else if(!hidePrevious)
      {
         this.ButtonDetails[button][2]._visible = false;
         this.ButtonDetails[button][3]._visible = false;
      }
   }
   function BAR_POSITION(pos)
   {
      this.CONTENT.foreBar._width = this.CONTENT.bgBar._width * pos;
   }
   function SHOW_BAR(showBar)
   {
      if(showBar)
      {
         this.CONTENT.bgBar._visible = true;
         this.CONTENT.foreBar._visible = true;
      }
      else
      {
         this.CONTENT.bgBar._visible = false;
         this.CONTENT.foreBar._visible = false;
      }
   }
   function CONSTRUCT_STRING(button, startString, endString, prompt, clearOld, hasFill)
   {
      if(hasFill == undefined)
      {
         hasFill = false;
      }
      if(prompt < 2)
      {
         var _loc3_ = undefined;
         var _loc6_ = undefined;
         if(prompt == 0)
         {
            _loc3_ = this.CONTENT.promptTXT;
            _loc6_ = this.CONTENT.fill1;
         }
         else
         {
            _loc3_ = this.CONTENT.promptTXT2;
            _loc6_ = this.CONTENT.fill2;
         }
         _loc3_.wordWrap = false;
         _loc3_.text = startString;
         var _loc7_ = _loc3_.textWidth;
         _loc3_.text = startString + "          " + endString;
         var _loc9_ = _loc3_.textWidth;
         var _loc10_ = (_loc3_._width - _loc9_) / 2;
         _loc7_ = _loc7_ + _loc10_;
         if(clearOld)
         {
            var _loc2_ = 0;
            var _loc5_ = 20;
            _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               this.ButtonDetails[_loc2_][0]._visible = false;
               _loc2_ = _loc2_ + 1;
            }
         }
         this.ButtonDetails[button][0]._visible = true;
         this.ButtonDetails[button][0]._width = 32;
         this.ButtonDetails[button][0]._height = 32;
         this.ButtonDetails[button][0]._x = _loc3_._x + _loc7_ + 6;
         this.ButtonDetails[button][0]._y = _loc3_._y - 8;
         if(hasFill)
         {
            _loc6_._visible = true;
            _loc6_._xscale = this.ButtonDetails[button][0]._xscale + 10;
            _loc6_._yscale = this.ButtonDetails[button][0]._yscale + 10;
            this.ButtonDetails[button][0]._x = this.ButtonDetails[button][0]._x - 8;
            _loc6_._x = this.ButtonDetails[button][0]._x + 16;
            _loc6_._y = this.ButtonDetails[button][0]._y + 16;
         }
      }
   }
   function SET_BUTTON_PRESS_STATE(isPressed, prompt)
   {
      var _loc2_ = undefined;
      if(prompt == 0)
      {
         _loc2_ = this.CONTENT.fill1;
      }
      else
      {
         _loc2_ = this.CONTENT.fill2;
      }
      if(isPressed)
      {
         _loc2_.gotoAndPlay(2);
      }
      else
      {
         _loc2_.gotoAndStop(1);
      }
   }
   function END_CALIBRATION()
   {
      var _loc2_ = 0;
      var _loc3_ = 20;
      _loc2_ = 2;
      while(_loc2_ < _loc3_)
      {
         this.ButtonDetails[_loc2_][0]._visible = false;
         this.ButtonDetails[_loc2_][2]._visible = false;
         this.ButtonDetails[_loc2_][3]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.bgBar._visible = false;
      this.CONTENT.foreBar._visible = false;
      this.CalibrationComplete = true;
   }
}
