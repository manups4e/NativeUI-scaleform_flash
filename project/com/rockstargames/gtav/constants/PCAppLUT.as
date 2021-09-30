class com.rockstargames.gtav.constants.PCAppLUT
{
   var PREFIX = "pc";
   var HASHTABLE = new Object();
   static var PC_EMPTY = new Array(0,"PC_EMPTY");
   static var PC_MY_COMPUTER = new Array(1,"PC_MY_COMPUTER");
   static var PC_ANTIVIRUS = new Array(2,"PC_ANTIVIRUS");
   static var PC_VIRUS = new Array(3,"PC_VIRUS");
   static var PC_HACKING = new Array(4,"PC_HACKING");
   static var PC_SUB = new Array(5,"PC_SUB");
   static var PC_QUIT = new Array(6,"PC_QUIT");
   static var PC_USB = new Array(7,"PC_USB");
   static var PC_FOLDER = new Array(8,"PC_FOLDER");
   static var PC_PRINT = new Array(9,"PC_PRINT");
   static var PC_TRASH = new Array(10,"PC_TRASH");
   static var PC_WINDOW = new Array(40,"PC_WINDOW");
   static var PC_ANTIVIRUS_START = new Array(50,"PC_ANTIVIRUS_START");
   static var PC_ANTIVIRUS_CLEAN = new Array(51,"PC_ANTIVIRUS_CLEAN");
   static var PC_ANTIVIRUS_CLOSE = new Array(52,"PC_ANTIVIRUS_CLOSE");
   static var PC_POPUP_CLOSE = new Array(60,"PC_POPUP_CLOSE");
   static var PC_SUB_OPEN_SLUICE = new Array(70,"PC_SUB_OPEN_SLUICE");
   static var PC_SUB_RELEASE_SUB = new Array(71,"PC_SUB_RELEASE_SUB");
   static var PC_ERROR = new Array(80,"PC_ERROR");
   static var PC_HACKING_MENU = new Array(81,"PC_HACKING_MENU");
   static var PC_HACKING_APP01 = new Array(82,"PC_HACKING_APP01");
   static var PC_HACKING_APP02 = new Array(83,"PC_HACKING_APP02");
   static var PC_HACKING_IP_SUCCESS = new Array(84,"PC_HACKING_IP_SUCCESS");
   static var PC_HACKING_IP_FAIL = new Array(85,"PC_HACKING_IP_FAIL");
   static var PC_HACKING_ROULETTE_WIN = new Array(86,"PC_HACKING_ROULETTE_WIN");
   static var PC_HACKING_ROULETTE_FAIL = new Array(87,"PC_HACKING_ROULETTE_FAIL");
   static var PC_HACKING_ROULETTE_RETRY = new Array(88,"PC_HACKING_ROULETTE_RETRY");
   static var PC_HACKING_ROULETTE_NORETRY = new Array(89,"PC_HACKING_ROULETTE_NORETRY");
   static var PC_HACKING_IP_RETRY = new Array(90,"PC_HACKING_IP_RETRY");
   static var PC_HACKING_IP_NORETRY = new Array(91,"PC_HACKING_IP_NORETRY");
   static var PC_HACKING_ROULETTE_SUCCESS = new Array(92,"PC_HACKING_ROULETTE_SUCCESS");
   static var PC_HACKING_DOWNLOAD = new Array(93,"PC_HACKING_DOWNLOAD");
   function PCAppLUT()
   {
      this.HASHTABLE = new Object();
      this.HASHTABLE[this.PREFIX + "0"] = com.rockstargames.gtav.constants.PCAppLUT.PC_EMPTY;
      this.HASHTABLE[this.PREFIX + "1"] = com.rockstargames.gtav.constants.PCAppLUT.PC_MY_COMPUTER;
      this.HASHTABLE[this.PREFIX + "2"] = com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS;
      this.HASHTABLE[this.PREFIX + "3"] = com.rockstargames.gtav.constants.PCAppLUT.PC_VIRUS;
      this.HASHTABLE[this.PREFIX + "4"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING;
      this.HASHTABLE[this.PREFIX + "5"] = com.rockstargames.gtav.constants.PCAppLUT.PC_SUB;
      this.HASHTABLE[this.PREFIX + "6"] = com.rockstargames.gtav.constants.PCAppLUT.PC_QUIT;
      this.HASHTABLE[this.PREFIX + "7"] = com.rockstargames.gtav.constants.PCAppLUT.PC_USB;
      this.HASHTABLE[this.PREFIX + "8"] = com.rockstargames.gtav.constants.PCAppLUT.PC_FOLDER;
      this.HASHTABLE[this.PREFIX + "9"] = com.rockstargames.gtav.constants.PCAppLUT.PC_PRINT;
      this.HASHTABLE[this.PREFIX + "10"] = com.rockstargames.gtav.constants.PCAppLUT.PC_TRASH;
      this.HASHTABLE[this.PREFIX + "40"] = com.rockstargames.gtav.constants.PCAppLUT.PC_WINDOW;
      this.HASHTABLE[this.PREFIX + "50"] = com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_START;
      this.HASHTABLE[this.PREFIX + "51"] = com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_CLEAN;
      this.HASHTABLE[this.PREFIX + "60"] = com.rockstargames.gtav.constants.PCAppLUT.PC_POPUP_CLOSE;
      this.HASHTABLE[this.PREFIX + "70"] = com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_OPEN_SLUICE;
      this.HASHTABLE[this.PREFIX + "71"] = com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_RELEASE_SUB;
      this.HASHTABLE[this.PREFIX + "80"] = com.rockstargames.gtav.constants.PCAppLUT.PC_ERROR;
      this.HASHTABLE[this.PREFIX + "81"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_MENU;
      this.HASHTABLE[this.PREFIX + "82"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP01;
      this.HASHTABLE[this.PREFIX + "83"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP02;
      this.HASHTABLE[this.PREFIX + "84"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_SUCCESS;
      this.HASHTABLE[this.PREFIX + "85"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_FAIL;
      this.HASHTABLE[this.PREFIX + "86"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_WIN;
      this.HASHTABLE[this.PREFIX + "87"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_FAIL;
      this.HASHTABLE[this.PREFIX + "88"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_RETRY;
      this.HASHTABLE[this.PREFIX + "89"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_NORETRY;
      this.HASHTABLE[this.PREFIX + "90"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_RETRY;
      this.HASHTABLE[this.PREFIX + "91"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_NORETRY;
      this.HASHTABLE[this.PREFIX + "92"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_SUCCESS;
      this.HASHTABLE[this.PREFIX + "93"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_DOWNLOAD;
   }
   static function lookUp(i)
   {
      if(com.rockstargames.gtav.constants.PCAppLUT._instance == undefined)
      {
         com.rockstargames.gtav.constants.PCAppLUT._instance = new com.rockstargames.gtav.constants.PCAppLUT();
      }
      return com.rockstargames.gtav.constants.PCAppLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.PCAppLUT._instance.PREFIX + i];
   }
}
