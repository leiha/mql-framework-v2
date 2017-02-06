//+------------------------------------------------------------------+
//|                                                        Serie.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../Object/Object.mqh"
#include "../Array/Array.mqh"

class Signal{};

class Position{};

template < typename TExpert >
class When
{

TExpert * parentExpert;

Array < Signal * >

public
   :
   
   When < TExpert > * 
      or  ( bool state , Signal * signal ) 
   {
      return GetPointer( this );
   };
   
   When < TExpert > * 
      and ( bool state , Signal * signal ) 
   {
      return GetPointer( this );
   };
   
   TExpert * 
      end ( ) 
   {
      return parentExpert;
   };

};

class Expert
{

public
   :
   
   When < Expert > *
      when ( bool state , Signal * signal )
   {
      return new When < Expert > ();
   
   };
   

};

void toto () 
{
          Expert   * expert = new Expert ( );
   When < Expert > * when   = expert.when( true , new Signal( ) );
                     when.or ( true , new Signal( ) )
                         .and( true , new Signal( ) )
                     ;
};