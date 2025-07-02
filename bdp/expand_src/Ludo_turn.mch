MACHINE Ludo_turn
SEES Ludo_ctx

DEFINITIONS
  turnIndex == colorsOrder ~ ( color ) // indice da cor que esta jogando

ABSTRACT_VARIABLES
  gameStarted ,
  enabledColors ,
  color ,
  hasRoll ,
  diceValue ,
  sixSequenceCount ,
  finishOrder

INVARIANT
  gameStarted : BOOL &
  enabledColors : POW ( COLORS ) &
  enabledColors : FIN ( enabledColors ) &
  color : COLORS &
  hasRoll : BOOL &
  diceValue : 0 .. 6 &
  sixSequenceCount : 0 .. 2 &
  // array de de cores que finalizaram o jogo
  finishOrder : 0 .. numColors - 1 >+> COLORS &
  finishOrder : FIN ( finishOrder ) &
  ( gameStarted = FALSE or (
    card ( enabledColors ) >= 2 &
    color : enabledColors &
    ran ( finishOrder ) <: enabledColors
  ) )

INITIALISATION
  gameStarted := FALSE ||
  enabledColors := {} ||
  color :: COLORS ||
  hasRoll := FALSE ||
  diceValue := 0 ||
  sixSequenceCount := 0 ||
  finishOrder := {}

OPERATIONS
  pickColor ( cc ) =
    PRE cc : COLORS & cc /: enabledColors & gameStarted = FALSE
    THEN enabledColors := enabledColors \/ { cc }
    END ;

  unpickColor ( cc ) =
    PRE cc : COLORS & cc : enabledColors & gameStarted = FALSE
    THEN enabledColors := enabledColors - { cc }
    END ;

  initGame =
    PRE gameStarted = FALSE & card ( enabledColors ) >= 2
    THEN
      gameStarted := TRUE ||
      color :: enabledColors ||
      hasRoll := TRUE ||
      diceValue := 0 ||
      sixSequenceCount := 0 ||
      finishOrder := {}
    END ;

  // zera o valor do dado atual, e caso a peça tenha turno extra ele altera hasRoll pra TRUE
  computeAction ( extraTurn , finished ) =
    PRE
      gameStarted = TRUE &
      diceValue /= 0 &
      extraTurn : BOOL &
      finished : BOOL &
      ( extraTurn = TRUE => finished = FALSE )
    THEN
      diceValue := 0 ||
      IF finished = TRUE THEN
        finishOrder ( card ( finishOrder ) ) := color ||
        hasRoll := FALSE
      ELSIF extraTurn = TRUE THEN
        hasRoll := TRUE
      END
    END ;

  nextTurn =
    PRE
      gameStarted = TRUE &
      hasRoll = FALSE &
      card ( finishOrder ) < card ( enabledColors )
    THEN
      hasRoll := TRUE ||
      sixSequenceCount := 0 ||
      diceValue := 0 ||
      LET numJumps
      BE
        // menor número de pulos em cores para a próxima cor válida de acordo com colorsOrder
        numJumps = min ( { nn |
          nn : 1 .. numColors & colorsOrder ( ( turnIndex + nn ) mod numColors ) : enabledColors - ran ( finishOrder )
        } )
      IN color := colorsOrder ( ( turnIndex + numJumps ) mod numColors )
      END
    END ;

  value <-- rollDice =
    PRE gameStarted = TRUE & hasRoll = TRUE
    THEN
      ANY dd WHERE dd : 1 .. 6
      THEN
        value := dd ||
        IF dd = 6 THEN
          IF sixSequenceCount < 2 THEN
            sixSequenceCount := sixSequenceCount + 1 ||
            diceValue := dd
          ELSE
            sixSequenceCount := 0 ||
            hasRoll := FALSE ||
            diceValue := 0
          END
        ELSE
          hasRoll := FALSE ||
          diceValue := dd
        END
      END
    END ;

  endGame =
    PRE gameStarted = TRUE & card ( finishOrder ) >= 1
    THEN gameStarted := FALSE
    END
END
