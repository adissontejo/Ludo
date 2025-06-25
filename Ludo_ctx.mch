MACHINE Ludo_ctx

SETS
  COLORS = {RED, GREEN, YELLOW, BLUE};
  PIECES

ABSTRACT_CONSTANTS
  colorOf,
  diceOptions,
  stars,
  startPoint,
  colorsOrder
  
CONCRETE_CONSTANTS
  numColors,
  numPiecesByColor,
  numExternal,
  numInternal

PROPERTIES
  numPiecesByColor = 4 &
  numExternal = 52 &
  numInternal = 6 &
  numColors : NAT &
  numColors = card(COLORS) &
  diceOptions = 1..6 &
  stars <: 0..numExternal-1 &
  stars = {8,21,34,47} &
  // função total com pontos iniciais de cada cor
  startPoint : COLORS --> 0..numExternal-1 &
  startPoint = {RED |-> 0, GREEN |-> 13, YELLOW |-> 26, BLUE |-> 39} &
  card(PIECES) = numPiecesByColor * card(COLORS) &

  // função sobrejetiva, onde para todo cor, existe uma quantidade 
  // finita de peças e essa quantidade é denifida pela cosntante numPiecesByColor
  colorOf : PIECES -->> COLORS &
  !cc . (cc : COLORS => colorOf~[{cc}] : FIN(PIECES) & card(colorOf~[{cc}]) = numPiecesByColor) &
  
  // array de cores, função bijetiva
  colorsOrder : 0..numColors-1 >->> COLORS &
  colorsOrder = { 0 |-> RED, 1 |-> GREEN, 2 |-> YELLOW, 3 |-> BLUE }

END