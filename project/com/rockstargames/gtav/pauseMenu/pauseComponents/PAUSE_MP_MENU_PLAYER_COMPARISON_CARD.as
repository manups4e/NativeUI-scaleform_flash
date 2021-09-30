class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_PLAYER_COMPARISON_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.MP_PLAYER_CARD
{
   function PAUSE_MP_MENU_PLAYER_COMPARISON_CARD()
   {
      super();
      this.dbgID = "PAUSE_MP_MENU_PLAYER_COMPARISON_CARD";
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc,true);
   }
   function SET_TITLE(title)
   {
      super.SET_TITLE.apply(this,arguments);
      com.rockstargames.ui.utils.UIText.setSizedText(this.CONTENT.titleTF,title,true,false,18,18);
   }
}
