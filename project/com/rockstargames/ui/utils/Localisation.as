class com.rockstargames.ui.utils.Localisation
{
   function Localisation()
   {
   }
   static function setTextWithTranslation(txtField, textLabel, scriptType, isHTML)
   {
      if(isHTML == undefined)
      {
         isHTML = false;
      }
      if(scriptType == undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,textLabel,txtField,isHTML);
      }
      else
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",scriptType,textLabel,txtField,isHTML);
      }
   }
}
