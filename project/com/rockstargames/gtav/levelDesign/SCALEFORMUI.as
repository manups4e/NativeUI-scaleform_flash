class com.rockstargames.gtav.levelDesign.SCALEFORMUI extends com.rockstargames.ui.core.BaseScreenLayout
{
	var UIMenu;
	var DispConf;
	var offset = [];
	var iActualWidth;

	function SCALEFORMUI()
	{
		super();
		_global.gfxExtensions = true;
		this.DispConf = new com.rockstargames.ui.utils.DisplayConfig();
		this.DispConf = this.getDisplayConfig(true);
	}

	function INITIALISE(mc)
	{
		super.INITIALISE(mc);
		this.getDisplayConfig(true);
	}

	function initScreenLayout()
	{
		this.offset[0] = this.FOUR_THREE_PADDING + this.DispConf.safeLeft * this.DispConf.screenWidth;
		this.offset[1] = this.DispConf.safeTop * this.DispConf.screenHeight;
	}

	function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept, _isAsian, _actualWidth, _actualHeight)
	{
		this.DispConf.isCircleAccept = _isCircleAccept;
		this.DispConf.isWideScreen = _isWideScreen;
		this.DispConf.safeBottom = _safeBottomPercent;
		this.DispConf.safeLeft = _safeLeftPercent;
		this.DispConf.safeRight = _safeRightPercent;
		this.DispConf.safeTop = _safeTopPercent;
		this.DispConf.screenHeight = _screenHeightPixels;
		this.DispConf.screenWidth = _screenWidthPixels;
		if (((_actualWidth / _actualHeight) > 1.5))
		{
			this.iActualWidth = 1280;
		}
		else
		{
			this.iActualWidth = 890;
		}
		this.initScreenLayout();
	}

	function CREATE_MENU(title, subtitle, x, y, txd, txn, enableAnim, animType)
	{
		var off = [x, y];
		this.UIMenu = new com.rockstargames.ScaleformUI.UIMenu(this.CONTENT, title, subtitle, x, y, txd, txn, enableAnim, animType);
	}

	function CLEAR_ALL()
	{
		this.UIMenu.Clear();
		this.UIMenu = undefined;
	}

	function ADD_ITEM(id, str, sub, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13)
	{
		this.UIMenu.addItem(id,str,sub,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
	}

	function ADD_PANEL(item, panelType, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
	{
		this.UIMenu.addPanel(item,panelType,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
	}

	function ENABLE_SCROLLING_ANIMATION(enable)
	{
		this.UIMenu.EnableAnim = enable;
	}

	function CHANGE_SCROLLING_ANIMATION_TYPE(type)
	{
		this.UIMenu.AnimType = type;
	}

	function ADD_WINDOW(id, param0, param1, param2, param3, param4, param5, param6, param7, param8, param9)
	{
		this.UIMenu.addWindow(id,param0,param1,param2,param3,param4,param5,param6,param7,param8,param9);
	}
	function UPDATE_HERITAGE_WINDOW(id, mom, dad)
	{
		this.UIMenu.windows[id].setIndex(mom,dad);
	}
	function UPDATE_DETAILS_WINDOW_VALUES(id, _det0, _det1, _det2, txd, txn, x, y, w, h)
	{
		this.UIMenu.windows[id].setValues(_det0,_det1,_det2,txd,txn,x,y,w,h);
	}
	function ADD_STATS_DETAILS_WINDOW_STATWHEEL(id, pctComplete, statColourEnum)
	{
		this.UIMenu.windows[id].addStatToWheel(pctComplete,statColourEnum);
	}
	function UPDATE_STATS_DETAILS_WINDOW_STATWHEEL(id, statId, pctComplete, statColourEnum)
	{
		this.UIMenu.windows[id].updateStatistic(statId,pctComplete,statColourEnum);
	}
	function ADD_SIDE_PANEL_TO_ITEM(item, panelType, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
	{
		this.UIMenu.addSidePanel(item,panelType,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
	}
	function REMOVE_SIDE_PANEL_TO_ITEM(item)
	{
		if (this.UIMenu.menuItems[item].sidePanel != undefined)
		{
			if (this.UIMenu.menuItems[item].sidePanel.descItems.length > 0)
			{
				for (var dd in this.UIMenu.menuItems[item].sidePanel.descItems)
				{
					this.UIMenu.menuItems[item].sidePanel.descItems[dd].itemMC.removeMovieClip();
				}
			}
			this.UIMenu.menuItems[item].sidePanel.itemMC.removeMovieClip();
		}
	}
	function UPDATE_MISSION_DETAILS_PANEL_IMG(item, txd, txn)
	{
		this.UIMenu.menuItems[item].sidePanel.setPicture(txd,txn);
	}
	function ADD_MISSION_DETAILS_DESC_ITEM(item, itemType, textLeft, textRight, param3, param4, param5, param6)
	{
		this.UIMenu.menuItems[item].sidePanel.AddItem(itemType,textLeft,textRight,param3,param4,param5,param6);
	}
	function REMOVE_MISSION_DETAILS_DESC_ITEM(item, id)
	{
		this.UIMenu.menuItems[item].sidePanel.RemoveItem(id);
	}


	function SET_INPUT_EVENT(direction, item, val)
	{
		var retVal = 0;
		switch (direction)
		{
			case com.rockstargames.ui.game.GamePadConstants.CROSS :

				var _item = this.UIMenu.menuItems[item];
				if (_item._type == 2)
				{
					if (_item._enabled)
					{
						_item.Value = val;
						retVal = _item.Value;
					}
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

	function SET_CURRENT_ITEM(item)
	{
		this.UIMenu.currentSelection = item;
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
				if (item._enabled)
				{
					if (!item.highlighted)
					{
						this.UIMenu.currentSelection = i;
					}
					var _type = 0;
					if (this.UIMenu.currentItem._type == 1 || this.UIMenu.currentItem._type == 2 || this.UIMenu.currentItem._type == 3 || this.UIMenu.currentItem._type == 4)
					{
						_type = this.UIMenu.currentItem._type;
					}
					retVal.push("it");
					retVal.push(this.UIMenu.currentSelection);
					retVal.push(_type);
					retVal.push(this.UIMenu.currentItem.Select());
					com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET");
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
					if ((_panel instanceof com.rockstargames.ScaleformUI.panels.UIMenuColorPanel))
					{
						retVal.push("pan");
						retVal.push(i);
						retVal.push(0);
						retVal.push(_panel.Value);
						com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET");
						return retVal.toString();
					}
				}
			}
		}
		return "none";
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
		if (this.UIMenu.currentItem.panels.length > 0)
		{
			for (var i = 0; i < this.UIMenu.currentItem.panels.length; i++)
			{
				var _panel = this.UIMenu.currentItem.panels[i];
				if (_panel._hovered)
				{
					var _panType = 0;
					if ((_panel instanceof com.rockstargames.ScaleformUI.panels.UIMenuColorPanel))
					{
						_panType = 0;
					}
					else if ((_panel instanceof com.rockstargames.ScaleformUI.panels.UIMenuPercentagePanel))
					{
						_panType = 1;
						_panel.Coords = posX;
					}
					else if ((_panel instanceof com.rockstargames.ScaleformUI.panels.UIMenuGridPanel))
					{
						_panType = 2;
						_panel.Coords = new Array(posX, posY);
					}
					if (((_panType == 1) || _panType == 2))
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
		return "none";
	}

	function ADD_ITEM_TO_ITEMLIST(listItemId, item)
	{
		this.UIMenu.menuItems[listItemId].itemList.push(item);
	}

	function REMOVE_ITEM_FROM_ITEMLIST(listItemId, idx)
	{
		this.UIMenu.menuItems[listItemId].multiListItems.splice(idx,1);
	}

	function UPDATE_LISTITEM_LIST(item, list, index)
	{
		this.UIMenu.menuItems[item].multiListItems = [];
		this.UIMenu.menuItems[item].multiListItems = list.split(",");
		this.SET_ITEM_VALUE(item,index);
	}

	function ENABLE_ITEM(item, disable)
	{
		this.UIMenu.menuItems[item].Enabled = disable;
		this.UIMenu.updateItemsDrawing();
	}

	function UPDATE_ITEM_DESCRIPTION(item, substr)
	{
		var _selectedItem = UIMenu.menuItems[item];
		_selectedItem.subtitle = substr;
		this.UIMenu.updateItemsDrawing();
	}

	function UPDATE_COLORS(item, mainColor, highlightColor, textColor, textHighlightColor, sliderColor)
	{
		var _selectedItem = UIMenu.menuItems[item];
		_selectedItem._mainColor = mainColor;
		_selectedItem._highlightColor = highlightColor;
		if (_selectedItem.Enabled)
		{
			_selectedItem._textColor = textColor;
			_selectedItem._textHighlightColor = textHighlightColor;
		}
		if (_selectedItem._type == 3 || _selectedItem._type == 4)
		{
			_selectedItem._sliderColor = sliderColor;
			_selectedItem.bar.setBarColour(_selectedItem._sliderColor);
		}
		this.UIMenu.updateItemsDrawing();
	}

	function SET_ITEM_VALUE(item, _val)
	{
		var _item = this.UIMenu.menuItems[item];
		if (_item._type == 1 || _item._type == 2 || _item._type == 3 || _item._type == 4)
		{
			_item.Value = _val;
		}
		else if ((_item instanceof com.rockstargames.ScaleformUI.items.UIMenuStatsItem))
		{
			_item.barscale = _val;
		}
	}

	function SET_RIGHT_BADGE(item, icon)
	{
		this.UIMenu.menuItems[item].SetRightBadge(icon);
	}

	function SET_ITEM_LABELS(item, lbl, rtxt)
	{
		if (this.UIMenu.menuItems[item]._type == 0)
		{
			com.rockstargames.ui.utils.UIText.setSizedText(this.UIMenu.menuItems[item].leftTextTF,lbl,true,true);
			this.UIMenu.menuItems[item].SetRightText(rtxt);
		}
	}
	function SET_BLINK_DESC(item, blink)
	{
		this.UIMenu.menuItems[item].blinkDesc = blink;
	}

	function SET_LEFT_LABEL(item, txt)
	{
		com.rockstargames.ui.utils.UIText.setSizedText(this.UIMenu.menuItems[item].leftTextTF,txt,true,true);
	}
	function SET_RIGHT_LABEL(item, txt)
	{
		if (this.UIMenu.menuItems[item]._type == 0)
		{
			this.UIMenu.menuItems[item].SetRightText(txt);
		}
	}

	function GET_VALUE_FROM_PANEL(item, panel)
	{
		return this.UIMenu.menuItems[item].panels[panel].Value;
	}

	function ADD_STATISTIC_TO_PANEL(item, panel, _label, _value)
	{
		this.UIMenu.menuItems[item].panels[panel].addStat(_label,_value);
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

	function ADD_TXD_REF_RESPONSE(txd, strRef, success)
	{
		if (success == true)
		{
			var pMC = this.CONTENT;
			var il = com.rockstargames.ui.media.ImageLoaderMC(eval(pMC + "." + strRef));
			if (pMC != undefined)
			{
				il.displayTxdResponse(txd);
			}
		}
	}

	function TXD_HAS_LOADED(txd, success, strRef)
	{
		if (success == true)
		{
			var pMC = this.CONTENT;
			var il = com.rockstargames.ui.media.ImageLoaderMC(eval(pMC + "." + strRef));
			if (pMC != undefined)
			{
				il.displayTxdResponse(txd,success);
			}
		}
	}

	function TXD_ALREADY_LOADED(txd, strRef)
	{
		var pMC = this.CONTENT;
		var il = com.rockstargames.ui.media.ImageLoaderMC(eval(pMC + "." + strRef));
		if (pMC != undefined)
		{
			il.displayTxdResponse(txd,true);
		}
	}

}