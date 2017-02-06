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


template <
   typename TExpert ,
   typename TWhen   ,
   typename TSignal
>
class ExpertTemplate
   : public Object < TExpert , NullI , Null >
{

Array < TWhen * > _whens;

public
   :
   ExpertTemplate 
      ( )
      : Object( )
   {};
   
   // -
   
   TWhen *
      when ( bool state , TSignal * signal ) 
   {
      TWhen * when = ( new TWhen ( ) ).parent( pointer( ) ) ;
      _whens.update( when );
      return when;
   };
   
};

template <
   typename TWhen     ,
   typename TPosition ,
   typename TParent
>
class ExpertWhenTemplate
   : public Object < TWhen , NullI , TParent >
{

public
   :
   ExpertWhenTemplate
      ( )
      : Object( )
   {};
   
   // -
   
   TPosition
      Long ( ) 
   {
      return position( true  ) ;
   };
   
   TPosition
      Short ( ) 
   {
      return position( false ) ;
   };

protected
   :
   
   TPosition
      position ( bool longOrShort = false ) 
   {
      TPosition * position = new TPosition( );
      _positions.update( position.parent( pointer( ) ) );
      return position;
   };
};

// ------

template <
   typename TPosition     ,
   typename TPositionOpen ,
   typename TParent
>
class ExpertPositionTemplate
   : public Object < TPosition , NullI , TParent >
{

public
   :
   ExpertPositionTemplate
      ( )
      : Object( )
   {};
   
   // -   

protected
   :   
   
};

template <
   typename TPositionOpen ,
   typename TParent
>
class ExpertPosition
   : public ExpertPositionTemplate < 
      ExpertPosition < TPositionOpen , TParent > , 
      TParent 
   >
{

public
   :
   ExpertPosition
      ( )
      : Object( )
   {};
   
   // -   

protected
   :   
   
};

// ------

template <
   typename TParent
>
class ExpertWhen
   : public ExpertWhenTemplate < 
                       ExpertWhen < TParent >   , 
      ExpertPosition < ExpertWhen < TParent > > ,       
      TParent 
   >
{

public
   :
   ExpertWhen
      ( )
      : ExpertWhenTemplate( )
   {};
   
};



class Expert
   : public ExpertTemplate 
      < 
         Expert ,
         ExpertWhen < 
            ExpertPosition < 
               ExpertWhen < Expert > 
            > , 
            Expert 
         > ,
         Signal
      >
{

public
   :
   Expert
      ( )
      : ExpertTemplate ( )
   {};
   
   // -
   
};

void ttt () {

   Expert * expert = new Expert( );
   expert
      .when             ( true , ( new Signal( ) ) )
//         .or            ( true , ( new Signal( ) ) )
//         .and           ( true , ( new Signal( ) ) )
//         .or            ( true , ( new Signal( ) ) )
         .Long          ( )
//            .limit      ( -50 , 300 )
//            .open       ( 0.1 )
//            .when       ( true , ( new Signal( ) ) )
//               .close   ( )
//         .end           ( )
//     .end               ( )
//     .iterate           ( )
   ;
   };