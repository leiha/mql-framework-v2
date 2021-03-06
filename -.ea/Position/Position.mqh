//+------------------------------------------------------------------+
//|                                                         Time.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../Request/Request.mqh"
//#include <Trade\PositionInfo.mqh>

// ---

class Position 
{

public
   :
   
   Position( int i ) 
   {
      ulong ticket = PositionGetTicket( i );
   };
   
   Request * open ( ) 
   {
      string symbol        = symbol( );
      ENUM_ORDER_TYPE type = ( ENUM_ORDER_TYPE ) type( );   
      Request * 
         request = new Request( );
         request.action    ( TRADE_ACTION_DEAL ); 
         request.symbol    ( symbol );
         //request.magic   ( EXPERT_MAGIC );         
         request.type      ( type );
         request.price     ( SymbolInfoDouble( symbol , type == ORDER_TYPE_BUY ? SYMBOL_ASK : SYMBOL_BID ) );     
         request.deviation ( 5 );      
      
      return request;
   };
   
   Request * modify ( ) 
   {
      ulong ticket         = ticketOfPosition( );
      string symbol        = symbol( );
      ENUM_ORDER_TYPE type = ( ENUM_ORDER_TYPE ) type( );        
      Request * 
         request = new Request( );
         request.action          ( TRADE_ACTION_SLTP ); 
         request.symbol          ( symbol );
         //request.magic         ( EXPERT_MAGIC );         
         request.ticketOfPosition( ticket );
         request.volume          ( volume( ) );
         
      return request;
   };
   
   Request * close ( ) 
   {
      ulong ticket         = ticketOfPosition( );
      string symbol        = symbol( );
      Request * 
         request = new Request( );
         request.action          ( TRADE_ACTION_DEAL ); 
         request.symbol          ( symbol );
         //request.magic         ( EXPERT_MAGIC );         
         request.ticketOfPosition( ticket );
         request.volume          ( volume( ) );
         if( POSITION_TYPE_BUY == type( ) )
         {
            request.price( SymbolInfoDouble( symbol , SYMBOL_BID ) );
            request.type ( ORDER_TYPE_SELL );
         }
         else {
            request.price( SymbolInfoDouble( symbol , SYMBOL_ASK ) );
            request.type ( ORDER_TYPE_BUY );
         }
         
      return request;
   };
   
   /** 
    */
   long
      ticketOfPosition (  ) 
   {
      return getInteger( POSITION_TICKET );
   };
   
   /** 
    */
   datetime
      time (  ) 
   {
      return getInteger( POSITION_TIME );
   };
   
   /** 
    */
   long
      timeMsc (  ) 
   {
      return getInteger( POSITION_TIME_MSC );
   };
   
   /** 
    */
   long
      timeUpdate (  ) 
   {
      return getInteger( POSITION_TIME_UPDATE );
   };
   
   /** 
    */
   long
      timeUpdateMsc (  ) 
   {
      return getInteger( POSITION_TIME_UPDATE_MSC );
   };
   
   /** 
    */
   ENUM_POSITION_TYPE
      type (  ) 
   {
      return getInteger( POSITION_TYPE );
   };
   
   /** 
    */
   long
      magic (  ) 
   {
      return getInteger( POSITION_MAGIC );
   };
   
   /** 
    */
   long
      identifier (  ) 
   {
      return getInteger( POSITION_IDENTIFIER );
   };
   
   /** 
    */
   double
      volume (  ) 
   {
      return getDouble( POSITION_VOLUME );
   };
   
   /** 
    */
   double
      priceOpen (  ) 
   {
      return getDouble( POSITION_PRICE_OPEN );
   };
   
   /** 
    */
   double
      stopLoss (  ) 
   {
      return getDouble( POSITION_SL );
   };
   
   /** 
    */
   double
      takeProfit (  ) 
   {
      return getDouble( POSITION_TP );
   };
   
   /** 
    */
   double
      priceCurrent (  ) 
   {
      return getDouble( POSITION_PRICE_CURRENT );
   };
   
   /** 
    */
   double
      swap (  ) 
   {
      return getDouble( POSITION_SWAP );
   };
   
   /** 
    */
   double
      profit (  ) 
   {
      return getDouble( POSITION_PROFIT );
   };
   
   /** 
    */
   string
      symbol (  ) 
   {
      return getString( POSITION_SYMBOL );
   };
   
   /** 
    */
   string
      comment (  ) 
   {
      return getString( POSITION_COMMENT );
   };
   
protected
   :
   
   /** 
    */
   string
      getString
         ( ENUM_POSITION_PROPERTY_STRING property ) 
   {
      return PositionGetString( property );
   };
   
   /** 
    */
   long
      getInteger
         ( ENUM_POSITION_PROPERTY_INTEGER property ) 
   {
      return PositionGetInteger( property );        
   };
   
   /** 
    */
   double
      getDouble
         ( ENUM_POSITION_PROPERTY_DOUBLE property ) 
   {
      return PositionGetDouble( property );        
   };

};