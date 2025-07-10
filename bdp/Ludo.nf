Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Ludo))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Ludo))==(Machine(Ludo));
  Level(Machine(Ludo))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Ludo)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Ludo))==(Ludo_ctx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Ludo))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Ludo))==(Ludo_turn,Ludo_board);
  List_Includes(Machine(Ludo))==(Ludo_board,Ludo_turn)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Ludo))==(pickColor,unpickColor,endGame,getDiceValue)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Ludo))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Ludo))==(?);
  Context_List_Variables(Machine(Ludo))==(?);
  Abstract_List_Variables(Machine(Ludo))==(?);
  Local_List_Variables(Machine(Ludo))==(atePieceDummy);
  List_Variables(Machine(Ludo))==(atePieceDummy,internalPos,externalPos,lockedPieces,finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted);
  External_List_Variables(Machine(Ludo))==(atePieceDummy,internalPos,externalPos,lockedPieces,finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Ludo))==(?);
  Abstract_List_VisibleVariables(Machine(Ludo))==(?);
  External_List_VisibleVariables(Machine(Ludo))==(?);
  Expanded_List_VisibleVariables(Machine(Ludo))==(?);
  List_VisibleVariables(Machine(Ludo))==(?);
  Internal_List_VisibleVariables(Machine(Ludo))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Ludo))==(btrue);
  Gluing_List_Invariant(Machine(Ludo))==(btrue);
  Abstract_List_Invariant(Machine(Ludo))==(btrue);
  Expanded_List_Invariant(Machine(Ludo))==(lockedPieces: POW(PIECES) & externalPos: PIECES +-> 0..numExternal-1 & internalPos: PIECES +-> 0..numInternal-1 & dom(externalPos)/\dom(internalPos) = {} & dom(externalPos)/\lockedPieces = {} & dom(internalPos)/\lockedPieces = {} & dom(externalPos)\/dom(internalPos)\/lockedPieces = PIECES & !nn.(nn: 0..numExternal-1 => card(externalPos|>{nn})<=2 & (nn/:(stars\/ran(startPoint)) => card((externalPos~;colorOf)[{nn}])<=1)) & gameStarted: BOOL & enabledColors: POW(COLORS) & enabledColors: FIN(enabledColors) & color: COLORS & hasRoll: BOOL & diceValue: 0..6 & sixSequenceCount: 0..2 & finishOrder: 0..numColors-1 >+> COLORS & finishOrder: FIN(finishOrder) & dom(finishOrder) = 0..card(finishOrder)-1 & (gameStarted = FALSE or (card(enabledColors)>=2 & color: enabledColors & ran(finishOrder) <: enabledColors)));
  Context_List_Invariant(Machine(Ludo))==(btrue);
  List_Invariant(Machine(Ludo))==(!cc.(cc: ran(finishOrder) => colorOf~[{cc}] <: internalPos~[{numInternal-1}]) & !pp.(pp: PIECES => (colorOf(pp)/:enabledColors => pp: lockedPieces)) & atePieceDummy: BOOL)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Ludo))==(btrue);
  Expanded_List_Assertions(Machine(Ludo))==(btrue);
  Context_List_Assertions(Machine(Ludo))==(btrue);
  List_Assertions(Machine(Ludo))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Ludo))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Ludo))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Ludo))==(lockedPieces,externalPos,internalPos:=PIECES,{},{};(gameStarted,enabledColors:=FALSE,{} || @(color$0).(color$0: COLORS ==> color:=color$0) || hasRoll:=FALSE || diceValue:=0 || sixSequenceCount:=0 || finishOrder:={});@(atePieceDummy$0).(atePieceDummy$0: BOOL ==> atePieceDummy:=atePieceDummy$0));
  Context_List_Initialisation(Machine(Ludo))==(skip);
  List_Initialisation(Machine(Ludo))==(atePieceDummy:: BOOL)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Ludo))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Ludo),Machine(Ludo_board))==(?);
  List_Instanciated_Parameters(Machine(Ludo),Machine(Ludo_turn))==(?);
  List_Instanciated_Parameters(Machine(Ludo),Machine(Ludo_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Ludo),Machine(Ludo_turn))==(btrue);
  List_Context_Constraints(Machine(Ludo))==(btrue);
  List_Constraints(Machine(Ludo))==(btrue);
  List_Constraints(Machine(Ludo),Machine(Ludo_board))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Ludo))==(startGame,free,throwDice,skipTurn,walk,getPiecePos,getTurn,getNumWinners,getPlacement,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_nextTurn,pre_walk,pre_finishGame,pickColor,unpickColor,endGame,getDiceValue);
  List_Operations(Machine(Ludo))==(startGame,free,throwDice,skipTurn,walk,getPiecePos,getTurn,getNumWinners,getPlacement,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_nextTurn,pre_walk,pre_finishGame,pickColor,unpickColor,endGame,getDiceValue)
END
&
THEORY ListInputX IS
  List_Input(Machine(Ludo),getDiceValue)==(?);
  List_Input(Machine(Ludo),endGame)==(?);
  List_Input(Machine(Ludo),unpickColor)==(cc);
  List_Input(Machine(Ludo),pickColor)==(cc);
  List_Input(Machine(Ludo),startGame)==(?);
  List_Input(Machine(Ludo),free)==(pp);
  List_Input(Machine(Ludo),throwDice)==(?);
  List_Input(Machine(Ludo),skipTurn)==(?);
  List_Input(Machine(Ludo),walk)==(pp);
  List_Input(Machine(Ludo),getPiecePos)==(pp);
  List_Input(Machine(Ludo),getTurn)==(?);
  List_Input(Machine(Ludo),getNumWinners)==(?);
  List_Input(Machine(Ludo),getPlacement)==(nn);
  List_Input(Machine(Ludo),pre_pickColor)==(cc);
  List_Input(Machine(Ludo),pre_unpickColor)==(cc);
  List_Input(Machine(Ludo),pre_initGame)==(?);
  List_Input(Machine(Ludo),pre_free)==(pp);
  List_Input(Machine(Ludo),pre_rollDice)==(?);
  List_Input(Machine(Ludo),pre_nextTurn)==(?);
  List_Input(Machine(Ludo),pre_walk)==(pp);
  List_Input(Machine(Ludo),pre_finishGame)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Ludo),getDiceValue)==(value);
  List_Output(Machine(Ludo),endGame)==(?);
  List_Output(Machine(Ludo),unpickColor)==(?);
  List_Output(Machine(Ludo),pickColor)==(?);
  List_Output(Machine(Ludo),startGame)==(?);
  List_Output(Machine(Ludo),free)==(?);
  List_Output(Machine(Ludo),throwDice)==(vv);
  List_Output(Machine(Ludo),skipTurn)==(?);
  List_Output(Machine(Ludo),walk)==(?);
  List_Output(Machine(Ludo),getPiecePos)==(ee,ii);
  List_Output(Machine(Ludo),getTurn)==(cc);
  List_Output(Machine(Ludo),getNumWinners)==(nn);
  List_Output(Machine(Ludo),getPlacement)==(cc);
  List_Output(Machine(Ludo),pre_pickColor)==(rr);
  List_Output(Machine(Ludo),pre_unpickColor)==(rr);
  List_Output(Machine(Ludo),pre_initGame)==(rr);
  List_Output(Machine(Ludo),pre_free)==(rr);
  List_Output(Machine(Ludo),pre_rollDice)==(rr);
  List_Output(Machine(Ludo),pre_nextTurn)==(rr);
  List_Output(Machine(Ludo),pre_walk)==(rr);
  List_Output(Machine(Ludo),pre_finishGame)==(rr)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Ludo),getDiceValue)==(value <-- getDiceValue);
  List_Header(Machine(Ludo),endGame)==(endGame);
  List_Header(Machine(Ludo),unpickColor)==(unpickColor(cc));
  List_Header(Machine(Ludo),pickColor)==(pickColor(cc));
  List_Header(Machine(Ludo),startGame)==(startGame);
  List_Header(Machine(Ludo),free)==(free(pp));
  List_Header(Machine(Ludo),throwDice)==(vv <-- throwDice);
  List_Header(Machine(Ludo),skipTurn)==(skipTurn);
  List_Header(Machine(Ludo),walk)==(walk(pp));
  List_Header(Machine(Ludo),getPiecePos)==(ee,ii <-- getPiecePos(pp));
  List_Header(Machine(Ludo),getTurn)==(cc <-- getTurn);
  List_Header(Machine(Ludo),getNumWinners)==(nn <-- getNumWinners);
  List_Header(Machine(Ludo),getPlacement)==(cc <-- getPlacement(nn));
  List_Header(Machine(Ludo),pre_pickColor)==(rr <-- pre_pickColor(cc));
  List_Header(Machine(Ludo),pre_unpickColor)==(rr <-- pre_unpickColor(cc));
  List_Header(Machine(Ludo),pre_initGame)==(rr <-- pre_initGame);
  List_Header(Machine(Ludo),pre_free)==(rr <-- pre_free(pp));
  List_Header(Machine(Ludo),pre_rollDice)==(rr <-- pre_rollDice);
  List_Header(Machine(Ludo),pre_nextTurn)==(rr <-- pre_nextTurn);
  List_Header(Machine(Ludo),pre_walk)==(rr <-- pre_walk(pp));
  List_Header(Machine(Ludo),pre_finishGame)==(rr <-- pre_finishGame)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(Ludo),getDiceValue)==(btrue);
  List_Precondition(Machine(Ludo),getDiceValue)==(btrue);
  Own_Precondition(Machine(Ludo),endGame)==(gameStarted = TRUE & card(finishOrder)>=1);
  List_Precondition(Machine(Ludo),endGame)==(gameStarted = TRUE & card(finishOrder)>=1);
  Own_Precondition(Machine(Ludo),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE);
  List_Precondition(Machine(Ludo),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE);
  Own_Precondition(Machine(Ludo),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE);
  List_Precondition(Machine(Ludo),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE);
  List_Precondition(Machine(Ludo),startGame)==(gameStarted = FALSE & card(enabledColors)>=2);
  List_Precondition(Machine(Ludo),free)==(gameStarted = TRUE & pp: PIECES & colorOf(pp) = color & diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2);
  List_Precondition(Machine(Ludo),throwDice)==(gameStarted = TRUE & hasRoll = TRUE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal))))));
  List_Precondition(Machine(Ludo),skipTurn)==(gameStarted = TRUE & hasRoll = FALSE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal))))) & card(finishOrder)<card(enabledColors));
  List_Precondition(Machine(Ludo),walk)==(gameStarted = TRUE & pp: PIECES & colorOf(pp) = color & diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal));
  List_Precondition(Machine(Ludo),getPiecePos)==(pp: PIECES);
  List_Precondition(Machine(Ludo),getTurn)==(btrue);
  List_Precondition(Machine(Ludo),getNumWinners)==(btrue);
  List_Precondition(Machine(Ludo),getPlacement)==(nn: NAT & nn: dom(finishOrder));
  List_Precondition(Machine(Ludo),pre_pickColor)==(cc: COLORS);
  List_Precondition(Machine(Ludo),pre_unpickColor)==(cc: COLORS);
  List_Precondition(Machine(Ludo),pre_initGame)==(btrue);
  List_Precondition(Machine(Ludo),pre_free)==(pp: PIECES);
  List_Precondition(Machine(Ludo),pre_rollDice)==(btrue);
  List_Precondition(Machine(Ludo),pre_nextTurn)==(btrue);
  List_Precondition(Machine(Ludo),pre_walk)==(pp: PIECES);
  List_Precondition(Machine(Ludo),pre_finishGame)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Ludo),pre_finishGame)==(btrue | rr:=bool(gameStarted = TRUE & card(finishOrder)>=1));
  Expanded_List_Substitution(Machine(Ludo),pre_walk)==(pp: PIECES | rr:=bool(gameStarted = TRUE & colorOf(pp) = color & diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal)));
  Expanded_List_Substitution(Machine(Ludo),pre_nextTurn)==(btrue | rr:=bool(gameStarted = TRUE & hasRoll = FALSE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal))))) & card(finishOrder)<card(enabledColors)));
  Expanded_List_Substitution(Machine(Ludo),pre_rollDice)==(btrue | rr:=bool(gameStarted = TRUE & hasRoll = TRUE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal)))))));
  Expanded_List_Substitution(Machine(Ludo),pre_free)==(pp: PIECES | rr:=bool(gameStarted = TRUE & colorOf(pp) = color & diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2));
  Expanded_List_Substitution(Machine(Ludo),pre_initGame)==(btrue | rr:=bool(gameStarted = FALSE & card(enabledColors)>=2));
  Expanded_List_Substitution(Machine(Ludo),pre_unpickColor)==(cc: COLORS | rr:=bool(cc/:enabledColors & gameStarted = FALSE));
  Expanded_List_Substitution(Machine(Ludo),pre_pickColor)==(cc: COLORS | rr:=bool(cc/:enabledColors & gameStarted = FALSE));
  Expanded_List_Substitution(Machine(Ludo),getPlacement)==(nn: NAT & nn: dom(finishOrder) | cc:=finishOrder(nn));
  Expanded_List_Substitution(Machine(Ludo),getNumWinners)==(btrue | nn:=card(finishOrder));
  Expanded_List_Substitution(Machine(Ludo),getTurn)==(btrue | cc:=color);
  Expanded_List_Substitution(Machine(Ludo),getPiecePos)==(pp: PIECES | pp: dom(externalPos) ==> ee,ii:=externalPos(pp), -1 [] not(pp: dom(externalPos)) ==> (pp: dom(internalPos) ==> ee,ii:= -1,internalPos(pp) [] not(pp: dom(internalPos)) ==> ee,ii:= -1, -1));
  Expanded_List_Substitution(Machine(Ludo),walk)==(gameStarted = TRUE & pp: PIECES & colorOf(pp) = color & diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal) | pp: dom(externalPos) & diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal ==> @newPos.(newPos = (diceValue+externalPos(pp)) mod numExternal ==> (pp: PIECES & pp/:lockedPieces & pp/:dom(internalPos) & newPos: 0..numExternal-1 & card(externalPos|>{newPos})<2 | newPos/:(stars\/ran(startPoint)) & (externalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={} ==> externalPos,lockedPieces,atePieceDummy:=externalPos|>>{newPos}<+{pp|->newPos},lockedPieces\/externalPos~[{newPos}],TRUE [] not(newPos/:(stars\/ran(startPoint)) & (externalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={}) ==> externalPos,atePieceDummy:=externalPos<+{pp|->newPos},FALSE || (newPos/:(stars\/ran(startPoint)) & (externalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={} ==> (gameStarted = TRUE & diceValue/=0 & TRUE: BOOL & FALSE: BOOL & (TRUE = TRUE => FALSE = FALSE) | diceValue:=0 || (FALSE = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(FALSE = TRUE) ==> (TRUE = TRUE ==> hasRoll:=TRUE [] not(TRUE = TRUE) ==> skip))) [] not(newPos/:(stars\/ran(startPoint)) & (externalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={}) ==> (gameStarted = TRUE & diceValue/=0 & FALSE: BOOL & FALSE: BOOL & (FALSE = TRUE => FALSE = FALSE) | diceValue:=0 || (FALSE = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(FALSE = TRUE) ==> (FALSE = TRUE ==> hasRoll:=TRUE [] not(FALSE = TRUE) ==> skip)))))) [] not(pp: dom(externalPos) & diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal) ==> (pp: dom(externalPos) ==> (pp: PIECES & pp/:lockedPieces & diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1: 0..numInternal-1 | internalPos,externalPos:=internalPos<+{pp|->diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1},{pp}<<|externalPos) [] not(pp: dom(externalPos)) ==> (pp: PIECES & pp/:lockedPieces & diceValue+internalPos(pp): 0..numInternal-1 | internalPos,externalPos:=internalPos<+{pp|->diceValue+internalPos(pp)},{pp}<<|externalPos) || (pp: dom(internalPos) & diceValue+internalPos(pp) = numInternal-1 or (pp: dom(externalPos) & diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1 = numInternal-1) ==> (card(internalPos~[{numInternal-1}]/\colorOf~[{color}]) = numPiecesByColor-1 ==> (gameStarted = TRUE & diceValue/=0 & FALSE: BOOL & TRUE: BOOL & (FALSE = TRUE => TRUE = FALSE) | diceValue:=0 || (TRUE = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(TRUE = TRUE) ==> (FALSE = TRUE ==> hasRoll:=TRUE [] not(FALSE = TRUE) ==> skip))) [] not(card(internalPos~[{numInternal-1}]/\colorOf~[{color}]) = numPiecesByColor-1) ==> (gameStarted = TRUE & diceValue/=0 & TRUE: BOOL & FALSE: BOOL & (TRUE = TRUE => FALSE = FALSE) | diceValue:=0 || (FALSE = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(FALSE = TRUE) ==> (TRUE = TRUE ==> hasRoll:=TRUE [] not(TRUE = TRUE) ==> skip)))) [] not(pp: dom(internalPos) & diceValue+internalPos(pp) = numInternal-1 or (pp: dom(externalPos) & diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1 = numInternal-1)) ==> (gameStarted = TRUE & diceValue/=0 & FALSE: BOOL & FALSE: BOOL & (FALSE = TRUE => FALSE = FALSE) | diceValue:=0 || (FALSE = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(FALSE = TRUE) ==> (FALSE = TRUE ==> hasRoll:=TRUE [] not(FALSE = TRUE) ==> skip))))));
  Expanded_List_Substitution(Machine(Ludo),skipTurn)==(gameStarted = TRUE & hasRoll = FALSE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal))))) & card(finishOrder)<card(enabledColors) & gameStarted = TRUE & hasRoll = FALSE & card(finishOrder)<card(enabledColors) | hasRoll,sixSequenceCount,diceValue:=TRUE,0,0 || @numJumps.(numJumps = min({nn | nn: 1..numColors & colorsOrder((colorsOrder~(color)+nn) mod numColors): enabledColors-ran(finishOrder)}) ==> color:=colorsOrder((colorsOrder~(color)+numJumps) mod numColors)));
  Expanded_List_Substitution(Machine(Ludo),throwDice)==(gameStarted = TRUE & hasRoll = TRUE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal))))) & gameStarted = TRUE & hasRoll = TRUE | @dd.(dd: 1..6 ==> (vv:=dd || (dd = 6 ==> (sixSequenceCount<2 ==> sixSequenceCount,diceValue:=sixSequenceCount+1,dd [] not(sixSequenceCount<2) ==> sixSequenceCount,hasRoll,diceValue:=0,FALSE,0) [] not(dd = 6) ==> hasRoll,diceValue:=FALSE,dd))));
  Expanded_List_Substitution(Machine(Ludo),free)==(gameStarted = TRUE & pp: PIECES & colorOf(pp) = color & diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 & gameStarted = TRUE & diceValue/=0 & FALSE: BOOL & FALSE: BOOL & (FALSE = TRUE => FALSE = FALSE) & pp: PIECES & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 | diceValue:=0 || (FALSE = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(FALSE = TRUE) ==> (FALSE = TRUE ==> hasRoll:=TRUE [] not(FALSE = TRUE) ==> skip)) || lockedPieces,externalPos:=lockedPieces-{pp},externalPos<+{pp|->startPoint(colorOf(pp))});
  Expanded_List_Substitution(Machine(Ludo),startGame)==(gameStarted = FALSE & card(enabledColors)>=2 & gameStarted = FALSE & card(enabledColors)>=2 & btrue | gameStarted:=TRUE || @(color$0).(color$0: enabledColors ==> color:=color$0) || hasRoll:=TRUE || diceValue:=0 || sixSequenceCount:=0 || finishOrder:={} || lockedPieces,externalPos,internalPos:=PIECES,{},{});
  List_Substitution(Machine(Ludo),getDiceValue)==(value:=diceValue);
  Expanded_List_Substitution(Machine(Ludo),getDiceValue)==(btrue | value:=diceValue);
  List_Substitution(Machine(Ludo),endGame)==(gameStarted:=FALSE);
  Expanded_List_Substitution(Machine(Ludo),endGame)==(gameStarted = TRUE & card(finishOrder)>=1 | gameStarted:=FALSE);
  List_Substitution(Machine(Ludo),unpickColor)==(enabledColors:=enabledColors-{cc});
  Expanded_List_Substitution(Machine(Ludo),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE | enabledColors:=enabledColors-{cc});
  List_Substitution(Machine(Ludo),pickColor)==(enabledColors:=enabledColors\/{cc});
  Expanded_List_Substitution(Machine(Ludo),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE | enabledColors:=enabledColors\/{cc});
  List_Substitution(Machine(Ludo),startGame)==(initGame || clear);
  List_Substitution(Machine(Ludo),free)==(computeAction(FALSE,FALSE) || setFree(pp));
  List_Substitution(Machine(Ludo),throwDice)==(vv <-- rollDice);
  List_Substitution(Machine(Ludo),skipTurn)==(nextTurn);
  List_Substitution(Machine(Ludo),walk)==(IF pp: dom(externalPos) & diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal THEN LET newPos BE newPos = (diceValue+externalPos(pp)) mod numExternal IN atePieceDummy <-- setExternalPos(pp,newPos) || IF newPos/:(stars\/ran(startPoint)) & (externalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={} THEN computeAction(TRUE,FALSE) ELSE computeAction(FALSE,FALSE) END END ELSE IF pp: dom(externalPos) THEN setInternalPos(pp,diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1) ELSE setInternalPos(pp,diceValue+internalPos(pp)) END || IF pp: dom(internalPos) & diceValue+internalPos(pp) = numInternal-1 or (pp: dom(externalPos) & diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1 = numInternal-1) THEN IF card(internalPos~[{numInternal-1}]/\colorOf~[{color}]) = numPiecesByColor-1 THEN computeAction(FALSE,TRUE) ELSE computeAction(TRUE,FALSE) END ELSE computeAction(FALSE,FALSE) END END);
  List_Substitution(Machine(Ludo),getPiecePos)==(ee,ii <-- getPos(pp));
  List_Substitution(Machine(Ludo),getTurn)==(cc:=color);
  List_Substitution(Machine(Ludo),getNumWinners)==(nn <-- numWinners);
  List_Substitution(Machine(Ludo),getPlacement)==(cc <-- placement(nn));
  List_Substitution(Machine(Ludo),pre_pickColor)==(rr:=bool(cc/:enabledColors & gameStarted = FALSE));
  List_Substitution(Machine(Ludo),pre_unpickColor)==(rr:=bool(cc/:enabledColors & gameStarted = FALSE));
  List_Substitution(Machine(Ludo),pre_initGame)==(rr:=bool(gameStarted = FALSE & card(enabledColors)>=2));
  List_Substitution(Machine(Ludo),pre_free)==(rr:=bool(gameStarted = TRUE & colorOf(pp) = color & diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2));
  List_Substitution(Machine(Ludo),pre_rollDice)==(rr:=bool(gameStarted = TRUE & hasRoll = TRUE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal)))))));
  List_Substitution(Machine(Ludo),pre_nextTurn)==(rr:=bool(gameStarted = TRUE & hasRoll = FALSE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal))))) & card(finishOrder)<card(enabledColors)));
  List_Substitution(Machine(Ludo),pre_walk)==(rr:=bool(gameStarted = TRUE & colorOf(pp) = color & diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal)));
  List_Substitution(Machine(Ludo),pre_finishGame)==(rr:=bool(gameStarted = TRUE & card(finishOrder)>=1))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Ludo))==(?);
  Inherited_List_Constants(Machine(Ludo))==(?);
  List_Constants(Machine(Ludo))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Ludo))==(?);
  Context_List_Defered(Machine(Ludo))==(COLORS,PIECES);
  Context_List_Sets(Machine(Ludo))==(COLORS,PIECES);
  List_Valuable_Sets(Machine(Ludo))==(?);
  Inherited_List_Enumerated(Machine(Ludo))==(?);
  Inherited_List_Defered(Machine(Ludo))==(?);
  Inherited_List_Sets(Machine(Ludo))==(?);
  List_Enumerated(Machine(Ludo))==(?);
  List_Defered(Machine(Ludo))==(?);
  List_Sets(Machine(Ludo))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Ludo))==(?);
  Expanded_List_HiddenConstants(Machine(Ludo))==(?);
  List_HiddenConstants(Machine(Ludo))==(?);
  External_List_HiddenConstants(Machine(Ludo))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Ludo))==(btrue);
  Context_List_Properties(Machine(Ludo))==(numPiecesByColor = 4 & numExternal = 52 & numInternal = 6 & numColors = 4 & card(COLORS) = numColors & numPieces: NAT & numPieces = numPiecesByColor*numColors & diceOptions = 1..6 & stars <: 0..numExternal-1 & stars = {8,21,34,47} & startPoint: COLORS >-> 0..51 & card(PIECES) = numPiecesByColor*numColors & colorsOrder: 0..3 >->> COLORS & colorOf: PIECES -->> COLORS & !cc.(cc: COLORS => colorOf~[{cc}]: FIN(PIECES) & card(colorOf~[{cc}]) = numPiecesByColor) & piecesOrder: 0..15 >->> PIECES & COLORS: FIN(INTEGER) & not(COLORS = {}) & PIECES: FIN(INTEGER) & not(PIECES = {}));
  Inherited_List_Properties(Machine(Ludo))==(btrue);
  List_Properties(Machine(Ludo))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Ludo),Machine(Ludo_ctx))==(?);
  Seen_Context_List_Enumerated(Machine(Ludo))==(?);
  Seen_Context_List_Invariant(Machine(Ludo))==(btrue);
  Seen_Context_List_Assertions(Machine(Ludo))==(btrue);
  Seen_Context_List_Properties(Machine(Ludo))==(btrue);
  Seen_List_Constraints(Machine(Ludo))==(btrue);
  Seen_List_Operations(Machine(Ludo),Machine(Ludo_ctx))==(?);
  Seen_Expanded_List_Invariant(Machine(Ludo),Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Ludo),getDiceValue)==(?);
  List_ANY_Var(Machine(Ludo),endGame)==(?);
  List_ANY_Var(Machine(Ludo),unpickColor)==(?);
  List_ANY_Var(Machine(Ludo),pickColor)==(?);
  List_ANY_Var(Machine(Ludo),startGame)==(?);
  List_ANY_Var(Machine(Ludo),free)==(?);
  List_ANY_Var(Machine(Ludo),throwDice)==(?);
  List_ANY_Var(Machine(Ludo),skipTurn)==(?);
  List_ANY_Var(Machine(Ludo),walk)==(?);
  List_ANY_Var(Machine(Ludo),getPiecePos)==(?);
  List_ANY_Var(Machine(Ludo),getTurn)==(?);
  List_ANY_Var(Machine(Ludo),getNumWinners)==(?);
  List_ANY_Var(Machine(Ludo),getPlacement)==(?);
  List_ANY_Var(Machine(Ludo),pre_pickColor)==(?);
  List_ANY_Var(Machine(Ludo),pre_unpickColor)==(?);
  List_ANY_Var(Machine(Ludo),pre_initGame)==(?);
  List_ANY_Var(Machine(Ludo),pre_free)==(?);
  List_ANY_Var(Machine(Ludo),pre_rollDice)==(?);
  List_ANY_Var(Machine(Ludo),pre_nextTurn)==(?);
  List_ANY_Var(Machine(Ludo),pre_walk)==(?);
  List_ANY_Var(Machine(Ludo),pre_finishGame)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Ludo)) == (? | ? | atePieceDummy | V,finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted,internalPos,externalPos,lockedPieces | startGame,free,throwDice,skipTurn,walk,getPiecePos,getTurn,getNumWinners,getPlacement,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_nextTurn,pre_walk,pre_finishGame | pickColor,unpickColor,endGame,getDiceValue | seen(Machine(Ludo_ctx)),included(Machine(Ludo_board)),included(Machine(Ludo_turn)) | ? | Ludo);
  List_Of_HiddenCst_Ids(Machine(Ludo)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo)) == (?);
  List_Of_VisibleVar_Ids(Machine(Ludo)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo)) == (seen(Machine(Ludo_ctx)): (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | stars,diceOptions | ? | ?));
  List_Of_Ids(Machine(Ludo_turn)) == (? | ? | finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted | ? | pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame,getDiceValue,getColor,numWinners,placement | ? | seen(Machine(Ludo_ctx)) | ? | Ludo_turn);
  List_Of_HiddenCst_Ids(Machine(Ludo_turn)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_turn)) == (?);
  List_Of_VisibleVar_Ids(Machine(Ludo_turn)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_turn)) == (?: ?);
  List_Of_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | ? | ? | Ludo_ctx);
  List_Of_HiddenCst_Ids(Machine(Ludo_ctx)) == (stars,diceOptions | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Of_VisibleVar_Ids(Machine(Ludo_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_ctx)) == (?: ?);
  List_Of_Ids(Machine(Ludo_board)) == (? | ? | internalPos,externalPos,lockedPieces | ? | clear,setFree,setExternalPos,setInternalPos,getPos | ? | seen(Machine(Ludo_ctx)) | ? | Ludo_board);
  List_Of_HiddenCst_Ids(Machine(Ludo_board)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_board)) == (?);
  List_Of_VisibleVar_Ids(Machine(Ludo_board)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_board)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Ludo)) == (Type(lockedPieces) == Mvl(SetOf(atype(PIECES,?,?)));Type(externalPos) == Mvl(SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?)));Type(internalPos) == Mvl(SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?)));Type(gameStarted) == Mvl(btype(BOOL,?,?));Type(enabledColors) == Mvl(SetOf(atype(COLORS,?,?)));Type(color) == Mvl(atype(COLORS,?,?));Type(hasRoll) == Mvl(btype(BOOL,?,?));Type(diceValue) == Mvl(btype(INTEGER,?,?));Type(sixSequenceCount) == Mvl(btype(INTEGER,?,?));Type(finishOrder) == Mvl(SetOf(btype(INTEGER,?,?)*atype(COLORS,?,?)));Type(atePieceDummy) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Ludo)) == (Type(pickColor) == Cst(No_type,atype(COLORS,?,?));Type(unpickColor) == Cst(No_type,atype(COLORS,?,?));Type(endGame) == Cst(No_type,No_type);Type(getDiceValue) == Cst(btype(INTEGER,?,?),No_type);Type(pre_finishGame) == Cst(btype(BOOL,?,?),No_type);Type(pre_walk) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_nextTurn) == Cst(btype(BOOL,?,?),No_type);Type(pre_rollDice) == Cst(btype(BOOL,?,?),No_type);Type(pre_free) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_initGame) == Cst(btype(BOOL,?,?),No_type);Type(pre_unpickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(pre_pickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(getPlacement) == Cst(atype(COLORS,?,?),btype(INTEGER,?,?));Type(getNumWinners) == Cst(btype(INTEGER,?,?),No_type);Type(getTurn) == Cst(atype(COLORS,?,?),No_type);Type(getPiecePos) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),atype(PIECES,?,?));Type(walk) == Cst(No_type,atype(PIECES,?,?));Type(skipTurn) == Cst(No_type,No_type);Type(throwDice) == Cst(btype(INTEGER,?,?),No_type);Type(free) == Cst(No_type,atype(PIECES,?,?));Type(startGame) == Cst(No_type,No_type));
  Observers(Machine(Ludo)) == (Type(getDiceValue) == Cst(btype(INTEGER,?,?),No_type);Type(pre_finishGame) == Cst(btype(BOOL,?,?),No_type);Type(pre_walk) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_nextTurn) == Cst(btype(BOOL,?,?),No_type);Type(pre_rollDice) == Cst(btype(BOOL,?,?),No_type);Type(pre_free) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_initGame) == Cst(btype(BOOL,?,?),No_type);Type(pre_unpickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(pre_pickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(getPlacement) == Cst(atype(COLORS,?,?),btype(INTEGER,?,?));Type(getNumWinners) == Cst(btype(INTEGER,?,?),No_type);Type(getTurn) == Cst(atype(COLORS,?,?),No_type);Type(getPiecePos) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),atype(PIECES,?,?));Type(throwDice) == Cst(btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
