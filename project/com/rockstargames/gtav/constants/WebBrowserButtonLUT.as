class com.rockstargames.gtav.constants.WebBrowserButtonLUT
{
   var PREFIX = "wb";
   var HASHTABLE = new Object();
   static var NOTHING = -1;
   static var HOME_BUTTON = 1;
   static var BACK_BUTTON = 2;
   static var FORWARD_BUTTON = 3;
   static var ADDRESS_BOX = 4;
   static var SEARCH_BOX = 5;
   static var ADVERT = 6;
   static var WEB_BUTTON = 7;
   static var TEXT_BOX = 8;
   static var PASSWORD_TEXT_BOX = 9;
   static var PLUS_BUTTON = 10;
   static var MINUS_BUTTON = 11;
   static var LIST_ITEM = 12;
   static var HISTORY_BUTTON = 13;
   static var FAVORITES_BUTTON = 14;
   static var BROWSER_LIST_ITEM = 15;
   static var ANCHOR_BUTTON = 16;
   function WebBrowserButtonLUT()
   {
      var _loc7_ = new Array(-1,"NOTHING","OFF","ARROW",-1);
      var _loc12_ = new Array(1,"HOME_BUTTON","ON","HAND",-2);
      var _loc14_ = new Array(2,"BACK_BUTTON","ON","HAND",-2);
      var _loc18_ = new Array(3,"FORWARD_BUTTON","ON","HAND",-2);
      var _loc2_ = new Array(4,"ADDRESS_BOX","ON","TEXT",-2);
      var _loc3_ = new Array(5,"SEARCH_BOX","ON","TEXT",-2);
      var _loc4_ = new Array(6,"ADVERT","ON","HAND",null);
      var _loc13_ = new Array(7,"WEB_BUTTON","ON","HAND",null);
      var _loc15_ = new Array(8,"TEXT_BOX","ON","TEXT",null);
      var _loc8_ = new Array(9,"PASSWORD_TEXT_BOX","ON","TEXT",null);
      var _loc16_ = new Array(10,"PLUS_BUTTON","ON","HAND",null);
      var _loc11_ = new Array(11,"MINUS_BUTTON","ON","HAND",null);
      var _loc17_ = new Array(12,"LIST_ITEM","ON","HAND",null);
      var _loc5_ = new Array(13,"HISTORY_BUTTON","ON","HAND",-2);
      var _loc6_ = new Array(14,"FAVORITES_BUTTON","ON","HAND",-2);
      var _loc9_ = new Array(15,"BROWSER_LIST_ITEM","ON","HAND",-2);
      var _loc10_ = new Array(16,"ANCHOR_BUTTON","ON","HAND",null);
      this.HASHTABLE = new Object();
      this.HASHTABLE[this.PREFIX + "-1"] = _loc7_;
      this.HASHTABLE[this.PREFIX + "1"] = _loc12_;
      this.HASHTABLE[this.PREFIX + "2"] = _loc14_;
      this.HASHTABLE[this.PREFIX + "3"] = _loc18_;
      this.HASHTABLE[this.PREFIX + "4"] = _loc2_;
      this.HASHTABLE[this.PREFIX + "5"] = _loc3_;
      this.HASHTABLE[this.PREFIX + "6"] = _loc4_;
      this.HASHTABLE[this.PREFIX + "7"] = _loc13_;
      this.HASHTABLE[this.PREFIX + "8"] = _loc15_;
      this.HASHTABLE[this.PREFIX + "9"] = _loc8_;
      this.HASHTABLE[this.PREFIX + "10"] = _loc16_;
      this.HASHTABLE[this.PREFIX + "11"] = _loc11_;
      this.HASHTABLE[this.PREFIX + "12"] = _loc17_;
      this.HASHTABLE[this.PREFIX + "13"] = _loc5_;
      this.HASHTABLE[this.PREFIX + "14"] = _loc6_;
      this.HASHTABLE[this.PREFIX + "15"] = _loc9_;
      this.HASHTABLE[this.PREFIX + "16"] = _loc10_;
   }
   static function lookUp(i)
   {
      if(com.rockstargames.gtav.constants.WebBrowserButtonLUT._instance == undefined)
      {
         com.rockstargames.gtav.constants.WebBrowserButtonLUT._instance = new com.rockstargames.gtav.constants.WebBrowserButtonLUT();
      }
      return com.rockstargames.gtav.constants.WebBrowserButtonLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.WebBrowserButtonLUT._instance.PREFIX + i];
   }
}
