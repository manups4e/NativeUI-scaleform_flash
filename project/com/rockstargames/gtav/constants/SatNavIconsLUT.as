class com.rockstargames.gtav.constants.SatNavIconsLUT
{
   var HASHTABLE = new Object();
   var PREFIX = "sn";
   static var BLANK = new Array(0,"BLANK");
   static var FORWARD = new Array(1,"FORWARD");
   static var BACK = new Array(2,"BACK");
   static var LEFT = new Array(3,"LEFT");
   static var RIGHT = new Array(4,"RIGHT");
   static var SLIPROAD_LEFT = new Array(5,"SLIPROAD_LEFT");
   static var SLIPROAD_RIGHT = new Array(6,"SLIPROAD_RIGHT");
   static var DIAGONAL_LEFT = new Array(7,"DIAGONAL_LEFT");
   static var DIAGONAL_RIGHT = new Array(8,"DIAGONAL_RIGHT");
   static var MERGE_LEFT = new Array(9,"MERGE_LEFT");
   static var MERGE_RIGHT = new Array(10,"MERGE_RIGHT");
   static var U_TURN = new Array(11,"U_TURN");
   function SatNavIconsLUT()
   {
      this.HASHTABLE = new Object();
      this.HASHTABLE[this.PREFIX + "0"] = com.rockstargames.gtav.constants.SatNavIconsLUT.BLANK;
      this.HASHTABLE[this.PREFIX + "1"] = com.rockstargames.gtav.constants.SatNavIconsLUT.FORWARD;
      this.HASHTABLE[this.PREFIX + "2"] = com.rockstargames.gtav.constants.SatNavIconsLUT.BACK;
      this.HASHTABLE[this.PREFIX + "3"] = com.rockstargames.gtav.constants.SatNavIconsLUT.LEFT;
      this.HASHTABLE[this.PREFIX + "4"] = com.rockstargames.gtav.constants.SatNavIconsLUT.RIGHT;
      this.HASHTABLE[this.PREFIX + "5"] = com.rockstargames.gtav.constants.SatNavIconsLUT.SLIPROAD_LEFT;
      this.HASHTABLE[this.PREFIX + "6"] = com.rockstargames.gtav.constants.SatNavIconsLUT.SLIPROAD_RIGHT;
      this.HASHTABLE[this.PREFIX + "7"] = com.rockstargames.gtav.constants.SatNavIconsLUT.DIAGONAL_LEFT;
      this.HASHTABLE[this.PREFIX + "8"] = com.rockstargames.gtav.constants.SatNavIconsLUT.DIAGONAL_RIGHT;
      this.HASHTABLE[this.PREFIX + "9"] = com.rockstargames.gtav.constants.SatNavIconsLUT.MERGE_LEFT;
      this.HASHTABLE[this.PREFIX + "10"] = com.rockstargames.gtav.constants.SatNavIconsLUT.MERGE_RIGHT;
      this.HASHTABLE[this.PREFIX + "11"] = com.rockstargames.gtav.constants.SatNavIconsLUT.U_TURN;
   }
   static function lookUp(i)
   {
      if(com.rockstargames.gtav.constants.SatNavIconsLUT._instance == undefined)
      {
         com.rockstargames.gtav.constants.SatNavIconsLUT._instance = new com.rockstargames.gtav.constants.SatNavIconsLUT();
      }
      return com.rockstargames.gtav.constants.SatNavIconsLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.SatNavIconsLUT._instance.PREFIX + i];
   }
}
