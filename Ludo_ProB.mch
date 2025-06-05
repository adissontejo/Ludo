MACHINE Ludo_ProB
EXTENDS Ludo
SEES Ludo_ctx
CONSTANTS
  Red1, Red2, Red3, Red4,
  Green1, Green2, Green3, Green4,
  Yellow1, Yellow2, Yellow3, Yellow4,
  Blue1, Blue2, Blue3, Blue4

PROPERTIES
  Red1 : PIECES & Red2 : PIECES & Red3 : PIECES & Red4 : PIECES &
  Green1 : PIECES & Green2 : PIECES & Green3 : PIECES & Green4 : PIECES &
  Yellow1 : PIECES & Yellow2 : PIECES & Yellow3 : PIECES & Yellow4 : PIECES &
  Blue1 : PIECES & Blue2 : PIECES & Blue3 : PIECES & Blue4 : PIECES &
  PIECES = {
    Red1, Red2, Red3, Red4,
    Green1, Green2, Green3, Green4,
    Yellow1, Yellow2, Yellow3, Yellow4,
    Blue1, Blue2, Blue3, Blue4
  } &
  card(PIECES) = 16 &
  colorOf = {
    Red1 |-> RED, Red2 |-> RED, Red3 |-> RED, Red4 |-> RED,
    Green1 |-> GREEN, Green2 |-> GREEN, Green3 |-> GREEN, Green4 |-> GREEN,
    Yellow1 |-> YELLOW, Yellow2 |-> YELLOW, Yellow3 |-> YELLOW, Yellow4 |-> YELLOW,
    Blue1 |-> BLUE, Blue2 |-> BLUE, Blue3 |-> BLUE, Blue4 |-> BLUE
  }

END
