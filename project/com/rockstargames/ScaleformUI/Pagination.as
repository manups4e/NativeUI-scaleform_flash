class com.rockstargames.ScaleformUI.Pagination
{
	var _currentPageIndex;
	var _currentMenuIndex;
	var currentPage;
	var itemsPerPage;
	var totalItems;
	var ScaleformIndex;

	function get CurrentPage()
	{
		return this.currentPage;
	}
	function set CurrentPage(val)
	{
		this.currentPage = val;
	}

	function get ItemsPerPage()
	{
		return this.itemsPerPage;
	}
	function set ItemsPerPage(val)
	{
		this.itemsPerPage = val;
	}

	function get TotalItems()
	{
		return this.totalItems;
	}
	function set TotalItems(val)
	{
		this.totalItems = val;
	}

	function get CurrentPageIndex()
	{
		return this._currentPageIndex;
	}
	function set CurrentPageIndex(val)
	{
		this._currentPageIndex = this.GetPageIndex(val);
	}

	function get CurrentMenuIndex()
	{
		return this._currentMenuIndex;
	}
	function set CurrentMenuIndex(val)
	{
		this._currentMenuIndex = val;
	}

	function get TotalPages()
	{
		return Math.floor(this.totalItems / this.itemsPerPage);
	}
	function get CurrentPageStartIndex()
	{
		return this.currentPage * this.itemsPerPage;
	}
	function get CurrentPageEndIndex()
	{
		return this.CurrentPageStartIndex + this.itemsPerPage - 1;
	}


	function GetPageIndex(externalIndex)
	{
		var page = GetPage(externalIndex);
		var startIndex = page * this.itemsPerPage;
		return externalIndex - startIndex;
	}

	function GetMenuIndex(page, index)
	{
		var initialIndex = page * this.itemsPerPage;
		var endIndex = initialIndex + this.itemsPerPage - 1;
		return initialIndex + index;
	}

	function GetPage(externalIndex)
	{
		return Math.floor(externalIndex / this.itemsPerPage);
	}


	function GoUp()
	{
		CurrentMenuIndex--;
		if (CurrentMenuIndex < 0)
		{
			CurrentMenuIndex = TotalItems - 1;
		}
		CurrentPageIndex = CurrentMenuIndex;
		ScaleformIndex--;
		CurrentPage = GetPage(CurrentMenuIndex);
		if (ScaleformIndex < 0)
		{
			if (TotalItems < itemsPerPage)
			{
				ScaleformIndex = TotalItems - 1;
				return false;
			}
			ScaleformIndex = 0;
			return true;
		}
		return false;
	}

	function GoDown()
	{
		CurrentMenuIndex++;
		if (CurrentMenuIndex >= TotalItems)
		{
			CurrentMenuIndex = 0;
		}
		CurrentPageIndex = CurrentMenuIndex;
		ScaleformIndex++;
		CurrentPage = GetPage(CurrentMenuIndex);
		if (ScaleformIndex >= totalItems)
		{
			ScaleformIndex = 0;
			return false;
		}
		else if (ScaleformIndex >= itemsPerPage)
		{
			ScaleformIndex = itemsPerPage - 1;
			return true;
		}
		return false;
	}

}