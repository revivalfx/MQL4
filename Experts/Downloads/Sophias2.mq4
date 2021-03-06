#property copyright "Copyright © 2014"
#property link      ""
#property version   "1.02"

input string                Pattern_settings                 = "----------------------------------------------------------------------";
input int                   MinPatternCandles                = 5;
input int                   MaxPatternCandles                = 50;
double                MinHeight                        = 0;
double                MaxHeight                        = 0;
int                   MinCandles                       = 2;
int                   MaxCandles                       = 0;
input int                   CancelPatternCandles             = 30;   
input string                Entry_and_exit_conditions        = "----------------------------------------------------------------------";
input bool                  PSARExit                         = true;
input bool                  FractalExit                      = true;
input bool                  ExitOnOppositeSignal             = false;
bool                  ReverseSignals                   = false;
input string                Order_settings                   = "----------------------------------------------------------------------";
int                   TradesPerDirection               = 1;
input int                   TradesPerSession                 = 0;
input int                   MagicNumber                      = 102070;
input string                TradeComment                     = "Sophia";
input bool                  SwingSL                          = false;
input bool                  ZeroLevelSL                      = true;
input double                PipsAddedToSL                    = 1;
input double                MinimumSLPips                    = 1;
input double                MaximumSLPips                    = 0;
input double                FractalBreakevenTrigger          = 5;
input double                FractalBreakevenPips             = 2;
input double                SpikePipsRiskedMultiplier        = 10;
input double                MinSpikePipsRisked               = 5;
input double                RRProfitMultiplier               = 9;
input double                StopLoss                         = 0;
int                   StopLossType                     = 0;
double                VisibleSL                        = 1;
input double                TakeProfit                       = 20;
int                   TakeProfit1Type                  = 0;
double                TakeProfit2                      = 0;
int                   TakeProfit2Type                  = 0;
double                TakeProfit3                      = 0;
int                   TakeProfit3Type                  = 0;
double                TakeProfit4                      = 0;
int                   TakeProfit4Type                  = 0;
double                VisibleTP                        = 0;
input double                BreakEvenTrigger                 = 0;
int                   BreakEvenTriggerType             = 0;
input double                LockProfit                       = 0;
int                   LockProfitType                   = 0;
input double                TrailingStop                     = 0;
int                   TrailingStopType                 = 0;
input double                TrailingStart                    = 0;
int                   TrailingStartType                = 0;
input double                TrailingStep                     = 0;
int                   TrailingStepType                 = 0;
int                   CloseProfitableAfterMinutes      = 0;
int                   CloseLosingAfterMinutes          = 0;
input double                Slippage                         = 3;
input double                MaxSpread                        = 0;
bool                  CloseOnProfit                    = false;
input bool                  Hedge                            = false;
double                MinOrdersDistance                = 0;
int                   MinOrdersDistanceType            = 0;
int                   NewHighLow                       = 0;
int                   CandlesDistance                  = 1;
input int                   SendEmail                        = 0;
input int                   SendNotifications                = 0;
input int                   Alerts                           = 0;
input string                AlertSound                       = "alert.wav";
input int                   ScreenShots                      = 0;
input color                 LongColour                       = 11193702;
input color                 ShortColour                      = 5275647;
input string                Trading_hours_settings           = "----------------------------------------------------------------------";
input bool                  AutoGMTOffset                    = true;
input int                   ManualGMTOffset                  = 1;
input bool                  DSTOffset                        = true;
input string                TradingSession1                  = "00002400";
input string                TradingSession2                  = "00000000";
input string                TradingSession3                  = "00000000";
input string                MondayOpenHour                   = "";
input string                FridayCloseHour                  = "";
input int                   FridayCloseTrades                = 3;
input bool                  NewsFilter                       = false;
input int                   MinutesBeforeNews                = 10;
input int                   MinutesAfterNews                 = 10;
input string                Money_management_settings        = "----------------------------------------------------------------------";
input double                Lots                             = 0.2;
input double                PSARPartialClose                 = 50;
input double                FractalPartialClose              = 50;
input double                TakeProfitPartialClose           = 50;
input double                SpikePartialClose                = 50;
input double                RRProfitPartialClose             = 50;
double                PartialClose1                    = 0;
double                PartialClose2                    = 0;
double                PartialClose3                    = 0;
input bool                  MoneyManagement                  = false;
input double                BalancePercent                   = 0;
input double                StopLossRisk                     = 0;
double                LotPercent                       = 0;
int                   StartProgression                 = 0;
int                   MaxProgression                   = 0;
double                CloseAllProfit                   = 0;
double                CloseAllLoss                     = 0;
bool                  CloseOneDirection                = true;
input string                Divergence_types                 = "----------------------------------------------------------------------";
input bool                  RegularConsecutive               = true;
input bool                  RegularNonConsecutive            = true;
input bool                  HiddenConsecutive                = true;
input bool                  SlopeDivergence                  = true;
string                ATR_settings                     = "----------------------------------------------------------------------";
int                   ATRPeriod                        = 14;
input string                TVI_settings                     = "----------------------------------------------------------------------";
input int                   r                                = 8;
input int                   s                                = 8;
input int                   u                                = 5;
input string                CCI_settings                     = "----------------------------------------------------------------------";
input int                   CCI_Period                       = 20;
input ENUM_APPLIED_PRICE    CCI_applied_price                = PRICE_TYPICAL;
input string                T3MA_Basic_settings              = "----------------------------------------------------------------------";
input int                   T3_period                        = 8;
input double                T3_b                             = 0.618;
input int                   T3_maxbars                       = 5000;
input string                GannHiLo_Histo_settings          = "----------------------------------------------------------------------";
input int                   period                           = 10;
input string                PSAR_settings                    = "----------------------------------------------------------------------";
input double                PSAR_step                        = 0.02;
input double                PSAR_maximum                     = 0.2;
input string                FFCal_settings                   = "----------------------------------------------------------------------";
input bool                  IncludeHigh 	                   = true;
input bool                  IncludeMedium                    = true;
input bool                  IncludeLow                       = false;
input bool                  IncludeSpeaks                    = true;
input bool		             ReportAllForUSD		             = false;

double Vd[200][500],Td[200][500],Ind[2000][30][20],OProfit[200][9],PartialClose[19],Timi[9],mult,Lots0,StopLossRisk0,BalancePercent0;
int Vi[200][500],Ti[400][200],Trade[19],OTicket[200][9],MinutesUntilNextEvent,MinutesAfterPrevEvent,tf,Slippage0,TradesPerDirection0;
int GMTOffset,StartProgression0,MaxProgression0,SendEmail0,ScreenShots0,SendNotifications0,Alerts0,e1,e2,z0,k8;
bool EntrySignal[9][40][9],ExitSignal[9][40][9],Dot[9][40][10],TradingTime[19],Session[9],NewsFilter0,SwingSL0,ZeroLevelSL0,MoneyManagement0;
color Colour[9];
ENUM_TIMEFRAMES TF[]={PERIOD_CURRENT,PERIOD_M1,PERIOD_M2,PERIOD_M3,PERIOD_M4,PERIOD_M5,PERIOD_M6,PERIOD_M10,PERIOD_M12,PERIOD_M15,PERIOD_M20,PERIOD_M30,PERIOD_H1,PERIOD_H2,PERIOD_H3,PERIOD_H4,PERIOD_H6,PERIOD_H8,PERIOD_H12,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
string TimeFr[]={"0","M1","M2","M3","M4","M5","M6","M10","M12","M15","M20","M30","H1","H2","H3","H4","H6","H8","H12","D1","W1","MN"};
string Vs[200][450],Ts[200][200],gv[200][100];
datetime Vt[200][200],Tt[200][200],OTime[100],ETime[50][9];
MqlTick LastTick;

int k1,ConsecutiveLosingTrades,CConsecutiveLosingTrades,ConsecutiveProfitableTrades,CConsecutiveProfitableTrades,FirstSignal;
int ProfitableClosedTrades,LosingClosedTrades;
int LastClosedTrade,ZoneBars0,MinBarsClosedOutside0,MA_Period0,DivergenceType0,MaxPatternCandles0,MinPatternCandles0,MinZZPatternBars,RSI_period0;
int PastBars0,DisplayPanelWidth,RandomBars;
int DivType[10],PatternTotalTrades[3],PatternClosedTrades[3],TotalTrades[3],ClosedTrades[3],TotalPatterns[3];
datetime TradeCloseTime[10000][3],TradeOpenTime[10000][3],CZStart,CZEnd;
double MaxEntryDistance0,RSIEntryLevel0,RSIExitLevel0,MinHeight0,MaxHeight0,HighBO,LowBO,CZone[10000][6],BPips,RPips,ShortSignalPrice,LongSignalPrice,LotSize,ClosedLots;
double StopLossLevel,TakeProfitLevel,Loss,Profit,FixedSpread0,Commission;
double TradeOpenPrice[10000][3],TradeClosePrice[10000][3],TradeProfitLoss[10000][3];
double TakeProfit0,StopLoss0,MaxProfit,MaxDrawdown;
double ClosedTradesProfit[3],ClosedTradesLoss[3],SignalPrice[3],TPValue[3],SLValue[3];
bool AutoOptimize0,ReverseLogic0,LongTrades0,ShortTrades0,ShowLines0,ShowVirtualTrades0,IndicatorMode0,SwingTakeProfit0,SLBeyondSwingClose0,SwingStopLoss;
bool ExitOnOppositeSignal0;

void OnInit()
{int t1,t2,t3,t4,t5,t8;
double d1;
string s7;

Vd[0][0]=(MarketInfo(Symbol(),MODE_PROFITCALCMODE)==0)*MarketInfo(Symbol(),MODE_LOTSIZE)+(MarketInfo(Symbol(),MODE_PROFITCALCMODE)>=1)*100000; 
tf=0; t1=1; while(t1<=21 && tf==0) {tf=(PeriodSeconds(PERIOD_CURRENT)==PeriodSeconds(TF[t1]))*t1; t1++;}
TF[0]=TF[tf]; mult=MathPow(10,(MathRound(Digits()*0.5)!=Digits()*0.5)); Slippage0=Slippage*mult;

Vs[0][1]="000"; k1=StringLen(Vs[0][1]); ShowLines0=true;
t1=1; while(t1<=k1-1) {Vi[40][t1]=MinCandles; Vi[41][t1]=MaxCandles; Vd[40][t1]=MinHeight; Vd[41][t1]=MaxHeight; t1++;}
//MaxPatternBars=0; t1=1; while(t1<=k1-1) {MaxPatternBars+=Vi[41][t1]+(Vi[41][t1]==0)*500; t1++;}
MinPatternCandles0=MathMax(MinPatternCandles,3); MaxPatternCandles0=MaxPatternCandles+(MaxPatternCandles==0)*500;

Vi[0][3]=((TakeProfit>0)+(TakeProfit2>0)+(TakeProfit3>0)+(TakeProfit4>0));
Timi[3]=NormalizeDouble(mult*Point(),Digits()); Timi[4]=NormalizeDouble(MaxSpread*mult*Point(),Digits());
SendEmail0=SendEmail; ScreenShots0=ScreenShots; SendNotifications0=SendNotifications; Alerts0=Alerts; NewsFilter0=NewsFilter;

t8=4; PartialClose[1]=PartialClose1; PartialClose[2]=PartialClose2; PartialClose[3]=PartialClose3;
PartialClose[t8]=100; t1=1; while(t1<=t8-1) {if (PartialClose[t1]>=100) {PartialClose[t1]=100; t2=t1+1; while(t2<=t8-1) {PartialClose[t2]=0; t2++;}} t1++;}
t1=1; while(t1<=t8-1) {t2=t1+1; while(t2<=t8-1) {d1=0; t3=1; while(t3<=t2-1) {d1+=PartialClose[t3]; t3++;}
if (PartialClose[t1]+PartialClose[t2]>100) {PartialClose[t2]=100-d1; t4=t2+1; while(t4<=t8-1) {PartialClose[t4]=0; t4++;}} t2++;} t1++;}
t1=1; while(t1<=t8-1) {Td[t1][0]=PartialClose[t1]; t1++;}
t1=2; while(t1<=t8-1) {if (Td[t1][0]>0) {d1=0; t2=1; while(t2<=t1-1) {d1+=Td[t2][0]; t2++;} PartialClose[t1]/=(100-d1)*0.01;} t1++;}

Colour[1]=LongColour; Colour[2]=ShortColour; Colour[3]=16777215; Colour[4]=16436871; Colour[5]=clrGreenYellow; 
TradesPerDirection0=MathMax(TradesPerDirection,(TradesPerDirection==0 || TradesPerDirection>99)*99);
Lots0=LotDecimals(Lots); Vs[30][1]=StringSubstr(Symbol(),0,6); s7=StringConcatenate(" ",Vs[30][1]," ",TimeFr[tf]);
Vs[30][4]=StringConcatenate(StringSubstr(TradeComment,0,27-StringLen(s7)),s7);

e1=11; e2=e1+1; t1=1; while(t1<=e1) {Ts[t1][1]="0000"; t1++;}
Ts[1][1]="1000"; Ts[2][1]="1000"; Ts[3][1]="1000"; Ts[4][1]="1000"; Ts[5][1]="1010";
Ts[6][1]=StringConcatenate("0",PSARExit,"10"); Ts[7][1]=StringConcatenate("0",FractalExit,"10");
Ts[10][1]=StringConcatenate("0",(SpikePipsRiskedMultiplier>0),"10"); Ts[11][1]=StringConcatenate("0",(RRProfitMultiplier>0),"10");
t1=1; while(t1<=e1) {t2=1; while(t2<=3) {Vi[t1][t2]=StringToInteger(StringSubstr(Ts[t1][1],t2-1,1)); Vi[t1][t2]*=(Vi[t1][t2]<=2); t2++;} t1++;}
t1=1; while(t1<=e1) {t2=1; while(t2<=4) {t3=1; while(t3<=2)
{t4=(t2<=2)*t3+(t2==4)*2; t5=(t2<=3)*t2+(t2==4)*3; Dot[2-t3][t1][t2]=(Vi[t1][t5]==t4 && !(t2>=3 && !Dot[2-t3][t1][1])); t3++;} t2++;} t1++;}
t1=1; while(t1<=e1) {Ts[0][0]=StringSubstr(Ts[t1][1],3,3); Vi[t1][5]=0;
t2=0; while(t2<=21 && Vi[t1][5]==0) {Vi[t1][5]=(Ts[0][0]==TimeFr[t2] && (Vi[t1][1]>0 || Vi[t1][2]>0))*TF[t2]; t2++;} Vi[t1][5]+=(Vi[t1][5]==0)*PERIOD_CURRENT; t1++;}
t1=1; while(t1<=e1) {Vi[t1][6]=Vi[t1][5]; if (t1==6) {Vi[t1][6]=PERIOD_CURRENT;} Vi[t1][7]=3; t1++;} 
Vi[0][5]=PERIOD_CURRENT; t1=1; while(t1<=e1) {Vi[0][5]=MathMin(Vi[0][5],Vi[t1][5]); t1++;}
Vt[30][3]=CandlesDistance*PeriodSeconds(PERIOD_CURRENT);
Vi[0][1]=0; t1=1; while(t1<=e1) {Vi[0][1]+=(Dot[0][t1][1] || Dot[1][t1][1]); t1++;}
t1=1; while(t1<=2) {t2=3; while(t2<=4) {t3=1; while(t3<=e1+1)
{Dot[t1-1][0][t2]=(Dot[t1-1][0][t2] || Dot[t1-1][t3][t2]); Dot[t1-1][0][t2-2]=(Dot[t1-1][0][t2-2] || Dot[t1-1][t3][t2-2]); t3++;} t2++;} t1++;}
t1=1; while(t1<=2) {t2=1; while(t2<=e1+1) {Dot[t1-1][t2][7]=(Dot[t1-1][t2][1] || Dot[t1-1][t2][2]); t2++;} t1++;}
t1=1; while(t1<=e1) {Dot[0][t1][8]=Dot[0][t1][7]; Dot[1][t1][8]=(Dot[0][t1][7] || Dot[1][t1][7]); t1++;} 
Dot[0][e2][2]=ExitOnOppositeSignal; t1=1; while(t1<=e1) {Dot[0][t1][9]=true; t1++;}
Vs[33][1]=TradingSession1; Vs[33][2]=TradingSession2; Vs[33][3]=TradingSession3;
t1=1; while(t1<=3) {if (Vs[33][t1]=="00002400") {t2=1; while(t2<=3) {Vs[33][t2]="00002400"; t2++;}}
if (StringSubstr(Vs[33][t1],0,2)=="24") {Vs[33][t1]="00000000";}
if (StringToInteger(StringSubstr(Vs[33][t1],0,2))>24 || StringToInteger(StringSubstr(Vs[33][t1],4,2))>24) {Vs[33][t1]="00000000";} 
if (StringSubstr(Vs[33][t1],0,4)==StringSubstr(Vs[33][t1],4,4)) {Vs[33][t1]="00000000";} t1++;} TradingTime[9]=(Vs[33][1]!="00002400"); 
t1=0; while(t1<=200) {t2=0; while(t2<=99) {gv[t1][t2]=StringConcatenate(Vs[30][1],MagicNumber," ",t1," ",t2); t2++;} t1++;}
if (IsTesting()) {SendEmail0=0; SendNotifications0=0; ScreenShots0=0; Alerts0=0; NewsFilter0=false; GlobalVariablesDeleteAll();}
t1=0; while(t1<=100) {Vs[41][t1]=StringConcatenate("Comment",t1); t1++;}
Vs[31][6]="PSAR"; Vs[31][7]="Fractal"; Vs[31][10]="Spike"; Vs[31][11]="RRProfit";      
Vs[31][e2]="Opposite signal"; Vs[31][31]="Take profit"; Vs[31][32]="Stop loss"; Vs[31][33]="Trailing stop"; Vs[31][34]="Timeout close"; Vs[31][35]="Timeout close";
Vs[31][36]="Friday close"; Vs[31][39]="Manual close"; Vs[31][40]="Close all"; 
Vs[32][1]=" profit is "; Vs[32][2]=" loss is "; Vs[32][3]="Long order"; Vs[32][4]="Short order"; Vs[32][5]=""; Vs[32][6]="";
Vs[32][7]=" has been opened"; Vs[32][8]=" has been closed"; Vs[32][9]="Open.png"; Vs[32][10]="Close.png";
Vs[32][51]="Regular Consecutive"; Vs[32][52]="Regular Non Consecutive"; Vs[32][53]="Hidden Consecutive"; Vs[32][54]="Slope";
Vs[32][55]="Bullish"; Vs[32][56]="Bearish";
Vs[32][82]="profit"; Vs[32][83]="loss";
Vs[32][86]="TradingSession1"; Vs[32][87]="TradingSession2"; Vs[32][88]="TradingSession3";
t1=1; while(t1<=3) {Vs[32][t1+89]=""; t1++;} 
TradingTime[1]=true; t1=0; while(t1<=50) {OTime[t1]=0; t2=1; while(t2<=3) {ETime[t1][t2]=0; t2++;} t1++;} 
Vi[0][0]=(!IsTesting() || IsVisualMode()); StartProgression0=MathMax(StartProgression,2);
MaxProgression0=MaxProgression+(MaxProgression==0)*99; MaxProgression0=MathMax(MaxProgression0,2); MaxProgression0=MathMin(MaxProgression0,99); 
SwingSL0=(SwingSL && MinimumSLPips>0); ZeroLevelSL0=(ZeroLevelSL && MinimumSLPips>0 && !SwingSL0);
StopLossRisk0=(StopLoss>0 || SwingSL0 || ZeroLevelSL0)*StopLossRisk; BalancePercent0=(StopLossRisk0==0)*BalancePercent; 
MoneyManagement0=(BalancePercent0>0 || StopLossRisk0>0)*MoneyManagement;
Vi[30][1]=0; t1=1; while(t1<=200) {Vi[30][1]=MathMax(Vi[30][1],(GlobalVariableGet(gv[t1][0])>0 || GlobalVariableGet(gv[t1][60])>0)*t1); t1++;}

ArraySetAsSeries(Open,true); ArraySetAsSeries(Close,true); ArraySetAsSeries(High,true); ArraySetAsSeries(Low,true); ArraySetAsSeries(Time,true);
ChartSetInteger(0,CHART_MODE,CHART_CANDLES);

Vt[40][22]=StringToTime("2020.03.29"); Vt[41][22]=StringToTime("2020.10.25"); Vt[40][21]=StringToTime("2019.03.31"); Vt[41][21]=StringToTime("2019.10.27");
Vt[40][20]=StringToTime("2018.03.25"); Vt[41][20]=StringToTime("2018.10.28"); Vt[40][19]=StringToTime("2017.03.26"); Vt[41][19]=StringToTime("2017.10.29");
Vt[40][18]=StringToTime("2016.03.27"); Vt[41][18]=StringToTime("2016.10.30"); Vt[40][17]=StringToTime("2015.03.29"); Vt[41][17]=StringToTime("2015.10.25");
Vt[40][16]=StringToTime("2014.03.30"); Vt[41][16]=StringToTime("2014.10.26"); Vt[40][15]=StringToTime("2013.03.31"); Vt[41][15]=StringToTime("2013.10.27");
Vt[40][14]=StringToTime("2012.03.25"); Vt[41][14]=StringToTime("2012.10.28"); Vt[40][13]=StringToTime("2011.03.27"); Vt[41][13]=StringToTime("2011.10.30");
Vt[40][12]=StringToTime("2010.03.28"); Vt[41][12]=StringToTime("2010.10.31"); Vt[40][11]=StringToTime("2009.03.29"); Vt[41][11]=StringToTime("2009.10.25");
Vt[40][10]=StringToTime("2008.03.30"); Vt[41][10]=StringToTime("2008.10.26"); Vt[40][9]=StringToTime("2007.03.25"); Vt[41][9]=StringToTime("2007.10.28");
Vt[40][8]=StringToTime("2006.03.26"); Vt[41][8]=StringToTime("2006.10.29"); Vt[40][7]=StringToTime("2005.03.27"); Vt[41][7]=StringToTime("2005.10.30");
Vt[40][6]=StringToTime("2004.03.28"); Vt[41][6]=StringToTime("2004.10.31"); Vt[40][5]=StringToTime("2003.03.30"); Vt[41][5]=StringToTime("2003.10.26");
Vt[40][4]=StringToTime("2002.03.31"); Vt[41][4]=StringToTime("2002.10.27"); Vt[40][3]=StringToTime("2001.03.25"); Vt[41][3]=StringToTime("2001.10.28");
Vt[40][2]=StringToTime("2000.03.26"); Vt[41][2]=StringToTime("2000.10.29"); Vt[40][1]=StringToTime("1999.03.28"); Vt[41][1]=StringToTime("1999.10.31");}

void OnDeinit(const int reason) {}

int start()
{int t0,t1,t2,t3,t4,t5,t6,t7,t8,t9;
bool b1;
double d1,d2,d3,db[100];
string s2;

// Entry and exit signals **************************************************************************************
TradingHours(); SymbolInfoTick(Symbol(),LastTick); Timi[1]=LastTick.bid; Timi[2]=LastTick.ask; Ind[0][0][e2]=iATR(Symbol(),Vi[e2][5],ATRPeriod,0);
t5=1; while(t5<=e1) {t1=0; while(t1<=Vi[t5][7] && (ETime[t5][3]!=iTime(Symbol(),Vi[t5][5],0) || t1==0)) {t4=(t1>0); t2=0; while(t2<=7 && Dot[t4][t5][8])
{CalcInd(t1,t2,t5); t2++;} t1++;} ETime[t5][3]=iTime(Symbol(),Vi[t5][5],0); t5++;}

t5=1; while(t5<=e1) {t2=(Dot[1][t5][1] && !Dot[0][t5][2]); while(t2<=2 && (Dot[1][t5][1] || Dot[0][t5][1] || Dot[1][t5][2] || Dot[0][t5][2]) && (ETime[t5][1]!=iTime(Symbol(),Vi[t5][6],0) || t2==0)) 
{t1=1; while(t1<=2) {z0=3-t1*2;
if (t5==1) {EntrySignal[t2][t5][t1]=(z0*(Ind[t2][0][t5]-Ind[t2+1][0][t5])>0);}
if (t5==2) {EntrySignal[t2][t5][t1]=(z0*Ind[t2][0][t5]>0);}
if (t5==3) {EntrySignal[t2][t5][t1]=(z0*(Ind[t2][0][t5]-Ind[t2+1][0][t5])>0);}
if (t5==4) {EntrySignal[t2][t5][t1]=(Ind[t2][t1-1][t5]>0);}
if (t5==5) {EntrySignal[t2][t5][t1]=(DivType[3-t1]>0);}

t1++;} t2++;} ETime[t5][1]=iTime(Symbol(),Vi[t5][6],0); t5++;}

t1=1; while (t1<=2) {t3=1; while (t3<=2) 
{EntrySignal[t1][0][t3+2]=(Dot[t1-1][0][1] && (Dot[t1-1][0][3] || Dot[t1-1][0][4])); 
EntrySignal[t1][0][t3]=true; Ti[t1][t3]=0; Ti[t1][t3+2]=0; t2=1; while (t2<=e1)
{EntrySignal[t1][t2][t3+2]=(EntrySignal[t1][t2][t3] || !Dot[t1-1][t2][1] || (!Dot[t1-1][t2][3] && !Dot[t1-1][t2][4]));
Ti[t1][t3]+=((!EntrySignal[t1][t2][t3] && Dot[t1-1][t2][1] && Dot[t1-1][t2][3]) || !Dot[t1-1][0][3]);
Ti[t1][t3+2]+=(EntrySignal[t1][t2][t3] && Dot[t1-1][t2][1] && Dot[t1-1][t2][4] && Dot[t1-1][0][4]);
EntrySignal[t1][0][t3]*=(EntrySignal[t1][t2][t3] || !Dot[1][t2][1]); EntrySignal[t1][0][t3+2]*=EntrySignal[t1][t2][t3+2]; t2++;} 
EntrySignal[t1][0][t3+2]=(EntrySignal[t1][0][t3+2] || Ti[t1][t3]==0 || Ti[t1][t3+2]>0); t3++;} t1++;}

t1=1; while (t1<=2) {EntrySignal[0][0][t1]=true; t2=1; while (t2<=e1) {EntrySignal[0][0][t1]*=(EntrySignal[0][t2][t1] || !Dot[0][t2][1]);
EntrySignal[3][t2][t1]=((EntrySignal[0][t2][t1] || !Dot[0][t2][1]) && (EntrySignal[1][t2][t1] || !Dot[1][t2][1])); t2++;} 
EntrySignal[3][0][t1]=(EntrySignal[0][0][t1] && EntrySignal[1][0][t1] && !EntrySignal[1][0][t1+2] && !EntrySignal[2][0][t1+2]); t1++;}

t5=1; while(t5<=e2) {t2=Dot[1][t5][2]; while(t2<=1 && (ETime[t5][2]!=iTime(Symbol(),Vi[t5][6],0) || t2==0)) {t1=1; while(t1<=2) {z0=3-t1*2;
if (t5==e2 && t2==0) {ExitSignal[t2][e2][t1]=EntrySignal[3][0][3-t1];}
t1++;} t2++;} ETime[t5][2]=iTime(Symbol(),Vi[t5][6],0); t5++;} 

t1=1; while (t1<=2) {t2=1; while (t2<=e2)
{ExitSignal[3][t2][t1]=((ExitSignal[1][t2][t1] && Dot[1][t2][2]) || (ExitSignal[0][t2][t1] && Dot[0][t2][2])); t2++;} t1++;}
 
// Order management ************************************************************************************************                                              
t1=0; while (t1<=2) {Trade[t1]=0; t1++;} t1=1; while (t1<=Vi[30][1]) {OTicket[t1][0]=0; t1++;}
OProfit[0][1]=0; OProfit[0][2]=0; Vt[30][2]=TradingTime[9]*OTime[9]+(!TradingTime[9])*StringToTime("00:00");
t9=OrdersTotal()-1; while(t9>=0) {if (OrderSelect(t9,SELECT_BY_POS,MODE_TRADES) && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
{t0=OrderType()+1; z0=3-t0*2; Trade[0]++; Trade[t0]++; k8=FindSeat(OrderTicket()); 
if (k8>0) {OTicket[k8][0]=OrderTicket(); OProfit[k8][0]=OrderProfit()+OrderSwap()+OrderCommission(); OProfit[0][t0]+=OProfit[k8][0];
if (StringFind(OrderComment(),Vs[30][4])>=0 && OrderOpenTime()+PeriodSeconds(PERIOD_H1)>=OTime[22]) {s2=StringConcatenate(OrderTicket(),"open"); 
if (GlobalVariableGet(s2)==0) {GlobalVariableSet(s2,1); OrderAlert(1,OrderType()+1,OrderTicket(),OrderOpenPrice());}}

// Take profit calculation ***********************************************************************************************
if (Vi[0][3]>0) {if (GlobalVariableGet(gv[k8][10])==0) {db[1]=CalcValue(TakeProfit1Type,TakeProfit,t0); db[2]=CalcValue(TakeProfit2Type,TakeProfit2,t0); 
db[3]=CalcValue(TakeProfit3Type,TakeProfit3,t0); db[4]=CalcValue(TakeProfit4Type,TakeProfit4,t0); 
t6=0; t1=1; while (t1<=4) {t5=ArrayMaximum(db,4,1); if (db[t5]>0) {t6++; Td[0][t6]=db[t5]; db[t5]=0;} t1++;}
t1=1; while (t1<=t6) {GlobalVariableSet(gv[k8][t1+10],NormalizeDouble(OrderOpenPrice()+z0*Td[0][t6-t1+1],Digits())); t1++;} GlobalVariableSet(gv[k8][10],1);}
if (GlobalVariableGet(gv[k8][1])==0 && GlobalVariableGet(gv[k8][4])<Vi[0][3]) {t7=GlobalVariableGet(gv[k8][4])+1;
GlobalVariableSet(gv[k8][1],GlobalVariableGet(gv[k8][t7+10]));}}

// Break even ***********************************************************************************************************                                                 
if (BreakEvenTrigger>0) {d1=CalcValue(BreakEvenTriggerType,BreakEvenTrigger,t0); d2=CalcValue(LockProfitType,LockProfit,t0);
if (z0*(Timi[t0]-OrderOpenPrice())-d1>=0 && (z0*(OrderOpenPrice()-GlobalVariableGet(gv[k8][2]))+d2>0 || GlobalVariableGet(gv[k8][2])==0))      
{GlobalVariableSet(gv[k8][2],NormalizeDouble(OrderOpenPrice()+z0*d2,Digits())); OTicket[k8][1]=0;}}

if (Dot[1][7][2] && (z0*(OrderOpenPrice()-Ind[1][0][6])>=0 || !Dot[1][6][2])) // Fractal
{d1=CalcValue(0,FractalBreakevenTrigger,t0); d2=CalcValue(0,FractalBreakevenPips,t0);
if (z0*(Ind[1][3-t0][7]-OrderOpenPrice())-d1>=0 && z0*(Timi[t0]-OrderOpenPrice())-d1>=0 && (z0*(OrderOpenPrice()-GlobalVariableGet(gv[k8][2]))+d2>0 || GlobalVariableGet(gv[k8][2])==0))      
{GlobalVariableSet(gv[k8][2],NormalizeDouble(OrderOpenPrice()+z0*d2,Digits())); OTicket[k8][1]=0;}}

// Trailing stop ******************************************************************************************************** 
if (TrailingStop>0) {d1=CalcValue(TrailingStopType,TrailingStop,t0); d2=CalcValue(TrailingStartType,TrailingStart,t0); d3=CalcValue(TrailingStepType,TrailingStep,t0);
if (z0*(Timi[t0]-OrderOpenPrice())-d1>=0 && z0*(Timi[t0]-OrderOpenPrice())-d2>=0 && (z0*(Timi[t0]-GlobalVariableGet(gv[k8][2]))-d1-d3>=0 || GlobalVariableGet(gv[k8][2])==0))
{GlobalVariableSet(gv[k8][2],NormalizeDouble(Timi[t0]-z0*d1,Digits())); OTicket[k8][1]=0;}}

// Order close at signal ***************************************************************************************
t7=0; t7+=((t7==0 && GlobalVariableGet(gv[k8][6])==OrderTicket())*GlobalVariableGet(gv[k8][8]));
if (OTime[13]>0) {if (!TradingTime[4] && GlobalVariableGet(gv[k8][5])==0) 
{t7+=(t7==0 && ((OProfit[k8][0]>=0 && FridayCloseTrades==1) || (OProfit[k8][0]<0 && FridayCloseTrades==2) || FridayCloseTrades==3))*36;} 
GlobalVariableSet(gv[k8][5],(!TradingTime[4]));}
t7+=(t7==0 && ExitSignal[3][e2][t0+z0*ReverseSignals] && iTime(Symbol(),PERIOD_CURRENT,0)>OrderOpenTime() && (OProfit[k8][0]>=0 || !CloseOnProfit))*e2;
t7+=(t7==0 && !PastExit(31) && GlobalVariableGet(gv[k8][1])>0 && z0*(Timi[t0]-GlobalVariableGet(gv[k8][1]))>=0)*31;
t7+=(t7==0 && GlobalVariableGet(gv[k8][2])>0 && z0*(GlobalVariableGet(gv[k8][2])-Timi[t0])>=0)*32;
t7+=(t7==32 && z0*(GlobalVariableGet(gv[k8][2])-OrderOpenPrice())>=0);
d2=0; t1=1; while (Time[t1]>OrderOpenTime() && Dot[1][6][2] && d2==0) {d1=(t0==1)*Low[t1]+(t0==2)*High[t1]; d2=(z0*(d1-Ind[t1][0][6])>=0)*Ind[t1][0][6]; t1++;}
t7+=(t7==0 && !PastExit(6) && Dot[1][6][2] && d2>0 && z0*(d2-OrderOpenPrice())>0 && z0*(d2-Timi[t0])>=0)*6; // PSAR
t7+=(t7==0 && !PastExit(7) && Dot[1][7][2] && Ind[1][3-t0][7]>0 && z0*(Ind[1][3-t0][7]-OrderOpenPrice())-CalcValue(0,FractalBreakevenTrigger,t0)>0 && 
z0*(Ind[1][3-t0][7]-Timi[t0])-CalcValue(0,1,t0)>=0)*7; // Fractal
t7+=(t7==0 && !PastExit(10) && Dot[1][10][2] && GlobalVariableGet(gv[k8][30])>0 && z0*(Timi[t0]-GlobalVariableGet(gv[k8][30]))>=0)*10; // Spike
t7+=(t7==0 && !PastExit(11) && Dot[1][11][2] && GlobalVariableGet(gv[k8][31])>0 && z0*(Timi[t0]-GlobalVariableGet(gv[k8][31]))>=0)*11; // RRProfit
t7+=(t7==0 && OProfit[k8][0]>=0 && TimeCurrent()-OrderOpenTime()-CloseProfitableAfterMinutes*PeriodSeconds(PERIOD_M1)>=0 && CloseProfitableAfterMinutes>0 && GlobalVariableGet(gv[k8][20])==0)*34;
t7+=(t7==0 && OProfit[k8][0]<0 && TimeCurrent()-OrderOpenTime()-CloseLosingAfterMinutes*PeriodSeconds(PERIOD_M1)>=0 && CloseLosingAfterMinutes>0 && GlobalVariableGet(gv[k8][21])==0)*35;
if (TimeCurrent()-OrderOpenTime()-CloseProfitableAfterMinutes*PeriodSeconds(PERIOD_M1)>=0 && CloseProfitableAfterMinutes>0) {GlobalVariableSet(gv[k8][20],1);}
if (TimeCurrent()-OrderOpenTime()-CloseLosingAfterMinutes*PeriodSeconds(PERIOD_M1)>=0 && CloseLosingAfterMinutes>0) {GlobalVariableSet(gv[k8][21],1);}

if (t7>0) {d1=0; t1=GlobalVariableGet(gv[k8][3])+1;
if (PartialClose[t1]>0) {d1=MarketInfo(Symbol(),MODE_LOTSTEP)*MathRound(OrderLots()*PartialClose[t1]*0.01/MarketInfo(Symbol(),MODE_LOTSTEP)); d1=MathMin(d1,OrderLots());}
d2=(t7==31)*TakeProfitPartialClose+(t7==6)*PSARPartialClose+(t7==7)*FractalPartialClose+(t7==10)*SpikePartialClose+(t7==11)*RRProfitPartialClose;
if (d2>0) {d1=MarketInfo(Symbol(),MODE_LOTSTEP)*MathRound(GlobalVariableGet(gv[k8][39])*d2*0.01/MarketInfo(Symbol(),MODE_LOTSTEP)); d1=MathMin(d1,OrderLots());}
if (t7==e2 || t7==32 || t7==33 || t7==34 || t7==35 || t7==36) {d1=OrderLots();}
t5=0; if (d1>0) {GlobalVariableSet(gv[k8][7],d1); GlobalVariableSet(gv[k8][6],OrderTicket()); GlobalVariableSet(gv[k8][8],t7);
RefreshRates(); SymbolInfoTick(Symbol(),LastTick); Timi[1]=LastTick.bid; Timi[2]=LastTick.ask; b1=OrderClose(OrderTicket(),d1,Timi[t0],Slippage0,Colour[t0]);}}

VisibleTPSL(k8);}} t9--;}

// Check closed trades ****************************************************************************************
t9=OrdersHistoryTotal()-1; while(t9>=0) {if (OrderSelect(t9,SELECT_BY_POS,MODE_HISTORY) && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
{t8=0; t1=1; while (t1<=Vi[30][1] && t8==0) {t8=(OrderTicket()==MathRound(GlobalVariableGet(gv[t1][0])))*t1; t1++;}
if (t8>0) {t1=(GlobalVariableGet(gv[t8][8])+(MathRound(GlobalVariableGet(gv[t8][8]))==0)*39);
if (StringFind(OrderComment(),"[tp]")!=-1) {t1=31;} if (StringFind(OrderComment(),"[sl]")!=-1) {t1=32;}
CloseEvent(t1,(StringFind(OrderComment(),"from #",0)<0 && StringFind(OrderComment(),Vs[30][4])==-1),t8);}
if (OrderCloseTime()+PeriodSeconds(PERIOD_H1)>=OTime[22]) {s2=StringConcatenate(OrderTicket(),"close"); if (GlobalVariableGet(s2)==0) 
{GlobalVariableSet(s2,1); OrderAlert(2,OrderType()+1,OrderTicket(),OrderClosePrice());}}} t9--;}

// Order opening at signal ****************************************************************************************
if (TradingTime[0] && Vi[0][1]>0) {t1=1; while(t1<=2) {t5=t1+(3-t1*2)*ReverseSignals; 
if (EntrySignal[3][0][t5] && Timi[4]>=(Timi[4]>0)*(Ask-Bid)) {if (SessionOrders(t1) && OrderDistance(t1)) 
{RefreshRates(); SymbolInfoTick(Symbol(),LastTick); Timi[1]=LastTick.bid; Timi[2]=LastTick.ask;
b1=OrderSend(Symbol(),t1-1,CalcLots(t1),Timi[3-t1],Slippage0,0,0,Vs[30][4],MagicNumber,0,Colour[t1]);}} t1++;}}

// Close all trades ****************************************************************************************
t1=1; while(t1<=2) {t7=CloseOneDirection*t1; d1=OProfit[0][t1]+(!CloseOneDirection)*OProfit[0][3-t1];
t6=((CloseAllLoss<=MathAbs(d1*100/AccountBalance()) && d1<0 && CloseAllLoss>0) || (CloseAllProfit<=d1*100/AccountBalance() && CloseAllProfit>0)); 
if (t6>0) {CloseAll(t7,3);} t1++;} ScreenInfo(); return(0);}

//Functions *********************************************************************************************************************
void CalcInd(int x5,int x6,int x7)
{int t1,t2;

if (x7==1 && x6==0) {t1=1; while(t1<=MaxPatternCandles0*2) {Ind[t1][x6][x7]=iCustom(Symbol(),Vi[x7][5],"TVI",r,s,u,x6,t1); t1++;}} 
if (x7==2 && x6==0) {Ind[x5][x6][x7]=iCCI(Symbol(),Vi[x7][5],CCI_Period,CCI_applied_price,x5);}
if (x7==3 && x6==0) {Ind[x5][x6][x7]=iCustom(Symbol(),Vi[x7][5],"T3MA-Basic",T3_period,T3_b,T3_maxbars,x6,x5);}
if (x7==4 && x6>=0 && x6<=1) {Ind[x5][x6][x7]=iCustom(Symbol(),Vi[x7][5],"GannHiLo-Histo",period,x6,x5);}
if (x7==5 && x6==1 && x5==1) {FindPattern(x5+1);}
if (x7==6 && x6==0) {t1=1; while(t1<=1000) {Ind[t1][x6][x7]=iSAR(Symbol(),Vi[x7][5],PSAR_step,PSAR_maximum,t1); t1++;}}
if (x7==7 && x6>=1 && x6<=2 && x5==1) {t2=0; t1=1; while(t2==0) {t2=(iFractals(Symbol(),Vi[x7][5],x6,t1)>0)*t1; t1++;}
Ind[x5][x6][x7]=iFractals(Symbol(),Vi[x7][5],x6,t2);}

}

void FindPattern(int x7)
{int t0,t1,t2,t3,t4,t5,t7,t9,l[200];

t1=1; while(t1<=2) {t5=3-t1*2; t0=3-t1; SessionOrders(t0); if (CheckOpenTrades(t0)==0) {ArrayInitialize(l,0);

t4=0; t2=x7; while(t2<=MathMin(x7+MaxPatternCandles0,ArraySize(Time)-1)) {if (IndSwing(t2,t1)) {t4+=1; l[t4]=t2;} t2++;}

t7=0; t2=2; while(t2<=t4 && t7==0 && l[1]==x7) {if (IndLine(l[1],l[t2],t1) && l[t2]-l[1]+1>=MinPatternCandles0 && l[t2]>0) 
{t3=l[1]+(l[t2]-l[1])*0.5; t9=l[1]; while(t9<t3 && t7==0) {MinZZPatternBars=MathMax(l[t2]-t9,MinPatternCandles0);
if (SwingPattern(t9,t1)) {t7=CheckDiv(l[1],l[t2],(t2==2),t1); t7*=(Ti[t1][k1]-l[1]>=0 && Ti[t1][1]-l[t2]+1>=0); if (t7>0) {l[2]=l[t2];}} t9++;}} t2++;}

if (t7==0) {ArrayInitialize(l,0); 
l[1]=x7; t4=1; t2=x7+1; while(t2<=MathMin(x7+MaxPatternCandles0,ArraySize(Time)-1)) {if (SlopeLine(x7,t2,t1)) {t4+=1; l[t4]=t2;} t2++;}

t7=0; t2=2; while(t2<=t4 && t7==0 && l[1]==x7) {if (l[t2]-l[1]+1>=MinPatternCandles0 && l[t2]>0) 
{t3=l[1]+(l[t2]-l[1])*0.5; t9=l[1]; while(t9<t3 && t7==0) {MinZZPatternBars=MathMax(l[t2]-t9,MinPatternCandles0);
if (SwingPattern(t9,t1)) {t7=CheckDiv(l[1],l[t2],true,t1); t7*=(Ti[t1][k1]-l[1]>=0 && Ti[t1][1]-l[t2]+1>=0); if (t7>0) {l[2]=l[t2];}} t9++;}} t2++;}}

if (t7>0 && Time[Ti[t1][k1]]!=Vi[t1+34][k1]) {DivType[t1]=t7; Ti[t1][k1+1]=l[1]; Ti[t1][k1+2]=l[2];
if (PatternClosedTrades[t0]==0) {Vs[30][t1+30]=StringConcatenate(TimeToString(Vi[t1+34][k1])," ",t1);} 

t2=1; while(t2<=k1+2) {Vi[t1+34][t2]=Time[Ti[t1][t2]]; t2++;}

t2=1; while(t2<=k1) {t4=(Vi[t1+34][t2]>0)*iBarShift(Symbol(),PERIOD_CURRENT,Vi[t1+34][t2]); 
Vd[t1+34][t2]=(Vi[t1+34][t2]>0)*((t1==1)*High[t4]+(t1==2)*Low[t4]); t2++;} 
t2=1; while(t2<=2) {Vd[t1+34][k1+t2]=Ind[Ti[t1][k1+t2]][0][1]; t2++;} DrawGraphics(t1,0);

if (x7==1) {OrderAlert(1,0,0,0-t1);}}}
if (x7<iBarShift(Symbol(),PERIOD_CURRENT,Vi[t1+34][k1+1])-CancelPatternCandles-1) {DivType[t1]=0;}
t1++;}}

bool SwingPattern(int x7,int x8)
{int t1,t3,t4;
bool b1;

t1=1; while(t1<=k1+2) {Ti[x8][t1]=0; t1++;} 
t3=k1; t1=x7; while(t3>=1 && t1<=MathMin(x7+MaxPatternCandles0,ArraySize(Time)-1) && (Ti[x8][k1]==x7 || t1==x7) && Ti[x8][1]==0) 
{if (SwingPoint(x8,t1)>0) {Ti[x8][t3]=t1; if (t3==1) {t4=t1-Ti[x8][k1]+1; 
Ti[x8][t3]*=(SwingLine(Ti[x8][k1],t1,x8) && t4>=MinZZPatternBars && t4<=MaxPatternCandles0);} 
t3-=(Ti[x8][t3]>0 && t3>1)*2;} t1++;} b1=(Ti[x8][1]>0);
return(b1);}

int ZZPattern(int x7,int x8)
{int t0,t1,t2,t3,t4,t5,l[200];
ArrayInitialize(l,0);

t1=1; while(t1<=k1+2) {Ti[x8][t1]=0; Ti[x8+2][t1]=0; t1++;} t1=1; while(t1<=k1+2)
{l[t1]=(int)StringToInteger(StringSubstr(Vs[0][1],t1-1,1)); t1++;}

t1=x7; t3=k1; while(t3>=1 && t1<=MathMin(x7+MaxPatternCandles0,ArraySize(Time)-1) && (Ti[x8][k1]==x7 || t1==x7)) 
{t4=k1-t3+1; t0=x8+(3-x8*2)*(MathRound(t4*0.5)==t4*0.5); 
if (SwingPoint(t0,t1)>0) {t2=(t3<k1-1)*(Ti[x8][t3+1]+1)+(t3>=k1-1)*x7; t4=Ti[x8][t3+1]+1; t5=Ti[x8][t3+2]+EqualHL(t0,Ti[x8][t3+2]);
if (((PointsDist(t1,t3,x8,t0)) || t3==k1)
&& ((t0==1 && (High[t1]>High[ArrayMaximum(High,MathMax(t1-t2,1),t2)] || t1-t2<=0 || t3==k1) 
&& (Low[Ti[x8][t3+1]]<=Low[ArrayMinimum(Low,MathMax(t1-t4,1),t4)] || t1-t4<=0 || t3==k1) 
&& ((3-2*x8)*(3-l[t3]*2)*(High[t1]-High[Ti[x8][t3+2]])>0 || l[t3]==0 || t3>=k1-1) 
&& (MathMax(High[t1],High[Ti[x8][t3+2]])>High[Ti[x8][t3+1]] || t1-Ti[x8][t3+1]<=0 || Ti[x8][t3+1]-t5<=0 || t3>=k1-1))
|| (t0==2 && (Low[t1]<Low[ArrayMinimum(Low,MathMax(t1-t2,1),t2)] || t1-t2<=0 || t3==k1) 
&& (High[Ti[x8][t3+1]]>=High[ArrayMaximum(High,MathMax(t1-t4,1),t4)] || t1-t4<=0 || t3==k1) 
&& ((3-2*x8)*(3-l[t3]*2)*(Low[t1]-Low[Ti[x8][t3+2]])>0 || l[t3]==0 || t3>=k1-1)
&& (MathMin(Low[t1],Low[Ti[x8][t3+2]])<Low[Ti[x8][t3+1]] || t1-Ti[x8][t3+1]<=0 || Ti[x8][t3+1]-t5<=0 || t3>=k1-1)))) 
{Ti[x8][t3]=t1;}} 

t1+=(Ti[x8][t3]==0); if (t1>=MaxPatternCandles0+x7 && Ti[x8][t3]==0 && t3<k1) {if (Ti[x8+2][t3]==0) {t2=k1; while(t2>t3) {Ti[x8+2][t2]=Ti[x8][t2]; t2--;}}
t1=Ti[x8][t3+1]+1; Ti[x8][t3+1]=0; t3++;} t3-=(Ti[x8][t3]>0);}
t1=1; if (Ti[x8][1]==0) {t1=0; t2=2; while(t2<=k1) {t1+=(t1==0 && Ti[x8+2][t2]>0)*t2; Ti[x8][t2]=Ti[x8+2][t2]; t2++;}} // t2

return(t1);}

bool PointsDist(int x1,int x3,int x8,int x0)
{bool b1;
double d1,d2,d3;

d1=(x0==1)*High[x1]+(x0==2)*Low[x1]; d2=(x0==1)*Low[Ti[x8][x3+1]]+(x0==2)*High[Ti[x8][x3+1]]; d3=MathAbs(d1-d2)/(mult*Point()); 
b1=(d3>=Vd[40][x3]/*MinHeight*/ && (d3<=Vd[41][x3]/*MaxHeight*/ || Vd[41][x3]==0)); 
b1=(b1 && (x1-Ti[x8][x3+1]>=Vi[40][x3]/*MinSwingBars*/ && (x1-Ti[x8][x3+1]<=Vi[41][x3]/*MaxSwingBars*/ || Vi[41][x3]==0)));
if (x3==1) {b1=(b1 && SwingLine(Ti[x8][k1],x1,x0));}
if (x3==1 && MinZZPatternBars>0) {b1=(b1 && x1-Ti[x8][k1]+1>=MinZZPatternBars);}
return(b1);}

int CheckDiv(int x1,int x2,bool x3,int x0)
{int t1,t2,t3,t4,t5,t6,l[200];
bool b1;
double d1,d2,d3,d4;

t5=3-x0*2; t3=MathMax(x1,x2); t4=MathMin(x1+(x1==0)*x2,x2+(x2==0)*x1); t1=Ti[x0][1]; t2=Ti[x0][k1]; 
b1=(IndSwing(t3,x0) && IndSwing(t4,x0)); 
l[1]=(b1 && x3 && RegularConsecutive); l[2]=(b1 && !x3 && RegularNonConsecutive)*2;
l[3]=(b1 && x3 && HiddenConsecutive)*3; l[4]=(!b1 && SlopeDivergence)*4;
d1=(x0==1)*High[t1]+(x0==2)*Low[t1]; d2=(x0==1)*High[t2]+(x0==2)*Low[t2];  
d3=Ind[t3][0][1]; d4=Ind[t4][0][1]; 
t6=(t5*(d2-d1)>0 && t5*(d3-d4)>0)*(l[1]+l[2]); // regular
t6+=(t6==0 && (t5*(d1-d2)>0 && t5*(d4-d3)>0))*l[3]; // hidden
t6+=(t6==0 && (t5*(d2-d1)>0 && t5*(d3-d4)>0))*l[4]; // slope

return(t6);}

bool SwingLine(int x1,int x2,int x0)
{int t1,t3,t4;
bool b1=true;
double d1,d2,d3,d4;

t3=MathMin(x1+(x1==0)*x2,x2+(x2==0)*x1); t4=MathMax(x1,x2); d3=(x0==1)*High[t3]+(x0==2)*Low[t3]; d4=(x0==1)*High[t4]+(x0==2)*Low[t4];
if (t3<t4) {d1=(d3-d4)/(t4-t3); t1=t3+1; while(t1<=t4-1 && b1) {d2=(x0==1)*Close[t1]+(x0==2)*Close[t1];
b1=((3-x0*2)*(d3-d1*(t1-t3)-d2)>=0); t1++;}} return(b1);}

bool SlopeLine(int x1,int x2,int x0)
{int t1,t3,t4;
bool b1=true;
double d1;

t3=MathMin(x1+(x1==0)*x2,x2+(x2==0)*x1); t4=MathMax(x1,x2); b1=((3-x0*2)*Ind[t3][0][1]>0 && (3-x0*2)*Ind[t4][0][1]>0);
if (t3<t4) {d1=(Ind[t3][0][1]-Ind[t4][0][1])/(t4-t3);
t1=t3-1; while(t1<=t4+1 && b1) {b1=((3-x0*2)*(Ind[t3][0][1]-d1*(t1-t3)-Ind[t1][0][1])>0 || t1==t3 || t1==t4); t1++;}} 
return(b1);}

bool IndLine(int x1,int x2,int x0)
{int t1,t3,t4;
bool b1=true;
double d1,d2;

t3=MathMin(x1+(x1==0)*x2,x2+(x2==0)*x1); t4=MathMax(x1,x2);
if (t3<t4) {d1=(Ind[t3][0][1]-Ind[t4][0][1])/(t4-t3);
t1=t3+1; while(t1<=t4-1 && b1) {d2=Ind[t3][0][1]-d1*(t1-t3);
b1=((3-x0*2)*(d2-Ind[t1][0][1])>=0); t1++;}} return(b1);}

bool IndSwing(int x7,int x0)
{int t1,t3;
bool b1;

t3=0; t1=x7+1; while(t3==0 && ((3-x0*2)*(Ind[x7][0][1]-Ind[x7-1][0][1])>0 || x7<=1) && t1<=ArraySize(Time)-1) 
{t3=(((3-x0*2)*(Ind[x7][0][1]-Ind[t1][0][1])>0)-((3-x0*2)*(Ind[t1][0][1]-Ind[x7][0][1])>0)); t1++;} 
b1=(t3>0 && (3-x0*2)*Ind[x7][0][1]>0); return(b1);}

double SwingPoint(int x1,int x7)
{int t1,t3;
double d5;

t3=0; t1=x7+1; while(t3==0 && ((x1==1 && High[x7]>High[x7-1]) || (x1==2 && Low[x7]<Low[x7-1]) || x7<=1) && t1<=ArraySize(Time)-1) 
{t3=(((x1==1 && High[x7]>High[t1]) || (x1==2 && Low[x7]<Low[t1]))-((x1==1 && High[x7]<High[t1]) || (x1==2 && Low[x7]>Low[t1]))); t1++;} 
d5=(t3>0)*((x1==1)*High[x7]+(x1==2)*Low[x7]); return(d5);}

int EqualHL(int x1,int x7)
{int t1;

t1=x7+1; while((x1==1 && High[x7]==High[t1]) || (x1==2 && Low[x7]==Low[t1])) {t1++;} return(t1-x7-1);}

double Swing(int x6,int x7)
{int t1,t5;
double d5;

t5=0; t1=x7+1; while(t5==0 && ((x6==1 && iHigh(Symbol(),PERIOD_CURRENT,x7)>iHigh(Symbol(),PERIOD_CURRENT,x7-1)) || (x6==2 && iLow(Symbol(),PERIOD_CURRENT,x7)<iLow(Symbol(),PERIOD_CURRENT,x7-1)) || x7==0)) 
{t5=(((x6==1 && iHigh(Symbol(),PERIOD_CURRENT,x7)>iHigh(Symbol(),PERIOD_CURRENT,t1)) || (x6==2 && iLow(Symbol(),PERIOD_CURRENT,x7)<iLow(Symbol(),PERIOD_CURRENT,t1)))-((x6==1 && iHigh(Symbol(),PERIOD_CURRENT,x7)<iHigh(Symbol(),PERIOD_CURRENT,t1)) || (x6==2 && iLow(Symbol(),PERIOD_CURRENT,x7)>iLow(Symbol(),PERIOD_CURRENT,t1)))); t1++;} 
d5=(t5>0)*((x6==1)*iHigh(Symbol(),PERIOD_CURRENT,x7)+(x6==2)*iLow(Symbol(),PERIOD_CURRENT,x7)); return(d5);}

void RemoveObjects(string r6)
{int t1;

t1=ObjectsTotal(); while(t1>=0) {if (StringFind(ObjectName(t1),r6,0)>-1) {ObjectDelete(0,ObjectName(t1));} t1--;}}

void DrawText(string r6,string r7,datetime x6,double f7,int x5,string r8,color x3,int x7)
{if (r7=="" && ObjectFind(0,r6)!=-1) {ObjectDelete(0,r6);}
if (r7!="") {if (ObjectFind(0,r6)==-1) {ObjectCreate(0,r6,OBJ_TEXT,0,0,0);} ObjectSetString(0,r6,OBJPROP_TEXT,r7); ObjectSetInteger(0,r6,OBJPROP_TIME,x6); 
ObjectSetDouble(0,r6,OBJPROP_PRICE,f7); ObjectSetInteger(0,r6,OBJPROP_FONTSIZE,x5); ObjectSetString(0,r6,OBJPROP_FONT,r8); ObjectSetInteger(0,r6,OBJPROP_COLOR,x3); 
ObjectSetInteger(0,r6,OBJPROP_ANCHOR,x7);}}

void DrawArrow(string r6,ENUM_OBJECT x1,datetime x6,double f7,color x3)
{if (ObjectFind(0,r6)==-1) {ObjectCreate(0,r6,x1,0,0,0);}
ObjectSetInteger(0,r6,OBJPROP_TIME,x6); ObjectSetDouble(0,r6,OBJPROP_PRICE,f7); ObjectSetInteger(0,r6,OBJPROP_COLOR,x3);}

void DrawTrendLine(string r6,int x1,datetime x6,double f6,datetime x7,double f7,color x3,int x4,int x5)
{if (x6==0 && x7==0 && ObjectFind(0,r6)!=-1) {ObjectDelete(0,r6);}
if (x6>0 || x7>0) {if (ObjectFind(0,r6)==-1) {ObjectCreate(0,r6,OBJ_TREND,x1,0,0,0,0); ObjectSetInteger(0,r6,OBJPROP_RAY,false);} 
ObjectSetInteger(0,r6,OBJPROP_TIME,x6); ObjectSetInteger(0,r6,OBJPROP_TIME,1,x7); ObjectSetDouble(0,r6,OBJPROP_PRICE,f6); ObjectSetDouble(0,r6,OBJPROP_PRICE,1,f7); 
ObjectSetInteger(0,r6,OBJPROP_COLOR,x3); ObjectSetInteger(0,r6,OBJPROP_STYLE,x4); ObjectSetInteger(0,r6,OBJPROP_WIDTH,x5);}}

void DrawGraphics(int x1,int x8)
{int t2,t3,t6;
double d1;
string s1,s5,s7;

if (DivType[x1]>0 && ShowLines0) {if (Vs[30][x1+30]!="") {RemoveObjects(Vs[30][x1+30]); Vs[30][x1+30]="";}

t2=1; while (t2<=k1+2) {Ti[0][t2]=(x8>0)*GlobalVariableGet(gv[x8][t2+60])+(x8==0)*Vi[x1+34][t2];
Td[0][t2]=(x8>0)*GlobalVariableGet(gv[x8][t2+70])+(x8==0)*Vd[x1+34][t2]; t2++;}
s5=StringConcatenate(TimeToString(Ti[0][k1])," ",x1);
s7=StringConcatenate(s5," divergence"); DrawTrendLine(s7,0,Ti[0][1],Td[0][1],Ti[0][3],Td[0][3],Colour[3-x1],0,1);
s7=StringConcatenate(s5," divergence type"); t6=((x1==1)*ANCHOR_LEFT_LOWER+(x1==2)*ANCHOR_LEFT_UPPER); 
d1=(x1==1)*MathMax(Td[0][1],Td[0][k1])+(x1==2)*MathMin(Td[0][1],Td[0][k1]);
DrawText(s7,Vs[32][DivType[x1]+50],Ti[0][1],d1,10,"Segoe UI",Colour[3-x1],t6);

s1=StringConcatenate("TVI(",r,",",s,",",u,")"); t3=ChartWindowFind(0,s1); s7=StringConcatenate(s5," TVI");
if (t3>0) {DrawTrendLine(s7,t3,Ti[0][k1+2],Td[0][k1+2],Ti[0][k1+1],Td[0][k1+1],Colour[3-x1],0,1);}}}

double CalcValue(int x7,double f8,int x8)
{int t0,t1;
double d1;

t1=0-x8; t0=/*(x8>0)*(OrderType()+1)+*/(x8<0)*(t1+(3-t1*2)*0); d1=(x8<0)*Vd[37-t0][k1+x7]; //+(x8>0)*GlobalVariableGet(gv[x8][k1+x7+70]);
return(NormalizeDouble(f8*((x7==0)*mult*Point()/*+(x7==1)*ATR[1]+(x7>=2)*d1)*/),Digits()));}

double CalcStopLoss(int x6)
{int t0,t1,t4,t5,t6;
double d1,d2,d3,d4,d5,d6,d9;

t0=(x6>0)*(OrderType()+1)-(x6<0)*x6; t5=3-t0*2; d4=(x6>0)*OrderOpenPrice()+(x6<0)*Timi[3-t0]; 
d1=CalcValue(StopLossType,StopLoss,t0); d5=(t0==2)*(Ask-Bid); d3=0; t1=2; while(t1<=50 && d3==0) {d3=Swing(3-t0,t1); t1++;} 
d3=(t0==1)*iLow(Symbol(),PERIOD_CURRENT,iLowest(Symbol(),PERIOD_CURRENT,1,t1,0))+(t0==2)*iHigh(Symbol(),PERIOD_CURRENT,iHighest(Symbol(),PERIOD_CURRENT,2,t1,0)); 
d2=d4;
if (SwingSL0) {d1=CalcValue(0,PipsAddedToSL,t0); d2=d3+d5; d9=t5*(d4-d2)+d1; if (d9<CalcValue(0,MinimumSLPips,t0)) {d2=d4; d1=CalcValue(0,MinimumSLPips,t0);} 
if (d9>CalcValue(0,MaximumSLPips,t0) && MaximumSLPips>0) {d2=d4; d1=CalcValue(0,MaximumSLPips,t0);}} 
if (ZeroLevelSL0) {d1=CalcValue(0,PipsAddedToSL,t0);
t4=1+(mult==10); t6=t0*2-3; d9=NormalizeDouble(d3,Digits()-t4); d9+=(t6*(d3-d9)>=0)*t6*Point()*MathPow(10,t4); d9+=d5; d2=d9; d9=t5*(d4-d9)+d1;
if (d9<CalcValue(0,MinimumSLPips,t0)) {d2=d4; d1=CalcValue(0,MinimumSLPips,t0);} 
if (d9>CalcValue(0,MaximumSLPips,t0) && MaximumSLPips>0) {d2=d4; d1=CalcValue(0,MaximumSLPips,t0);}}

d6=d2-t5*d1; return(d6);}

int CheckOpenTrades(int x1)
{int t7=0,t9;

t7=0; t9=OrdersTotal()-1; while(t9>=0 && t7==0)
{if (OrderSelect(t9,SELECT_BY_POS,MODE_TRADES) && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber) 
{t7+=(OrderType()+1==x1 || (x1!=1 && x1!=2));} t9--;} return(t7);}

bool SessionOrders(int x6)
{int t0,t3,t4,t6,t7,t9;
bool b1;

t0=3-x6; PatternClosedTrades[x6]=0;
t9=OrdersTotal()-1; while(t9>=0) {if (OrderSelect(t9,SELECT_BY_POS,MODE_TRADES) && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
{t3+=(OrderOpenTime()>=Vt[30][2]); t6+=(OrderType()+1==x6); t7+=(OrderType()+1==3-x6);} t9--;} 

t9=OrdersHistoryTotal()-1; while(t9>=0)
{if (OrderSelect(t9,SELECT_BY_POS,MODE_HISTORY) && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber && (StringFind(OrderComment(),"from #",0)>=0 || StringFind(OrderComment(),Vs[30][4])>=0))
{t3+=(OrderOpenTime()>=Vt[30][2]); t4+=(OrderOpenTime()>=iTime(Symbol(),PERIOD_CURRENT,0) && OrderType()+1==x6 && Vt[30][3]>0);} 
PatternClosedTrades[x6]+=(OrderOpenTime()>Vi[t0+34][k1] && OrderType()+1==x6); t9--;}
b1=((t3<TradesPerSession || TradesPerSession==0) && t4==0 && t6<TradesPerDirection0 && (t7==0 || Hedge) && PatternClosedTrades[x6]==0);

return(b1);}

bool OrderDistance(int x6)
{int t2,t3,t4,t5,t9;
double d1,d5;

d5=CalcValue(MinOrdersDistanceType,MinOrdersDistance,x6); d1=0; t2=1; t3=0; t4=0; t5=0; t9=OrdersTotal()-1; while(t9>=0)
{if (OrderSelect(t9,SELECT_BY_POS,MODE_TRADES) && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber && OrderType()+1==x6 && OrderOpenTime()>t3)
{t3=OrderOpenTime(); d1=OrderOpenPrice();} t9--;} 
if (d1>0) {t5=(3-x6*2)*(NewHighLow*2-3); t2=((MathAbs(d1-Timi[3-x6])>=d5 || d5==0) && (t5*(d1-Timi[3-x6])>0 || NewHighLow==0));
t2*=(iTime(Symbol(),PERIOD_CURRENT,0)-iTime(Symbol(),PERIOD_CURRENT,iBarShift(Symbol(),PERIOD_CURRENT,t3,false))>=Vt[30][3]);} return(t2);}

double LotDecimals(double f8)
{return(MarketInfo(Symbol(),MODE_LOTSTEP)*MathRound(MathMin(MathMax(f8,MarketInfo(Symbol(),MODE_MINLOT)),MarketInfo(Symbol(),MODE_MAXLOT))/MarketInfo(Symbol(),MODE_LOTSTEP)));}

double CalcLots(int x6)
{int t3,t7;
double d1,d2;

d1=Lots0; if (MoneyManagement0) {if (BalancePercent0>0) {d1=AccountBalance()*BalancePercent0/Vd[0][0];}
if (StopLossRisk0>0) {d2=(3-x6*2)*(Timi[3-x6]-CalcStopLoss(0-x6)); d1=AccountBalance()*StopLossRisk0*0.01/(d2*(MarketInfo(Symbol(),MODE_TICKVALUE)/MarketInfo(Symbol(),MODE_TICKSIZE)));}}
if (Trade[x6]==0) {GlobalVariableSet(gv[0][x6+50],0);} if (LotPercent!=0) {t7=GlobalVariableGet(gv[0][x6+50]);  
if (t7>0) {t3=(t7-StartProgression0+2); t3=(t3>0)*MathMin(t3,MaxProgression0-StartProgression0+1); d2=GlobalVariableGet(gv[0][x6+52]); d1=d2*(1+t3*LotPercent*0.01);}}
d1=LotDecimals(d1); if (Trade[x6]==0) {GlobalVariableSet(gv[0][x6+52],d1);} return(d1);}

int FindSeat(int x7)
{int t0,t1,t2,t5,t8;
bool b1;
double d1;

t8=0; t1=1; while (t1<=200 && t8==0) {t8=(x7==GlobalVariableGet(gv[t1][0]))*t1; t1++;}
if (t8==0 && StringFind(OrderComment(),Vs[30][4])>=0) {t1=1; while (t1<=200 && t8==0) 
{t8=(GlobalVariableGet(gv[t1][0])==0 && GlobalVariableGet(gv[t1][59])==0)*t1; t1++;}
if (t8>0) {t1=1; while (t1<=200) {if (GlobalVariableGet(gv[t1][59])>0 && GlobalVariableGet(gv[t1][59])+14400<OTime[22]) {t2=1; while (t2<=10) 
{GlobalVariableSet(gv[t1][t2+50],0); t2++;}} t1++;}
t1=0; while (t1<=50) {GlobalVariableSet(gv[t8][t1],0); t1++;} b1=OrderSelect(x7,SELECT_BY_TICKET); t0=OrderType()+1; t5=3-t0*2;
if (GlobalVariableGet(gv[t8][2])==0 && (StopLoss>0 || SwingSL0 || ZeroLevelSL0)) {GlobalVariableSet(gv[t8][2],CalcStopLoss(t8));}
d1=(GlobalVariableGet(gv[t8][2])>0)*t5*(OrderOpenPrice()-GlobalVariableGet(gv[t8][2]));
if (GlobalVariableGet(gv[t8][30])==0 && SpikePipsRiskedMultiplier>0 && d1-CalcValue(0,MinSpikePipsRisked,t0)>=0 && d1>0) 
{GlobalVariableSet(gv[t8][30],OrderOpenPrice()+t5*d1);}
if (GlobalVariableGet(gv[t8][31])==0 && RRProfitMultiplier>0 && d1>0) {GlobalVariableSet(gv[t8][31],OrderOpenPrice()+t5*d1);}
GlobalVariableSet(gv[t8][39],OrderLots());
if (LotPercent!=0) {t1=GlobalVariableGet(gv[0][t0+50]); GlobalVariableSet(gv[0][t0+50],t1+1);} GlobalVariableSet(gv[t8][0],x7);
Vi[30][1]=0; t1=1; while(t1<=200) {Vi[30][1]=MathMax(Vi[30][1],(GlobalVariableGet(gv[t1][0])>0 || GlobalVariableGet(gv[t1][60])>0)*t1); t1++;}}} return(t8);}

int FindTicket(int x7)
{int t3,t4,t9;
bool b1;
string s1;

t3=0; s1=StringConcatenate("#",x7); t4=StringLen(s1); t9=OrdersTotal()-1; while(t9>=0 && t3==0)
{if (OrderSelect(t9,SELECT_BY_POS,MODE_TRADES) && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber)
{t3=((StringSubstr(OrderComment(),StringLen(OrderComment())-t4,t4)==s1)*OrderTicket());} t9--;} b1=OrderSelect(x7,SELECT_BY_TICKET); return(t3);}

void VisibleTPSL(int x8)
{int t0,t1,t5;
double d1,d2,d3,d4,d5,d7,d8;

if (OTicket[x8][1]!=OrderTicket()) {OTicket[x8][1]=OrderTicket(); t0=OrderType()+1; t5=3-t0*2; d5=Timi[3]+MarketInfo(Symbol(),MODE_STOPLEVEL)*Point();
d1=0; t1=4; while (t1>=1 && d1==0) {d1=GlobalVariableGet(gv[x8][t1+10]); t1--;} d1=(d1>0)*t5*(d1-OrderOpenPrice()); d1*=VisibleTP;
d2=(GlobalVariableGet(gv[x8][2])>0)*MathAbs(OrderOpenPrice()-GlobalVariableGet(gv[x8][2]))*VisibleSL;
d7=OrderTakeProfit(); d3=OrderOpenPrice()+t5*d1; if (d1>0 && d3!=d7) {d4=Timi[t0]+t5*d5; d7=NormalizeDouble((t0==1)*MathMax(d3,d4)+(t0==2)*MathMin(d3,d4),Digits());}
d8=OrderStopLoss(); d3=OrderOpenPrice()-t5*d2; if (d2>0 && d3!=d8) {d4=Timi[t0]-t5*d5; d8=NormalizeDouble((t0==1)*MathMin(d3,d4)+(t0==2)*MathMax(d3,d4),Digits());}
if (d7!=OrderTakeProfit() || d8!=OrderStopLoss()) {OTicket[x8][1]*=(OrderModify(OrderTicket(),OrderOpenPrice(),d8,d7,0,Colour[t0]));}}}

void CloseAll(int x6,int x7) 
{int t0,t1,t3,t5,t8,t9;
bool b1;
double d5;
datetime h1,dt[500];

ArrayInitialize(dt,0); t5=0; t9=OrdersTotal()-1; while(t9>=0 && x7>0)
{if (OrderSelect(t9,SELECT_BY_POS,MODE_TRADES) && OrderSymbol()==Symbol() && OrderMagicNumber()==MagicNumber && (OrderType()+1==x6 || x6==0))
{t0=OrderType()+1; d5=OrderProfit()+OrderSwap()+OrderCommission(); if ((d5>=0 && x7==1) || (d5<0 && x7==2) || x7==3)  
{t5++; Ti[0][t5]=OrderTicket(); dt[t5]=OrderOpenTime();}} t9--;}
h1=dt[ArrayMaximum(dt,t5,1)]; t1=1; while(t1<=t5) {t3=ArrayMinimum(dt,t5,1); dt[t3]=h1+1; if (OrderSelect(Ti[0][t3],SELECT_BY_TICKET,MODE_TRADES))
{t8=FindSeat(OrderTicket()); if (t8>0) {t0=OrderType()+1; RefreshRates(); SymbolInfoTick(Symbol(),LastTick); Timi[1]=LastTick.bid; Timi[2]=LastTick.ask;
GlobalVariableSet(gv[t8][7],OrderLots()); GlobalVariableSet(gv[t8][6],OrderTicket()); GlobalVariableSet(gv[t8][8],40);
b1=OrderClose(OrderTicket(),OrderLots(),Timi[t0],Slippage0,Colour[t0]);}} t1++;}}

void OrderAlert(int x6,int x7,int x8,double f8)
{string s1;

s1=StringConcatenate(Vs[32][x7+2]," #",x8,Vs[32][x6+6]," at ",DoubleToString(f8,Digits()));
if (SendEmail0==x6 || SendEmail0==3) {SendMail(Vs[30][4],s1);}
if (SendNotifications0==x6 || SendNotifications0==3) {SendNotification(StringConcatenate(s1,", ",Vs[30][4]));}
if (ScreenShots0==x6 || ScreenShots0==3) {WindowScreenShot(StringConcatenate(TimeFr[tf],Vs[30][1],x8,Vs[32][x6+8]),1280,800,-1,-1,-1);}
if (Alerts0==x6 || Alerts0==3) {Alert(StringConcatenate(s1,", ",Vs[30][4])); if (AlertSound!="") {PlaySound(AlertSound);}}}

void CloseEvent(int x6,int x7,int x8)
{int t1,t7;
bool b1;

b1=OrderSelect(OrderTicket(),SELECT_BY_TICKET); if (Dot[0][x6][9]) {GlobalVariableSet(gv[x8][9],1);}
t7=0; if (x7==1) {t7=FindTicket(OrderTicket()); if (t7>0) {GlobalVariableSet(gv[x8][0],t7);
if (x6==31) {t1=GlobalVariableGet(gv[x8][4])+1; GlobalVariableSet(gv[x8][4],t1); GlobalVariableSet(gv[x8][1],0);}
if (x6==10) {GlobalVariableSet(gv[x8][2],NormalizeDouble(OrderOpenPrice()+(1-OrderType()*2)*CalcValue(0,2,OrderType()+1),Digits())); OTicket[x8][1]=0;}}}
if (x7==0 || t7>0) {t1=GlobalVariableGet(gv[x8][3])+1; GlobalVariableSet(gv[x8][3],t1); GlobalVariableSet(gv[x8][t1+40],x6); OTicket[x8][0]=0;}
if (x7==0) {GlobalVariableSet(gv[x8][0],0); t1=1; while(t1<=5) {GlobalVariableSet(gv[x8][t1+50],GlobalVariableGet(gv[x8][t1+40])); t1++;}
GlobalVariableSet(gv[x8][59],OrderCloseTime()); GlobalVariableSet(gv[x8][60],OrderTicket()); Print(OrderInfo(8,OrderTicket(),x8));}}

bool PastExit(int x6)
{int t1,t2,t3;
bool b1=false;

t2=0; t1=1; while(t2==0) {t3=GlobalVariableGet(gv[k8][t1+40]); t2=(t3==x6)*x6-(t3==0); t1++;} b1=(t2==x6);
return(b1);}

string DoubleStr(double f7)
{double d1;
string s7;

d1=NormalizeDouble(f7,1); s7=DoubleToString(d1,(MathFloor(d1)!=d1)); return(s7);}

void DrawLabel(string r6,string r7,ENUM_BASE_CORNER x4,int x1,int x2,int x5,string r8,color x3,bool b6)
{if (r7=="" && ObjectFind(0,r6)!=-1) {ObjectDelete(0,r6);}
if (r7!="") {if (ObjectFind(0,r6)==-1) {ObjectCreate(0,r6,OBJ_LABEL,0,0,0);} ObjectSetInteger(0,r6,OBJPROP_CORNER,x4); ObjectSetString(0,r6,OBJPROP_TEXT,r7); 
ObjectSetInteger(0,r6,OBJPROP_FONTSIZE,x5); ObjectSetString(0,r6,OBJPROP_FONT,r8); ObjectSetInteger(0,r6,OBJPROP_COLOR,x3); ObjectSetInteger(0,r6,OBJPROP_BACK,b6);
ObjectSetInteger(0,r6,OBJPROP_XDISTANCE,x1); ObjectSetInteger(0,r6,OBJPROP_YDISTANCE,x2);}}

string OrderInfo(int x6,int x7,int x8)
{int t0,t1,t2,t3,t6;
bool b1;
double d1,d2;
string s7="";

b1=OrderSelect(x7,SELECT_BY_TICKET); t0=OrderType()+1; 
if (x6==1) {s7=StringConcatenate(Vs[32][2+t0]," #",x7," entry price at ",DoubleToString(OrderOpenPrice(),Digits()));}
if (x6==2) {d1=(3-t0*2)*(Timi[t0]-OrderOpenPrice())/(mult*Point()); t1=(d1>=0)+(d1<0)*2;
s7=StringConcatenate("Current ",Vs[32][t1+81]," is ",DoubleStr(d1)," pips");}
if (x6==3) {d2=GlobalVariableGet(gv[x8][1]); d1=(3-t0*2)*(d2>0)*(d2-OrderOpenPrice())/(mult*Point());
s7=StringConcatenate("Take profit at ",DoubleToString(d2,(d2>0)*Digits()),", ",DoubleStr(d1)," pips");}
if (x6==4) {d2=GlobalVariableGet(gv[x8][2]); d1=(3-t0*2)*(d2>0)*(OrderOpenPrice()-d2)/(mult*Point()); t3=(d1>=0)+(d1<0)*2;
s7=StringConcatenate(Vs[31][t3+31]," at ",DoubleToString(d2,(d2>0)*Digits()),", ",DoubleStr(MathAbs(d1))," pips");}
if (x6==5) {t2=1; while(t2<=4) {t6=GlobalVariableGet(gv[x8][t2+40]); if (t6>0) {s7=StringConcatenate(s7,Vs[31][t6],", ");} t2++;}
if (s7!="") {s7=StringConcatenate("Exits: ",s7); s7=StringSubstr(s7,0,StringLen(s7)-2);}} 
if (x6==6) {s7=StringConcatenate(Vs[32][t0+2]," #",x7," has been closed");}
if (x6==7) {d1=(3-t0*2)*(OrderClosePrice()-OrderOpenPrice())/(mult*Point()); t1=(d1>=0)+(d1<0)*2;
s7=StringConcatenate("Trade ",Vs[32][t1+81]," was ",DoubleStr(d1)," pips");}
if (x6==8) {t2=1; while(t2<=5) {t6=GlobalVariableGet(gv[x8][t2+50]); if (t6>0) {s7=StringConcatenate(s7,Vs[31][t6],", ");} t2++;}
if (s7!="") {s7=StringConcatenate("Exits: ",s7); s7=StringSubstr(s7,0,StringLen(s7)-2);}}

return(s7);}

void TradingHours()
{int t1,t2,t3,t5;
datetime h1;

if (OTime[22]!=iTime(Symbol(),PERIOD_M1,0)) {OTime[22]=iTime(Symbol(),PERIOD_M1,0); if (OTime[21]!=iTime(Symbol(),PERIOD_W1,0)) 
{OTime[21]=iTime(Symbol(),PERIOD_W1,0); Vt[0][10]=0; if (OTime[21]>0 && OTime[22]>0) 
{Vt[0][10]=OTime[21]+(OTime[22]-OTime[21]>=PeriodSeconds(PERIOD_W1))*PeriodSeconds(PERIOD_W1);
t2=0; t1=1; while(t1<=22 && t2==0 && DSTOffset) {t2=(Vt[0][10]>=Vt[40][t1] && Vt[0][10]<Vt[41][t1]); t1++;}
GMTOffset=ManualGMTOffset+t2; if (AutoGMTOffset && !IsTesting()) {GMTOffset=MathRound((double)(TimeCurrent()-TimeLocal()-TimeGMTOffset())/PeriodSeconds(PERIOD_H1));}
t1=1; while(t1<=3 && TradingTime[9]) {t2=1; while(t2<=2) {Vs[t1][t2]="00:00"; if (Vs[33][t1]!="00000000")
{t5=StringToInteger(StringSubstr(Vs[33][t1],(t2-1)*4,4))+GMTOffset*100; t5+=2400*((t2==1)*((t5<0)-(t5>=2400))+(t2==2)*((t5<=0)-(t5>2400))); 
Ts[0][0]=DoubleToString(t5,0); t3=1; while(StringLen(Ts[0][0])<4) {Ts[0][0]=StringConcatenate("0",Ts[0][0]); t3++;}
Vs[t1][t2]=StringConcatenate(StringSubstr(Ts[0][0],0,2),":",StringSubstr(Ts[0][0],2,2));} t2++;} t1++;}
if (TradingTime[9]) {t1=1; while(t1<=3) {if (Vs[33][t1]!="00000000") {Vs[32][t1+89]=StringConcatenate(Vs[32][t1+85]," ",Vs[t1][1]," to ",Vs[t1][2]);} t1++;}}
if (StringLen(MondayOpenHour)==4) {t1=StringToInteger(MondayOpenHour);
h1=(MathFloor(t1/100)*PeriodSeconds(PERIOD_H1)+(t1-MathFloor(t1/100)*100)*PeriodSeconds(PERIOD_M1)+GMTOffset*PeriodSeconds(PERIOD_H1)); 
OTime[12]=Vt[0][10]+PeriodSeconds(PERIOD_D1)+h1+(h1<0)*PeriodSeconds(PERIOD_D1)-(h1>=PeriodSeconds(PERIOD_D1))*PeriodSeconds(PERIOD_D1);}
if (StringLen(FridayCloseHour)==4) {t1=StringToInteger(FridayCloseHour); 
h1=(MathFloor(t1/100)*PeriodSeconds(PERIOD_H1)+(t1-MathFloor(t1/100)*100)*PeriodSeconds(PERIOD_M1)+GMTOffset*PeriodSeconds(PERIOD_H1)); 
OTime[13]=Vt[0][10]+PeriodSeconds(PERIOD_D1)*5+h1+(h1<0)*PeriodSeconds(PERIOD_D1)-(h1>PeriodSeconds(PERIOD_D1))*PeriodSeconds(PERIOD_D1);}}}
if (OTime[22]>=MathMax(OTime[2],OTime[4]) && NewsFilter0) {t1=1; while(t1<=4) {OTime[t1]=0; t1++;}
MinutesUntilNextEvent=iCustom(Symbol(),PERIOD_CURRENT,"FFCal",IncludeHigh,IncludeMedium,IncludeLow,IncludeSpeaks,true,0,true,-1,-1,ReportAllForUSD,1,1);
MinutesAfterPrevEvent=iCustom(Symbol(),PERIOD_CURRENT,"FFCal",IncludeHigh,IncludeMedium,IncludeLow,IncludeSpeaks,true,0,true,-1,-1,ReportAllForUSD,1,0);
if (MinutesAfterPrevEvent!=99999) {OTime[1]=OTime[22]-(MinutesAfterPrevEvent+MinutesBeforeNews)*PeriodSeconds(PERIOD_M1);
OTime[2]=OTime[22]-(MinutesAfterPrevEvent-MinutesAfterNews)*PeriodSeconds(PERIOD_M1);}
if (MinutesUntilNextEvent!=99999) {OTime[3]=OTime[22]+(MinutesUntilNextEvent-MinutesBeforeNews)*PeriodSeconds(PERIOD_M1); 
OTime[4]=OTime[22]+(MinutesUntilNextEvent+MinutesAfterNews)*PeriodSeconds(PERIOD_M1);}}
TradingTime[2]=(OTime[22]>=OTime[2] && (OTime[22]<OTime[3] || OTime[22]>=OTime[4]));
if (TradingTime[9]) {TradingTime[1]=false; t1=1; while(t1<=3) {Tt[t1][1]=StringToTime(Vs[t1][1]); Tt[t1][2]=StringToTime(Vs[t1][2]);
Tt[t1][1]-=(Tt[t1][2]<Tt[t1][1] && OTime[22]<Tt[t1][2])*PeriodSeconds(PERIOD_D1); Tt[t1][2]+=(Tt[t1][2]<Tt[t1][1] && OTime[22]>=Tt[t1][2])*PeriodSeconds(PERIOD_D1);
Session[t1]=(OTime[22]>=Tt[t1][1] && OTime[22]<Tt[t1][2]);
if (!TradingTime[1]) {TradingTime[1]=Session[t1]; if (TradingTime[1]) {OTime[9]=Tt[t1][1]; OTime[10]=Tt[t1][2];}} t1++;}
if (!TradingTime[1]) {OTime[10]=StringToTime("24:00"); t1=1; while(t1<=3)
{h1=Tt[t1][1]; if (h1>OTime[22] && h1<OTime[10]) {OTime[9]=h1; OTime[10]=h1;} t1++;}}}
TradingTime[3]=(OTime[22]>=OTime[12]); TradingTime[4]=(OTime[13]==0 || OTime[22]<OTime[13]);
TradingTime[0]=(TradingTime[1] && TradingTime[2] && TradingTime[3] && TradingTime[4]);}}

void ScreenInfo()
{int t1,t2,t7;
//bool b1;
double d1;
//string s1;

if (Vi[0][0]>0) {t1=0; while(t1<=100) {Vs[40][t1]=""; Vi[32][t1]=Colour[3]; t1++;}
t7=1; Vs[40][t7]=StringConcatenate("Server time ",TimeToString(OTime[22],2),", GMTOffset ",GMTOffset); 
t1=1; while(t1<=3) {if (Vs[32][t1+89]!="") {t7+=1; Vs[40][t7]=Vs[32][t1+89]; if (Session[t1]) {Vi[32][t7]=Colour[5];}} t1++;}
if (TradingTime[9]) {t7+=1; Vs[40][t7]="We are outside trading hours"; if (TradingTime[1]) {Vs[40][t7]="We are inside trading hours";}}
if (NewsFilter0) {t7+=1; if (OTime[1]>0) {Vs[40][t7]=StringConcatenate("News period ",TimeToString(OTime[1],3)," to ",TimeToString(OTime[2],3));}
if (OTime[3]>0 && OTime[1]!=OTime[3]) {Vs[40][t7+1]=StringConcatenate(TimeToString(OTime[3],3)," to ",TimeToString(OTime[4],3));
if (OTime[1]>0) {Vs[40][t7]=StringConcatenate(Vs[40][t7],",");} if (OTime[1]==0) {Vs[40][t7+1]=StringConcatenate("News period ",Vs[40][t7+1]);}}
t7+=2; Vs[40][t7]="We are outside news period"; if (!TradingTime[2]) {Vs[40][t7]="We are inside news period";}
if (OTime[1]==0 && OTime[3]==0) {Vs[40][t7]="No news data received from FFCal indicator";}}
if ((CloseAllProfit>0 || CloseAllLoss>0) && Trade[0]>0) {t7+=1; 
d1=(OProfit[0][1]+OProfit[0][2])*100/AccountBalance(); t1=(d1<0); Vs[40][t7]=StringConcatenate("Total",Vs[32][t1+1],DoubleToString(d1,2),"%");
if (CloseOneDirection) {Vs[40][t7]=""; t1=1; while(t1<=2) {if (Trade[t1]>0) {d1=OProfit[0][t1]*100/AccountBalance();
Vs[40][t7]=StringConcatenate(Vs[40][t7],Vs[32][t1+2],"s",Vs[32][(d1<0)+1],DoubleToString(d1,2),"% ,");} t1++;} 
Vs[40][t7]=StringSubstr(Vs[40][t7],0,StringLen(Vs[40][t7])-2);}}
t1=1; while(t1<=2) {t2=DivType[3-t1]; if (t2>0) {t7+=1; Vs[40][t7]=StringConcatenate(Vs[32][t1+54]," ",Vs[32][t2+50]," divergence");} t1++;}


//s1=StringConcatenate("TVI(",r,",",s,",",u,")"); t1=ChartWindowFind(0,s1);
//t7+=1; Vs[40][t7]=StringConcatenate(t1," ",ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,0)," ",ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS,1));

//t7+=1; Vs[40][t7]=StringConcatenate(" ",Ind[1][0][6]," ",Ind[1][1][7]," ",Ind[1][2][7]);

t1=1; while(t1<=Vi[30][1]) {if (OTicket[t1][0]>0 && Trade[0]>0) {t2=1; while(t2<=5) 
{Vs[40][t7+t2]=OrderInfo(t2,OTicket[t1][0],t1); t2++;} t7+=t2-1;} t1++;}
t1=1; while(t1<=Vi[30][1]) {if (GlobalVariableGet(gv[t1][59])+PeriodSeconds(PERIOD_H4)>=OTime[22]) {t2=1; while(t2<=3) 
{Vs[40][t7+t2]=OrderInfo(t2+5,GlobalVariableGet(gv[t1][60]),t1); Vi[32][t7+t2]=Colour[4]; t2++;} t7+=t2-1;} t1++;}
t2=14; t1=0; while(t1<=100) {DrawLabel(Vs[41][t1],Vs[40][t1],CORNER_LEFT_UPPER,2,t2,10,"Segoe UI",Vi[32][t1],false); t2+=(Vs[40][t1]!="")*14; t1++;}}}

// [k8][0] Ticket of open trade
// [k8][1] Current take profit level
// [k8][2] Current stop loss level
// [k8][3] Number of partial exits
// [k8][4] Number of take profit exits
// [k8][5] FridayClose has occured
// [k8][6] Ticket of possible closed trade
// [k8][7] Lots of possible closed trade
// [k8][8] Reason of possible closed trade
// [k8][9] An indicator exit has occured
// [k8][+10] Partial take profit levels
// [k8][20] CloseProfitableAfterMinutes
// [k8][21] CloseLosingAfterMinutes
// [k8][30] Partial take profit levels
// [k8][31] 
// [k8][39] Initial lot size
// [k8][+40] Exit type of open trade
// [k8][+50] Exit type of fully closed trade
// [k8][59] Close time of fully closed trade
// [k8][60] Ticket of fully closed trade

// Vi[30][1] Current number of virtual magic numbers 
// Vt[30][2] Session start time
// Vt[30][3] CandlesDistance

/*input double    TrailingProfit                   = 0;
input int       TrailingProfitType               = 0;
input double    TrailingProfitStart              = 0;
input int       TrailingProfitStartType          = 0;
input double    TrailingProfitStep               = 0;
input int       TrailingProfitStepType           = 0;*/

/*
// Trailing profit ******************************************************************************************************** 
if (TrailingProfit>0) {d1=CalcValue(TrailingProfitType,TrailingProfit); d2=CalcValue(TrailingProfitStartType,TrailingProfitStart); d3=CalcValue(TrailingProfitStepType,TrailingProfitStep);
if (z0*(OrderOpenPrice()-Timi[t0])-MathMax(d1,d2)>=0 && (z0*(GlobalVariableGet(gv[k8][1])-Timi[t0])-d1-d3>=0 || GlobalVariableGet(gv[k8][1])==0)) 
{GlobalVariableSet(gv[k8][1],NormalizeDouble(Timi[t0]+z0*d1,Digits()));}}*/