//-->Types
#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_EDIT 2
#define CT_SLIDER 3
#define CT_COMBO 4
#define CT_LISTBOX 5
#define CT_TOOLBOX 6
#define CT_CHECKBOXES 7
#define CT_PROGRESS 8
#define CT_HTML 9
#define CT_STATIC_SKEW 10
#define CT_ACTIVETEXT 11
#define CT_TREE 12
#define CT_STRUCTURED_TEXT 13
#define CT_CONTEXT_MENU 14
#define CT_CONTROLS_GROUP 15
#define CT_SHORTCUTBUTTON 16
#define CT_XKEYDESC 40
#define CT_XBUTTON          41
#define CT_XLISTBOX 42
#define CT_XSLIDER 43
#define CT_XCOMBO 44
#define CT_ANIMATED_TEXTURE 45
#define CT_MENU 46 //Arma 3 (EDEN)
#define CT_MENU_STRIP 47 //Arma 3 (EDEN)
#define CT_CHECKBOX 77 //Arma 3
#define CT_OBJECT 80
#define CT_OBJECT_ZOOM 81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK 98
#define CT_ANIMATED_USER 99
#define CT_MAP 100
#define CT_MAP_MAIN 101
#define CT_LISTNBOX 102
#define CT_ITEMSLOT 103

//-->Styles
// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144 //tileH and tileW params required for tiled image
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200 // this style works for CT_STATIC in conjunction with ST_MULTI
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           1024

#define SL_TEXTURES       0x10

// progress bar 
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define FontM             "PuristaMedium" // The standard font in Arma 3 is "PuristaMedium"

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

//-->SAF Common
//->General
class SAF_RscBg {
	type = CT_STATIC;
	style = ST_HUD_BACKGROUND;
	shadow = 0;
	
	text = "";
	colorText[] = {0,0,0,0};
	font = FontM;
	sizeEx = 0;
	
	colorbackground[] = 
	{
		"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
	};
};

class SAF_RscPicture {
	access = 0;
	type = CT_STATIC;
	style = ST_PICTURE;
	
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	
	font = FontM;
	sizeEx = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	lineSpacing = 0;
	
};

class SAF_RscStructuredText {
	deletable = 0;
	fade = 0;
	access = 0;
	type = CT_STRUCTURED_TEXT;
	style = CT_STATIC;
	shadow = 1;
	
	colorText[] = {1,1,1,1};
	text = "";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	class Attributes
	{
		font = FontM;
		color = "#ffffff";
		colorLink = "#D09B43";
		align = "left";
		valign = "middle";
		shadow = 0;
		shadowColor = "#000000";
		size = 1;
	};
};

class SAF_RscButton {
	deletable = 0;
	fade = 0;
	access = 0;
	type = CT_BUTTON;
	style = ST_LEFT;
	shadow = 0;
	borderSize = 0;
	
	colorText[] = {1,1,1,1};
	text = "";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	font = FontM;
	
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0,0,0,1};
	colorBackgroundDisabled[] = {0,0,0,1};
	colorBackgroundActive[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	
	onMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [1, 1, 1, 1]";
	default = false;
};



class SAF_RscCombo {
	access = 0;
	type = CT_COMBO;
	style = ST_LEFT + LB_TEXTURES;
	blinkingPeriod = 0;
	shadow = 0;
	maxHistoryDelay = 1;
	wholeHeight = 0.45;
	
	colorText[] = {1,1,1,1};
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";	
	font = FontM;
	
	colorBackground[] = {0.2,0.2,0.2,1}; 
	colorSelectBackground[] = {0.2,0.2,0.2,1};
	colorDisabled[] = {1,1,1,0.5}; 
	colorSelect[] = {1,1,1,1}; 
	
	pictureColor[] = {1,0.5,0,1}; 
	pictureColorSelect[] = {1,1,1,1}; 
	pictureColorDisabled[] = {1,1,1,0.5};
	
	tooltip = "CT_COMBO";
	tooltipColorShade[] = {0,0,0,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1}; // Sound played when the list is expanded
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1}; // Sound played when the list is collapsed
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1}; // Sound played when an item is selected
	
	class ComboScrollBar {
		width = 0;
		height = 0; 
		scrollSpeed = 0.01; 

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";

		color[] = {1,1,1,1};
	};

	default = 0;
};

class SAF_RscToolBox {
	type = CT_TOOLBOX;
	style = ST_CENTER;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";	
	font = FontM;
	colorText[] = {1, 1, 1, 1};
	color[] = {0,0,0,0};
	colorTextSelect[] = {0, 0, 0, 1};
	colorSelect[] = {0,0,0,0};
	colorTextDisable[] = {0,0,0,0};
	colorDisable[] = {0,0,0,0};
	colorSelectedBg[] = {1,1,1,1};
	rows = 3;
	columns = 3;
};

//-->Dialogs
class SAF_status_dialog
{
	idd = -1; //no need for the whole dialog to be referenced at any time.
	movingEnable = false; //not moving
	moving = 1; // who the hell knows what this does????????
	onLoad = "uiNamespace setVariable ['SAF_status_dialog', _this select 0]";
	onUnLoad="uiNamespace setVariable ['SAF_status_dialog', objNull]";
	class controls {	
		class SAF_blank_btnCancel: SAF_RscButton
			{
				idc = 1103;

				text = "CANCEL";
				x = 0.45;
				y = 0.6;
				w = 0.1;
				h = 0.04;
				onButtonClick = "closeDialog 1";
			};
	};
};
//-->Test
/*
class SAF_test_dialog {
	idd = -1; //no need for the whole dialog to be referenced at any time.
	movingEnable = false; //not moving
	moving = 1; // who the hell knows what this does????????
	onLoad = "uiNamespace setVariable ['SAF_test_dialog', _this select 0]";
	onUnLoad="uiNamespace setVariable ['SAF_test_dialog', objNull]";
	
	
	class Objects
	{
		class Person
		{
			
		};
	};
	
	class controlsBackground {
		class SAF_test_bg: SAF_RscBg
		{
			idc = -1;
			w = safezoneW;
			h = safezoneH;
			x = safezoneX;
			y = safezoneY;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};
	
	class controls {

		class SAF_test_header: SAF_RscStructuredText 
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.044 * safezoneH;
			
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
			text = "Wybierz kategoriê";
			colorBackground[] = {0.769,0.51,0.078,1};
		};
		
		class SAF_tst_menu: SAF_RscToolBox {
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.44 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";	
			strings[] = {"Entry 1","Entry 2","Entry 3","Entry 4","Entry 5","Entry 6"};
			values[] = {1,1,0,1,0,0};
		};
		
		
	};
	
};
*/
