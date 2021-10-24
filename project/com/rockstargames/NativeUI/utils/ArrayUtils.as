class com.rockstargames.NativeUI.utils.ArrayUtils
{
	static function findInArray(str, array)
	{
		for (var i = 0; i < array.length; i++)
		{
			if (array[i] == str)
			{
				return i;
			}
		}
		return -1;//If not found
	}

	static function findInArrayPartially(str, array)
	{
		for (var i = 0; i < array.length; i++)
		{
			if (array[i].indexOf(str) > -1)
			{
				return i;
			}
		}
		return -1;//If not found
	}

	static function jsonToArray(str)
	{
		var s = str;
		var s = com.rockstargames.NativeUI.utils.ArrayUtils.Replace(s, "[", "");
		var s = com.rockstargames.NativeUI.utils.ArrayUtils.Replace(s, "]", "");
		var stringSplit = s.split(",");
		return stringSplit;
	}

	static function Replace(string, searchStr, replaceStr)
	{
		return string.split(searchStr).join(replaceStr);
	}

	function ArrayUtils()
	{
	}

	/*
	function breakDownArray(list:Array):Array
	{
	    var newList:Array = [];             //Use this array for storing changes, so we don't mess up the for in loop.
	    for each(var s:String in list)          //For each item in array...
	    {
	        //We're going to use , as the character to split by in a moment...
	        s = s.replace(" and ", ",");    //Replace the " and " separator with a comma.
	        //You can keep putting additional search terms in here.
	
	        var splitString:Array = s.split(",");   //Split string using ",".
	        newList = newList.concat(splitString); //We combine our newList array with the splitString array.
	    }
	
	    return newList;         //Return newList.
	}
	*/
}