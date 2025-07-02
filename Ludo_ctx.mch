MACHINE Ludo_ctx

SETS
  COLORS;
  PIECES

ABSTRACT_CONSTANTS
  diceOptions,
  stars
  
CONCRETE_CONSTANTS
  colorOf,
  startPoint,
  colorsOrder,
  piecesOrder,
  numColors,
  numPiecesByColor,
  numPieces,
  numExternal,
  numInternal

PROPERTIES
  numPiecesByColor = 4 &
  numExternal = 52 &
  numInternal = 6 &
  numColors = 4 &
  card(COLORS) = numColors &
  numPieces : NAT &
  numPieces = numPiecesByColor * numColors & 
  diceOptions = 1..6 &
  stars <: 0..numExternal-1 &
  stars = {8,21,34,47} &
  // função total com pontos iniciais de cada cor
  startPoint : COLORS >-> 0..51 &
  card(PIECES) = numPiecesByColor * numColors &

  colorsOrder : 0..3 >->> COLORS &
  
  // array de peças, função bijetiva
  colorOf : PIECES -->> COLORS &
  
  
  // função sobrejetiva, onde para todo cor, existe uma quantidade 
  // finita de peças e essa quantidade é denifida pela cosntante numPiecesByColor
  !cc . (cc : COLORS => colorOf~[{cc}] : FIN(PIECES) & card(colorOf~[{cc}]) = numPiecesByColor) &
  
  piecesOrder : 0..15 >->> PIECES

END