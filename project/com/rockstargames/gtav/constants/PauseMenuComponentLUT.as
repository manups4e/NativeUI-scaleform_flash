class com.rockstargames.gtav.constants.PauseMenuComponentLUT
{
   var PREFIX = "pm";
   var HASHTABLE = new Object();
   static var SP_HEADER = [0,"PAUSE_MENU_HEADER","PAUSE_MENU_HEADER.swf",48,71,1];
   static var SP_CONTENT = [1,"PAUSE_MENU_SP_CONTENT","PAUSE_MENU_SP_CONTENT.swf",48,160,2];
   static var STORE_CONTENT = [2,"PAUSE_MENU_STORE_CONTENT","../Store/PAUSE_MENU_STORE_CONTENT.swf",48,160,2];
   static var INSTRUCTIONAL = [3,"PAUSE_MENU_INSTRUCTIONAL_BUTTONS","PAUSE_MENU_INSTRUCTIONAL_BUTTONS.swf",-300,0,2];
   function PauseMenuComponentLUT()
   {
      this.HASHTABLE = new Object();
      this.HASHTABLE[this.PREFIX + "0"] = com.rockstargames.gtav.constants.PauseMenuComponentLUT.SP_HEADER;
      this.HASHTABLE[this.PREFIX + "1"] = com.rockstargames.gtav.constants.PauseMenuComponentLUT.SP_CONTENT;
      this.HASHTABLE[this.PREFIX + "2"] = com.rockstargames.gtav.constants.PauseMenuComponentLUT.STORE_CONTENT;
      this.HASHTABLE[this.PREFIX + "4"] = com.rockstargames.gtav.constants.PauseMenuComponentLUT.INSTRUCTIONAL;
   }
   static function lookUp(i)
   {
      if(com.rockstargames.gtav.constants.PauseMenuComponentLUT._instance == undefined)
      {
         com.rockstargames.gtav.constants.PauseMenuComponentLUT._instance = new com.rockstargames.gtav.constants.PauseMenuComponentLUT();
      }
      return com.rockstargames.gtav.constants.PauseMenuComponentLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.PauseMenuComponentLUT._instance.PREFIX + i];
   }
}
