class com.rockstargames.gtav.levelDesign.NATIVEUI extends com.rockstargames.ui.core.BaseScreenLayout
{
	var _customBannerLoaded = false;
	var UIMenu;

	function NATIVEUI()
	{
		super();
		_global.gfxExtensions = true;
	}

	function INITIALISE(mc)
	{
		super.INITIALISE(mc);
		this.getDisplayConfig(true);
	}

	function CREATE_MENU(title, subtitle, txd, txn)
	{
		this.UIMenu = new com.rockstargames.NativeUI.UIMenu(this.CONTENT, title, subtitle, txd, txn);
	}

	function CLEAR_ALL()
	{
		this.UIMenu.Clear();
		this.UIMenu = undefined;
	}

	function ADD_ITEM(id, str, sub, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
	{
		this.UIMenu.addItem(id,str,sub,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
	}

	function SET_INPUT_EVENT(direction, item, val)
	{
		var retVal = 0;
		switch (direction)
		{
			case com.rockstargames.ui.game.GamePadConstants.CROSS :

				var _item = this.UIMenu.menuItems[item];
				if (_item instanceof com.rockstargames.NativeUI.items.UIMenuCheckboxItem)
				{
					_item.Checked = val;
					retVal = _item.Checked;
				}
				break;
			case com.rockstargames.ui.game.GamePadConstants.DPADUP :
				retVal = this.UIMenu.goUp();
				break;
			case com.rockstargames.ui.game.GamePadConstants.DPADDOWN :
				retVal = this.UIMenu.goDown();
				break;
			case com.rockstargames.ui.game.GamePadConstants.DPADLEFT :
				retVal = this.UIMenu.goLeft();
				break;
			case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT :
				retVal = this.UIMenu.goRight();
				break;
		}
		return retVal;
	}

	function SET_CURRENT_ITEM(i)
	{
		this.UIMenu.currentSelection = i;
	}

	function SET_INPUT_MOUSE_EVENT_SINGLE(posX, posY)
	{
		var retVal = new Array();
		var limit = this.UIMenu.itemCount - 1;
		var counter = 0;
		if (this.UIMenu.itemCount > this.UIMenu.maxItemsOnScreen + 1)
		{
			limit = this.UIMenu._maxItem;
		}

		for (var i = this.UIMenu._minItem; i <= limit; i++)
		{
			var item = this.UIMenu.menuItems[i];
			if (item._hovered)
			{
				if (!item.highlighted)
				{
					this.UIMenu.currentSelection = i;
				}
				var _type = 0;
				if (this.UIMenu.currentItem instanceof com.rockstargames.NativeUI.items.UIMenuListItem)
				{
					_type = 1;
				}
				else if (this.UIMenu.currentItem instanceof com.rockstargames.NativeUI.items.UIMenuCheckboxItem)
				{
					_type = 2;
				}
				else if (this.UIMenu.currentItem instanceof com.rockstargames.NativeUI.items.UIMenuSliderItem)
				{
					_type = 3;
				}
				else if (this.UIMenu.currentItem instanceof com.rockstargames.NativeUI.items.UIMenuProgressItem)
				{
					_type = 4;
				}
				retVal.push("it");
				retVal.push(this.UIMenu.currentSelection);
				retVal.push(_type);
				retVal.push(this.UIMenu.currentItem.Select(posX, posY));
				return retVal.toString();
			}
		}

		if (this.UIMenu.currentItem.panels.length > 0)
		{
			for (var i = 0; i < this.UIMenu.currentItem.panels.length; i++)
			{
				var _panel = this.UIMenu.currentItem.panels[i];
				if (_panel._hovered)
				{
					if (_panel instanceof com.rockstargames.NativeUI.panels.UIMenuColorPanel)
					{
						retVal.push("pan");
						retVal.push(i);
						retVal.push(0);
						retVal.push(_panel.Value);
						return retVal.toString();
					}
				}
			}
		}
	}

	function SET_INPUT_MOUSE_EVENT_CONTINUE(posX, posY)
	{
		var retVal = new Array();
		var limit = this.UIMenu.itemCount - 1;
		var counter = 0;
		if (this.UIMenu.itemCount > this.UIMenu.maxItemsOnScreen + 1)
		{
			limit = this.UIMenu._maxItem;
		}

		for (var i = this.UIMenu._minItem; i <= limit; i++)
		{
			var item = this.UIMenu.menuItems[i];
			if (item._hovered)
			{
				var _type = 0;
				if (this.UIMenu.currentItem instanceof com.rockstargames.NativeUI.items.UIMenuSliderItem)
				{
					_type = 3;
				}
				else if (this.UIMenu.currentItem instanceof com.rockstargames.NativeUI.items.UIMenuProgressItem)
				{
					_type = 4;
				}
				if (_type == 3 || _type == 4)
				{
					retVal.push("it");
					retVal.push(this.UIMenu.currentSelection);
					retVal.push(_type);
					retVal.push(this.UIMenu.currentItem.Select(posX, posY));
					return retVal.toString();
				}
			}
		}

		if (this.UIMenu.currentItem.panels.length > 0)
		{
			for (var i = 0; i < this.UIMenu.currentItem.panels.length; i++)
			{
				var _panel = this.UIMenu.currentItem.panels[i];
				if (_panel._hovered)
				{
					var _panType = 0;
					if (_panel instanceof com.rockstargames.NativeUI.panels.UIMenuColorPanel)
					{
						_panType = 0;
					}
					else if (_panel instanceof com.rockstargames.NativeUI.panels.UIMenuPercentagePanel)
					{
						_panType = 1;
						_panel.Coords = posX;
					}
					else if (_panel instanceof com.rockstargames.NativeUI.panels.UIMenuGridPanel)
					{
						_panType = 2;
						_panel.Coords = new Array(posX, posY);
					}
					if (_panType == 1 || _panType == 2)
					{
						retVal.push("pan");
						retVal.push(i);
						retVal.push(_panType);
						retVal.push(_panel.Value);
						return retVal.toString();
					}
				}
			}
		}
	}

	function ADD_ITEM_TO_ITEMLIST(listItemId, item)
	{
		this.UIMenu.menuItems[listItemId].itemList.push(item);
	}

	function REMOVE_ITEM_FROM_LIST(item, idx)
	{
		this.UIMenu.menuItems[item].itemList.splice(idx,1);
	}

	function SET_RIGHT_BADGE(item, txd, icon)
	{
		this.UIMenu.menuItems[item].SetRightBadge(txd,icon);
	}

	function GET_VALUE_FROM_ITEM(item)
	{
		return this.UIMenu.menuItems[item].value;
	}

	function GET_VALUE_FROM_PANEL(item, panel)
	{
		return this.UIMenu.menuItems[item].panels[panel].Value;
	}

	function ADD_PANEL(item, panelType, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
	{
		this.UIMenu.addPanel(item,panelType,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
	}

	function ADD_STATISTIC_TO_PANEL(item, panel, _label, _value)
	{
		this.UIMenu.menuItems[item].panels[panel].addStat(_label);
	}

	function SET_PANEL_STATS_ITEM_VALUE(item, panel, statId, _value)
	{
		this.UIMenu.menuItems[item].panels[panel].setStat(statId,_value);
	}

	function SET_COLOR_PANEL_RETURN_VALUE(item, panel)
	{
		// returns -1 if no selection is done
		return this.UIMenu.menuItems[item].panels[panel].Value;
	}
	function SET_COLOR_PANEL_VALUE(item, panel, val)
	{
		this.UIMenu.menuItems[item].panels[panel].Value = val;
	}

	function SET_PERCENT_PANEL_RETURN_VALUE(item, panel, val)
	{
		// set percentage and its value
		this.UIMenu.menuItems[item].panels[panel].Value = val;
		return this.UIMenu.menuItems[item].panels[panel].Value;
	}

	function SET_GRID_PANEL_POSITION_RETURN_VALUE(item, panel, posX, posY)
	{
		// returns grid position (x, y)
		this.UIMenu.menuItems[item].panels[panel].Coords = new Array(posX, posY);
		return this.UIMenu.menuItems[item].panels[panel].Value.toString();
	}
	function SET_GRID_PANEL_POSITION_RETURN_COORDS(item, panel, posX, posY)
	{
		// returns dot coordinates
		this.UIMenu.menuItems[item].panels[panel].Coords = new Array(posX, posY);
		return this.UIMenu.menuItems[item].panels[panel].Coords.toString();
	}
	function SET_GRID_PANEL_VALUE_RETURN_COORDS(item, panel, posX, posY)
	{
		// returns dot coordinates
		this.UIMenu.menuItems[item].panels[panel].Value = new Array(posX, posY);
		return this.UIMenu.menuItems[item].panels[panel].Coords.toString();
	}
	function SET_GRID_PANEL_VALUE_RETURN_VALUE(item, panel, posX, posY)
	{
		// returns dot coordinates
		this.UIMenu.menuItems[item].panels[panel].Value = new Array(posX, posY);
		return this.UIMenu.menuItems[item].panels[panel].Value.toString();
	}

	function SET_PERCENT_PANEL_POSITION_RETURN_VALUE(item, panel, posX)
	{
		// set percentage based on mouse and returns its value
		this.UIMenu.menuItems[item].panels[panel].Coords = posX;
		return this.UIMenu.menuItems[item].panels[panel].Value.toString();
	}


}