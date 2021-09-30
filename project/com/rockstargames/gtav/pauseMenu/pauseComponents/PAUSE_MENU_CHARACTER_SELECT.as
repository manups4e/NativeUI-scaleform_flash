class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CHARACTER_SELECT extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var silAlpha = 15;
   var numAlpha = 5;
   var strLabelList = new Array();
   function PAUSE_MENU_CHARACTER_SELECT()
   {
      super();
      this.dbgID = "PAUSE_MENU_CHARACTER_SELECT";
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      var _loc4_ = 1;
      while(_loc4_ <= 5)
      {
         var _loc3_ = this["playerSil" + _loc4_ + "MC"];
         _loc3_.gotoAndStop(1);
         if(_loc4_ > 2)
         {
            _loc3_._alpha = 50;
         }
         _loc3_.numMC.gotoAndStop(_loc4_);
         _loc3_.silhuetteMC._alpha = this.silAlpha;
         _loc3_.bgMC._visible = false;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3_.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
         _loc3_.numMC._alpha = this.numAlpha;
         var _loc5_ = this["importedFrom" + _loc4_ + "MC"];
         _loc5_._visible = false;
         _loc4_ = _loc4_ + 1;
      }
      this.CONTENT.infoMC._visible = false;
      this.CONTENT.infoTeamSelectMC._visible = false;
      this.CONTENT.infoTeamSelectMC.vehicleMC._visible = false;
      this.CONTENT.infoTeamSelectMC.weaponMC._visible = false;
      this.strLabelList = [];
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      var _loc3_ = arguments[0] + 1;
      var _loc4_ = arguments[6];
      var _loc5_ = arguments[7];
      var _loc6_ = arguments[8];
      this.SetCharacterProperties(_loc3_,_loc5_,_loc4_);
   }
   function SET_TITLE(str)
   {
      this.strLabelList = arguments;
   }
   function SET_DESCRIPTION()
   {
      var _loc7_ = arguments[0];
      var _loc9_ = arguments[1];
      var _loc34_ = arguments[2];
      var _loc31_ = 0;
      var _loc37_ = arguments[3];
      var _loc10_ = arguments[4];
      var _loc32_ = arguments[5];
      var _loc12_ = arguments[6];
      var _loc26_ = arguments[7];
      var _loc21_ = arguments[8];
      var _loc22_ = arguments[9];
      var _loc14_ = arguments[10];
      var _loc35_ = arguments[11];
      var _loc27_ = arguments[12];
      var _loc8_ = arguments[13];
      var _loc36_ = arguments[14];
      var _loc15_ = arguments[15];
      var _loc17_ = arguments[16];
      var _loc38_ = arguments[17];
      var _loc16_ = arguments[18];
      var _loc23_ = this.strLabelList[12];
      var _loc39_ = this.strLabelList[0];
      var _loc24_ = this.strLabelList[1];
      var _loc20_ = this.strLabelList[2];
      var _loc25_ = this.strLabelList[3];
      var _loc33_ = this.strLabelList[4];
      var _loc18_ = this.strLabelList[5];
      var _loc19_ = this.strLabelList[6];
      var _loc29_ = this.strLabelList[7];
      var _loc30_ = this.strLabelList[8];
      var _loc28_ = this.strLabelList[9];
      var _loc13_ = this.strLabelList[10];
      var _loc11_ = this.strLabelList[11];
      var _loc6_ = 13;
      var _loc3_ = 0;
      while(_loc3_ < 5)
      {
         var _loc4_ = this["importedFrom" + (_loc3_ + 1) + "MC"];
         var _loc5_ = this.strLabelList[_loc6_ + _loc3_];
         if(_loc5_)
         {
            com.rockstargames.ui.utils.UIText.setSizedText(_loc4_.importedFromTF,_loc5_,true);
            _loc4_._alpha = 100;
         }
         else
         {
            _loc4_._alpha = 0;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.PCC.SHOW_COLUMN(true);
      this.PCC.SET_DATA_SLOT_EMPTY(0);
      this.PCC.SET_TITLE(_loc7_,_loc9_,_loc34_,_loc31_,_loc7_,_loc9_,_loc36_,_loc15_,_loc23_,_loc17_,_loc38_,_loc16_,_loc8_);
      this.PCC.SET_DATA_SLOT(0,1113,0,0,0,_loc22_,_loc14_,_loc35_,_loc27_,_loc8_);
      this.PCC.SET_DATA_SLOT(1,1113,0,0,0,1,_loc39_,_loc19_,_loc37_);
      this.PCC.SET_DATA_SLOT(2,1113,0,0,0,1,_loc24_,_loc29_,_loc10_);
      this.PCC.SET_DATA_SLOT(3,1113,0,0,0,1,_loc20_,_loc30_,_loc32_);
      this.PCC.SET_DATA_SLOT(4,1113,0,0,0,1,_loc25_,_loc28_,_loc12_);
      this.PCC.SET_DATA_SLOT(5,1113,0,0,0,1,_loc33_,_loc13_,_loc26_);
      this.PCC.SET_DATA_SLOT(6,1113,0,0,0,1,_loc18_,_loc11_,_loc21_);
      this.PCC.DISPLAY_VIEW(0);
   }
   function SET_STATE(i)
   {
      this.PCC = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_PLAYER_COMPARISON_CARD)arguments[1];
   }
   function ON_DESTROY()
   {
      this.PCC = null;
   }
   function SetCharacterProperties(index, visible, highlight)
   {
      var _loc11_ = this["playerSil" + index + "MC"];
      _loc11_.silhuetteMC._visible = visible;
      _loc11_.bgMC._visible = visible;
      _loc11_.numMC.gotoAndStop(index);
      _loc11_.silhuetteMC._alpha = highlight != 1?this.silAlpha:30;
      _loc11_.numMC._alpha = highlight != 1?this.numAlpha:this.numAlpha * 3;
      if(highlight == 1)
      {
         var _loc10_ = 2;
         var _loc9_ = 143;
         var _loc14_ = index * _loc9_ + index * _loc10_;
         this.PCC._x = _loc14_;
         var _loc2_ = index + 1;
         while(_loc2_ <= 5)
         {
            var _loc7_ = this["playerSil" + _loc2_ + "MC"];
            var _loc8_ = _loc2_ * _loc9_ + _loc2_ * _loc10_;
            _loc7_._x = _loc8_;
            _loc2_ = _loc2_ + 1;
         }
         var _loc12_ = this["playerSil" + index + "MC"];
         _loc12_._x = (index - 1) * _loc9_ + (index - 1) * _loc10_;
         var _loc3_ = 0;
         while(_loc3_ < 5)
         {
            var _loc4_ = _loc3_ + 1;
            var _loc5_ = this["importedFrom" + _loc4_ + "MC"];
            if(index == _loc4_)
            {
               _loc5_._visible = true;
            }
            else
            {
               _loc5_._visible = false;
            }
            _loc3_ = _loc3_ + 1;
         }
      }
   }
}
