class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_SELECTOR extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   function MP_MATCHMAKING_SELECTOR()
   {
      super();
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
      this.betSelectorMC = this.CONTENT.betSelectorMC;
      this.carSelectorMC = this.CONTENT.carSelectorMC;
      this.carSelectorMC.innerMC.nameTF.textAutoSize = "shrink";
      this.gamerInfoMC = this.CONTENT.gamerInfoMC;
      this.betSelectorMC._visible = false;
      this.carSelectorMC._visible = false;
      this.gamerInfoMC._visible = false;
   }
   function SHOW_GAMER_INFO(colIndex, name, crewName, crewTagStr, txd, txn)
   {
      this.gamerInfoMC._visible = true;
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(colIndex,_loc2_);
      com.rockstargames.ui.utils.Colour.Colourise(this.gamerInfoMC.nameTF,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      this.gamerInfoMC.nameTF.text = name;
      this.gamerInfoMC.crewNameTF.htmlText = crewName;
      if(txd != undefined && txn != undefined)
      {
         if(this.gamerInfoMC.crewEmblem == undefined)
         {
            this.gamerInfoMC.crewEmblem = this.gamerInfoMC.attachMovie("crewEmblem","crewEmblemMC",this.gamerInfoMC.getNextHighestDepth(),{_x:7,_y:7});
         }
         if(this.gamerInfoMC.crewEmblem.isLoaded)
         {
            this.gamerInfoMC.crewEmblem.removeTxdRef();
         }
         this.gamerInfoMC.crewEmblem.init("mp_matchmaking_selector",txd,txn,64,64);
         this.gamerInfoMC.crewEmblem.addTxdRef("");
      }
      else if(this.gamerInfoMC.crewEmblem.isLoaded)
      {
         this.gamerInfoMC.crewEmblem.removeTxdRef();
      }
      if(crewTagStr == "" || crewTagStr == undefined)
      {
         this.gamerInfoMC.crewTag._visible = false;
      }
      else
      {
         this.gamerInfoMC.crewTag.UNPACK_CREW_TAG(crewTagStr);
         this.gamerInfoMC.crewTag._x = this.gamerInfoMC.nameTF._x + this.gamerInfoMC.nameTF.textWidth + 10;
         this.gamerInfoMC.crewTag._visible = true;
      }
   }
   function SHOW_CENTER_CONTENT(show)
   {
      this.currSelectorMC.innerMC._visible = show;
   }
   function SHOW_BOTTOM_SELECTOR(show)
   {
      this.currSelectorMC.innerMC.lowerSelectorMC._visible = show;
   }
   function SHOW_LEFT_ARROW(show)
   {
      this.currSelectorMC.arrowLeftMC._visible = show;
   }
   function SHOW_RIGHT_ARROW(show)
   {
      this.currSelectorMC.arrowRightMC._visible = show;
   }
   function SHOW_UP_DOWN_ARROWS(show)
   {
      this.currSelectorMC.innerMC.lowerSelectorMC.upArrowMC._visible = show;
      this.currSelectorMC.innerMC.lowerSelectorMC.downArrowMC._visible = show;
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID)
   {
      this.gamerInfoMC.crewEmblem.displayTxdResponse(textureDict);
   }
   function SHOW_BET_SELECTOR(betsOnVal, oddsVal, myBetVal)
   {
      this.betSelectorMC._visible = true;
      this.carSelectorMC._visible = false;
      this.currSelectorMC = this.betSelectorMC;
      this.SHOW_CENTER_CONTENT(true);
      this.SHOW_LEFT_ARROW(true);
      this.SHOW_RIGHT_ARROW(true);
      this.LOCK_BETTING(false);
      this.betSelectorMC.innerMC.betsOnThisPlayerValTF.text = betsOnVal;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.betSelectorMC.innerMC.betsOnThisPlayerTF,"BETS_ON_THIS_PLAYER");
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.betSelectorMC.innerMC.betsOnThisPlayerValBGMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      var _loc4_ = this.betSelectorMC.innerMC.betsOnThisPlayerValTF.textWidth + 20;
      this.betSelectorMC.innerMC.betsOnThisPlayerValBGMC._width = _loc4_;
      this.betSelectorMC.innerMC.betsOnThisPlayerValBGMC._x = 640 - _loc4_ / 2;
      this.betSelectorMC.innerMC.oddsValTF.text = oddsVal;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.betSelectorMC.innerMC.oddsTF,"ODDS");
      this.betSelectorMC.innerMC.myBetValTF.text = myBetVal;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.betSelectorMC.innerMC.myBetTF,"MY_BET");
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE,_loc2_);
      com.rockstargames.ui.utils.Colour.Colourise(this.betSelectorMC.innerMC.myBetValBGMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      _loc4_ = this.betSelectorMC.innerMC.myBetValTF.textWidth + 30;
      this.betSelectorMC.innerMC.myBetValBGMC._width = _loc4_;
      this.betSelectorMC.innerMC.myBetValBGMC._x = 640 - _loc4_ / 2;
   }
   function SET_BETS_ON_PLAYER(val)
   {
      this.betSelectorMC.innerMC.betsOnThisPlayerValTF.text = val;
      var _loc2_ = this.betSelectorMC.innerMC.betsOnThisPlayerValTF.textWidth + 20;
      this.betSelectorMC.innerMC.betsOnThisPlayerValBGMC._width = _loc2_;
      this.betSelectorMC.innerMC.betsOnThisPlayerValBGMC._x = 640 - _loc2_ / 2;
   }
   function LOCK_BETTING(locked)
   {
      this.betSelectorMC.innerMC.noBetsTF._visible = locked;
      this.betSelectorMC.innerMC.noBetsBGMC._visible = locked;
      if(locked)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.betSelectorMC.innerMC.noBetsTF,"BETS_LOCKED");
      }
      this.SHOW_UP_DOWN_ARROWS(!locked);
   }
   function SET_ODDS(val)
   {
      this.betSelectorMC.innerMC.oddsValTF.text = val;
   }
   function SET_MY_BET(val)
   {
      this.betSelectorMC.innerMC.myBetValTF.text = val;
      var _loc2_ = this.betSelectorMC.innerMC.myBetValTF.textWidth + 30;
      this.betSelectorMC.innerMC.myBetValBGMC._width = _loc2_;
      this.betSelectorMC.innerMC.myBetValBGMC._x = 640 - _loc2_ / 2;
   }
   function SHOW_VEHICLE_SELECTOR(name, type, colour, colourType)
   {
      this.betSelectorMC._visible = false;
      this.carSelectorMC._visible = true;
      this.currSelectorMC = this.carSelectorMC;
      this.SHOW_CENTER_CONTENT(true);
      this.SHOW_LEFT_ARROW(true);
      this.SHOW_RIGHT_ARROW(true);
      this.SHOW_UP_DOWN_ARROWS(true);
      this.SHOW_BOTTOM_SELECTOR(true);
      this.SET_VEHICLE_NAME(name);
      this.carSelectorMC.innerMC.typeTF.text = type;
      this.carSelectorMC.innerMC.lowerSelectorMC.colourTF.text = colour;
      this.carSelectorMC.innerMC.lowerSelectorMC.colourTypeTF.text = colourType;
   }
   function SHOW_QUESTION_MARK(show)
   {
      this.carSelectorMC.innerMC.questionMarkTF._visible = show;
   }
   function SET_VEHICLE_NAME(name)
   {
      this.carSelectorMC.innerMC.nameTF.text = name;
   }
   function SET_VEHICLE_TYPE(type)
   {
      this.carSelectorMC.innerMC.typeTF.text = type;
   }
   function SET_COLOUR(colour)
   {
      this.carSelectorMC.innerMC.lowerSelectorMC.colourTF.text = colour;
   }
   function SET_COLOUR_TYPE(colourType)
   {
      this.carSelectorMC.innerMC.lowerSelectorMC.colourTypeTF.text = colourType;
   }
}
