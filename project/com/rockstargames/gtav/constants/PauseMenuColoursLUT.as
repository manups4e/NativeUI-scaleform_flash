class com.rockstargames.gtav.constants.PauseMenuColoursLUT
{
   var PREFIX = "cl";
   var HASHTABLE = new Object();
   static var BLACK = [0,0,0,0,100];
   static var BLACK_ALPHA_30 = [1,0,0,0,30];
   static var BLACK_ALPHA_50 = [2,0,0,0,50];
   static var WHITE = [4,225,225,225,100];
   static var GREYED = [5,160,160,160,100];
   static var BLACK_ALPHA_DEFAULT = [14,0,0,0,50];
   function PauseMenuColoursLUT()
   {
      this.HASHTABLE = new Object();
      this.HASHTABLE[this.PREFIX + "0"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK;
      this.HASHTABLE[this.PREFIX + "1"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_30;
      this.HASHTABLE[this.PREFIX + "2"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_50;
      this.HASHTABLE[this.PREFIX + "4"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
      this.HASHTABLE[this.PREFIX + "5"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.GREYED;
      this.HASHTABLE[this.PREFIX + "14"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_DEFAULT;
   }
   static function lookUp(i)
   {
      if(com.rockstargames.gtav.constants.PauseMenuColoursLUT._instance == undefined)
      {
         com.rockstargames.gtav.constants.PauseMenuColoursLUT._instance = new com.rockstargames.gtav.constants.PauseMenuColoursLUT();
      }
      return com.rockstargames.gtav.constants.PauseMenuColoursLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.PauseMenuColoursLUT._instance.PREFIX + i];
   }
}
