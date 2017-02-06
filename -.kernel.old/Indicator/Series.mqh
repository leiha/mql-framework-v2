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

template < typename TIndicator , typename TSerie >
class IndicatorSeries
   : public ArrayMap < int , TSerie * >
{

TIndicator * parent;

public
   :
   
   IndicatorSeries
      ( TIndicator * parentIndicator )
      : ArrayMap ( ),
        parent   ( parentIndicator )
   {
   
   };   
   
   TIndicator * end
      ( )
   {
      return parent;
   };
   
};