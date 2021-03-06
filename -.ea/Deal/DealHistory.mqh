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

// ---

class DealHistory    
{

ulong ticket;

public
   :
   
   DealHistory ( ulong ticketNumber )
      : ticket( ticketNumber )
   {
      
   };

protected
   :
   
   /** 
    */
   virtual string
      getString
         ( ENUM_DEAL_PROPERTY_STRING property ) 
   {
      return HistoryDealGetString( ticket , property );
   };
   
   /** 
    */
   virtual long
      getInteger
         ( ENUM_DEAL_PROPERTY_INTEGER property ) 
   {
      return HistoryDealGetInteger( ticket , property );        
   };
   
   /** 
    */
   virtual double
      getDouble
         ( ENUM_DEAL_PROPERTY_DOUBLE property ) 
   {
      return HistoryDealGetDouble( ticket , property );        
   };
   
public
   :
   
   /** 
    */
   long
      order (  ) 
   {
      return getInteger( DEAL_ORDER );
   };
   
   /** 
    */
   datetime
      time (  ) 
   {
      return getInteger( DEAL_TIME );
   };
   
   /** 
    */
   long
      timeMsc (  ) 
   {
      return getInteger( DEAL_TIME_MSC );
   };
   
   /** 
    */
   ENUM_DEAL_TYPE
      type (  ) 
   {
      return getInteger( DEAL_TYPE );
   };
   
   /** 
    */
   ENUM_DEAL_ENTRY
      entry (  ) 
   {
      return getInteger( DEAL_ENTRY );
   };
   
   /** 
    */
   long
      positionId (  ) 
   {
      return getInteger( DEAL_POSITION_ID );
   };
   
   /** 
    */
   double
      volume (  ) 
   {
      return getDouble( DEAL_VOLUME );
   };
   
   /** 
    */
   double
      price (  ) 
   {
      return getDouble( DEAL_PRICE );
   };
   
   /** 
    */
   double
      commission (  ) 
   {
      return getDouble( DEAL_COMMISSION );
   };
   
   /** 
    */
   double
      swap (  ) 
   {
      return getDouble( DEAL_SWAP );
   };
   
   /** 
    */
   double
      profit (  ) 
   {
      return getDouble( DEAL_PROFIT );
   };
   
   /** 
    */
   string
      symbol (  ) 
   {
      return getString( DEAL_SYMBOL );
   };
   
   /** 
    */
   string
      comment (  ) 
   {
      return getString( DEAL_COMMENT );
   };
   
};