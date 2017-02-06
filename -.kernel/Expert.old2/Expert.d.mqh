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

class Clause
{

public
   :

};


class Signal
{

};

template < typename TObject , typename TParent >
class WhenTemplate
   : private Object < TObject , NullI , TParent  >
{

TParent * _parent;
Array < Clause * > _clauses;

public
   :
   
   TObject * 
      and ( bool state , Signal * signal )
   {
      _clauses.update( new Clause( ) );
      return pointer( );
   };
   
   TObject * 
      or ( bool state , Signal * signal )
   {
      _clauses.update( new Clause( ) );
      return pointer( );
   };   
   
   TParent * 
      end ( )
   {
      return parent( );
   };   
   
};

template < 
   typename TObject ,
   typename TPosition ,
   typename TWhenGroup , 
   typename TParent 
>
class WhenWithGroupTemplate
   : public WhenTemplate < TObject , TParent >
{

public
   :
   
   TWhenGroup * 
      andWhen ( bool state , Signal * signal )
   {
      TWhenGroup * w = new TWhenGroup ( );
      w.and( state , signal );
      return w;
   };
   
   TWhenGroup * 
      orWhen ( bool state , Signal * signal )
   {
      TWhenGroup * w = new TWhenGroup( );
      w.or( state , signal );
      return w;
   };
};

template < 
   typename TParent 
>
class Position
   : public When < TParent >
{

};

template < 
   typename TObject ,
   typename TPosition ,
   typename TParent 
>
class WhenGroupSubTemplate
   : public WhenTemplate < TObject , TParent >
{

public
   :  
   
   TPosition * 
      open ( )
   {
      return new TPosition( );
   };
};

template < 
   typename TParent 
>
class WhenGroupSub
   : public WhenGroupSubTemplate < 
      WhenGroupSub < TParent >, 
      TPosition , 
      TParent 
   >
{

public
   :
};


template < 
   typename TParent 
>
class WhenGroup
   : public WhenWithGroupTemplate < 
      WhenGroup < TParent > , 
      Position <  > ,
      TParent
   >
{

public
   :
   
};

template < 
   typename TParent 
>
class When
   : public WhenWithGroupTemplate < 
      When < TParent > , 
      Position <  > ,
      TParent
   >
{

public
   :

};

class Expert 
{

public
   :
   
   When < Expert > * when ( ) 
   {
      return new When < Expert >( );
   };

};


void tttt()
{
   Expert * e = new Expert( );
   
   e.when()
      .andWhen( true , new Signal( ) )
         .andWhen( true , new Signal( ) )
         .end()
      .end()
   .end()
   ;
   
};