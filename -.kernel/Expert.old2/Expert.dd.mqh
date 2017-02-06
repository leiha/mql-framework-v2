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

template < typename TParent >
interface WhenFacade
{
   WhenFacade < TParent > *
      or ( bool state , Signal * signal )
      ;
   
   
   WhenFacade < TParent > *
      and ( bool state , Signal * signal )
      ;
      
   TParent *
      end ( )
      ;
   
};

template < typename TParent >
interface WhenMFacade
   : public WhenFacade < TParent >
{
      
};

template < typename TParent >
class When
   : public Object < When < TParent > , WhenMFacade < TParent > , TParent >
{

public
   :
   
   int CLAUSE_AND ,
       CLAUSE_OR   
         ;
    
   When ( )
      : CLAUSE_AND  ( 1 ) ,
        CLAUSE_OR   ( 2 )
   {};
   
   WhenFacade < TParent > *
      or ( bool state , Signal * signal )
   {
      return when( CLAUSE_OR , state , signal );
   };
   
   WhenFacade < TParent > *
      and ( bool state , Signal * signal )
   {
      return when( CLAUSE_AND , state , signal );
   };
   
   WhenFacade < TParent > *
      or ( )
   {
      return new When < TParent > ( );
   };
   
   WhenMFacade < TParent > *
      and ( )
   {
      return new When < TParent > ( );
   };
   
protected
   :
   
   WhenFacade < TParent > *
      when ( int clause , bool state , Signal * signal )
   {
      return pointer( );
   };
};

class Test{};

void ttt () {

   WhenFacade < Test > * w = new When < Test >( );
   w.and( true , new Signal( ) )
    
      ;


};