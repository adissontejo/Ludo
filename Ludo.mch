MACHINE Ludo
SEES Ludo_ctx
INCLUDES
  board.Ludo_board,
  turn.Ludo_turn

DEFINITIONS
  // ponto final externo
  finishPoint(color) == (startPoint(color) + numExternal - 2) mod numExternal;
   
  // diferença entre duas posições externas 
  stepsDiff(n1, n2) == (n2 - n1 + numExternal) mod numExternal;

  // quantidade de passos para chegar no ponto final externo
  stepsToFinish(piece) == stepsDiff(board.externalPos(piece), finishPoint(colorOf(piece)));

  // retorna se a cor tem todas as suas peças finalizadas
  isFinished(color) == colorOf~[{color}] <: board.internalPos~[{numInternal-1}];

  // verifica se peça pode ser liberada
  canFree(pp) ==
    turn.diceValue = 6 &
    pp : board.lockedPieces &
    card(board.externalPos |> {startPoint(colorOf(pp))}) < 2;

  // regra de barreira
  // verifica se o caminho está livre de barreiras
  isPathFree(n1, n2) == !nn . (
    nn : 0..numExternal-1 & nn /= n1 & stepsDiff(n1, nn) <= stepsDiff(n1, n2) =>
    card(board.externalPos |> {nn}) < 2
  );

  // verifica se a peça pode andar
  canWalk(pp) == 
    turn.diceValue /= 0 &
    pp /: board.lockedPieces &
    (pp : dom(board.externalPos) => 
      (
        turn.diceValue <= stepsToFinish(pp) &
        isPathFree(board.externalPos(pp), (board.externalPos(pp) + turn.diceValue) mod numExternal)
      ) or (
        turn.diceValue - stepsToFinish(pp) - 1 < numInternal &
        isPathFree(board.externalPos(pp), finishPoint(colorOf(pp)))
      )
    ) &
    (pp : dom(board.internalPos) =>
      board.internalPos(pp) + turn.diceValue < numInternal
    );

  // verifica se a cor tem ações para fazer: liberar ou andar
  hasActions == # pp . (pp : PIECES & colorOf(pp) = turn.color & (canFree(pp) or canWalk(pp)))

INVARIANT
  ! cc . (cc : ran(turn.finishOrder) => isFinished(cc)) &
  // para todas as peças que a cor não esta habilitada ao jogo, ficam bloqueadas nos seus pontos
  // de partida
  ! pp . (pp : PIECES => (colorOf(pp) /: turn.enabledColors => pp : board.lockedPieces))

OPERATIONS
  pickColor(cc) =
    PRE cc : COLORS & cc /: turn.enabledColors & turn.gameStarted = FALSE
    THEN turn.pickColor(cc)
    END;
 
  unpickColor(cc) = 
    PRE cc : COLORS & cc : turn.enabledColors & turn.gameStarted = FALSE
    THEN turn.unpickColor(cc)
    END;

  initGame =
    PRE 
      turn.gameStarted = FALSE
      & card(turn.enabledColors) >= 2
    THEN
      turn.initGame ||
      board.clear
    END;

  free(pp) = 
    PRE
      turn.gameStarted = TRUE &
      pp : PIECES &
      colorOf(pp) = turn.color &
      canFree(pp)
    THEN
      turn.computeAction(FALSE, FALSE) ||
      board.setFree(pp)
    END;

  vv <-- rollDice =
    PRE
      turn.gameStarted = TRUE &
      turn.hasRoll = TRUE &
      // não tem ações pendentes ou não tem ações possíveis
      (turn.diceValue = 0 or not(hasActions))
    THEN vv <-- turn.rollDice
    END;

  nextTurn =
    PRE
      turn.gameStarted = TRUE &
      turn.hasRoll = FALSE &
      (turn.diceValue = 0 or not(hasActions)) &
      card(turn.finishOrder) < card(turn.enabledColors)
    THEN turn.nextTurn
    END;
 
  walk(pp) =
    PRE
      turn.gameStarted = TRUE &
      pp : PIECES &
      colorOf(pp) = turn.color &
      canWalk(pp)
    THEN
      IF pp : dom(board.externalPos) & turn.diceValue <= stepsToFinish(pp) THEN
        LET newPos
        BE newPos = (turn.diceValue + board.externalPos(pp)) mod numExternal
        IN 
          board.setExternalPos(pp, newPos) ||
          IF
            newPos /: (stars \/ ran(startPoint)) &
            (board.externalPos~;colorOf)[{newPos}] - {colorOf(pp)} /= {}
          THEN
            turn.computeAction(TRUE, FALSE)
          ELSE
            turn.computeAction(FALSE, FALSE)
          END
        END
      ELSE
        IF pp : dom(board.externalPos) THEN
          board.setInternalPos(pp, turn.diceValue - stepsToFinish(pp) - 1)
        ELSE
          board.setInternalPos(pp, turn.diceValue + board.internalPos(pp))
        END ||
        IF  
	  ((pp : dom(board.internalPos) & turn.diceValue + board.internalPos(pp) = numInternal - 1)
	  or (pp : dom(board.externalPos) & turn.diceValue - stepsToFinish(pp) - 1 = numInternal - 1))
        THEN
          IF card(board.internalPos~[{numInternal-1}] /\ colorOf~[{turn.color}]) = numPiecesByColor - 1 THEN
            turn.computeAction(FALSE, TRUE)
          ELSE
            turn.computeAction(TRUE, FALSE)
          END
        ELSE
          turn.computeAction(FALSE, FALSE)
        END
      END 
    END;

  dd <-- getDiceValue = 
    PRE turn.gameStarted = TRUE & turn.diceValue /= 0
    THEN dd := turn.diceValue
    END;

  ee, ii <-- getBoard =
    PRE turn.gameStarted = TRUE
    THEN ee, ii := board.externalPos, board.internalPos
    END;

  cc <-- getTurn =
    PRE turn.gameStarted = TRUE & card(turn.finishOrder) < numColors
    THEN cc := turn.color
    END;

  oo <-- finishGame =
    PRE turn.gameStarted = TRUE & card(turn.finishOrder) >= 1
    THEN
      oo := turn.finishOrder ||
      turn.endGame
    END
END
