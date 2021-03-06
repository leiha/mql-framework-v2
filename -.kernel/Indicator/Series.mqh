//+------------------------------------------------------------------+
//|                                                    Indicator.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../ArrayMap.mqh"

template < typename T , typename TT >
class IndicatorSeries
   : public ArrayMap < int , TT * >
{

T * parent;

public
   :
   
   IndicatorSeries
      ( T * parentIndicator )
      : ArrayMap ( ),
        parent   ( parentIndicator )
   {
   
   };   
   
   T * end
      ( )
   {
      return parent;
   };
   
};