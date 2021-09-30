class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   static var IMAGE_X = 8;
   static var IMAGE_Y = 6;
   static var IMAGE_LENGTH = 40;
   static var STAT_HEIGHT = 28;
   function PauseMenuFeedItem()
   {
      super();
      com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.TEXT_X = this.labelMC._x;
      this.iconMC._visible = false;
      this.feedImgContainer2 = this.createEmptyMovieClip("feedImgContainer2",this.getNextHighestDepth());
      this.feedImgContainer1 = this.createEmptyMovieClip("feedImgContainer1",this.getNextHighestDepth());
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bodyMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.itemTextLeft.htmlText = this.parseForTitleFonts(this.__get__data()[0]);
      var _loc8_ = !this.__get__data()[1]?"":this.__get__data()[1];
      var _loc10_ = !this.__get__data()[2]?"":this.__get__data()[2];
      var _loc4_ = !this.__get__data()[3]?"":this.__get__data()[3];
      var _loc5_ = !this.__get__data()[4]?"":this.__get__data()[4];
      this.indentLabel(_loc4_ != undefined && _loc5_ != undefined && _loc4_ != "" && _loc5_ != "");
      this.feedImgDefaultMC = this.loadFeedTexture(this.feedImgDefaultMC,this.feedImgContainer1,"feedImgDefault",_loc4_,_loc5_,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_X,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_Y,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_LENGTH,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_LENGTH,this.fadeDefaultImgIn);
      this.labelMC.subtitleTF.htmlText = this.parseForFonts(_loc8_);
      this.bodyMC.bodyTF.autoSize = "left";
      this.bodyMC.bodyTF.multiline = true;
      this.bodyMC.bodyTF.wordWrap = true;
      this.bodyMC.bodyTF.htmlText = this.parseForFonts(_loc10_);
      this.placeholderImgMC._visible = true;
      switch(this.type)
      {
         case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.AWARD:
            var _loc6_ = this.__get__data()[5];
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.feedImgDefaultMC,_loc6_);
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.labelMC.subtitleTF,_loc6_);
            break;
         case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.UNLOCK:
            this.indentLabel(true);
            this.placeholderImgMC._visible = false;
            this.iconMC._visible = true;
            this.iconMC.gotoAndStop(this.__get__data()[5] + 1);
            break;
         case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.TOOLTIPS:
         case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.TICKER:
            this.placeholderImgMC._visible = false;
            this.bodyMC._y = 3;
            if(this.textIconLayerMC != undefined)
            {
               this.textIconLayerMC.removeMovieClip();
            }
            this.textIconLayerMC = this.createEmptyMovieClip("textIconLayerMC",this.getNextHighestDepth());
            this.textIconLayerMC._x = this.bodyMC._x;
            this.textIconLayerMC._y = this.bodyMC._y;
            var _loc11_ = new com.rockstargames.ui.utils.Text();
            _loc11_.setTextWithIcons(this.bodyMC.bodyTF.text,this.textIconLayerMC,this.bodyMC.bodyTF,0,13,3,false);
            break;
         case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.CREW_TAG:
            if(this.crewTagMC == undefined)
            {
               this.crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",this.getNextHighestDepth(),{_x:com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_X + com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_LENGTH + 14,_y:com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_Y + 6,_xscale:70,_yscale:70});
            }
            this.crewTagMC.UNPACK_CREW_TAG(this.__get__data()[5]);
            break;
         case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.VERSUS:
            this.feedImgSecondaryMC = this.loadFeedTexture(this.feedImgSecondaryMC,this.feedImgContainer2,"feedImgSecondary",this.__get__data()[5],this.__get__data()[6],this.labelMC._x + this.itemTextLeft.textWidth + 10,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_Y,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_LENGTH,com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_LENGTH,this.fadeSecondaryImgIn);
            break;
         case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.STATS:
            this.placeholderImgMC._visible = true;
            this.bodyMC._visible = false;
            var _loc7_ = !this.__get__data()[5]?0:this.__get__data()[5];
            var _loc9_ = !this.__get__data()[6]?0:this.__get__data()[6];
            var _loc3_ = !this.__get__data()[7]?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE:this.__get__data()[7];
            switch(_loc4_)
            {
               case "CHAR_MICHAEL":
                  _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL;
                  break;
               case "CHAR_FRANKLIN":
                  _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FRANKLIN;
                  break;
               case "CHAR_TREVOR":
                  _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR;
                  break;
               default:
                  _loc3_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
            }
            this.setStat(0,_loc9_ + _loc7_,"",_loc3_,6,33,10);
            break;
         default:
            this.placeholderImgMC._visible = false;
      }
      this.itemTextLeft.autoSize = "left";
      this.itemTextLeft.multiline = true;
      this.itemTextLeft.wordWrap = true;
      this.labelMC.subtitleTF._y = this.labelMC.titleTF._y + this.labelMC.titleTF.textHeight;
      return this.__get__data();
   }
   function indentLabel(bIndent)
   {
      if(bIndent)
      {
         this.labelMC._x = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_X + com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_LENGTH + 5;
         this.itemTextLeft._width = this.labelMC.subtitleTF._width = 578 - this.itemTextLeft._x - 8;
      }
      else
      {
         this.labelMC._x = 5;
      }
   }
   function parseForFonts(str)
   {
      str = str.split("<C>").join("<FONT FACE=\'$Font2_cond\' SIZE=\'15\'>");
      str = str.split("</C>").join("<FONT FACE=\'$Font2\' SIZE=\'12\'>");
      return str;
   }
   function parseForTitleFonts(str)
   {
      str = str.split("<C>").join("<FONT FACE=\'$Font2_cond\' SIZE=\'18\'>");
      str = str.split("</C>").join("<FONT FACE=\'$Font2\' SIZE=\'15\'>");
      return str;
   }
   function loadFeedTexture(loaderMC, containerMC, name, txd, txn, x, y, w, h, callback)
   {
      if(txd == undefined || txn == undefined || txd == "" || txn == "")
      {
         if(loaderMC)
         {
            loaderMC.removeTxdRef();
         }
      }
      else
      {
         if(loaderMC == undefined)
         {
            loaderMC = (com.rockstargames.ui.media.ImageLoaderMC)containerMC.attachMovie("GenericImageLoader",name,containerMC.getNextHighestDepth(),{_x:x,_y:y});
         }
         if(loaderMC.textureDict == txd)
         {
            if(loaderMC.isLoaded)
            {
               loaderMC.init("PAUSE_MENU_SP_CONTENT",txd,txn,w,h);
               loaderMC.displayTxdResponse(txd);
               this.fadeImageIn(loaderMC);
            }
         }
         else
         {
            if(loaderMC.isLoaded)
            {
               loaderMC.removeTxdRef();
            }
            loaderMC.init("PAUSE_MENU_SP_CONTENT",txd,txn,w,h);
            if(txd.substr(0,5) == "CHAR_" || txn.substr(0,5) == "HC_N_")
            {
               var _loc5_ = loaderMC.splitPath(String(loaderMC),6);
               loaderMC.requestTxdRef(_loc5_,true,callback,this);
            }
            else
            {
               loaderMC.addTxdRefWithPath(String(loaderMC),6,callback,this);
            }
         }
      }
      return loaderMC;
   }
   function setStat(iIndex, iProgress, sName, eHudColour, x, y, h)
   {
      var _loc2_ = this["statMC" + iIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = this.attachMovie("feedItemStat","statMC" + iIndex,this.getNextHighestDepth(),{_x:x,_y:y});
         _loc2_.progBarMC = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(_loc2_.progBarMC);
         _loc2_.progBarMC.mc._height = _loc2_.barMaskMC._height = h;
      }
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)_loc2_.progBarMC.init(eHudColour);
      (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)_loc2_.progBarMC.percent(iProgress);
      _loc2_.nameTF.text = sName;
   }
   function getHeight()
   {
      return !(this.type == com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.TICKER || this.type == com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.TOOLTIPS)?this._height:this.bodyMC._y + this.bodyMC.bodyTF.textHeight;
   }
   function onDestroy()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.feedImgDefaultMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.feedImgSecondaryMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.placeholderImgMC);
      if(this.feedImgDefaultMC.isLoaded)
      {
         this.feedImgDefaultMC.removeTxdRef();
      }
      if(this.feedImgSecondaryMC.isLoaded)
      {
         this.feedImgSecondaryMC.removeTxdRef();
      }
   }
   function fadeDefaultImgIn()
   {
      this.fadeImageIn(this.feedImgDefaultMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.placeholderImgMC,com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION,{_alpha:0,onComplete:this.cleanupPlaceholder,onCompleteScope:this});
   }
   function fadeSecondaryImgIn()
   {
      this.fadeImageIn(this.feedImgSecondaryMC);
   }
   function fadeImageIn(imgMC)
   {
      imgMC._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(imgMC,com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION,{_alpha:100});
   }
   function cleanupPlaceholder()
   {
      this.placeholderImgMC._visible = false;
   }
   function __set__highlighted(_h)
   {
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
