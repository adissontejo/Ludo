MACHINE Ludo
SEES Ludo_ctx
INCLUDES
  Ludo_board ,
  Ludo_turn
PROMOTES
  pickColor , unpickColor , endGame , getDiceValue














































ABSTRACT_VARIABLES
    atePieceDummy

INVARIANT
  ! cc . ( cc : ran ( finishOrder ) => colorOf ~ [ { cc } ] <: internalPos ~ [ { numInternal - 1 } ] ) &
  // para todas as peças que a cor não esta habilitada ao jogo, ficam bloqueadas nos seus pontos
  // de partida
  ! pp . ( pp : PIECES => ( colorOf ( pp ) /: enabledColors => pp : lockedPieces ) ) &
  atePieceDummy : BOOL

INITIALISATION
  atePieceDummy :: BOOL

OPERATIONS
  startGame =
    PRE
      gameStarted = FALSE
      & card ( enabledColors ) >= 2
    THEN
      initGame ||
      clear
    END ;

  free ( pp ) =
    PRE
      gameStarted = TRUE &
      pp : PIECES &
      colorOf ( pp ) = color &
      diceValue = 6 & pp : lockedPieces & card ( externalPos |> { startPoint ( colorOf ( pp ) ) } ) < 2
    THEN
      computeAction ( FALSE , FALSE ) ||
      setFree ( pp )
    END ;

  vv <-- throwDice =
    PRE
      gameStarted = TRUE &
      hasRoll = TRUE &
      // não tem ações pendentes ou não tem ações possíveis
      ( diceValue = 0 or not ( # pp . ( pp : PIECES & colorOf ( pp ) = color & ( diceValue = 6 & pp : lockedPieces & card ( externalPos |> { startPoint ( colorOf ( pp ) ) } ) < 2 or diceValue /= 0 & pp /: lockedPieces & ( pp : dom ( externalPos ) => ( diceValue <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( externalPos ( pp ) + diceValue ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) or ( diceValue - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) ) & ( pp : dom ( internalPos ) => internalPos ( pp ) + diceValue < numInternal ) ) ) ) )
    THEN vv <-- rollDice
    END ;

  skipTurn =
    PRE
      gameStarted = TRUE &
      hasRoll = FALSE &
      ( diceValue = 0 or not ( # pp . ( pp : PIECES & colorOf ( pp ) = color & ( diceValue = 6 & pp : lockedPieces & card ( externalPos |> { startPoint ( colorOf ( pp ) ) } ) < 2 or diceValue /= 0 & pp /: lockedPieces & ( pp : dom ( externalPos ) => ( diceValue <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( externalPos ( pp ) + diceValue ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) or ( diceValue - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) ) & ( pp : dom ( internalPos ) => internalPos ( pp ) + diceValue < numInternal ) ) ) ) ) &
      card ( finishOrder ) < card ( enabledColors )
    THEN nextTurn
    END ;

  walk ( pp ) =
    PRE
      gameStarted = TRUE &
      pp : PIECES &
      colorOf ( pp ) = color &
      diceValue /= 0 & pp /: lockedPieces & ( pp : dom ( externalPos ) => ( diceValue <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( externalPos ( pp ) + diceValue ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) or ( diceValue - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) ) & ( pp : dom ( internalPos ) => internalPos ( pp ) + diceValue < numInternal )
    THEN
      IF pp : dom ( externalPos ) & diceValue <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal THEN
        LET newPos
        BE newPos = ( diceValue + externalPos ( pp ) ) mod numExternal
        IN
          atePieceDummy <-- setExternalPos ( pp , newPos ) ||
          IF
            newPos /: ( stars \/ ran ( startPoint ) ) &
            ( externalPos ~ ; colorOf ) [ { newPos } ] - { colorOf ( pp ) } /= {}
          THEN
            computeAction ( TRUE , FALSE )
          ELSE
            computeAction ( FALSE , FALSE )
          END
        END
      ELSE
        IF pp : dom ( externalPos ) THEN
          setInternalPos ( pp , diceValue - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal - 1 )
        ELSE
          setInternalPos ( pp , diceValue + internalPos ( pp ) )
        END ||
        IF
          ( ( pp : dom ( internalPos ) & diceValue + internalPos ( pp ) = numInternal - 1 )
          or ( pp : dom ( externalPos ) & diceValue - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal - 1 = numInternal - 1 ) )
        THEN
          IF card ( internalPos ~ [ { numInternal - 1 } ] /\ colorOf ~ [ { color } ] ) = numPiecesByColor - 1 THEN
            computeAction ( FALSE , TRUE )
          ELSE
            computeAction ( TRUE , FALSE )
          END
        ELSE
          computeAction ( FALSE , FALSE )
        END
      END
    END ;

  ee , ii <-- getPiecePos ( pp ) =
    PRE pp : PIECES
    THEN ee , ii <-- getPos ( pp )
    END ;

  cc <-- getTurn =
    cc := color ;

  nn <-- getNumWinners =
      nn <-- numWinners ;

  cc <-- getPlacement ( nn ) =
      PRE nn : NAT & nn : dom ( finishOrder )
      THEN cc <-- placement ( nn )
      END ;

  // operações de pre condicao

  rr <-- pre_pickColor ( cc ) =
    PRE cc : COLORS
    THEN rr := bool ( cc /: enabledColors & gameStarted = FALSE )
    END ;

  rr <-- pre_unpickColor ( cc ) =
    PRE cc : COLORS
    THEN rr := bool ( cc /: enabledColors & gameStarted = FALSE )
    END ;

  rr <-- pre_initGame =
    rr := bool ( gameStarted = FALSE & card ( enabledColors ) >= 2 ) ;


  rr <-- pre_free ( pp ) =
    PRE pp : PIECES
    THEN rr := bool ( gameStarted = TRUE & colorOf ( pp ) = color & diceValue = 6 & pp : lockedPieces & card ( externalPos |> { startPoint ( colorOf ( pp ) ) } ) < 2 )
    END ;

  rr <-- pre_rollDice =
    rr := bool ( gameStarted = TRUE & hasRoll = TRUE & ( diceValue = 0 or not ( # pp . ( pp : PIECES & colorOf ( pp ) = color & ( diceValue = 6 & pp : lockedPieces & card ( externalPos |> { startPoint ( colorOf ( pp ) ) } ) < 2 or diceValue /= 0 & pp /: lockedPieces & ( pp : dom ( externalPos ) => ( diceValue <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( externalPos ( pp ) + diceValue ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) or ( diceValue - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) ) & ( pp : dom ( internalPos ) => internalPos ( pp ) + diceValue < numInternal ) ) ) ) ) ) ;

  rr <-- pre_nextTurn =
      rr := bool ( gameStarted = TRUE & hasRoll = FALSE & ( diceValue = 0 or not ( # pp . ( pp : PIECES & colorOf ( pp ) = color & ( diceValue = 6 & pp : lockedPieces & card ( externalPos |> { startPoint ( colorOf ( pp ) ) } ) < 2 or diceValue /= 0 & pp /: lockedPieces & ( pp : dom ( externalPos ) => ( diceValue <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( externalPos ( pp ) + diceValue ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) or ( diceValue - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) ) & ( pp : dom ( internalPos ) => internalPos ( pp ) + diceValue < numInternal ) ) ) ) ) & card ( finishOrder ) < card ( enabledColors ) ) ;

  rr <-- pre_walk ( pp ) =
    PRE pp : PIECES
    THEN rr := bool ( gameStarted = TRUE & colorOf ( pp ) = color & diceValue /= 0 & pp /: lockedPieces & ( pp : dom ( externalPos ) => ( diceValue <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( externalPos ( pp ) + diceValue ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) or ( diceValue - ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal - 1 < numInternal & ! nn . ( nn : 0 .. numExternal - 1 & nn /= externalPos ( pp ) & ( nn - externalPos ( pp ) + numExternal ) mod numExternal <= ( ( startPoint ( colorOf ( pp ) ) + numExternal - 2 ) mod numExternal - externalPos ( pp ) + numExternal ) mod numExternal => card ( externalPos |> { nn } ) < 2 ) ) ) & ( pp : dom ( internalPos ) => internalPos ( pp ) + diceValue < numInternal ) )
    END ;

  rr <-- pre_finishGame =
      rr := bool ( gameStarted = TRUE & card ( finishOrder ) >= 1 )
END
