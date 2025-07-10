MACHINE Ludo
SEES Ludo_ctx
INCLUDES
  Ludo_board ,
  Ludo_turn
PROMOTES
  pickColor , unpickColor , endGame , getDiceValue
DEFINITIONS
  // ponto final externo
  finishPoint ( color ) == ( startPoint ( color ) + numExternal - 2 ) mod numExternal ;


  stepsDiff ( n1 , n2 ) == ( n2 - n1 + numExternal ) mod numExternal ;


  stepsToFinish ( piece ) == stepsDiff ( externalPos ( piece ) , finishPoint ( colorOf ( piece ) ) ) ;


  isFinished ( color ) == colorOf ~ [ { color } ] <: internalPos ~ [ { numInternal - 1 } ] ;


  canFree ( pp ) ==
    diceValue = 6 &
    pp : lockedPieces &
    card ( externalPos |> { startPoint ( colorOf ( pp ) ) } ) < 2 ;



  isPathFree ( n1 , n2 ) == ! nn . (
    nn : 0 .. numExternal - 1 & nn /= n1 & stepsDiff ( n1 , nn ) <= stepsDiff ( n1 , n2 ) =>
    card ( externalPos |> { nn } ) < 2
  ) ;


  canWalk ( pp ) ==
    diceValue /= 0 &
    pp /: lockedPieces &
    ( pp : dom ( externalPos ) =>
      (
        diceValue <= stepsToFinish ( pp ) &
        isPathFree ( externalPos ( pp ) , ( externalPos ( pp ) + diceValue ) mod numExternal )
      ) or (
        diceValue - stepsToFinish ( pp ) - 1 < numInternal &
        isPathFree ( externalPos ( pp ) , finishPoint ( colorOf ( pp ) ) )
      )
    ) &
    ( pp : dom ( internalPos ) =>
      internalPos ( pp ) + diceValue < numInternal
    ) ;


  hasActions == # pp . ( pp : PIECES & colorOf ( pp ) = color & ( canFree ( pp ) or canWalk ( pp ) ) )

ABSTRACT_VARIABLES
    atePieceDummy

INVARIANT
  ! cc . ( cc : ran ( finishOrder ) => isFinished ( cc ) ) &
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
      canFree ( pp )
    THEN
      computeAction ( FALSE , FALSE ) ||
      setFree ( pp )
    END ;

  vv <-- throwDice =
    PRE
      gameStarted = TRUE &
      hasRoll = TRUE &
      // não tem ações pendentes ou não tem ações possíveis
      ( diceValue = 0 or not ( hasActions ) )
    THEN vv <-- rollDice
    END ;

  skipTurn =
    PRE
      gameStarted = TRUE &
      hasRoll = FALSE &
      ( diceValue = 0 or not ( hasActions ) ) &
      card ( finishOrder ) < card ( enabledColors )
    THEN nextTurn
    END ;

  walk ( pp ) =
    PRE
      gameStarted = TRUE &
      pp : PIECES &
      colorOf ( pp ) = color &
      canWalk ( pp )
    THEN
      IF pp : dom ( externalPos ) & diceValue <= stepsToFinish ( pp ) THEN
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
          setInternalPos ( pp , diceValue - stepsToFinish ( pp ) - 1 )
        ELSE
          setInternalPos ( pp , diceValue + internalPos ( pp ) )
        END ||
        IF
          ( ( pp : dom ( internalPos ) & diceValue + internalPos ( pp ) = numInternal - 1 )
          or ( pp : dom ( externalPos ) & diceValue - stepsToFinish ( pp ) - 1 = numInternal - 1 ) )
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
    THEN rr := bool ( gameStarted = TRUE & colorOf ( pp ) = color & canFree ( pp ) )
    END ;

  rr <-- pre_rollDice =
    rr := bool ( gameStarted = TRUE & hasRoll = TRUE & ( diceValue = 0 or not ( hasActions ) ) ) ;

  rr <-- pre_nextTurn =
      rr := bool ( gameStarted = TRUE & hasRoll = FALSE & ( diceValue = 0 or not ( hasActions ) ) & card ( finishOrder ) < card ( enabledColors ) ) ;

  rr <-- pre_walk ( pp ) =
    PRE pp : PIECES
    THEN rr := bool ( gameStarted = TRUE & colorOf ( pp ) = color & canWalk ( pp ) )
    END ;

  rr <-- pre_finishGame =
      rr := bool ( gameStarted = TRUE & card ( finishOrder ) >= 1 )
END
