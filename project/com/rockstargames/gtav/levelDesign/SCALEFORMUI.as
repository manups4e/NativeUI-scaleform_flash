class com.rockstargames.gtav.levelDesign.SCALEFORMUI extends com.rockstargames.ui.core.BaseScreenLayout
{
	var UIMenu;
	var DispConf;
	var offset = [];
	var iActualWidth;
	static var MouseEnabled = true;
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
		if ((_actualWidth / _actualHeight) > 1.5)
		{
			this.iActualWidth = 1280;
		}
		else
		{
			this.iActualWidth = 890;
		}
		this.initScreenLayout();
	}

	function CREATE_MENU(title, subtitle, x, y, alternative, txd, txn, maxItems, enableAnim, animType, buildType, counterColor, dFontName, dFontId)
	{
		var off = [x, y];
		this.UIMenu = new com.rockstargames.ScaleformUI.UIMenu(this.CONTENT, title, subtitle, alternative, x, y, txd, txn, maxItems, enableAnim, animType, buildType, counterColor, dFontName, dFontId);
	}

	function CLEAR_ALL()
	{
		this.UIMenu.Clear();
		this.UIMenu = undefined;
	}

	function ENABLE_MOUSE(bool)
	{
		com.rockstargames.gtav.levelDesign.SCALEFORMUI.MouseEnabled = bool;
	}

	function UPDATE_TITLE_SUBTITLE(title, sub, altern)
	{
		this.UIMenu.updateTitleSubtitle(title,sub,altern);
	}

	function SET_COUNTER_COLOR(colour)
	{
		this.UIMenu.colorCounter(colour);
	}

	function SET_DESC_FONT(fName, fId)
	{
		this.UIMenu.descFont = [fName, fId];
	}
	function SET_ITEM_LABEL_FONT(item, fontName, fontId)
	{
		this.UIMenu.menuItems[item].updateFont(fontName, fontId);
	}

	function ADD_ITEM(id, str, sub, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13)
	{
		this.UIMenu.addItem(id,str,sub,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
	}

	function REMOVE_ITEM(id)
	{
		this.UIMenu.removeItem(id);
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

	function CHANGE_BUILDING_ANIMATION_TYPE(type)
	{
		this.UIMenu.buildingType = type;
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
	function UPDATE_SIDE_PANEL_TITLE(item, _title)
	{
		this.UIMenu.menuItems[item].sidePanel.setTitle(_title);
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
				retVal = this.UIMenu.goUp(item);
				break;
			case com.rockstargames.ui.game.GamePadConstants.DPADDOWN :
				retVal = this.UIMenu.goDown(item);
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

	function SELECT_ITEM(item)
	{
		var _item = this.UIMenu.menuItems[item];
		var ret = _item.Select();
		com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET");
		return ret;
	}

	function SELECT_PANEL(item)
	{
		var retVal = new Array();
		var _item = this.UIMenu.menuItems[item];
		if (_item.panels.length > 0)
		{
			for (var i = 0; i < _item.panels.length; i++)
			{
				var _panel = _item.panels[i];
				if (_panel._hovered)
				{
					if (_panel instanceof com.rockstargames.ScaleformUI.panels.UIMenuColorPanel)
					{
						retVal.push(i);
						retVal.push(_panel.Value);
						com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET");
						return retVal.toString();
					}
				}
			}
		}
	}

	function SELECT_SIDE_PANEL(item)
	{
		var item = this.UIMenu.menuItems[item];
		if (item.sidePanel != undefined)
		{
			if (item.sidePanel instanceof com.rockstargames.ScaleformUI.sidePanels.ColourPickerPanel)
			{
				com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET");
				return item.sidePanel.Value.toString();
			}
		}
	}

	function SET_INPUT_MOUSE_EVENT_CONTINUE()
	{
		var retVal = new Array();
		var counter = 0;
		if (this.UIMenu.currentItem.panels.length > 0)
		{
			for (var i = 0; i < this.UIMenu.currentItem.panels.length; i++)
			{
				var _panel = this.UIMenu.currentItem.panels[i];
				if (_panel._hovered)
				{
					_panel.SetCoords();
					retVal.push(i);
					retVal.push(_panel.Value);
					return retVal.toString();
				}
			}
		}
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
	
	function UPDATE_LISTITEM_INDEX(item, index){
		
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
		if (_selectedItem._type == 5)
		{
			_selectedItem.barMC.setBarColour(sliderColor);
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
		else if (_item._type == 5)
		{
			_item.barscale = _val;
		}
		this.UIMenu.updateItemsDrawing();
	}

	function SET_LEFT_BADGE(item, icon)
	{
		this.UIMenu.menuItems[item].SetLeftBadge(icon);
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