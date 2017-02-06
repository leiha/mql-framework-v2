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

class Clause
{

public
   :

};

template <
   typename TWhenFacade ,
   typename TParent  
>
interface WhenFacadeTemplate
    
{
   TWhenFacade * 
      and ( bool state , Signal * signal )
      ;
      
   TWhenFacade * 
      orGroup ( bool state , Signal * signal )
      ;
      
   TWhenFacade * 
      andGroup ( bool state , Signal * signal )
      ;
      
   TWhenFacade * 
      andWhen ( bool state , Signal * signal )
      ;
   
   TWhenFacade * 
      orWhen ( bool state , Signal * signal )
      ;
      
   TWhenFacade * 
      open ( )
      ;    
      
   
};

template <
   typename TParent  
>
interface WhenFacade   
   : public WhenFacadeTemplate < WhenFacade , TParent >
{
   
};

template <
   typename TWhen    ,
   typename TWhenSub    ,
   typename TParent
>
class WhenTemplate
   : public Object < TWhen , WhenFacade < TParent > , TParent >
{

Array < int > *  currentSubGroup;
Array < int > * previousSubGroup;
Array < Array < int > * > _subGroups;
Array < Clause *        > _clauses;

public
   :   
   WhenTemplate (  ) 
      : Object ( )
   {
      group( );
   };
   
   TWhen * 
      and ( bool state , Signal * signal )
   {
      _clauses.update( new Clause( ) );
      return pointer( );
   };
   
   TWhen * 
      andGroup ( bool state , Signal * signal )
   {
      group( );
      and  ( state , signal );
      return pointer( );
   };
   
   TWhenSub * 
      andWhen ( bool state , Signal * signal )
   {
      TWhenSub * w = new TWhenSub ( );
      w.and( state , signal );
      return w;
   };
   
   TWhen * 
      or ( bool state , Signal * signal )
   {
      _clauses.update( new Clause( ) );
      return pointer( );
   };
   
   TWhen * 
      orGroup ( bool state , Signal * signal )
   {
      group( );
      and  ( state , signal );
      return pointer( );
   };
   
   TWhen * 
      orWhen ( bool state , Signal * signal )
   {
      TWhenSub * w = new TWhenSub( );
      w.or( state , signal );
      return w;
   };
   
   TWhen * 
      open ( )
   {
      return pointer( );
   };
   
   TParent * 
      end ( )
   {
      return parent( );
   };

protected
   :
   
   TWhen * 
      group( )
   {
      int t = _clauses.total( );
      if( _subGroups.total( ) > 1 ) {
         previousSubGroup = _subGroups.get( -1 );
         previousSubGroup.items[ 1 ] = t - 1 - previousSubGroup.items[ 0 ];
      }
      
      currentSubGroup = new Array<int> ( );
      _subGroups.update( currentSubGroup );
      currentSubGroup.items[ 0 ] = t;
      return pointer(  );
   };

};


template <
   typename TParent
>
class WhenGroup
   : public WhenTemplate < 
      WhenGroup < TParent > , 
      //When < WhenFacade < TParent > > , 
      WhenFacade < TParent > >
{
};

template <
   typename TParent
>
class When
   : public WhenTemplate < 
      When       < TParent > , 
      WhenGroup  < WhenFacade < TParent > > , 
      Null
{
};


class Test{};

void ttt () 
{
   WhenFacade < Test > * w = new When < Test > ( );
   w.andWhen( true , new Signal( ) ).end();
};