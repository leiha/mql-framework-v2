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

#include "./Position.mqh"
#include "./ExpertWhen.mqh"

// -----
/**
 * FACADE : ExpertFacade
 * --------------------
 */
interface ExpertFacade
   : public ObjectFacade
{

};

class Expert
   : public Object < Expert , ExpertFacade , Null >
{

Array < ExpertWhen < Expert > * > _whens;

public
   :
   
   ExpertWhen < Expert > *
      when ( bool state , Signal * signal ) 
   {
      ExpertWhen < Expert > * when = ( new ExpertWhen < Expert > ( ) ).parent( pointer( ) ) ;
      _whens.update( when );
      return when;
   };
   
   Expert *
      iterate ()
   {
      for( int i = 0 , t = _whens.total( ) ; i < t ; i++ )
      {
         _whens.items[ i ].iterate( );
      };
      return pointer( );
   };
   
};

void ttt () {

   Expert * expert = new Expert( );
   expert
      .whenGroup        ( true , ( new Signal( ) ) )
         .and           ( true , ( new Signal( ) ) )
         .andGroup      ( true , ( new Signal( ) ) )
            .or         ( true , ( new Signal( ) ) )
         .end( )
      .end( )
      .when             ( true , ( new Signal( ) ) )
         .or            ( true , ( new Signal( ) ) )
         .and           ( true , ( new Signal( ) ) )
         .or            ( true , ( new Signal( ) ) )
         .Long          ( )
            .limit      ( -50 , 300 )
            .open       ( 0.1 )
            .when       ( true , ( new Signal( ) ) )
               .close   ( )
         .end           ( )
     .end               ( )
     .iterate           ( )
   ;
   };