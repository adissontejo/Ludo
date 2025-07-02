MACHINE Ludo
SEES Ludo_ctx
INCLUDES
  (board.Ludo_board) ,
  (turn.Ludo_turn)















































INVARIANT
  ! cc . ( cc : ran ( (turn.finishOrder) ) => colorOf ~ [ { cc } ] <: (board.internalPos) ~ [ { numInternal - 1 } ] ) &
  // para todas as peças que a cor não esta habilitada ao jogo, ficam bloqueadas nos seus pontos
  // de partida
  ! pp . ( pp : PIECES => ( colorOf ( pp ) /: (turn.enabledColors) => pp : (board.lockedPieces) ) )

OPERATIONS
  pickColor ( cc ) =
    PRE cc : COLORS & cc /: (turn.enabledColors) & (turn.gameStarted) = FALSE
    THEN (turn.pickColor) ( cc )
    END ;

  unpickColor ( cc ) =
    PRE cc : COLORS & cc : (turn.enabledColors) & (turn.gameStarted) = FALSE
    THEN (turn.unpickColor) ( cc )
    END ;

  initGame =
    PRE
      (turn.gameStarted) = FALSE
      & card ( (turn.enabledColors) ) >= 2
    THEN
      (turn.initGame) ||
      (board.clear)
    END ;

  free ( pp ) =
    PRE
      (turn.gameStarted) = TRUE &
      pp : PIECES &
      colorOf ( pp ) = (turn.color) &
      (turn.diceValue) = 6 & pp : (board.lockedPieces) & card ( (board.externalPos) |> { startPoint ( colorOf ( pp ) ) } ) < 2
    THEN
      (turn.computeAction) ( FALSE , FALSE ) ||
      (board.setFree) ( pp )
    END ;

  vv <-- rollDice =
    PRE
      (turn.gameStarted) = TRUE &
      (turn.hasRoll) = TRUE &

      ( (turn.diceValue) = 0 or not ( # pp . ( pp : PIECES & colorOf ( pp ) = (turn.color) & ( (turn.diceValue) = 6 & pp : (board.lockedPieces) & card ( (board.externalPos) |> { startPoint ( colorOf ( pp ) ) } ) < 2 or (turn.diceValue) /= 0 & pp /: (board.lockedPieces) & ( pp : dom ( (board.externalPos) ) => ( (turn.diceValue) <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( (board.externalPos) ( pp ) + (turn.diceValue) ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) or ( (turn.diceValue) - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) ) & ( pp : dom ( (board.internalPos) ) => (board.internalPos) ( pp ) + (turn.diceValue) < numInternal ) ) ) ) )
    THEN vv <-- (turn.rollDice)
    END ;

  nextTurn =
    PRE
      (turn.gameStarted) = TRUE &
      (turn.hasRoll) = FALSE &
      ( (turn.diceValue) = 0 or not ( # pp . ( pp : PIECES & colorOf ( pp ) = (turn.color) & ( (turn.diceValue) = 6 & pp : (board.lockedPieces) & card ( (board.externalPos) |> { startPoint ( colorOf ( pp ) ) } ) < 2 or (turn.diceValue) /= 0 & pp /: (board.lockedPieces) & ( pp : dom ( (board.externalPos) ) => ( (turn.diceValue) <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( (board.externalPos) ( pp ) + (turn.diceValue) ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) or ( (turn.diceValue) - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) ) & ( pp : dom ( (board.internalPos) ) => (board.internalPos) ( pp ) + (turn.diceValue) < numInternal ) ) ) ) ) &
      card ( (turn.finishOrder) ) < card ( (turn.enabledColors) )
    THEN (turn.nextTurn)
    END ;

  walk ( pp ) =
    PRE
      (turn.gameStarted) = TRUE &
      pp : PIECES &
      colorOf ( pp ) = (turn.color) &
      (turn.diceValue) /= 0 & pp /: (board.lockedPieces) & ( pp : dom ( (board.externalPos) ) => ( (turn.diceValue) <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( (board.externalPos) ( pp ) + (turn.diceValue) ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) or ( (turn.diceValue) - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) ) & ( pp : dom ( (board.internalPos) ) => (board.internalPos) ( pp ) + (turn.diceValue) < numInternal )
    THEN
      IF pp : dom ( (board.externalPos) ) & (turn.diceValue) <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal THEN
        LET newPos
        BE newPos = ( (turn.diceValue) + (board.externalPos) ( pp ) ) mod numExternal
        IN
          (board.setExternalPos) ( pp , newPos ) ||
          IF
            newPos /: ( stars \/ ran ( startPoint ) ) &
            ( (board.externalPos) ~ ; colorOf ) [ { newPos } ] - { colorOf ( pp ) } /= {}
          THEN
            (turn.computeAction) ( TRUE , FALSE )
          ELSE
            (turn.computeAction) ( FALSE , FALSE )
          END
        END
      ELSE
        IF pp : dom ( (board.externalPos) ) THEN
          (board.setInternalPos) ( pp , (turn.diceValue) - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal - 1 )
        ELSE
          (board.setInternalPos) ( pp , (turn.diceValue) + (board.internalPos) ( pp ) )
        END ||
        IF
          ( ( pp : dom ( (board.internalPos) ) & (turn.diceValue) + (board.internalPos) ( pp ) = numInternal - 1 )
          or ( pp : dom ( (board.externalPos) ) & (turn.diceValue) - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal - 1 = numInternal - 1 ) )
        THEN
          IF card ( (board.internalPos) ~ [ { numInternal - 1 } ] /\ colorOf ~ [ { (turn.color) } ] ) = numPiecesByColor - 1 THEN
            (turn.computeAction) ( FALSE , TRUE )
          ELSE
            (turn.computeAction) ( TRUE , FALSE )
          END
        ELSE
          (turn.computeAction) ( FALSE , FALSE )
        END
      END
    END ;

  dd <-- getDiceValue =
    PRE (turn.gameStarted) = TRUE & (turn.diceValue) /= 0
    THEN dd := (turn.diceValue)
    END ;

  ee , ii <-- getBoard =
    PRE (turn.gameStarted) = TRUE
    THEN ee , ii := (board.externalPos) , (board.internalPos)
    END ;

  cc <-- getTurn =
    PRE (turn.gameStarted) = TRUE & card ( (turn.finishOrder) ) < numColors
    THEN cc := (turn.color)
    END ;

  oo <-- finishGame =
    PRE (turn.gameStarted) = TRUE & card ( (turn.finishOrder) ) >= 1
    THEN
      oo := (turn.finishOrder) ||
      (turn.endGame)
    END ;

  // operações de pre condicao

  rr <-- pre_pickColor ( cc ) =
    PRE cc : COLORS
    THEN rr := bool ( cc /: (turn.enabledColors) & (turn.gameStarted) = FALSE )
    END ;

  rr <-- pre_unpickColor ( cc ) =
    PRE cc : COLORS
    THEN rr := bool ( cc /: (turn.enabledColors) & (turn.gameStarted) = FALSE )
    END ;

  rr <-- pre_initGame =
    rr := bool ( (turn.gameStarted) = FALSE & card ( (turn.enabledColors) ) >= 2 ) ;


  rr <-- pre_free ( pp ) =
    PRE pp : PIECES
    THEN rr := bool ( (turn.gameStarted) = TRUE & colorOf ( pp ) = (turn.color) & (turn.diceValue) = 6 & pp : (board.lockedPieces) & card ( (board.externalPos) |> { startPoint ( colorOf ( pp ) ) } ) < 2 )
    END ;

  rr <-- pre_rollDice =
    rr := bool ( (turn.gameStarted) = TRUE & (turn.hasRoll) = TRUE & ( (turn.diceValue) = 0 or not ( # pp . ( pp : PIECES & colorOf ( pp ) = (turn.color) & ( (turn.diceValue) = 6 & pp : (board.lockedPieces) & card ( (board.externalPos) |> { startPoint ( colorOf ( pp ) ) } ) < 2 or (turn.diceValue) /= 0 & pp /: (board.lockedPieces) & ( pp : dom ( (board.externalPos) ) => ( (turn.diceValue) <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( (board.externalPos) ( pp ) + (turn.diceValue) ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) or ( (turn.diceValue) - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) ) & ( pp : dom ( (board.internalPos) ) => (board.internalPos) ( pp ) + (turn.diceValue) < numInternal ) ) ) ) ) ) ;

  rr <-- pre_nextTurn =
      rr := bool ( (turn.gameStarted) = TRUE & (turn.hasRoll) = FALSE & ( (turn.diceValue) = 0 or not ( # pp . ( pp : PIECES & colorOf ( pp ) = (turn.color) & ( (turn.diceValue) = 6 & pp : (board.lockedPieces) & card ( (board.externalPos) |> { startPoint ( colorOf ( pp ) ) } ) < 2 or (turn.diceValue) /= 0 & pp /: (board.lockedPieces) & ( pp : dom ( (board.externalPos) ) => ( (turn.diceValue) <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( (board.externalPos) ( pp ) + (turn.diceValue) ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) or ( (turn.diceValue) - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) ) & ( pp : dom ( (board.internalPos) ) => (board.internalPos) ( pp ) + (turn.diceValue) < numInternal ) ) ) ) ) & card ( (turn.finishOrder) ) < card ( (turn.enabledColors) ) ) ;

  rr <-- pre_walk ( pp ) =
    PRE pp : PIECES
    THEN rr := bool ( (turn.gameStarted) = TRUE & colorOf ( pp ) = (turn.color) & (turn.diceValue) /= 0 & pp /: (board.lockedPieces) & ( pp : dom ( (board.externalPos) ) => ( (turn.diceValue) <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( (board.externalPos) ( pp ) + (turn.diceValue) ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) or ( (turn.diceValue) - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= (board.externalPos) ( pp ) & ( nn - (board.externalPos) ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - (board.externalPos) ( pp ) + numExternal ) mod numExternal => card ( (board.externalPos) |> { nn } ) < 2 ) ) ) & ( pp : dom ( (board.internalPos) ) => (board.internalPos) ( pp ) + (turn.diceValue) < numInternal ) )
    END
END
