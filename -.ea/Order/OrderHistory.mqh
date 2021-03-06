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

#include "./Order.mqh"

// ---

class OrderHistory 
   : public Order
{

ulong ticket;

public
   :
   
   OrderHistory ( ulong ticketNumber )
      : Order( ) , ticket( ticketNumber )
   {
      
   };

protected
   :
   
   /** 
    */
   virtual string
      getString
         ( ENUM_ORDER_PROPERTY_STRING property ) 
   {
      return HistoryOrderGetString( ticket , property );
   };
   
   /** 
    */
   virtual long
      getInteger
         ( ENUM_ORDER_PROPERTY_INTEGER property ) 
   {
      return HistoryOrderGetInteger( ticket , property );        
   };
   
   /** 
    */
   virtual double
      getDouble
         ( ENUM_ORDER_PROPERTY_DOUBLE property ) 
   {
      return HistoryOrderGetDouble( ticket , property );        
   };
   
};