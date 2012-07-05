// (c) Ger Versluis 2000-2004 version 6.20, Januari 14, 2004
//  You may use this script on non commercial sites
//  www.burmees.nl/menu/


	// Globals effecting all menus
	var PopNoOffMenus=1;	// number of seperate menus
	var BaseHref="http://www.countyofbranch.com/";		// Root of the site
	var PopRClick=0;		// Defines which menu reacts on right click. 0=none

	var PopMenuSlide="";
	var PopMenuSlide="progid:DXImageTransform.Microsoft.RevealTrans(duration=.3, transition=19)";
	var PopMenuSlide="progid:DXImageTransform.Microsoft.GradientWipe(duration=.3, wipeStyle=1)";

	var PopMenuShadow="";
	var PopMenuShadow="progid:DXImageTransform.Microsoft.DropShadow(color=#888888, offX=2, offY=2, positive=1)";
	var PopMenuShadow="progid:DXImageTransform.Microsoft.Shadow(color=#888888, direction=135, strength=3)";

	var PopMenuOpacity="";
	var PopMenuOpacity="progid:DXImageTransform.Microsoft.Alpha(opacity=95)";

	function P_BeforeStart(){return}
	function P_AfterBuild(){return}
	function P_BeforeFirstOpen(){return}
	function P_AfterCloseAll(){return}

	// Globals effecting one menu
	// Notation of PopMenu1 is different from PopMenu2. The result is the same. PopMenu1 is more understandable. PopMenu2 loads faster.

PopMenu1=new Array(		// global variables for PopMenu1
	30,			// number of main items
	75,			// Left position
	15,			// Top position
	"585841",			// Normal font color
	"#baa57b",		// Normal back color
	"white",			// High font color
	"tan",			// High back color
	"#585841",			// Border color
	"arial",	// Fontfamily
	-1,			// Bold
	0,			// Italic
	12,			// Font size in pixel
	0,			// First line horizontal
	0,			// First line permanent visible
	1,			// Border width
	"left",			// Text align "left", "center" or "right"
	.25,			// Horizontal overlap
	.25,			// Vertical overlap
	150,			// Delay
	0,			// Right to left unfold
	"deptid",			// Target div
	1,			// Border between elements
	"left",			// Menu horizontal centered "left", "center" or "right"
	"top",			// Menu vertical centered "top", "center" or "bottom"
	BaseHref+"tri.gif",		// Arrow right
	5,			// Arrow Width
	10,			// Arrow Height
	BaseHref+"tridown.gif",	// Arrow down
	10,			// Arrow Width
	5,			// Arrow Height
	BaseHref+"trileft.gif",	// Arrow left
	5,			// Arrow Width
	10,			// Arrow Height
	2,			// Top padding
	2,			// Left padding
	0);			// Unfold On Click

//	Menu Items:
//	MenuX=new Array(ItemText, Link, background image, number of sub elements, height, width,bgcolor,bghighcolor,
//	fontcolor,fonthighcolor,bordercolor,fontfamily,fontsize,fontbold,fontitalic,textalign,statustext);
// 	Fontsize, fontbold and fontitalic are ignored when set to -1.
//	For rollover images ItemText format is:  "rollover?Image1.jpg?Image2.jpg"

//	Notation of PopMenu1_1 is different from PopMenu1_1_1. The result is the same. PopMenu1_1 is more understandable. PopMenu1_1_1 loads faster.
	PopMenu1_1=new Array(
		"911 / Central Dispatch",	// ElementText
		"dept.taf?dept_id=119",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_2=new Array(
		"Administration",	// ElementText
		"dept.taf?dept_id=101",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_3=new Array(
		"Airport",	// ElementText
		"dept.taf?dept_id=133",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_4=new Array(
		"Animal Control",	// ElementText
		"dept.taf?dept_id=134",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_5=new Array(
		"Branch County Brownfield Redevelopment Authority",	// ElementText
		"dept.taf?dept_id=136",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_6=new Array(
		"Building Department",	// ElementText
		"dept.taf?dept_id=105",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_7=new Array(
		"Circuit Court",	// ElementText
		"dept.taf?dept_id=106",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_8=new Array(
		"Commissioners",	// ElementText
		"dept.taf?dept_id=110",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_9=new Array(
		"Community Corrections",	// ElementText
		"dept.taf?dept_id=132",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_10=new Array(
		"County Clerk",	// ElementText
		"dept.taf?dept_id=102",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_11=new Array(
		"County Complex",	// ElementText
		"dept.taf?dept_id=112",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_12=new Array(
		"Dept. of Public Works",	// ElementText
		"dept.taf?dept_id=124",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_13=new Array(
		"District Court 3-A",	// ElementText
		"dept.taf?dept_id=107",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_14=new Array(
		"Drain Commissioner",	// ElementText
		"dept.taf?dept_id=121",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_15=new Array(
		"Emergency Management",	// ElementText
		"dept.taf?dept_id=120",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_16=new Array(
		"Equalization",	// ElementText
		"dept.taf?dept_id=117",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_17=new Array(
		"Friend of the Court",	// ElementText
		"dept.taf?dept_id=127",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_18=new Array(
		"GIS - Geographic Information Systems",	// ElementText
		"dept.taf?dept_id=115",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_19=new Array(
		"Human Resources",	// ElementText
		"dept.taf?dept_id=125",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_20=new Array(
		"Information Technology",	// ElementText
		"dept.taf?dept_id=111",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_21=new Array(
		"Microfilm",	// ElementText
		"dept.taf?dept_id=113",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_22=new Array(
		"Parks and Recreation",	// ElementText
		"dept.taf?dept_id=131",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_23=new Array(
		"Planning Commission",	// ElementText
		"dept.taf?dept_id=135",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_24=new Array(
		"Probate Court",	// ElementText
		"dept.taf?dept_id=116",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_25=new Array(
		"Prosecuting Attorney",	// ElementText
		"dept.taf?dept_id=108",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_26=new Array(
		"Register of Deeds",	// ElementText
		"dept.taf?dept_id=118",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_27=new Array(
		"Road Commission",	// ElementText
		"dept.taf?dept_id=130",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_28=new Array(
		"Sheriff's Office",	// ElementText
		"dept.taf?dept_id=109",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_29=new Array(
		"Treasurer's Office",	// ElementText
		"dept.taf?dept_id=126",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

	PopMenu1_30=new Array(
		"Veteran Affairs",	// ElementText
		"dept.taf?dept_id=123",		// ElementLink
		"",		// ElementBgImage
		0,		// ElementNoOfSubElements
		18,		// ElementHeight
		175,		// ElementWidth
		"#baa57b",		// ElementBgColor
		"#baa57b",		// ElementBgHighColor
		"#585841",		// ElementFontColor
		"white",		// ElementFontHighColor
		"#585841",		// ElementBorderColor
		"arial",		// ElementFontFamily
		12,		// ElementFontSize in pixel
		-1,		// ElementBold
		0,		// ElementItalic
		"left",		// ElementTextAlign
		"View the first layout option");		// ElementStatusText

