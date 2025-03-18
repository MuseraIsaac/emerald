//+------------------------------------------------------------------+
//|                                                          EME.mq5 |
//|                                           Copyright 2021, Musera |
//|                                           https://www.musera.com |
//+------------------------------------------------------------------+
#include <Trade/Trade.mqh>
CTrade  trade;


#property copyright "Copyright 2021, EMERALD."
//#property link      "https://www.mql5.com"
#property version   "1.11"
#property description   "This Utility is designed to help traders in making of certain crucial trading decisions."
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

int Interval=1;

//=============================================

string name= "Menu";
int sub_window=0;
int xx=30;
int yy=20;
int width=300;
int height=420;
input color bg_color =clrGray;  //Menu Background Colour
color border_clr=clrBeige;
int border_width=2;

input bool ShowSandR= false; //Show Top & Lower Check Lines
input color ChartLines=clrBlue; //Top & Lower Check colors
input bool ShowSignal= true; //Show Signal

//================================================================
static bool ChartObjectsOn=true;

input group "Forex Sessions"
enum TimeZone
  {
   Albania =+1, //Albania
   Algeria=+1, //Algeria
   Andorra=+1, //Andorra
   Angola=+1,  //Angola
   Antigua_and_Garbuda=-4, //Antigua and Garbuda
   Argentina=-3,  //Argentina
   Arzebaijan=+4,  //Arzebaijan
   Australia_Sydney=+10, //Australia Sydney
   AustraliaMcDonaldsIslands=+5, //Australia McDonalds Islands
   AustraliaNorflkIslands=+11,  //Australia Norfolk Islands
   AustraliaQueensIsland =+10, //Australia Queens Island
   AustraliaWesternAustralia=+8,  //Australia Western Australia
   Austria=+1, //Austria
   Bahamas=-5,  //Bahamas
   Bahrain=+3,  //Bahrain
   Bangladesh=+6,//Bangladesh
   Barbados=-4,//Barbados
   Belarus=+3,//Belarus
   Belgium=+1,//Belgium
   Belize=-6,//Belize
   Benin=+1,//Benin
   Bolivia=-4,//Bolivia
   BosniaandHezegovina=+1,//Bosnia and Hezegovina
   Botswana=+2,//Botswana
   Brazil=-3,//Brazil
   Bulgaria=+2,//Bulgaria
   BurkinaFaso=0,//BurkinaFaso
   Burundi=+2,//Burundi
   Cambodia=+7,//Cambodia
   Cameroon=+1,//Cameroon
   CanadaAlberta=-7,//Canada Alberta
   CanadaBritishColumbia=-8,//Canada British Columbia
   CanadaManitoba=-6,//Canada Manitoba
   CanadaNunavut=-7,//Canada Nunavut
   CanadaSaskatchewan=-7,//Canada Saskatchewan
   CentralAfricanRepublic=+1,//Central African Republic
   Chile=-4,//Chile
   China=+8,//China
   Colombia=-5,//Colombia
   Comoros=+3,//Comoros
   Congo=+1,//Congo
   CostaRica=-6,//Costa Rica
   CoteDivoire=0,//Cote D'ivoire
   Croatia=+1,//Croatia
   Cuba=-5,//Cuba
   Cyprus=+2,//Cyprus
   CzechRepublic=+1,//Czech Republic
   Denmark=+1,//Denmark
   DenmarkGreenland=-3,//Denmark Greenland
   Djibouti=+3,//Djibouti
   DominicanRepublic=-4,//Dominican Republic
   DRC=+2,//DRC
   Ecuador=-5,//Ecuador

   Egypt=+2,//Egypt
   ElSalvador=-6,//El Salvador
   EquitorialGuinea=+1,//Equitorial Guinea
   Eritrea=+3,//Eritrea
   Estonia=+2,//Estonia
   Fiji=+12,//Fiji
   Finland=+2,//Finland
   France=+1,//France
   FranceClippertonIsland=-8,//France Clipperton Island
   FranceGambierIslands=-9,//France Gambier Islands
   FranceSaintMartin=-4,//France Saint Martin
   Gabon=+1,//Gabon
   Gambia=0,//Gambia
   Germany=+1,//Germany
   Ghana=0,//Ghana
   Greece=+2,//Greece
   Grenada=-4,//Grenada
   Guatemala=-6,//Guatemala
   Guinea=0,//Guinea
   GuineaBissau=0,//Guinea Bissau
   Guyana=-4,//Guyana
   Haiti=-5, //Haiti
   Honduras=-6, //Honduras
   HongKong=+8, //Hong Kong
   Hungary=+1, //Hungary
// ---------------------------------------------------------------
   Iceland=0, //Iceland
   India=+5, //India
   Indonesia=+8, //Indonesia-Central
   Iran=+3, //Iran
   Iraq=+3, //Iraq
   Ireland=0, //Ireland
   Israel=+2, //Israel
   Italy=+1, //Italy

   Japan=+9,//Japan
   JarvisIsland=-11,//Jarvis Island
   Kenya=+3,//Kenya
   Kiribati=+12,//Kiribati
   Kosovo=+1,//Kosovo
   Kuwait=+3,//Kuwait
   Liberia=0,//Liberia
   Liechenstein=+1,//Liechenstein
   Luthania=+2,//Luthania
   Luxenberg=+1,//Luxenberg
   Lybia=+2,//Lybia
   Madagascar=+3,//Madagascar
   Malawi=+2,//Malawi
   Malaysia=+8,//Malaysia
   Maldives=+5,//Maldives
   Mali=0,//Mali
   Malta=+1,//Malta
   Mauritania=0,//Mauritania
   Mautitius=+4,//Mautitius
   Mexico=-6,//Mexico
   MexicoBajaCalifornia=-8,//Mexico Baja California
   MexicoNayarit=-7,//Mexico Nayarit
   Moldova=+2,//Moldova
   Monaco=+1,//Monaco
   Morocco=+1,//Morocco
   Mozambique=+2,//Mozambique
   Namibia=+2,//Namibia
   Nepal=+6,//Nepal
   Netherlands=+1,//Netherlands
   NetherlandsCaribbean=-4,//Netherlands Caribbean
   NewZealandCookIslands=-10,//NewZealand CookIslands
   NewZealandNiue=-11,//New Zealand Niue
   Nicaragua=-6,//Nicaragua
   Niger=+1,//Niger
   Nigeria=+1,//Nigeria
   NorthKorea=+9,//NorthKorea
   NorthMacedonia=+1,//North Macedonia
   Norway=+1,//Norway
   Oman=+4,//Oman
   Panam=-5,//Panam
   PapuaNewGuinea=+10,//Papua New Guinea
   Paraguay=-4,//Paraguay
   Peruu= -5,      //Peru
   Phillipines=+8,//Phillipines
   Poland=+1,//Poland
   Qatar=+3,//Qatar
   Romania=+2,//Romania
   RussiaIrkutsktime=+8,//Russia Irkutsk time
   RussiaKamchatkatime=+12,//Russia Kamchatka time
   RussiaKrasnoyarsktime=+7,//Russia Krasnoyarsk time
   RussiaMoscowtime=+3,//Russia Moscow time
   RussiaOmsktime=+6,//Russia Omsk time
   RussiaSamaratime=+4,//Russia Samara time
   RussiaVladivostoktime=+10,//Russia Vladivostok time
   Rwanda=+2,//Rwanda
   SaintVincentandtheGrenadines=-4,//Saint Vincent and the Grenadines
   SanMarino=+1,//San Marino
   Samoa=+13,//Samoa
   SaoTomeandPrincipe=0,//Sao Tome and Principe
   SaudiArabia=+3,//Saudi Arabia
   Senegal=0,//Senegal
   Serbia=+1,//Serbia
   Seychelles=+4,//Seychelles
   SierraLeone=0, //Sierra Leone
   Singapore=+8,  //Singapore
   Slovakia=+2, //Slovakia
   Slovenia=+1, //Slovenia
   SolomonIslands=+11, //Solomon Islands
   Somalia=+3,  //Somalia
   
   SouthKorea=+9,//SouthKorea
   Spain=+1,//Spain
   Sudan=+2,//Sudan
   Suriname=-3,//Suriname
   Sweden=+1,//Sweden
   Switzerland=+1,//Switzerland
   Syria=+2,//Syria
   Taiwan=+8,//Taiwan
   Tanzania=+3,//Tanzania
   Thailand=+7,//Thailand
   Togo =0,//Togo
   Tonga=+13,//Tonga
   TrinidanandTobago=-4,//TrinidanandTobago
   Tunisia=+1,//Tunisia
   Turkey=+3,//Turkey
   UAE=+4,//UAE
   Uganda=+3,//Uganda
   UK=0,//UK
   UKBermuda=-4,//UK Bermuda
   UKPitcairnIslands=-8,//UK Pitcairn Islands
   Ukraine=+2,//Ukraine
   UKSouthGeorgia=-2,//UK South Georgia
   Uraguay=-3,//Uraguay
   USAlabama=-6,//US Alabama
   USAlaska=-9,//US Alaska
   USArizona=-7,//US Arizona
   USArkansas=-6,//US Arkansas
   USBakerIsland=-12,//US Baker Island
   USCalifornia=-8,//US California
   USColorado=-7,//US Colorado
   USDelaware=-5,//US Delaware
   USDistrictofColumbia=-5,//US District of Columbia
   USGeorgua=-5,//US Georgua
   USHawaii=-10,//US Hawaii
   USHowlandIsland=-12,//US Howland Island

   USIdaho=-8,//US Idaho
   USIllinois=-6,//US Illinois
   USIndiana=-5,//US Indiana
   USLousiana=-6,//US Lousiana
   USMaryland=-5,//US Maryland
   USMinnesita=-6,//US Minnesita
   USMississipi=-6,//US Mississipi
   USMissouro=-6,//US Missouro
   USMontana=-7,//US Montana
   USNevada=-7,//US Nevada

   USNeyJersey=-5,//US Ney Jersey
   USNewYork=-5,//US New York
   USNorthCarolina=-5,//US North Carolina
   USOhio=-5,//US Ohio
   USOregon=-8,//US Oregon
   USPennslyvania=-5,//US Pennslyvania
   USPuertoRico=-4,//US PuertoRico
   USSamoa=-11,//US Samoa
   USSouthCarolina=-5,//US South Carolina
   USUSVirginIslands=-4,//US Virgin Islands
   USUtah=-7,//US Utah
   USVirginia=-5,//US Virginia
   USWashington=-8,//US Washington
   USWisconsin=-6,//US Wisconsin
   USWyoming=-7,//US Wyoming
   VaticanCity=+1,//Vatican City
   Venezuela=-4,//Venezuela
   Vietnam=+7,//Vietnam
   WesternSahara=+1,//Western Sahara
   Zambia=+2,//Zambia
   Zimbabwe=+2,//Zimbabwe



  };

input TimeZone time_zone=Albania;  //Session Time Zone
input bool SessionAlerts =true;  //Show Session Alerts

//Print(time_zone);

static int Symb1;
static int Symb2;
double RSI[];
int OnInit()
  {

   EventSetTimer(Interval); // CSM check timer
   int h_rsi;
   h_rsi=iRSI(_Symbol,PERIOD_CURRENT,10,PRICE_CLOSE);
   CopyBuffer(h_rsi,0,0,8,RSI);

   ObjectCreate(0,name,OBJ_RECTANGLE_LABEL,sub_window,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,xx);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,yy);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,height);
   ObjectSetInteger(0,name,OBJPROP_COLOR,border_clr);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,bg_color);
   ObjectSetInteger(0,name,OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0,name,OBJPROP_WIDTH,border_width);
   ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,0);
   ObjectSetInteger(0,name,OBJPROP_SELECTED,0);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,name,OBJPROP_ZORDER,0);
//----------------------------------------------------------------------

   ObjectCreate(0,"BlueNation",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"BlueNation",OBJPROP_FONT,"Cooper Black");
   ObjectSetInteger(0,"BlueNation",OBJPROP_FONTSIZE,12);
   ObjectSetString(0,"BlueNation",OBJPROP_TEXT,0,"             EMERALD");
   ObjectSetInteger(0,"BlueNation",OBJPROP_XDISTANCE,70);
   ObjectSetInteger(0,"BlueNation",OBJPROP_YDISTANCE,28);
   ObjectSetInteger(0,"BlueNation",OBJPROP_COLOR,clrBlack);


//---------------Chart Menu Lines--------------------------------

   ObjectCreate(0,"Line1",OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSetInteger(0,"Line1",OBJPROP_XDISTANCE,32);
   ObjectSetInteger(0,"Line1",OBJPROP_YDISTANCE,54);
   ObjectSetInteger(0,"Line1",OBJPROP_XSIZE,296);
   ObjectSetInteger(0,"Line1",OBJPROP_YSIZE,70);
   ObjectSetInteger(0,"Line1",OBJPROP_COLOR,border_clr);
   ObjectSetInteger(0,"Line1",OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,"Line1",OBJPROP_BACK,false);
   ObjectSetInteger(0,"Line1",OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,"Line1",OBJPROP_BGCOLOR,bg_color);


   ObjectCreate(0,"Line2",OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSetInteger(0,"Line2",OBJPROP_XDISTANCE,32);
   ObjectSetInteger(0,"Line2",OBJPROP_YDISTANCE,126);
   ObjectSetInteger(0,"Line2",OBJPROP_XSIZE,296);
   ObjectSetInteger(0,"Line2",OBJPROP_YSIZE,80);
   ObjectSetInteger(0,"Line2",OBJPROP_COLOR,border_clr);
   ObjectSetInteger(0,"Line2",OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,"Line2",OBJPROP_BACK,false);
   ObjectSetInteger(0,"Line2",OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,"Line2",OBJPROP_BGCOLOR,bg_color);

//===================================================================================
//------------Chart Buttons-------------------------------------------------------
   ObjectCreate(0,"CloseAllBuys",OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,"CloseAllBuys",OBJPROP_XSIZE,60);
   ObjectSetInteger(0,"CloseAllBuys",OBJPROP_YSIZE,20);
   ObjectSetInteger(0,"CloseAllBuys",OBJPROP_XDISTANCE,200);
   ObjectSetInteger(0,"CloseAllBuys",OBJPROP_YDISTANCE,145);
   ObjectSetInteger(0,"CloseAllBuys",OBJPROP_CORNER,2);
   ObjectSetString(0,"CloseAllBuys",OBJPROP_TEXT,"CloseAll");
   ObjectSetInteger(0,"CloseAllBuys",OBJPROP_CORNER,CORNER_LEFT_UPPER);

   ObjectCreate(0,"CloseAllSells",OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,"CloseAllSells",OBJPROP_XSIZE,60);
   ObjectSetInteger(0,"CloseAllSells",OBJPROP_YSIZE,20);
   ObjectSetInteger(0,"CloseAllSells",OBJPROP_XDISTANCE,200);
   ObjectSetInteger(0,"CloseAllSells",OBJPROP_YDISTANCE,175);
   ObjectSetInteger(0,"CloseAllSells",OBJPROP_CORNER,2);
   ObjectSetString(0,"CloseAllSells",OBJPROP_TEXT,"CloseAll");
   ObjectSetInteger(0,"CloseAllSells",OBJPROP_CORNER,CORNER_LEFT_UPPER);


//===================================================================================
//----------Currency Pair Labels
   ObjectCreate(0,"Pairs1",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"Pairs1",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"Pairs1",OBJPROP_FONTSIZE,8);
   ObjectSetString(0,"Pairs1",OBJPROP_TEXT,0,"EUR           USD            GBP            AUD          JPY   ");
   ObjectSetInteger(0,"Pairs1",OBJPROP_XDISTANCE,55);
   ObjectSetInteger(0,"Pairs1",OBJPROP_YDISTANCE,290);
   ObjectSetInteger(0,"Pairs1",OBJPROP_COLOR,clrBlack);

   ObjectCreate(0,"Pairs2",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"Pairs2",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"Pairs2",OBJPROP_FONTSIZE,8);
   ObjectSetString(0,"Pairs2",OBJPROP_TEXT,0,"CHF            NZD           CAD           NOK           DKK");
   ObjectSetInteger(0,"Pairs2",OBJPROP_XDISTANCE,55);
   ObjectSetInteger(0,"Pairs2",OBJPROP_YDISTANCE,390);
   ObjectSetInteger(0,"Pairs2",OBJPROP_COLOR,clrBlack);

   ObjectCreate(0,"CSM",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"CSM",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"CSM",OBJPROP_FONTSIZE,5);
   ObjectSetString(0,"CSM",OBJPROP_TEXT,0,"CURRENCY STRENGTH METER");
   ObjectSetInteger(0,"CSM",OBJPROP_XDISTANCE,120);
   ObjectSetInteger(0,"CSM",OBJPROP_YDISTANCE,208);
   ObjectSetInteger(0,"CSM",OBJPROP_COLOR,clrBlack);

//====================Forex Sessions====================================
   if(ChartObjectsOn)
     {

      ObjectCreate(0,"Line1",OBJ_RECTANGLE_LABEL,0,0,0);
      ObjectSetInteger(0,"Line1",OBJPROP_XDISTANCE,330);
      ObjectSetInteger(0,"Line1",OBJPROP_YDISTANCE,30);
      ObjectSetInteger(0,"Line1",OBJPROP_XSIZE,350);
      ObjectSetInteger(0,"Line1",OBJPROP_YSIZE,155);
      ObjectSetInteger(0,"Line1",OBJPROP_COLOR,clrWhiteSmoke);
      ObjectSetInteger(0,"Line1",OBJPROP_STYLE,STYLE_SOLID);
      ObjectSetInteger(0,"Line1",OBJPROP_BACK,false);
      ObjectSetInteger(0,"Line1",OBJPROP_HIDDEN,false);
      ObjectSetInteger(0,"Line1",OBJPROP_BGCOLOR,clrWhiteSmoke);

      ObjectCreate(0,"Line2",OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,"Line2",OBJPROP_XDISTANCE,330);
      ObjectSetInteger(0,"Line2",OBJPROP_YDISTANCE,31);
      ObjectSetInteger(0,"Line2",OBJPROP_XSIZE,350);
      ObjectSetInteger(0,"Line2",OBJPROP_YSIZE,30);
      ObjectSetInteger(0,"Line2",OBJPROP_COLOR,clrWhiteSmoke);

      ObjectCreate(0,"okyo",OBJ_LABEL,0,0,0);
      ObjectSetString(0,"okyo",OBJPROP_FONT,"Arial");
      ObjectSetInteger(0,"okyo",OBJPROP_FONTSIZE,10);
      ObjectSetString(0,"okyo",OBJPROP_TEXT,0,"Market Session         Opens          Closes           Status");
      ObjectSetInteger(0,"okyo",OBJPROP_XDISTANCE,338);
      ObjectSetInteger(0,"okyo",OBJPROP_YDISTANCE,37);
      ObjectSetInteger(0,"okyo",OBJPROP_COLOR,clrBlack);


      //ObjectSetString(0,"Line2",OBJPROP_TEXT,"Market Session     Opens    Closes");

      ObjectCreate(0,"Line3",OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,"Line3",OBJPROP_XDISTANCE,618);
      ObjectSetInteger(0,"Line3",OBJPROP_YDISTANCE,64);
      ObjectSetInteger(0,"Line3",OBJPROP_XSIZE,60);
      ObjectSetInteger(0,"Line3",OBJPROP_YSIZE,25);

      ObjectCreate(0,"Line4",OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,"Line4",OBJPROP_XDISTANCE,618);
      ObjectSetInteger(0,"Line4",OBJPROP_YDISTANCE,84);
      ObjectSetInteger(0,"Line4",OBJPROP_XSIZE,60);
      ObjectSetInteger(0,"Line4",OBJPROP_YSIZE,25);

      ObjectCreate(0,"Line5",OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,"Line5",OBJPROP_XDISTANCE,618);
      ObjectSetInteger(0,"Line5",OBJPROP_YDISTANCE,104);
      ObjectSetInteger(0,"Line5",OBJPROP_XSIZE,60);
      ObjectSetInteger(0,"Line5",OBJPROP_YSIZE,25);

      ObjectCreate(0,"Line6",OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,"Line6",OBJPROP_XDISTANCE,618);
      ObjectSetInteger(0,"Line6",OBJPROP_YDISTANCE,124);
      ObjectSetInteger(0,"Line6",OBJPROP_XSIZE,60);
      ObjectSetInteger(0,"Line6",OBJPROP_YSIZE,25);

      ObjectCreate(0,"Line7",OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,"Line7",OBJPROP_XDISTANCE,618);
      ObjectSetInteger(0,"Line7",OBJPROP_YDISTANCE,144);
      ObjectSetInteger(0,"Line7",OBJPROP_XSIZE,60);
      ObjectSetInteger(0,"Line7",OBJPROP_YSIZE,25);

      ObjectCreate(0,"CloseObj",OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,"CloseObj",OBJPROP_XDISTANCE,329);
      ObjectSetInteger(0,"CloseObj",OBJPROP_YDISTANCE,5);
      ObjectSetInteger(0,"CloseObj",OBJPROP_XSIZE,25);
      ObjectSetInteger(0,"CloseObj",OBJPROP_YSIZE,25);
      ObjectSetString(0,"CloseObj",OBJPROP_TEXT,"X");
     }

//===============================Forex Sessions==============================================

   return(0);
  }

void OnTick()

  {
  
  
//input TimeZone time_zone=Albania;  //Session Time Zone
//input bool SessionAlerts =true;  //Show Session Alerts

//Print((string) time_zone);
  
  
   double AccountBalance=AccountInfoDouble(ACCOUNT_BALANCE);
//----------------------------------------------------

   string CurrencyPair= ChartSymbol(0);
   int TimeFrame= PeriodSeconds();

   ObjectCreate(0,"CurrencyPair",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"CurrencyPair",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"CurrencyPair",OBJPROP_FONTSIZE,10);
   ObjectSetString(0,"CurrencyPair",OBJPROP_TEXT,0,""+ CurrencyPair+ ",  M"+TimeFrame/60);
   ObjectSetInteger(0,"CurrencyPair",OBJPROP_XDISTANCE,50);
   ObjectSetInteger(0,"CurrencyPair",OBJPROP_YDISTANCE,60);
   ObjectSetInteger(0,"CurrencyPair",OBJPROP_COLOR,clrWhiteSmoke);

   ObjectCreate(0,"Spread",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"Spread",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"Spread",OBJPROP_FONTSIZE,10);
   ObjectSetString(0,"Spread",OBJPROP_TEXT,0,"Spread: "+ SymbolInfoInteger(Symbol(),SYMBOL_SPREAD));
   ObjectSetInteger(0,"Spread",OBJPROP_XDISTANCE,180);
   ObjectSetInteger(0,"Spread",OBJPROP_YDISTANCE,100);
   ObjectSetInteger(0,"Spread",OBJPROP_COLOR,clrWhiteSmoke);

   ObjectCreate(0,"AccountBalance",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"AccountBalance",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"AccountBalance",OBJPROP_FONTSIZE,10);
   ObjectSetString(0,"AccountBalance",OBJPROP_TEXT,0,"Account Balance: " +DoubleToString(AccountBalance,2));
   ObjectSetInteger(0,"AccountBalance",OBJPROP_XDISTANCE,50);
   ObjectSetInteger(0,"AccountBalance",OBJPROP_YDISTANCE,80);
   ObjectSetInteger(0,"AccountBalance",OBJPROP_COLOR,clrWhiteSmoke);

   long AccountLeverage = AccountInfoInteger(ACCOUNT_LEVERAGE);
   ObjectCreate(0,"Leverage",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"Leverage",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"Leverage",OBJPROP_FONTSIZE,10);
   ObjectSetString(0,"Leverage",OBJPROP_TEXT,0,"Leverage: " +AccountLeverage);
   ObjectSetInteger(0,"Leverage",OBJPROP_XDISTANCE,50);
   ObjectSetInteger(0,"Leverage",OBJPROP_YDISTANCE,100);
   ObjectSetInteger(0,"Leverage",OBJPROP_COLOR,clrWhiteSmoke);

//----------------------------------------------------------------
   ObjectCreate(0,"BuyProfit",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"BuyProfit",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"BuyProfit",OBJPROP_FONTSIZE,10);
   ObjectSetString(0,"BuyProfit",OBJPROP_TEXT,0,"Buy Profit: "+ DoubleToString(TotalBuyProfit(),2));
   ObjectSetInteger(0,"BuyProfit",OBJPROP_XDISTANCE,50);
   ObjectSetInteger(0,"BuyProfit",OBJPROP_YDISTANCE,135);
   ObjectSetInteger(0,"BuyProfit",OBJPROP_COLOR,clrWhiteSmoke);

   ObjectCreate(0,"BuyOrders",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"BuyOrders",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"BuyOrders",OBJPROP_FONTSIZE,10);
   ObjectSetString(0,"BuyOrders",OBJPROP_TEXT,0,"Buy Orders: "+ OpenBuyPos());
   ObjectSetInteger(0,"BuyOrders",OBJPROP_XDISTANCE,50);
   ObjectSetInteger(0,"BuyOrders",OBJPROP_YDISTANCE,150);
   ObjectSetInteger(0,"BuyOrders",OBJPROP_COLOR,clrWhiteSmoke);

   ObjectCreate(0,"SellProfit",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"SellProfit",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"SellProfit",OBJPROP_FONTSIZE,10);
   ObjectSetString(0,"SellProfit",OBJPROP_TEXT,0,"Sell Profit: "+ DoubleToString(TotalSellProfit(),2));
   ObjectSetInteger(0,"SellProfit",OBJPROP_XDISTANCE,50);
   ObjectSetInteger(0,"SellProfit",OBJPROP_YDISTANCE,170);
   ObjectSetInteger(0,"SellProfit",OBJPROP_COLOR,clrWhiteSmoke);

   ObjectCreate(0,"SellOrders",OBJ_LABEL,0,0,0);
   ObjectSetString(0,"SellOrders",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"SellOrders",OBJPROP_FONTSIZE,10);
   ObjectSetString(0,"SellOrders",OBJPROP_TEXT,0,"Sell Orders: "+ OpenSellPos());
   ObjectSetInteger(0,"SellOrders",OBJPROP_XDISTANCE,50);
   ObjectSetInteger(0,"SellOrders",OBJPROP_YDISTANCE,185);
   ObjectSetInteger(0,"SellOrders",OBJPROP_COLOR,clrWhiteSmoke);

//-------------------------------------------------------------------
   MqlTick last_tick;
   SymbolInfoTick(Symbol(),last_tick);
   double CurrentPrice = last_tick.ask;
   double PriceSell= last_tick.bid;
   int SignalStrength; //Printed of Combined strength
   int RSISignal=MathAbs((RSI[0]-RSI[4])/4.5);
   if(RSISignal>5)
     {
      RSISignal=6.5;  //Set a cap constant for extremes
     }
   double CSIStrength=MathAbs((Symb1-Symb2)*18.4); //Max of 92
   SignalStrength=CSIStrength+RSISignal;

   if(ShowSignal)
     {
      if((Symb1-Symb2)>0)
        {
         ObjectCreate(_Symbol,"BuyProbability",OBJ_ARROW_UP,0,TimeCurrent()+PeriodSeconds(),CurrentPrice);
         ObjectSetInteger(0,"BuyProbability",OBJPROP_WIDTH,5);
         ObjectSetInteger(0,"BuyProbability",OBJPROP_COLOR,clrDarkTurquoise);
         ObjectMove(_Symbol,"BuyProbability",0,(TimeCurrent()+PeriodSeconds()),CurrentPrice);
         ObjectDelete(0,"SellProbability");
        }

      if((Symb1-Symb2)<0)
        {
         ObjectCreate(_Symbol,"SellProbability",OBJ_ARROW_DOWN,0,TimeCurrent()+2*PeriodSeconds(),PriceSell);
         ObjectSetInteger(0,"SellProbability",OBJPROP_WIDTH,5);
         ObjectSetInteger(0,"SellProbability",OBJPROP_COLOR,clrOrangeRed);
         ObjectMove(_Symbol,"SellProbability",0,(TimeCurrent()+PeriodSeconds()),PriceSell);
         ObjectDelete(0,"BuyProbability");
        }

      ObjectCreate(_Symbol,"SignalPct",OBJ_TEXT,0,0,0);
      ObjectSetInteger(0,"SignalPct",OBJPROP_FONTSIZE,8);
      ObjectSetString(0,"SignalPct",OBJPROP_TEXT,0,SignalStrength + "%");
      ObjectSetInteger(0,"SignalPct",OBJPROP_COLOR,clrBlue);
      ObjectMove(_Symbol,"SignalPct",0,TimeCurrent()+(1.5*PeriodSeconds()),CurrentPrice);
     }

//================================Alert=====================================================

//=============================Forex Sessions=================================================
   int hourT= TimeToString(TimeLocal(),TIME_MINUTES);
//----Run only when time changes-----------------
   static int timeCheck =0;
   if(timeCheck!=hourT  || ChartObjectsOn==true)
     {
      //-----------DST Adjust--------------------  //forex.timezoneconverter.com/?timezone=Europe/London&refresh=5
      datetime date =TimeCurrent();
      //-----------Frankfurt and London----------
      int DST=0, DSTsyd=0, DSTNY=0;
      if(date>=D' 2021.10.31' && date<=D' 2022.03.27' || date>=D' 2022.10.30' && date<=D' 2023.03.26' ||  date>=D' 2023.10.29' && date<=D' 2024.03.31' ||  date>=D' 2024.10.27' && date<=D' 2025.03.30'   ||  date>=D' 2025.10.26' && date<=D' 2026.03.29'/////***
          || date>=D' 2026.10.25' && date<=D' 2027.03.28')

        {DST=1;}
      //====Sydney Session
      if(date>=D' 2022.04.03' && date<=D' 2022.10.02' || date>=D' 2023.04.02' && date<=D' 2023.10.01' ||  date>=D' 2024.04.07' && date<=D' 2024.10.06' || date>=D' 2025.04.06' && date<=D' 2025.10.05'/////***
         ||date>=D' 2026.04.05' && date<=D' 2026.10.04' || date>=D' 2027.04.04' && date<=D' 2027.10.03')

        {DSTsyd=1;}

      //================DST for NY
      if(date>=D' 2021.11.07' && date<=D' 2022.03.13' || date>=D' 2022.11.06' && date<=D' 2023.03.12' ||  date>=D' 2023.11.05' && date<=D' 2024.03.10' || date>=D' 2024.11.03' && date<=D' 2025.03.09'///***
         ||date>=D' 2025.11.02' && date<=D' 2026.03.08' || date>=D' 2026.11.01' && date<=D' 2027.03.14')

        {DSTNY=1;}

      ///------------Time Zones------------------------
      int FrankfurtOpen=6+time_zone+DST, FrankfurtClose=14+time_zone+DST;
      int LondonOpen=7+time_zone+DST, LondonClose=15+time_zone+DST;
      int NewYorkOpen=12+time_zone+DSTNY,  NewYorkClose=20+time_zone+DSTNY;
      int SydneyOpen=21+time_zone+DSTsyd,  SydneyClose=5+time_zone+DSTsyd;
      int TokyoOpen=23+time_zone,    TokyoClose=7+time_zone;

      //---------Time Adjustments--------------
      if(FrankfurtOpen>24)
         FrankfurtOpen=FrankfurtOpen-24;
      if(FrankfurtClose>24)
         FrankfurtClose=FrankfurtClose-24;
      if(FrankfurtOpen<0)
         FrankfurtOpen=FrankfurtOpen+24;
      if(FrankfurtClose<0)
         FrankfurtClose=FrankfurtClose+24;

      if(LondonOpen>24)
         LondonOpen=LondonOpen-24;
      if(LondonClose>24)
         LondonClose=LondonClose-24;
      if(LondonOpen<0)
         LondonOpen=LondonOpen+24;
      if(LondonClose<0)
         LondonClose=LondonClose+24;

      if(NewYorkOpen>24)
         NewYorkOpen=NewYorkOpen-24;
      if(NewYorkClose>24)
         NewYorkClose=NewYorkClose-24;
      if(NewYorkOpen<0)
         NewYorkOpen=NewYorkOpen+24;
      if(NewYorkClose<0)
         NewYorkClose=NewYorkClose+24;

      if(SydneyOpen>24)
         SydneyOpen=SydneyOpen-24;
      if(SydneyClose>24)
         SydneyClose=SydneyClose-24;
      if(SydneyOpen<0)
         SydneyOpen=SydneyOpen+24;
      if(SydneyClose<0)
         SydneyClose=SydneyClose+24;

      if(TokyoOpen>24)
         TokyoOpen=TokyoOpen-24;
      if(TokyoClose>24)
         TokyoClose=TokyoClose-24;
      if(TokyoOpen<0)
         TokyoOpen=TokyoOpen+24;
      if(TokyoClose<0)
        {
         TokyoClose=TokyoClose+24;
        }
      //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      string FFStatus="Closed", LSStatus="Closed", NYStatus="Closed", SydStatus="Closed", TokStatus="Closed";
      color FFColor=clrSalmon, LSColor=clrSalmon, NYColor=clrSalmon, SydColor=clrSalmon, TokColor=clrSalmon;

      if(hourT>=FrankfurtOpen && hourT< FrankfurtClose || (FrankfurtOpen==24 && hourT<FrankfurtClose) || (FrankfurtOpen>=17 && FrankfurtClose<=7 &&(hourT>=FrankfurtOpen || hourT< FrankfurtClose)))
        {
         FFStatus="Open";
         FFColor=clrPaleGreen;
        }

      if(hourT>=LondonOpen && hourT< LondonClose || (LondonOpen==24 && hourT<LondonClose) || (LondonOpen>=17 && LondonClose<=7 &&(hourT>=LondonOpen || hourT< LondonClose)))
        {
         LSStatus="Open";
         LSColor=clrPaleGreen;
        }

      if(hourT>=NewYorkOpen && hourT< NewYorkClose || (NewYorkOpen==24 && hourT<NewYorkClose) || (NewYorkOpen>=17 && NewYorkClose<=7 &&(hourT>=NewYorkOpen || hourT< NewYorkClose)))
        {
         NYStatus="Open";
         NYColor=clrPaleGreen;
        }

      if(hourT>=SydneyOpen && hourT< SydneyClose || (SydneyOpen==24 && hourT<SydneyClose) || (SydneyOpen>=17 && SydneyClose<=7 &&(hourT>=SydneyOpen || hourT< SydneyClose)))
        {
         SydStatus="Open";
         SydColor=clrPaleGreen;
        }


      if(hourT>=TokyoOpen && hourT< TokyoClose || (TokyoOpen==24  && hourT<TokyoClose) || (TokyoOpen>=17 && TokyoClose<=7 &&(hourT>=TokyoOpen || hourT< TokyoClose)))
        {
         TokStatus="Open";
         TokColor=clrPaleGreen;
        }


      if(ChartObjectsOn)
        {

         //--------------------Market Sessions------------------------
         ObjectCreate(0,"Frankfurt", OBJ_LABEL,0,0,0);
         ObjectSetString(0,"Frankfurt",OBJPROP_FONT,"Arial");
         ObjectSetInteger(0,"Frankfurt",OBJPROP_FONTSIZE,10);
         ObjectSetString(0,"Frankfurt",OBJPROP_TEXT,0,"Frankfurt                "+ FrankfurtOpen+":00              " +FrankfurtClose+":00");
         ObjectSetInteger(0,"Frankfurt",OBJPROP_XDISTANCE,348);
         ObjectSetInteger(0,"Frankfurt",OBJPROP_YDISTANCE,67);
         ObjectSetInteger(0,"Frankfurt",OBJPROP_COLOR,clrBlack);

         ObjectCreate(0,"London", OBJ_LABEL,0,0,0);
         ObjectSetString(0,"London",OBJPROP_FONT,"Arial");
         ObjectSetInteger(0,"London",OBJPROP_FONTSIZE,10);
         ObjectSetString(0,"London",OBJPROP_TEXT,0,"London                  "+ LondonOpen+":00              " +LondonClose+":00");
         ObjectSetInteger(0,"London",OBJPROP_XDISTANCE,348);
         ObjectSetInteger(0,"London",OBJPROP_YDISTANCE,87);
         ObjectSetInteger(0,"London",OBJPROP_COLOR,clrBlack);


         ObjectCreate(0,"NewYork", OBJ_LABEL,0,0,0);
         ObjectSetString(0,"NewYork",OBJPROP_FONT,"Arial");
         ObjectSetInteger(0,"NewYork",OBJPROP_FONTSIZE,10);
         ObjectSetString(0,"NewYork",OBJPROP_TEXT,0,"NewYork                "+ NewYorkOpen+":00             " +NewYorkClose+":00");
         ObjectSetInteger(0,"NewYork",OBJPROP_XDISTANCE,348);
         ObjectSetInteger(0,"NewYork",OBJPROP_YDISTANCE,107);
         ObjectSetInteger(0,"NewYork",OBJPROP_COLOR,clrBlack);

         ObjectCreate(0,"Sydney", OBJ_LABEL,0,0,0);
         ObjectSetString(0,"Sydney",OBJPROP_FONT,"Arial");
         ObjectSetInteger(0,"Sydney",OBJPROP_FONTSIZE,10);
         ObjectSetString(0,"Sydney",OBJPROP_TEXT,0,"Sydney                  "+ SydneyOpen+":00              " +SydneyClose+":00");
         ObjectSetInteger(0,"Sydney",OBJPROP_XDISTANCE,348);
         ObjectSetInteger(0,"Sydney",OBJPROP_YDISTANCE,127);
         ObjectSetInteger(0,"Sydney",OBJPROP_COLOR,clrBlack);

         ObjectCreate(0,"Tokyo", OBJ_LABEL,0,0,0);
         ObjectSetString(0,"Tokyo",OBJPROP_FONT,"Arial");
         ObjectSetInteger(0,"Tokyo",OBJPROP_FONTSIZE,10);
         ObjectSetString(0,"Tokyo",OBJPROP_TEXT,0,"Tokyo                    "+ TokyoOpen+":00              " +TokyoClose+":00");
         ObjectSetInteger(0,"Tokyo",OBJPROP_XDISTANCE,348);
         ObjectSetInteger(0,"Tokyo",OBJPROP_YDISTANCE,147);
         ObjectSetInteger(0,"Tokyo",OBJPROP_COLOR,clrBlack);


         ObjectSetString(0,"Line3",OBJPROP_TEXT,FFStatus);
         ObjectSetInteger(0,"Line3",OBJPROP_BGCOLOR,FFColor);

         ObjectSetString(0,"Line4",OBJPROP_TEXT,LSStatus);
         ObjectSetInteger(0,"Line4",OBJPROP_BGCOLOR,LSColor);

         ObjectSetString(0,"Line5",OBJPROP_TEXT,NYStatus);
         ObjectSetInteger(0,"Line5",OBJPROP_BGCOLOR,NYColor);

         ObjectSetString(0,"Line6",OBJPROP_TEXT,SydStatus);
         ObjectSetInteger(0,"Line6",OBJPROP_BGCOLOR,SydColor);

         ObjectSetString(0,"Line7",OBJPROP_TEXT,TokStatus);
         ObjectSetInteger(0,"Line7",OBJPROP_BGCOLOR,TokColor);

         ObjectCreate(0,"Today", OBJ_LABEL,0,0,0);
         ObjectSetString(0,"Today",OBJPROP_FONT,"Arial");
         ObjectSetInteger(0,"Today",OBJPROP_FONTSIZE,8);
         ObjectSetInteger(0,"Today",OBJPROP_XDISTANCE,438);
         ObjectSetInteger(0,"Today",OBJPROP_YDISTANCE,167);
         ObjectSetInteger(0,"Today",OBJPROP_COLOR,clrBlack);
        }

      datetime TimeiMins = TimeToString(TimeLocal(), TIME_MINUTES);

      if(SessionAlerts)
        {
         //Alerts
         static int FFInitial=1, LOInitial=1, NYInitial=1, SydInitial=1, TokInitial=1;
         if(FFStatus=="Closed")
           {
            FFInitial=0;
           }
         if(LSStatus=="Closed")
           {
            LOInitial=0;
           }
         if(NYStatus=="Closed")
           {
            NYInitial=0;
           }
         if(SydStatus=="Closed")
           {
            SydInitial=0;
           }
         if(TokStatus=="Closed")
           {
            TokInitial=0;
           }

         //-------------------------------------------
         if(FFStatus=="Open" && FFInitial==0)
           {
            Alert("Frankfurt Session is NOW Open");
            FFInitial=1;
           }

         if(LSStatus=="Open" && LOInitial==0)
           {
            Alert("London Session is NOW Open");
            LOInitial=1;
           }

         if(NYStatus=="Open" && NYInitial==0)
           {
            Alert("New York Session is NOW Open");
            NYInitial=1;
           }

         if(SydStatus=="Open" && SydInitial==0)
           {
            Alert("Sydney Session is NOW Open");
            SydInitial=1;
           }

         if(TokStatus=="Open" && TokInitial==0)
           {
            Alert("Tokyo Session is NOW Open");
            TokInitial=1;
           }
        }
      timeCheck=hourT;  //reset the program call condition
     }

   double TopCheck=upperLine(); // Probable Resistance
   double LowCheck=lowerline(); // Probable Support
   if(ShowSandR)
     {
      ObjectCreate(_Symbol,"TopCheck",OBJ_HLINE,0,0,0);
      ObjectSetInteger(0,"TopCheck",OBJPROP_COLOR,ChartLines);
      ObjectSetInteger(0,"TopCheck",OBJPROP_WIDTH,2);
      ObjectMove(_Symbol,"TopCheck",0,0,TopCheck);

      ObjectCreate(_Symbol,"LowCheck",OBJ_HLINE,0,0,0);
      ObjectSetInteger(0,"LowCheck",OBJPROP_COLOR,ChartLines);
      ObjectSetInteger(0,"LowCheck",OBJPROP_WIDTH,2);
      ObjectMove(_Symbol,"LowCheck",0,0,LowCheck);

     }

   return;
  }

//---------------------------------------------------------------------------
double TotalBuyProfit()
  {
   double buypft=0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket>0)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
           {
            buypft+=PositionGetDouble(POSITION_PROFIT);
           }
        }
     }
   return(NormalizeDouble(buypft,_Digits));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double TotalSellProfit()
  {
   double sellpft=0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);
      if(ticket>0)
        {
         if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            sellpft+=PositionGetDouble(POSITION_PROFIT);
           }
        }
     }
   return(NormalizeDouble(sellpft,_Digits));
  }

//------------Counting No. of Trades-------------
int OpenBuyPos()
  {
   int count_buys=0;
   ulong ticket;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
         count_buys++;
     }
   return(count_buys);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OpenSellPos()
  {
   int count_sells=0;
   ulong uticket;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      uticket=PositionGetTicket(i);
      if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
         count_sells++;
     }
   return(count_sells);
  }

//======================================================================================================
bool SellChartControlOn=false;
bool BuyChartControlOn=false;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//==================================================================================================================================================
void OnChartEvent(const int id,const long& lparam, const double& dparam, const string& sparam)
  {

   if(id==CHARTEVENT_OBJECT_CLICK)
     {
        if(sparam=="CloseObj") // If delete button is pressed //
              {
              // Print("Something Clicked");
              
               if(ChartObjectsOn)
                 {
                  ObjectDelete(0,"Frankfurt");
                  ObjectDelete(0,"London");
                  ObjectDelete(0,"NewYork");
                  ObjectDelete(0,"Sydney");
                  ObjectDelete(0,"Tokyo");
                  ObjectDelete(0,"Today");
                  ObjectDelete(0,"Line1");
                  ObjectDelete(0,"Line2");
                  ObjectDelete(0,"Line3");
                  ObjectDelete(0,"Line4");
                  ObjectDelete(0,"Line5");
                  ObjectDelete(0,"Line6");
                  ObjectDelete(0,"Line7");
                  ObjectDelete(0,"okyo");
                  ChartObjectsOn=false;
                 }
               else if(ChartObjectsOn==false)
                    {
                     int t= ObjPrint();
                     ChartObjectsOn=true;
                    }   
              } 
      else  
        if(sparam=="CloseAllSells")//
         //Close all Open Sell Trades
         {
           for(int i=PositionsTotal()-1; i>=0; i--)
            {
              ulong ticket=PositionGetTicket(i);
              long PositionDirection=PositionGetInteger(POSITION_TYPE);
              if(PositionDirection==POSITION_TYPE_SELL)
               trade.PositionClose(ticket);
            
             }
          } 
      else
         if(sparam=="CloseAllBuys")
            //Close all Open Buy Trades
           // Print("Something Clicked");
           {
           for(int i=PositionsTotal()-1; i>=0; i--)
            {
              ulong ticket=PositionGetTicket(i);
              long PositionDirection=PositionGetInteger(POSITION_TYPE);
              if(PositionDirection==POSITION_TYPE_BUY)
               trade.PositionClose(ticket);
            
             }

           } 
      
     }
  }
//------------------------------------------------------------------------------
void CloseSellPositions()
  {
   for(int i=PositionsTotal()-1; i>=0; i--)
      {
        int ticket=PositionGetTicket(i);
        int PositionDirection=PositionGetInteger(POSITION_TYPE);
        if(PositionDirection==POSITION_TYPE_SELL)
         trade.PositionClose(ticket);
      
       }
    }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   EventKillTimer();
  }
//====================================================================================



//===================================================================================
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
{

//Countdown Timer
   int m, s, g;
   datetime currentbar_time=iTime(_Symbol,PERIOD_CURRENT,0);
   m=currentbar_time+PeriodSeconds()-TimeCurrent();
   g=m/60;
   s=m%60;
   m=(m-m%60)/60;

//-----------------------------------------------
   ObjectCreate(0,"bartimer", OBJ_LABEL,0,0,0);
   ObjectSetString(0,"bartimer",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"bartimer",OBJPROP_FONTSIZE,8);
   ObjectSetString(0,"bartimer",OBJPROP_TEXT,0,m + " Minutes left to bar end");
   ObjectSetInteger(0,"bartimer",OBJPROP_XDISTANCE,110);
   ObjectSetInteger(0,"bartimer",OBJPROP_YDISTANCE,415);
   ObjectSetInteger(0,"bartimer",OBJPROP_COLOR,clrBlack);

   static int p;
   p++;
   if(p>=5)
     {
      p=0;   //Reset p
      if(ChartObjectsOn)
        {
         string TimenMins = TimeToString(TimeLocal(),
                                         TIME_DATE|TIME_MINUTES);
         ObjectSetString(0,"Today",OBJPROP_TEXT,0,"Today "+ TimenMins);
        }
     }

   bool PrintBars=false;

//==========================================================================================
   static int t;
   t++;
   if(t>=20)
     {
      t=0;  //reset t
      

      string cookie = NULL, headers;
      char post[], result[];
      string url= "http://www.livecharts.co.uk/currency-strength.php";
      ResetLastError();
      //---Downloading html page
      int res = WebRequest("GET",url,cookie, NULL,500,post,0, result,headers);
      if(res==-1)
        {
         Print("Check Internet connection and add 'http://www.livecharts.co.uk' to the list of allowed URLs on tab Tools>Options>Expert Advisors. Error Code =",GetLastError());
        }
      else
        {
         if(res==200)
           {
            int filehandle = FileOpen("urll.txt",FILE_WRITE|FILE_BIN);
            if(filehandle!=INVALID_HANDLE)
              {
               PrintBars=true;
               // saving contents of result[] array to a file
               FileWriteArray(filehandle,result,0,ArraySize(result));
               //-------Close file
               FileClose(filehandle);
              }
           // else { }
           }
        // else {}

        }

      int hd1= FileOpen("urll.txt", FILE_READ|FILE_TXT|FILE_ANSI);
      if(hd1==INVALID_HANDLE)
        {
       // Print("Error in opening the file");
        }

      string sep="\n";
      ushort u_sep;
      string STresult[];
      ArrayResize(STresult,290);//290
      int k;
      string Sampletest="";
      string to_split;
      while(!FileIsEnding(hd1))
        {
         to_split=FileReadString(hd1,(int)FileSize(hd1));
         u_sep=StringGetCharacter(sep,-1);
         k=StringSplit(to_split, u_sep, STresult);

         if(k>0)
           {
            for(int i=0; i<k; i++)
              {
               StringAdd(Sampletest, STresult[0]);
               ArrayResize(STresult, 290);//290
              }
           }
        }
      FileClose(hd1);
      //------------------------------------------------------------------------
      string separator="<";
      ushort u_separator;
      string HtmlCode[];

      //-----------Get the Separator Code---------------

      u_separator=StringGetCharacter(separator,0);
      int x=StringSplit(Sampletest,u_separator,HtmlCode);

      if(x>0)
        {
         for(int y=0; y<x; y++)
           {
            // PrintFormat("HTMLCODE[%d]=\"%s\"", y, HtmlCode[y]);
           }
        }
        
      // Print("HTMLCODE[248]= ", HtmlCode[248]); 


   //====================CURRENCY STRENGTH METER===================================
      //Call CSM function
      if (PrintBars){int w =PrintStrengthMeter();}
     if(ArraySize(HtmlCode)<600)
        {
         return;
        }
      
      
     //----------------------------------------------------------------
     //The Current chart Currency
     string myPair= StringSubstr(ChartSymbol(0),0,6);
     
     //--------------------------------------------------------------
      //==================================================================
      //-------------EUR-----------------------
      int EURStrength;
      int EUR6= StringFind(HtmlCode[248],"weak3",0);
      int EUR5= StringFind(HtmlCode[250],"weak3",0);
      int EUR4= StringFind(HtmlCode[252],"weak3",0);
      int EUR3= StringFind(HtmlCode[254],"weak3",0);
      int EUR2= StringFind(HtmlCode[256],"weak3",0);
      int EUR1= StringFind(HtmlCode[258],"weak3",0);

      if(EUR6==-1)  //strength6
        {
         EURStrength=6;
        }
      if(EUR6!=-1 && EUR5==-1) //strength5
        {
         EURStrength=5;
         ObjectDelete(0,"EUR_6");
        }
      if(EUR6!=-1 && EUR5!=-1 && EUR4==-1) //strength4
        {
         EURStrength=4;
         ObjectDelete(0,"EUR_6");
         ObjectDelete(0,"EUR_5");
        }
      if(EUR6!=-1 && EUR5!=-1 && EUR4!=-1 && EUR3==-1) //strength3
        {
         EURStrength=3;
         ObjectDelete(0,"EUR_6");
         ObjectDelete(0,"EUR_5");
         ObjectDelete(0,"EUR_4");
        }
      if(EUR6!=-1 && EUR5!=-1 && EUR4!=-1 && EUR3!=-1 && EUR2==-1) //strength2
        {
         EURStrength=2;
         ObjectDelete(0,"EUR_6");
         ObjectDelete(0,"EUR_5");
         ObjectDelete(0,"EUR_4");
         ObjectDelete(0,"EUR_3");
        }
      if(EUR6!=-1 && EUR5!=-1 && EUR4!=-1 && EUR3!=-1 && EUR2!=-1 && EUR1==-1) //strength1
        {
         EURStrength=1;
         ObjectDelete(0,"EUR_6");
         ObjectDelete(0,"EUR_5");
         ObjectDelete(0,"EUR_4");
         ObjectDelete(0,"EUR_3");
         ObjectDelete(0,"EUR_2");
        }

      if((StringSubstr(myPair,0,3))=="EUR")             //(StringLen(ChartSymbol(0))/2)
        {
         Symb1=EURStrength;  // Pair1
        }
      if((StringSubstr(myPair,3,-1))=="EUR")             //ChartSymbol(0)     (StringLen(ChartSymbol(0))/2)
        {
         Symb2=EURStrength;  // Pair1
        }
    

      //-------------GBP-----------------------
      int GBPStrength;
      int GBP6= StringFind(HtmlCode[266],"weak3",0);
      int GBP5= StringFind(HtmlCode[268],"weak3",0);
      int GBP4= StringFind(HtmlCode[270],"weak3",0);
      int GBP3= StringFind(HtmlCode[272],"weak3",0);
      int GBP2= StringFind(HtmlCode[274],"weak3",0);
      int GBP1= StringFind(HtmlCode[276],"weak3",0);

      if(GBP6==-1)  //strength6
        {
         GBPStrength=6;
        }
      if(GBP6!=-1 && GBP5==-1) //strength5
        {
         GBPStrength=5;
         ObjectDelete(0,"GBP_6");
        }
      if(GBP6!=-1 && GBP5!=-1 && GBP4==-1) //strength4
        {
         GBPStrength=4;
         ObjectDelete(0,"GBP_6");
         ObjectDelete(0,"GBP_5");
        }
      if(GBP6!=-1 && GBP5!=-1 && GBP4!=-1 && GBP3==-1) //strength3
        {
         GBPStrength=3;
         ObjectDelete(0,"GBP_6");
         ObjectDelete(0,"GBP_5");
         ObjectDelete(0,"GBP_4");
        }
      if(GBP6!=-1 && GBP5!=-1 && GBP4!=-1 && GBP3!=-1 && GBP2==-1) //strength2
        {
         GBPStrength=2;
         ObjectDelete(0,"GBP_6");
         ObjectDelete(0,"GBP_5");
         ObjectDelete(0,"GBP_4");
         ObjectDelete(0,"GBP_3");
        }
      if(GBP6!=-1 && GBP5!=-1 && GBP4!=-1 && GBP3!=-1 && GBP2!=-1 && GBP1!=-1) //strength1
        {
         GBPStrength=1;
         ObjectDelete(0,"GBP_6");
         ObjectDelete(0,"GBP_5");
         ObjectDelete(0,"GBP_4");
         ObjectDelete(0,"GBP_3");
         ObjectDelete(0,"GBP_2");
        }
      if((StringSubstr(myPair,0,3))=="GBP")
        {
         Symb1=GBPStrength;  // Pair1
        }
      if((StringSubstr(myPair,3,-1))=="GBP")
        {
         Symb2=GBPStrength;  // Pair1
        }

      //-------------USD-----------------------
      int USDStrength;
      int USD6= StringFind(HtmlCode[284],"weak3",0);
      int USD5= StringFind(HtmlCode[286],"weak3",0);
      int USD4= StringFind(HtmlCode[288],"weak3",0);
      int USD3= StringFind(HtmlCode[290],"weak3",0);
      int USD2= StringFind(HtmlCode[292],"weak3",0);
      int USD1= StringFind(HtmlCode[294],"weak3",0);

      if(USD6==-1)  //strength6
        {
         USDStrength=6;
        }
      if(USD6!=-1 && USD5==-1) //strength5
        {
         USDStrength=5;
         ObjectDelete(0,"USD_6");
        }
      if(USD6!=-1 && USD5!=-1 && USD4==-1) //strength4
        {
         USDStrength=4;
         ObjectDelete(0,"USD_6");
         ObjectDelete(0,"USD_5");
        }
      if(USD6!=-1 && USD5!=-1 && USD4!=-1 && USD3==-1) //strength3
        {
         USDStrength=3;
         ObjectDelete(0,"USD_6");
         ObjectDelete(0,"USD_5");
         ObjectDelete(0,"USD_4");
        }
      if(USD6!=-1 && USD5!=-1 && USD4!=-1 && USD3!=-1 && USD2==-1) //strength2
        {
         USDStrength=2;
         ObjectDelete(0,"USD_6");
         ObjectDelete(0,"USD_5");
         ObjectDelete(0,"USD_4");
         ObjectDelete(0,"USD_3");
        }
      if(USD6!=-1 && USD5!=-1 && USD4!=-1 && USD3!=-1 && USD2!=-1 && USD1!=-1) //strength1
        {
         USDStrength=1;
         ObjectDelete(0,"USD_6");
         ObjectDelete(0,"USD_5");
         ObjectDelete(0,"USD_4");
         ObjectDelete(0,"USD_3");
         ObjectDelete(0,"USD_2");
        }
      if((StringSubstr(myPair,0,3))=="USD")
        {
         Symb1=USDStrength;  // Pair1
        }
      if((StringSubstr(myPair,3,-1))=="USD")
        {
         Symb2=USDStrength;  // Pair1
        }



      //-------------AUD-----------------------
      int AUDStrength;
      int AUD6= StringFind(HtmlCode[302],"weak3",0);
      int AUD5= StringFind(HtmlCode[304],"weak3",0);
      int AUD4= StringFind(HtmlCode[306],"weak3",0);
      int AUD3= StringFind(HtmlCode[308],"weak3",0);
      int AUD2= StringFind(HtmlCode[310],"weak3",0);
      int AUD1= StringFind(HtmlCode[312],"weak3",0);

      if(AUD6==-1)  //strength6
        {
         AUDStrength=6;
        }
      if(AUD6!=-1 && AUD5==-1) //strength5
        {
         AUDStrength=5;
         ObjectDelete(0,"AUD_6");
        }
      if(AUD6!=-1 && AUD5!=-1 && AUD4==-1) //strength4
        {
         AUDStrength=4;
         ObjectDelete(0,"AUD_6");
         ObjectDelete(0,"AUD_5");
        }
      if(AUD6!=-1 && AUD5!=-1 && AUD4!=-1 && AUD3==-1) //strength3
        {
         AUDStrength=3;
         ObjectDelete(0,"AUD_6");
         ObjectDelete(0,"AUD_5");
         ObjectDelete(0,"AUD_4");
        }
      if(AUD6!=-1 && AUD5!=-1 && AUD4!=-1 && AUD3!=-1 && AUD2==-1) //strength2
        {
         AUDStrength=2;
         ObjectDelete(0,"AUD_6");
         ObjectDelete(0,"AUD_5");
         ObjectDelete(0,"AUD_4");
         ObjectDelete(0,"AUD_3");
        }
      if(AUD6!=-1 && AUD5!=-1 && AUD4!=-1 && AUD3!=-1 && AUD2!=-1 && AUD1!=-1) //strength1
        {
         AUDStrength=1;
         ObjectDelete(0,"AUD_6");
         ObjectDelete(0,"AUD_5");
         ObjectDelete(0,"AUD_4");
         ObjectDelete(0,"AUD_3");
         ObjectDelete(0,"AUD_2");
        }
      if((StringSubstr(myPair,0,3))=="AUD")
        {
         Symb1=AUDStrength;  // Pair1
        }
      if((StringSubstr(myPair,3,-1))=="AUD")
        {
         Symb2=AUDStrength;  // Pair1
        }


      //-------------JPY-----------------------
      int JPYStrength;
      int JPY6= StringFind(HtmlCode[320],"weak3",0);
      int JPY5= StringFind(HtmlCode[322],"weak3",0);
      int JPY4= StringFind(HtmlCode[324],"weak3",0);
      int JPY3= StringFind(HtmlCode[326],"weak3",0);
      int JPY2= StringFind(HtmlCode[328],"weak3",0);
      int JPY1= StringFind(HtmlCode[330],"weak3",0);

      if(JPY6==-1)  //strength6
        {
         JPYStrength=6;
        }
      if(JPY6!=-1 && JPY5==-1) //strength5
        {
         JPYStrength=5;
         ObjectDelete(0,"JPY_6");
        }
      if(JPY6!=-1 && JPY5!=-1 && JPY4==-1) //strength4
        {
         JPYStrength=4;
         ObjectDelete(0,"JPY_6");
         ObjectDelete(0,"JPY_5");
        }
      if(JPY6!=-1 && JPY5!=-1 && JPY4!=-1 && JPY3==-1) //strength3
        {
         JPYStrength=3;
         ObjectDelete(0,"JPY_6");
         ObjectDelete(0,"JPY_5");
         ObjectDelete(0,"JPY_4");
        }
      if(JPY6!=-1 && JPY5!=-1 && JPY4!=-1 && JPY3!=-1 && JPY2==-1) //strength2
        {
         JPYStrength=2;
         ObjectDelete(0,"JPY_6");
         ObjectDelete(0,"JPY_5");
         ObjectDelete(0,"JPY_4");
         ObjectDelete(0,"JPY_3");
        }
      if(JPY6!=-1 && JPY5!=-1 && JPY4!=-1 && JPY3!=-1 && JPY2!=-1 && JPY1!=-1) //strength1
        {
         JPYStrength=1;
         ObjectDelete(0,"JPY_6");
         ObjectDelete(0,"JPY_5");
         ObjectDelete(0,"JPY_4");
         ObjectDelete(0,"JPY_3");
         ObjectDelete(0,"JPY_2");
        }
      if((StringSubstr(myPair,0,3))=="JPY")
        {
         Symb1=JPYStrength;  // Pair1
        }
      if((StringSubstr(myPair,3,-1))=="JPY")
        {
         Symb2=JPYStrength;  // Pair1
        }



      //-------------CHF-----------------------
      int CHFStrength;
      int CHF6= StringFind(HtmlCode[347],"weak3",0);
      int CHF5= StringFind(HtmlCode[349],"weak3",0);
      int CHF4= StringFind(HtmlCode[351],"weak3",0);
      int CHF3= StringFind(HtmlCode[353],"weak3",0);
      int CHF2= StringFind(HtmlCode[355],"weak3",0);
      int CHF1= StringFind(HtmlCode[357],"weak3",0);

      if(CHF6==-1)  //strength6
        {
         CHFStrength=6;
        }
      if(CHF6!=-1 && CHF5==-1) //strength5
        {
         CHFStrength=5;
         ObjectDelete(0,"CHF_6");
        }
      if(CHF6!=-1 && CHF5!=-1 && CHF4==-1) //strength4
        {
         CHFStrength=4;
         ObjectDelete(0,"CHF_6");
         ObjectDelete(0,"CHF_5");
        }
      if(CHF6!=-1 && CHF5!=-1 && CHF4!=-1 && CHF3==-1) //strength3
        {
         CHFStrength=3;
         ObjectDelete(0,"CHF_6");
         ObjectDelete(0,"CHF_5");
         ObjectDelete(0,"CHF_4");
        }
      if(CHF6!=-1 && CHF5!=-1 && CHF4!=-1 && CHF3!=-1 && CHF2==-1) //strength2
        {
         CHFStrength=2;
         ObjectDelete(0,"CHF_6");
         ObjectDelete(0,"CHF_5");
         ObjectDelete(0,"CHF_4");
         ObjectDelete(0,"CHF_3");
        }
      if(CHF6!=-1 && CHF5!=-1 && CHF4!=-1 && CHF3!=-1 && CHF2!=-1 && CHF1!=-1) //strength1
        {
         CHFStrength=1;
         ObjectDelete(0,"CHF_6");
         ObjectDelete(0,"CHF_5");
         ObjectDelete(0,"CHF_4");
         ObjectDelete(0,"CHF_3");
         ObjectDelete(0,"CHF_2");
        }
      if((StringSubstr(myPair,0,3))=="CHF")
        {
         Symb1=CHFStrength;  // Pair1
        }
      if((StringSubstr(myPair,3,-1))=="CHF")
        {
         Symb2=CHFStrength;  // Pair1
        }



      //-------------NZD-----------------------
      int NZDStrength;
      int NZD6= StringFind(HtmlCode[365],"weak3",0);
      int NZD5= StringFind(HtmlCode[367],"weak3",0);
      int NZD4= StringFind(HtmlCode[369],"weak3",0);
      int NZD3= StringFind(HtmlCode[371],"weak3",0);
      int NZD2= StringFind(HtmlCode[373],"weak3",0);
      int NZD1= StringFind(HtmlCode[375],"weak3",0);

      if(NZD6==-1)  //strength6
        {
         NZDStrength=6;
        }
      if(NZD6!=-1 && NZD5==-1) //strength5
        {
         NZDStrength=5;
         ObjectDelete(0,"NZD_6");
        }
      if(NZD6!=-1 && NZD5!=-1 && NZD4==-1) //strength4
        {
         NZDStrength=4;
         ObjectDelete(0,"NZD_6");
         ObjectDelete(0,"NZD_5");
        }
      if(NZD6!=-1 && NZD5!=-1 && NZD4!=-1 && NZD3==-1) //strength3
        {
         NZDStrength=3;
         ObjectDelete(0,"NZD_6");
         ObjectDelete(0,"NZD_5");
         ObjectDelete(0,"NZD_4");
        }
      if(NZD6!=-1 && NZD5!=-1 && NZD4!=-1 && NZD3!=-1 && NZD2==-1) //strength2
        {
         NZDStrength=2;
         ObjectDelete(0,"NZD_6");
         ObjectDelete(0,"NZD_5");
         ObjectDelete(0,"NZD_4");
         ObjectDelete(0,"NZD_3");
        }
      if(NZD6!=-1 && NZD5!=-1 && NZD4!=-1 && NZD3!=-1 && NZD2!=-1 && NZD1!=-1) //strength1
        {
         NZDStrength=1;
         ObjectDelete(0,"NZD_6");
         ObjectDelete(0,"NZD_5");
         ObjectDelete(0,"NZD_4");
         ObjectDelete(0,"NZD_3");
         ObjectDelete(0,"NZD_2");
        }
      if((StringSubstr(myPair,0,3))=="NZD")
        {
         Symb1=NZDStrength;  // Pair1
        }
      if((StringSubstr(myPair,3,-1))=="NZD")
        {
         Symb2=NZDStrength;  // Pair1
        }


      //-------------CAD-----------------------
      int CADStrength;
      int CAD6= StringFind(HtmlCode[383],"weak3",0);
      int CAD5= StringFind(HtmlCode[385],"weak3",0);
      int CAD4= StringFind(HtmlCode[387],"weak3",0);
      int CAD3= StringFind(HtmlCode[389],"weak3",0);
      int CAD2= StringFind(HtmlCode[391],"weak3",0);
      int CAD1= StringFind(HtmlCode[393],"weak3",0);

      if(CAD6==-1)  //strength6
        {
         CADStrength=6;
        }
      if(CAD6!=-1 && CAD5==-1) //strength5
        {
         CADStrength=5;
         ObjectDelete(0,"CAD_6");
        }
      if(CAD6!=-1 && CAD5!=-1 && CAD4==-1) //strength4
        {
         CADStrength=4;
         ObjectDelete(0,"CAD_6");
         ObjectDelete(0,"CAD_5");
        }
      if(CAD6!=-1 && CAD5!=-1 && CAD4!=-1 && CAD3==-1) //strength3
        {
         CADStrength=3;
         ObjectDelete(0,"CAD_6");
         ObjectDelete(0,"CAD_5");
         ObjectDelete(0,"CAD_4");
        }
      if(CAD6!=-1 && CAD5!=-1 && CAD4!=-1 && CAD3!=-1 && CAD2==-1) //strength2
        {
         CADStrength=2;
         ObjectDelete(0,"CAD_6");
         ObjectDelete(0,"CAD_5");
         ObjectDelete(0,"CAD_4");
         ObjectDelete(0,"CAD_3");
        }
      if(CAD6!=-1 && CAD5!=-1 && CAD4!=-1 && CAD3!=-1 && CAD2!=-1 && CAD1!=-1) //strength1
        {
         CADStrength=1;
         ObjectDelete(0,"CAD_6");
         ObjectDelete(0,"CAD_5");
         ObjectDelete(0,"CAD_4");
         ObjectDelete(0,"CAD_3");
         ObjectDelete(0,"CAD_2");
        }
      if((StringSubstr(myPair,0,3))=="CAD")
        {
         Symb1=CADStrength;  // Pair1
        }
      if((StringSubstr(myPair,3,-1))=="CAD")
        {
         Symb2=CADStrength;  // Pair1
        }



      //-------------NOK-----------------------
      int NOKStrength;
      int NOK6= StringFind(HtmlCode[401],"weak3",0);
      int NOK5= StringFind(HtmlCode[403],"weak3",0);
      int NOK4= StringFind(HtmlCode[405],"weak3",0);
      int NOK3= StringFind(HtmlCode[407],"weak3",0);
      int NOK2= StringFind(HtmlCode[409],"weak3",0);
      int NOK1= StringFind(HtmlCode[411],"weak3",0);

      if(NOK6==-1)  //strength6
        {
         NOKStrength=6;
        }
      if(NOK6!=-1 && NOK5==-1) //strength5
        {
         NOKStrength=5;
         ObjectDelete(0,"NOK_6");
        }
      if(NOK6!=-1 && NOK5!=-1 && NOK4==-1) //strength4
        {
         NOKStrength=4;
         ObjectDelete(0,"NOK_6");
         ObjectDelete(0,"NOK_5");
        }
      if(NOK6!=-1 && NOK5!=-1 && NOK4!=-1 && NOK3==-1) //strength3
        {
         NOKStrength=3;
         ObjectDelete(0,"NOK_6");
         ObjectDelete(0,"NOK_5");
         ObjectDelete(0,"NOK_4");
        }
      if(NOK6!=-1 && NOK5!=-1 && NOK4!=-1 && NOK3!=-1 && NOK2==-1) //strength2
        {
         NOKStrength=2;
         ObjectDelete(0,"NOK_6");
         ObjectDelete(0,"NOK_5");
         ObjectDelete(0,"NOK_4");
         ObjectDelete(0,"NOK_3");
        }
      if(NOK6!=-1 && NOK5!=-1 && NOK4!=-1 && NOK3!=-1 && NOK2!=-1 && NOK1!=-1) //strength1
        {
         NOKStrength=1;
         ObjectDelete(0,"NOK_6");
         ObjectDelete(0,"NOK_5");
         ObjectDelete(0,"NOK_4");
         ObjectDelete(0,"NOK_3");
         ObjectDelete(0,"NOK_2");
        }
      if((StringSubstr(myPair,0,3))=="NOK")
        {
         Symb1=NOKStrength;  // Pair1
        }
      if((StringSubstr(myPair,3,-1))=="NOK")
        {
         Symb2=NOKStrength;  // Pair1
        }



      //-------------DKK-----------------------
      int DKKStrength;
      int DKK6= StringFind(HtmlCode[419],"weak3",0);
      int DKK5= StringFind(HtmlCode[421],"weak3",0);
      int DKK4= StringFind(HtmlCode[423],"weak3",0);
      int DKK3= StringFind(HtmlCode[425],"weak3",0);
      int DKK2= StringFind(HtmlCode[427],"weak3",0);
      int DKK1= StringFind(HtmlCode[429],"weak3",0);

      if(DKK6==-1)  //strength6
        {
         DKKStrength=6;
        }
      if(DKK6!=-1 && DKK5==-1) //strength5
        {
         DKKStrength=5;
         ObjectDelete(0,"DKK_6");
        }
      if(DKK6!=-1 && DKK5!=-1 && DKK4==-1) //strength4
        {
         DKKStrength=4;
         ObjectDelete(0,"DKK_6");
         ObjectDelete(0,"DKK_5");
        }
      if(DKK6!=-1 && DKK5!=-1 && DKK4!=-1 && DKK3==-1) //strength3
        {
         DKKStrength=3;
         ObjectDelete(0,"DKK_6");
         ObjectDelete(0,"DKK_5");
         ObjectDelete(0,"DKK_4");
        }
      if(DKK6!=-1 && DKK5!=-1 && DKK4!=-1 && DKK3!=-1 && DKK2==-1) //strength2
        {
         DKKStrength=2;
         ObjectDelete(0,"DKK_6");
         ObjectDelete(0,"DKK_5");
         ObjectDelete(0,"DKK_4");
         ObjectDelete(0,"DKK_3");
        }
      if(DKK6!=-1 && DKK5!=-1 && DKK4!=-1 && DKK3!=-1 && DKK2!=-1 && DKK1!=-1) //strength1
        {
         DKKStrength=1;
         ObjectDelete(0,"DKK_6");
         ObjectDelete(0,"DKK_5");
         ObjectDelete(0,"DKK_4");
         ObjectDelete(0,"DKK_3");
         ObjectDelete(0,"DKK_2");
        }

      //Print("EURStrength = ", EURStrength);
      //Print("GBPStrength = ", GBPStrength);
      //Print("USDStrength = ", USDStrength);
      //Print("CADStrength = ", CADStrength);
      //Print("AUDStrength = ", AUDStrength);
      //Print("JPYStrength = ", JPYStrength);
      //Print("CHFStrength = ", CHFStrength);
      //Print("NZDStrength = ", NZDStrength);
      //Print("NOKStrength = ", NOKStrength);
      //Print("DKKStrength = ", DKKStrength);
      if((StringSubstr(myPair,0,3))=="DKK")
        {
         Symb1=DKKStrength;  // Pair1
        }
      if((StringSubstr(myPair,3,-1))=="DKK")
        {
         Symb2=DKKStrength;  // Pair1
        }

     }

  }
//----------------------------------------------------------------------------
//-------------Other Programs-------------------------------
double upperLine()
  {
   double TopCheck;
   int HighestCandle;
   double High[];
   ArraySetAsSeries(High,true);
   CopyHigh(_Symbol,PERIOD_CURRENT,1,30,High);
   HighestCandle=ArrayMaximum(High,0,WHOLE_ARRAY);

   MqlRates PriceInfo[];
   ArraySetAsSeries(PriceInfo, true);
   int Data= CopyRates(_Symbol,PERIOD_CURRENT,1,30,PriceInfo);
   TopCheck=PriceInfo[HighestCandle].high;
   return(TopCheck);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double lowerline()
  {
   double LowCheck;
   int LowestCandle;
   double Low[];
   ArraySetAsSeries(Low,true);
   CopyHigh(_Symbol,PERIOD_CURRENT,1,30,Low);
   LowestCandle=ArrayMaximum(Low,0,WHOLE_ARRAY);

   MqlRates PriceInfo[];
   ArraySetAsSeries(PriceInfo, true);
   int Data= CopyRates(_Symbol,PERIOD_CURRENT,1,30,PriceInfo);
   LowCheck=PriceInfo[LowestCandle].low;
   return(LowCheck);
  }

//----------------------------------------------------------------------------
int ObjPrint()
  {

   ObjectCreate(0,"Line1",OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSetInteger(0,"Line1",OBJPROP_XDISTANCE,330);
   ObjectSetInteger(0,"Line1",OBJPROP_YDISTANCE,30);
   ObjectSetInteger(0,"Line1",OBJPROP_XSIZE,350);
   ObjectSetInteger(0,"Line1",OBJPROP_YSIZE,155);
   ObjectSetInteger(0,"Line1",OBJPROP_COLOR,clrWhiteSmoke);
   ObjectSetInteger(0,"Line1",OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,"Line1",OBJPROP_BACK,false);
   ObjectSetInteger(0,"Line1",OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,"Line1",OBJPROP_BGCOLOR,clrWhiteSmoke);
   
     ObjectCreate(0,"Line2",OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,"Line2",OBJPROP_XDISTANCE,330);
      ObjectSetInteger(0,"Line2",OBJPROP_YDISTANCE,31);
      ObjectSetInteger(0,"Line2",OBJPROP_XSIZE,350);
      ObjectSetInteger(0,"Line2",OBJPROP_YSIZE,30);
      ObjectSetInteger(0,"Line2",OBJPROP_COLOR,clrWhiteSmoke);

      ObjectCreate(0,"okyo",OBJ_LABEL,0,0,0);
      ObjectSetString(0,"okyo",OBJPROP_FONT,"Arial");
      ObjectSetInteger(0,"okyo",OBJPROP_FONTSIZE,10);
      ObjectSetString(0,"okyo",OBJPROP_TEXT,0,"Market Session         Opens          Closes           Status");
      ObjectSetInteger(0,"okyo",OBJPROP_XDISTANCE,338);
      ObjectSetInteger(0,"okyo",OBJPROP_YDISTANCE,37);
      ObjectSetInteger(0,"okyo",OBJPROP_COLOR,clrBlack);



   ObjectCreate(0,"Line3",OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,"Line3",OBJPROP_XDISTANCE,618);
   ObjectSetInteger(0,"Line3",OBJPROP_YDISTANCE,64);
   ObjectSetInteger(0,"Line3",OBJPROP_XSIZE,60);
   ObjectSetInteger(0,"Line3",OBJPROP_YSIZE,25);

   ObjectCreate(0,"Line4",OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,"Line4",OBJPROP_XDISTANCE,618);
   ObjectSetInteger(0,"Line4",OBJPROP_YDISTANCE,84);
   ObjectSetInteger(0,"Line4",OBJPROP_XSIZE,60);
   ObjectSetInteger(0,"Line4",OBJPROP_YSIZE,25);

   ObjectCreate(0,"Line5",OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,"Line5",OBJPROP_XDISTANCE,618);
   ObjectSetInteger(0,"Line5",OBJPROP_YDISTANCE,104);
   ObjectSetInteger(0,"Line5",OBJPROP_XSIZE,60);
   ObjectSetInteger(0,"Line5",OBJPROP_YSIZE,25);

   ObjectCreate(0,"Line6",OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,"Line6",OBJPROP_XDISTANCE,618);
   ObjectSetInteger(0,"Line6",OBJPROP_YDISTANCE,124);
   ObjectSetInteger(0,"Line6",OBJPROP_XSIZE,60);
   ObjectSetInteger(0,"Line6",OBJPROP_YSIZE,25);

   ObjectCreate(0,"Line7",OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,"Line7",OBJPROP_XDISTANCE,618);
   ObjectSetInteger(0,"Line7",OBJPROP_YDISTANCE,144);
   ObjectSetInteger(0,"Line7",OBJPROP_XSIZE,60);
   ObjectSetInteger(0,"Line7",OBJPROP_YSIZE,25);

   return 2;

  }


int PrintStrengthMeter()
 {
   

         //EUR_
         ObjectCreate(0,"EUR_6",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"EUR_6",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"EUR_6",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"EUR_6",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"EUR_6",OBJPROP_YDISTANCE,220);
         ObjectSetInteger(0,"EUR_6",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"EUR_6",OBJPROP_BGCOLOR,clrGreen);

         ObjectCreate(0,"EUR_5",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"EUR_5",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"EUR_5",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"EUR_5",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"EUR_5",OBJPROP_YDISTANCE,232);
         ObjectSetInteger(0,"EUR_5",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"EUR_5",OBJPROP_BGCOLOR,clrMediumSeaGreen);

         ObjectCreate(0,"EUR_4",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"EUR_4",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"EUR_4",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"EUR_4",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"EUR_4",OBJPROP_YDISTANCE,244);
         ObjectSetInteger(0,"EUR_4",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"EUR_4",OBJPROP_BGCOLOR,clrYellowGreen);

         ObjectCreate(0,"EUR_3",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"EUR_3",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"EUR_3",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"EUR_3",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"EUR_3",OBJPROP_YDISTANCE,256);
         ObjectSetInteger(0,"EUR_3",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"EUR_3",OBJPROP_BGCOLOR,clrKhaki);

         ObjectCreate(0,"EUR_2",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"EUR_2",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"EUR_2",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"EUR_2",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"EUR_2",OBJPROP_YDISTANCE,268);
         ObjectSetInteger(0,"EUR_2",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"EUR_2",OBJPROP_BGCOLOR,clrOrange);

         ObjectCreate(0,"EUR_1",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"EUR_1",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"EUR_1",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"EUR_1",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"EUR_1",OBJPROP_YDISTANCE,280);
         ObjectSetInteger(0,"EUR_1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"EUR_1",OBJPROP_BGCOLOR,clrRed);



         //USD_
         ObjectCreate(0,"USD_6",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"USD_6",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"USD_6",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"USD_6",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"USD_6",OBJPROP_YDISTANCE,220);
         ObjectSetInteger(0,"USD_6",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"USD_6",OBJPROP_BGCOLOR,clrGreen);

         ObjectCreate(0,"USD_5",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"USD_5",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"USD_5",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"USD_5",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"USD_5",OBJPROP_YDISTANCE,232);
         ObjectSetInteger(0,"USD_5",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"USD_5",OBJPROP_BGCOLOR,clrMediumSeaGreen);

         ObjectCreate(0,"USD_4",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"USD_4",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"USD_4",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"USD_4",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"USD_4",OBJPROP_YDISTANCE,244);
         ObjectSetInteger(0,"USD_4",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"USD_4",OBJPROP_BGCOLOR,clrYellowGreen);

         ObjectCreate(0,"USD_3",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"USD_3",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"USD_3",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"USD_3",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"USD_3",OBJPROP_YDISTANCE,256);
         ObjectSetInteger(0,"USD_3",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"USD_3",OBJPROP_BGCOLOR,clrKhaki);

         ObjectCreate(0,"USD_2",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"USD_2",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"USD_2",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"USD_2",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"USD_2",OBJPROP_YDISTANCE,268);
         ObjectSetInteger(0,"USD_2",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"USD_2",OBJPROP_BGCOLOR,clrOrange);

         ObjectCreate(0,"USD_1",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"USD_1",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"USD_1",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"USD_1",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"USD_1",OBJPROP_YDISTANCE,280);
         ObjectSetInteger(0,"USD_1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"USD_1",OBJPROP_BGCOLOR,clrRed);


         //GBP_
         ObjectCreate(0,"GBP_6",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"GBP_6",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"GBP_6",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"GBP_6",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"GBP_6",OBJPROP_YDISTANCE,220);
         ObjectSetInteger(0,"GBP_6",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"GBP_6",OBJPROP_BGCOLOR,clrGreen);

         ObjectCreate(0,"GBP_5",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"GBP_5",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"GBP_5",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"GBP_5",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"GBP_5",OBJPROP_YDISTANCE,232);
         ObjectSetInteger(0,"GBP_5",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"GBP_5",OBJPROP_BGCOLOR,clrMediumSeaGreen);

         ObjectCreate(0,"GBP_4",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"GBP_4",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"GBP_4",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"GBP_4",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"GBP_4",OBJPROP_YDISTANCE,244);
         ObjectSetInteger(0,"GBP_4",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"GBP_4",OBJPROP_BGCOLOR,clrYellowGreen);

         ObjectCreate(0,"GBP_3",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"GBP_3",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"GBP_3",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"GBP_3",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"GBP_3",OBJPROP_YDISTANCE,256);
         ObjectSetInteger(0,"GBP_3",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"GBP_3",OBJPROP_BGCOLOR,clrKhaki);

         ObjectCreate(0,"GBP_2",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"GBP_2",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"GBP_2",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"GBP_2",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"GBP_2",OBJPROP_YDISTANCE,268);
         ObjectSetInteger(0,"GBP_2",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"GBP_2",OBJPROP_BGCOLOR,clrOrange);

         ObjectCreate(0,"GBP_1",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"GBP_1",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"GBP_1",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"GBP_1",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"GBP_1",OBJPROP_YDISTANCE,280);
         ObjectSetInteger(0,"GBP_1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"GBP_1",OBJPROP_BGCOLOR,clrRed);

         //AUD___________________________________________
         ObjectCreate(0,"AUD_6",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"AUD_6",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"AUD_6",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"AUD_6",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"AUD_6",OBJPROP_YDISTANCE,220);
         ObjectSetInteger(0,"AUD_6",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"AUD_6",OBJPROP_BGCOLOR,clrGreen);

         ObjectCreate(0,"AUD_5",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"AUD_5",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"AUD_5",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"AUD_5",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"AUD_5",OBJPROP_YDISTANCE,232);
         ObjectSetInteger(0,"AUD_5",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"AUD_5",OBJPROP_BGCOLOR,clrMediumSeaGreen);

         ObjectCreate(0,"AUD_4",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"AUD_4",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"AUD_4",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"AUD_4",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"AUD_4",OBJPROP_YDISTANCE,244);
         ObjectSetInteger(0,"AUD_4",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"AUD_4",OBJPROP_BGCOLOR,clrYellowGreen);

         ObjectCreate(0,"AUD_3",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"AUD_3",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"AUD_3",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"AUD_3",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"AUD_3",OBJPROP_YDISTANCE,256);
         ObjectSetInteger(0,"AUD_3",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"AUD_3",OBJPROP_BGCOLOR,clrKhaki);

         ObjectCreate(0,"AUD_2",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"AUD_2",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"AUD_2",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"AUD_2",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"AUD_2",OBJPROP_YDISTANCE,268);
         ObjectSetInteger(0,"AUD_2",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"AUD_2",OBJPROP_BGCOLOR,clrOrange);

         ObjectCreate(0,"AUD_1",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"AUD_1",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"AUD_1",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"AUD_1",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"AUD_1",OBJPROP_YDISTANCE,280);
         ObjectSetInteger(0,"AUD_1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"AUD_1",OBJPROP_BGCOLOR,clrRed);

         //JPY___________________________________________
         ObjectCreate(0,"JPY_6",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"JPY_6",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"JPY_6",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"JPY_6",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"JPY_6",OBJPROP_YDISTANCE,220);
         ObjectSetInteger(0,"JPY_6",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"JPY_6",OBJPROP_BGCOLOR,clrGreen);

         ObjectCreate(0,"JPY_5",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"JPY_5",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"JPY_5",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"JPY_5",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"JPY_5",OBJPROP_YDISTANCE,232);
         ObjectSetInteger(0,"JPY_5",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"JPY_5",OBJPROP_BGCOLOR,clrMediumSeaGreen);

         ObjectCreate(0,"JPY_4",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"JPY_4",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"JPY_4",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"JPY_4",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"JPY_4",OBJPROP_YDISTANCE,244);
         ObjectSetInteger(0,"JPY_4",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"JPY_4",OBJPROP_BGCOLOR,clrYellowGreen);

         ObjectCreate(0,"JPY_3",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"JPY_3",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"JPY_3",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"JPY_3",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"JPY_3",OBJPROP_YDISTANCE,256);
         ObjectSetInteger(0,"JPY_3",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"JPY_3",OBJPROP_BGCOLOR,clrKhaki);

         ObjectCreate(0,"JPY_2",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"JPY_2",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"JPY_2",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"JPY_2",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"JPY_2",OBJPROP_YDISTANCE,268);
         ObjectSetInteger(0,"JPY_2",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"JPY_2",OBJPROP_BGCOLOR,clrOrange);

         ObjectCreate(0,"JPY_1",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"JPY_1",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"JPY_1",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"JPY_1",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"JPY_1",OBJPROP_YDISTANCE,280);
         ObjectSetInteger(0,"JPY_1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"JPY_1",OBJPROP_BGCOLOR,clrRed);


         //CHF___________________________________________
         ObjectCreate(0,"CHF_6",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CHF_6",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CHF_6",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CHF_6",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"CHF_6",OBJPROP_YDISTANCE,320);
         ObjectSetInteger(0,"CHF_6",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CHF_6",OBJPROP_BGCOLOR,clrGreen);

         ObjectCreate(0,"CHF_5",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CHF_5",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CHF_5",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CHF_5",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"CHF_5",OBJPROP_YDISTANCE,332);
         ObjectSetInteger(0,"CHF_5",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CHF_5",OBJPROP_BGCOLOR,clrMediumSeaGreen);

         ObjectCreate(0,"CHF_4",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CHF_4",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CHF_4",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CHF_4",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"CHF_4",OBJPROP_YDISTANCE,344);
         ObjectSetInteger(0,"CHF_4",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CHF_4",OBJPROP_BGCOLOR,clrYellowGreen);

         ObjectCreate(0,"CHF_3",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CHF_3",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CHF_3",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CHF_3",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"CHF_3",OBJPROP_YDISTANCE,356);
         ObjectSetInteger(0,"CHF_3",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CHF_3",OBJPROP_BGCOLOR,clrKhaki);

         ObjectCreate(0,"CHF_2",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CHF_2",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CHF_2",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CHF_2",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"CHF_2",OBJPROP_YDISTANCE,368);
         ObjectSetInteger(0,"CHF_2",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CHF_2",OBJPROP_BGCOLOR,clrOrange);

         ObjectCreate(0,"CHF_1",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CHF_1",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CHF_1",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CHF_1",OBJPROP_XDISTANCE,45);
         ObjectSetInteger(0,"CHF_1",OBJPROP_YDISTANCE,380);
         ObjectSetInteger(0,"CHF_1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CHF_1",OBJPROP_BGCOLOR,clrRed);


         //NZD___________________________________________
         ObjectCreate(0,"NZD_6",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NZD_6",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NZD_6",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NZD_6",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"NZD_6",OBJPROP_YDISTANCE,320);
         ObjectSetInteger(0,"NZD_6",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NZD_6",OBJPROP_BGCOLOR,clrGreen);

         ObjectCreate(0,"NZD_5",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NZD_5",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NZD_5",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NZD_5",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"NZD_5",OBJPROP_YDISTANCE,332);
         ObjectSetInteger(0,"NZD_5",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NZD_5",OBJPROP_BGCOLOR,clrMediumSeaGreen);

         ObjectCreate(0,"NZD_4",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NZD_4",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NZD_4",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NZD_4",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"NZD_4",OBJPROP_YDISTANCE,344);
         ObjectSetInteger(0,"NZD_4",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NZD_4",OBJPROP_BGCOLOR,clrYellowGreen);

         ObjectCreate(0,"NZD_3",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NZD_3",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NZD_3",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NZD_3",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"NZD_3",OBJPROP_YDISTANCE,356);
         ObjectSetInteger(0,"NZD_3",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NZD_3",OBJPROP_BGCOLOR,clrKhaki);

         ObjectCreate(0,"NZD_2",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NZD_2",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NZD_2",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NZD_2",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"NZD_2",OBJPROP_YDISTANCE,368);
         ObjectSetInteger(0,"NZD_2",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NZD_2",OBJPROP_BGCOLOR,clrOrange);

         ObjectCreate(0,"NZD_1",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NZD_1",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NZD_1",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NZD_1",OBJPROP_XDISTANCE,100);
         ObjectSetInteger(0,"NZD_1",OBJPROP_YDISTANCE,380);
         ObjectSetInteger(0,"NZD_1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NZD_1",OBJPROP_BGCOLOR,clrRed);


         //CAD___________________________________________
         ObjectCreate(0,"CAD_6",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CAD_6",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CAD_6",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CAD_6",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"CAD_6",OBJPROP_YDISTANCE,320);
         ObjectSetInteger(0,"CAD_6",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CAD_6",OBJPROP_BGCOLOR,clrGreen);

         ObjectCreate(0,"CAD_5",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CAD_5",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CAD_5",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CAD_5",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"CAD_5",OBJPROP_YDISTANCE,332);
         ObjectSetInteger(0,"CAD_5",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CAD_5",OBJPROP_BGCOLOR,clrMediumSeaGreen);

         ObjectCreate(0,"CAD_4",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CAD_4",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CAD_4",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CAD_4",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"CAD_4",OBJPROP_YDISTANCE,344);
         ObjectSetInteger(0,"CAD_4",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CAD_4",OBJPROP_BGCOLOR,clrYellowGreen);

         ObjectCreate(0,"CAD_3",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CAD_3",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CAD_3",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CAD_3",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"CAD_3",OBJPROP_YDISTANCE,356);
         ObjectSetInteger(0,"CAD_3",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CAD_3",OBJPROP_BGCOLOR,clrKhaki);

         ObjectCreate(0,"CAD_2",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CAD_2",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CAD_2",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CAD_2",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"CAD_2",OBJPROP_YDISTANCE,368);
         ObjectSetInteger(0,"CAD_2",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CAD_2",OBJPROP_BGCOLOR,clrOrange);

         ObjectCreate(0,"CAD_1",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"CAD_1",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"CAD_1",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"CAD_1",OBJPROP_XDISTANCE,155);
         ObjectSetInteger(0,"CAD_1",OBJPROP_YDISTANCE,380);
         ObjectSetInteger(0,"CAD_1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"CAD_1",OBJPROP_BGCOLOR,clrRed);


         //NOK___________________________________________
         ObjectCreate(0,"NOK_6",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NOK_6",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NOK_6",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NOK_6",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"NOK_6",OBJPROP_YDISTANCE,320);
         ObjectSetInteger(0,"NOK_6",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NOK_6",OBJPROP_BGCOLOR,clrGreen);

         ObjectCreate(0,"NOK_5",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NOK_5",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NOK_5",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NOK_5",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"NOK_5",OBJPROP_YDISTANCE,332);
         ObjectSetInteger(0,"NOK_5",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NOK_5",OBJPROP_BGCOLOR,clrMediumSeaGreen);

         ObjectCreate(0,"NOK_4",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NOK_4",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NOK_4",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NOK_4",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"NOK_4",OBJPROP_YDISTANCE,344);
         ObjectSetInteger(0,"NOK_4",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NOK_4",OBJPROP_BGCOLOR,clrYellowGreen);

         ObjectCreate(0,"NOK_3",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NOK_3",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NOK_3",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NOK_3",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"NOK_3",OBJPROP_YDISTANCE,356);
         ObjectSetInteger(0,"NOK_3",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NOK_3",OBJPROP_BGCOLOR,clrKhaki);

         ObjectCreate(0,"NOK_2",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NOK_2",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NOK_2",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NOK_2",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"NOK_2",OBJPROP_YDISTANCE,368);
         ObjectSetInteger(0,"NOK_2",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NOK_2",OBJPROP_BGCOLOR,clrOrange);

         ObjectCreate(0,"NOK_1",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"NOK_1",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"NOK_1",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"NOK_1",OBJPROP_XDISTANCE,210);
         ObjectSetInteger(0,"NOK_1",OBJPROP_YDISTANCE,380);
         ObjectSetInteger(0,"NOK_1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"NOK_1",OBJPROP_BGCOLOR,clrRed);

         //DKK___________________________________________
         ObjectCreate(0,"DKK_6",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"DKK_6",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"DKK_6",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"DKK_6",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"DKK_6",OBJPROP_YDISTANCE,320);
         ObjectSetInteger(0,"DKK_6",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"DKK_6",OBJPROP_BGCOLOR,clrGreen);

         ObjectCreate(0,"DKK_5",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"DKK_5",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"DKK_5",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"DKK_5",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"DKK_5",OBJPROP_YDISTANCE,332);
         ObjectSetInteger(0,"DKK_5",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"DKK_5",OBJPROP_BGCOLOR,clrMediumSeaGreen);

         ObjectCreate(0,"DKK_4",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"DKK_4",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"DKK_4",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"DKK_4",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"DKK_4",OBJPROP_YDISTANCE,344);
         ObjectSetInteger(0,"DKK_4",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"DKK_4",OBJPROP_BGCOLOR,clrYellowGreen);

         ObjectCreate(0,"DKK_3",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"DKK_3",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"DKK_3",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"DKK_3",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"DKK_3",OBJPROP_YDISTANCE,356);
         ObjectSetInteger(0,"DKK_3",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"DKK_3",OBJPROP_BGCOLOR,clrKhaki);

         ObjectCreate(0,"DKK_2",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"DKK_2",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"DKK_2",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"DKK_2",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"DKK_2",OBJPROP_YDISTANCE,368);
         ObjectSetInteger(0,"DKK_2",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"DKK_2",OBJPROP_BGCOLOR,clrOrange);

         ObjectCreate(0,"DKK_1",OBJ_RECTANGLE_LABEL,0,0,0);
         ObjectSetInteger(0,"DKK_1",OBJPROP_XSIZE,40);
         ObjectSetInteger(0,"DKK_1",OBJPROP_YSIZE,10);
         ObjectSetInteger(0,"DKK_1",OBJPROP_XDISTANCE,265);
         ObjectSetInteger(0,"DKK_1",OBJPROP_YDISTANCE,380);
         ObjectSetInteger(0,"DKK_1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,"DKK_1",OBJPROP_BGCOLOR,clrRed);

       
 
 return 2;
 }
  
