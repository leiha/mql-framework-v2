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

#include "./RequestResult.mqh"

// ---

class Request
{

MqlTradeRequest  request;
RequestResult  * result ;

protected
   :

public
   :
   
   Request( ) 
      //: result( { 0 } ) ,  request( { 0 } )
   {
       result = new RequestResult( );
      
   };
   
   /**
    * Type d'opération de trading
    *  
    *  TRADE_ACTION_DEAL       
    *  - Place un ordre de trading pour une exécution immédiate avec les paramètres indiqués (ordre au marché)
    *  TRADE_ACTION_PENDING       
    *  - Place un ordre de trading pour une exécution sous les conditions indiquées (ordre en attente)
    *  TRADE_ACTION_SLTP       
    *  - Modifie les valeurs du Stop Loss et du Take Profit d'une position ouverte
    *  TRADE_ACTION_MODIFY       
    *  - Modifie les paramètres de l'ordre placé auparavant
    *  TRADE_ACTION_REMOVE       
    *  - Supprime l'ordre en attente placé auparavant
    *  TRADE_ACTION_CLOSE_BY       
    *  - Ferme une position par une position opposée
    */
   void 
      action( ENUM_TRADE_REQUEST_ACTIONS action ) 
   {
      request.action = action;
   }
   
   /**
    * Identifiant de l'expert (nombre magique)
    */
   void 
      magic( ulong magic ) 
   {
      request.magic = magic;
   }
   
   /**
    * Ticket de l'ordre
    */
   void 
      order( ulong order ) 
   {
      request.order = order;
   }
   
   /**
    * Nom de l'instrument
    */
   void 
      symbol( string symbol ) 
   {
      request.symbol = symbol;
   }
   
   /**
    * Volume demandé en lots
    */
   void 
      volume( double volume ) 
   {
      request.volume = volume;
   }
   
   /**
    * Prix
    */
   void 
      price( double price ) 
   {
      request.price = price;
   }
   
   /**
    * Niveau StopLimit de l'ordre
    */
   void 
      stopLimit( double stopLimit ) 
   {
      request.stoplimit = stopLimit;
   }
   
   /**
    * Niveau Stop Loss de l'ordre
    */
   void 
      stopLoss( double stopLoss ) 
   {
      request.sl = stopLoss;
   }
   
   /**
    * Niveau Take Profit de l'ordre
    */
   void 
      takeProfit( double takeProfit ) 
   {
      request.tp = takeProfit;
   }
   
   /**
    * Déviation possible maximale du prix demandé
    */
   void 
      deviation( ulong deviation ) 
   {
      request.deviation = deviation;
   }
   
   /**
    * Type de l'ordre
    */
   void 
      type( ENUM_ORDER_TYPE type ) 
   {
      request.type = type;
   }
   
   /**
    * Type d'exécution de l'ordre
    */
   void 
      typeFilling( ENUM_ORDER_TYPE_FILLING typeFilling ) 
   {
      request.type_filling = typeFilling;
   }
   
   /**
    * Type de l'ordre par temps de l'action
    */
   void 
      typeTime( ENUM_ORDER_TYPE_TIME typeTime ) 
   {
      request.type_time = typeTime;
   }
   
   /**
    * Heure d'expiration de l'ordre( pour les ordres du type ORDER_TIME_SPECIFIED )
    */
   void 
      expiration( datetime expiration ) 
   {
      request.expiration = expiration;
   }
   
   /**
    * Commentaire
    */
   void 
      comment( string comment ) 
   {
      request.comment = comment;
   }
   
   /**
    * Le ticket de la position
    */
   void 
      ticketOfPosition( ulong ticketOfPosition ) 
   {
      request.position = ticketOfPosition;
   }
   
   /**
    * Le ticket d'une position opposée
    */
   void 
      positionBy( ulong positionBy ) 
   {
      request.position_by = positionBy;
   }

   void send ( ) 
   {
      // --- envoie la demande
      if(! OrderSend( request , result.result ) ) {
         // si la demande ne peut pas être envoyée, retourne le code d'erreur
         PrintFormat("OrderSend error %d", GetLastError( ) );
      }
      
      // --- informations sur l'opération
      PrintFormat("retcode=%u  deal=%I64u  order=%I64u" , result.code( ) , result.deal( ) , result.order( ) );
   };
};