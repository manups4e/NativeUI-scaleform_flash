class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var multiListIndex: Number = 0;
    var multiListItems = new Array();
    var _data;
    var _highlighted;
    var attachMovie;
    var bgMC;
    var crewTagMC;
    var getNextHighestDepth;
    var index;
    var initialIndex;
    var isSelectable;
    var itemTextLeft;
    var itemTextRight;
    var labelMC;
    var selectedIndex;
    var selectedValue;
    var storeFunc;
    var storeScope;
    var type;

    function PauseMenuVerticalListItem()
    {
        super();
        this.itemTextRight = this.labelMC.valueTF;
    }

    function set data(_d)
    {
        super.__set__data(_d);
        if (this.crewTagMC) 
        {
            this.crewTagMC._visible = false;
        }
        if ((__reg0 = this.type) === 1) 
        {
            this.multiListItems = this.__get__data().slice(1);
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft, this._data[0]);
            this.__set__textIndex(this.initialIndex);
        }
        else if (__reg0 === 2) 
        {
            if (!this.crewTagMC) 
            {
                this.crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP", "CREW_TAG", this.getNextHighestDepth(), {_y: 4, _xscale: 70, _yscale: 70});
            }
            this.crewTagMC._visible = true;
            this.crewTagMC.UNPACK_CREW_TAG(this.__get__data()[1]);
            this.crewTagMC._x = this.itemTextLeft._x + this.itemTextLeft.textWidth + 10;
        }
    }

    function initStoreMethod(func, scope)
    {
        this.storeFunc = func;
        this.storeScope = scope;
    }

    function set textIndex(ti)
    {
        this.multiListIndex = ti;
        this.selectedIndex = this.multiListIndex;
        this.selectedValue = this.multiListItems[this.multiListIndex];
        com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight, this.selectedValue);
    }

    function set highlighted(_h)
    {
        if (this.bgMC) 
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC, _h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        }
        var __reg2 = new com.rockstargames.ui.utils.HudColour();
        var __reg3 = 100;
        if (this.isSelectable == 0) 
        {
            __reg3 = _h ? 60 : 30;
        }
        com.rockstargames.ui.utils.Colour.setHudColour(_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, __reg2);
        com.rockstargames.ui.utils.Colour.Colourise(this.labelMC, __reg2.r, __reg2.g, __reg2.b, __reg3);
        this._highlighted = _h;
    }

    function stepVal(dir)
    {
        if ((__reg0 = this.type) === 1) 
        {
            this.multiListIndex = this.multiListIndex + dir;
            if (this.multiListIndex < 0) 
            {
                this.multiListIndex = this.multiListItems.length - 1;
            }
            if (this.multiListIndex > this.multiListItems.length - 1) 
            {
                this.multiListIndex = 0;
            }
            this.__set__textIndex(this.multiListIndex);
            this.storeFunc.apply(this.storeScope, [this.index, this.multiListIndex]);
        }
        this.__set__highlighted(this._highlighted);
    }

}
