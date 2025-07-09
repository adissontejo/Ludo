MACHINE Ludo_board
SEES Ludo_ctx

ABSTRACT_VARIABLES
  lockedPieces ,
  externalPos ,
  internalPos

INVARIANT
  lockedPieces : POW ( PIECES ) &

  // função parcial, onde indica a peça e sua posição
  // é parcial porque pode estar exclusivamente em externalPos ou em internalPos
  externalPos : PIECES +-> 0 .. numExternal - 1 &
  internalPos : PIECES +-> 0 .. numInternal - 1 &

  // basicamente indicam que não é possível ter a mesma peça em dois lugares diferentes
  // e todas as peças estão contidas no tabuleiro
  dom ( externalPos ) /\ dom ( internalPos ) = {} &
  dom ( externalPos ) /\ lockedPieces = {} &
  dom ( internalPos ) /\ lockedPieces = {} &
  dom ( externalPos ) \/ dom ( internalPos ) \/ lockedPieces = PIECES &

  // regra de barreira
  // para todas as posições externas do tabuleiro, nunca existirão mais de duas peças
  // e se não for uma casa segura, nunca existirão duas peças de cores difrentes
  ! nn . ( nn : 0 .. numExternal - 1 =>
    card ( externalPos |> { nn } ) <= 2 &
    ( nn /: ( stars \/ ran ( startPoint ) ) => card ( ( externalPos ~ ; colorOf ) [ { nn } ] ) <= 1 )
  )

INITIALISATION
  lockedPieces := PIECES ||
  externalPos := {} ||
  internalPos := {}

OPERATIONS
  clear =
    lockedPieces , externalPos , internalPos := PIECES , {} , {} ;

  // peça uma peça, e se a quantidade de peças for menor que 2 na posição inicial,
  // ela libera a peça
  // regra de barreira
  setFree ( pp ) =
    PRE
      pp : PIECES &
      pp : lockedPieces &
      card ( externalPos |> { startPoint ( colorOf ( pp ) ) } ) < 2
    THEN
      lockedPieces := lockedPieces - { pp } ||
      externalPos ( pp ) := startPoint ( colorOf ( pp ) )
    END ;

  // não pode pertecencer as peças bloqueadas, e na posição que a peça vai não pode ter
  // duas ou mais peças dessa cor.
  setExternalPos ( pp , nn ) =
    PRE
      pp : PIECES &
      pp /: lockedPieces &
      pp /: dom ( internalPos ) &
      nn : 0 .. numExternal - 1 &
      card ( externalPos |> { nn } ) < 2
    THEN
      // acao de comer outra peça {
      IF
        nn /: ( stars \/ ran ( startPoint ) ) &
        ( externalPos ~ ; colorOf ) [ { nn } ] - { colorOf ( pp ) } /= {}
      THEN
        externalPos := ( externalPos |>> { nn } ) <+ { pp |-> nn } ||
        lockedPieces := lockedPieces \/ externalPos ~ [ { nn } ]
      // }
      ELSE
        externalPos ( pp ) := nn
      END
    END ;

  setInternalPos ( pp , nn ) =
    PRE pp : PIECES & pp /: lockedPieces & nn : 0 .. numInternal - 1
    THEN
      internalPos ( pp ) := nn ||
      externalPos := { pp } <<| externalPos
    END ;

  ee , ii <-- getPos ( pp ) =
    PRE pp : PIECES
    THEN
      IF pp : dom ( externalPos ) THEN
          ee , ii := externalPos ( pp ) , - 1
      ELSIF pp : dom ( internalPos ) THEN
          ee , ii := - 1 , internalPos ( pp )
      ELSE
          ee , ii := - 1 , - 1
      END
    END
END
