//+------------------------------------------------------------------+
//|                                       OBV, TVI, Price_Div_EA.mq4 |
//|                                                        version 2 |
//|                                                     by Murat aka.|
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright 2015, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+


int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
  
  
  
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
    

//-------------------------------------------------------------------- 2 --
int condition=3;
extern double Tolerance=0.0001;
extern double Tolerance2=0.0002;
extern double ProfitMargin=1.5;

//extern double TakeProfitFactor;
//extern double StopLossPips;

   int xaZZBuy_indicator=1;
   int xaZZSell_indicator=0;
   
   double   OBV, TVI, dHigh, dHighLeft, dHighMiddle, dHighRight, 
            dMax1=0, dTVImax1=0, dOBVmax1=0,
            dStopLoss, dTakeProfit, dLots=0.01;
            
            
   int         iTicket;
   
   int order;
   
   bool closed;
   
   double  TVI_Last, TVI_Now;
   double  OBV_Last, OBV_Now;
   
   datetime       lastTradeTime;

   #define        THIS_BAR 0

//--------------------------------------------------------------- 4 --
      double xazz_Sell_signal_Last = iCustom(NULL,0,"Strategy2/xaZZ", xaZZSell_indicator, 1); //
      double xazz_Buy_signal_Last  = iCustom(NULL,0,"Strategy2/xaZZ", xaZZBuy_indicator, 1); //
      double xazz_Sell_signal_Now = iCustom(NULL,0,"Strategy2/xaZZ", xaZZSell_indicator, 0); //
      double xazz_Buy_signal_Now = iCustom(NULL,0,"Strategy2/xaZZ", xaZZBuy_indicator, 0); //
//--------------------------------------------------------------- 5 --
   int ExtDepth=12;
   int ExtDeviation=5;
   int ExtBackstep=3;

//--------------------------------------------------------------- 3 --
int start()                      
  {
    
  
   int n, i, bar, bar4; 
   double p0, p1, p2, p3, p4, p5;
  
   i=0;
   
      while(n<5)
      {
      if(p0>0) {p5=p4; p4=p3; p3=p2; p2=p1; p1=p0; }
      p0=iCustom(Symbol(),0,"zigzag",ExtDepth,ExtDeviation,ExtBackstep,0,i);
      if(n==2){bar = i;}
      if(n==0){bar4=i;}
      if(p0>0) {n+=1; }
      i++;
      }

   TVI_Last = iCustom(NULL,0,"TVI_v2",5,5,5, 4, bar); //1 = upNEG, 0 = upPOS, 2 = downPOS  3= downNEG
   TVI_Now = iCustom(NULL,0,"TVI_v2",5,5,5, 0, 0); //1 = upNEG, 0 = upPOS, 2 = downPOS  3= downNEG
     
   xazz_Buy_signal_Last  = iCustom(NULL,0,"Strategy2/xaZZ", xaZZBuy_indicator, bar); //
   xazz_Sell_signal_Last  = iCustom(NULL,0,"Strategy2/xaZZ", xaZZSell_indicator, bar); //
   
   OBV_Last = iCustom(NULL,0,"Gadi_OBV_v2.2 for EA", 0, bar);
   OBV_Now = iCustom(NULL,0,"Gadi_OBV_v2.2 for EA", 0, bar4);
   
   xazz_Sell_signal_Now = iCustom(NULL,0,"Strategy2/xaZZ", xaZZSell_indicator, bar4); //
   xazz_Buy_signal_Now = iCustom(NULL,0,"Strategy2/xaZZ", xaZZBuy_indicator, bar4); //
  
 
   //Comment(xazz_Sell_signal_Last," ",xazz_Sell_signal_Now);
//----------------------------------------------------------------------------
//---------------------------------------------------------------------------


   bool HigherHigh = p2 > p3 && xazz_Sell_signal_Last < xazz_Sell_signal_Now ;
   bool LowerLow = p2 < p3 && xazz_Buy_signal_Last >  xazz_Buy_signal_Now ;



   if(HigherHigh && TVI_Last > TVI_Now && TVI_Now > 0&& OBV_Last > OBV_Now && lastTradeTime != Time[THIS_BAR] && OrdersTotal() < 1){
   
    lastTradeTime = Time[THIS_BAR];
    dStopLoss = xazz_Sell_signal_Last;
    dTakeProfit = xazz_Sell_signal_Now;
    Buy();
    DrawLine(IntegerToString(iTicket),bar,bar4);
    
   }
  // if(LowerLow)Sell();


   
//====================================================================
//--------------------------------------------------------------- 6 --
   return(0);                          
  }
  
 
//--------------------------------------------------------------- 7 -------------------------------------------+

void DrawLine(string name, int bar, int bar4){

   ObjectCreate("ObjName: "+name, OBJ_TREND, 0, Time[bar], High[bar], Time[bar4], High[bar4] ); 
   ObjectSet("ObjName: "+name, OBJPROP_WIDTH, 2);
   ObjectSet("ObjName: "+name,OBJPROP_RAY,false);
   ObjectSet("ObjName: "+name,OBJPROP_STYLE,STYLE_SOLID);
   ObjectSet("ObjName: "+name,OBJPROP_COLOR,Red);
   
}

void Buy(){

   iTicket=OrderSend(Symbol(),OP_BUY,dLots,Ask,3,(dStopLoss-100*Point),(dTakeProfit+100*Point),"OBV,TVI",0,Red);
   if(iTicket>0){
      
      if(OrderSelect(iTicket,SELECT_BY_TICKET,MODE_TRADES)) Print("BUY order opened : ",OrderOpenPrice());
   }
   else Print("Error opening BUY order : ",GetLastError());
   
}

void Sell(){

   iTicket=OrderSend(Symbol(),OP_SELL,dLots,Ask,3,(dStopLoss-100*Point),0,"OBV,TVI",0,Red);
   if(iTicket>0){
      
      if(OrderSelect(iTicket,SELECT_BY_TICKET,MODE_TRADES)) Print("BUY order opened : ",OrderOpenPrice());
   }
   else Print("Error opening BUY order : ",GetLastError());
   
}


int CloseAll(){

int total = OrdersTotal();
  for(int i=total-1;i>=0;i--)
  {
    OrderSelect(i, SELECT_BY_POS);
    int type   = OrderType();

    bool result = false;
    
    switch(type)
    {
      //Close opened long positions
      case OP_BUY       : result = OrderClose( OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_BID), 5, Red );
                          break;
      
      //Close opened short positions
      case OP_SELL      : result = OrderClose( OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_ASK), 5, Red );
                          
    }
    
    if(result == false)
    {
      Alert("Order " , OrderTicket() , " failed to close. Error:" , GetLastError() );
      Sleep(3000);
    }  
  }
  
  return(0);
}


bool MoveStopToBreakeven() {

   bool retVal = true;
   double sl;
   double breakeven;

   // select the Order
   for(int i = 0; i < OrdersTotal(); i++) {
      OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
      
      if(OrderSymbol() == Symbol()) {         
         
         if(  OrderType() == OP_BUY && Bid >=  OrderOpenPrice() && OrderProfit() >= ProfitMargin ){
         
              breakeven = ( Bid - OrderOpenPrice() ) ;
                
              sl = OrderOpenPrice() + breakeven/3;
              
              if( sl > OrderStopLoss() ) {
               retVal = OrderModify(OrderTicket(),OrderOpenPrice(), sl,OrderTakeProfit(),0,Blue) ;
              }
         }
        
       if(OrderType() == OP_SELL && Ask <= OrderOpenPrice() && OrderProfit() >= ProfitMargin) {
       
               breakeven = ( OrderOpenPrice() - Ask ) ;
               sl = OrderOpenPrice() - breakeven/3;
               
               if( sl < OrderStopLoss() ) {
                  retVal = OrderModify(OrderTicket(),OrderOpenPrice(), sl,OrderTakeProfit(),0,Red) ;
               }
         }
      }
   }
   
   if( !retVal ) {
     // Print( ErrorDescription( GetLastError() ) + ". SL: " + DoubleToStr( sl, Digits) );
   }
   
   return(retVal);
}

