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
  Inherited_List_Includes(Machine(Ludo))==(turn.Ludo_turn,board.Ludo_board);
  List_Includes(Machine(Ludo))==(board.Ludo_board,turn.Ludo_turn)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Ludo))==(?)
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
  Local_List_Variables(Machine(Ludo))==(?);
  List_Variables(Machine(Ludo))==(boardinternalPos,boardexternalPos,boardlockedPieces,turnfinishOrder,turnsixSequenceCount,turndiceValue,turnhasRoll,turncolor,turnenabledColors,turngameStarted);
  External_List_Variables(Machine(Ludo))==(board.internalPos,board.externalPos,board.lockedPieces,turn.finishOrder,turn.sixSequenceCount,turn.diceValue,turn.hasRoll,turn.color,turn.enabledColors,turn.gameStarted)
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
  Expanded_List_Invariant(Machine(Ludo))==(boardlockedPieces: POW(PIECES) & boardexternalPos: PIECES +-> 0..numExternal-1 & boardinternalPos: PIECES +-> 0..numInternal-1 & dom(boardexternalPos)/\dom(boardinternalPos) = {} & dom(boardexternalPos)/\boardlockedPieces = {} & dom(boardinternalPos)/\boardlockedPieces = {} & dom(boardexternalPos)\/dom(boardinternalPos)\/boardlockedPieces = PIECES & !nn.(nn: 0..numExternal-1 => card(boardexternalPos|>{nn})<=2 & (nn/:(stars\/ran(startPoint)) => card((boardexternalPos~;colorOf)[{nn}])<=1)) & turngameStarted: BOOL & turnenabledColors: POW(COLORS) & turnenabledColors: FIN(turnenabledColors) & turncolor: COLORS & turnhasRoll: BOOL & turndiceValue: 0..6 & turnsixSequenceCount: 0..2 & turnfinishOrder: 0..numColors-1 >+> COLORS & turnfinishOrder: FIN(turnfinishOrder) & (turngameStarted = FALSE or (card(turnenabledColors)>=2 & turncolor: turnenabledColors & ran(turnfinishOrder) <: turnenabledColors)));
  Context_List_Invariant(Machine(Ludo))==(btrue);
  List_Invariant(Machine(Ludo))==(!cc.(cc: ran(turnfinishOrder) => colorOf~[{cc}] <: boardinternalPos~[{numInternal-1}]) & !pp.(pp: PIECES => (colorOf(pp)/:turnenabledColors => pp: boardlockedPieces)))
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
  Expanded_List_Initialisation(Machine(Ludo))==(boardlockedPieces,boardexternalPos,boardinternalPos:=PIECES,{},{};(turngameStarted,turnenabledColors:=FALSE,{} || @(color$0).(color$0: COLORS ==> turncolor:=color$0) || turnhasRoll:=FALSE || turndiceValue:=0 || turnsixSequenceCount:=0 || turnfinishOrder:={}));
  Context_List_Initialisation(Machine(Ludo))==(skip);
  List_Initialisation(Machine(Ludo))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Ludo))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Ludo),Machine(board.Ludo_board))==(?);
  List_Instanciated_Parameters(Machine(Ludo),Machine(turn.Ludo_turn))==(?);
  List_Instanciated_Parameters(Machine(Ludo),Machine(Ludo_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Ludo),Machine(turn.Ludo_turn))==(btrue);
  List_Context_Constraints(Machine(Ludo))==(btrue);
  List_Constraints(Machine(Ludo))==(btrue);
  List_Constraints(Machine(Ludo),Machine(board.Ludo_board))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Ludo))==(pickColor,unpickColor,initGame,free,rollDice,nextTurn,walk,getDiceValue,getBoard,getTurn,finishGame,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_nextTurn,pre_walk);
  List_Operations(Machine(Ludo))==(pickColor,unpickColor,initGame,free,rollDice,nextTurn,walk,getDiceValue,getBoard,getTurn,finishGame,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_nextTurn,pre_walk)
END
&
THEORY ListInputX IS
  List_Input(Machine(Ludo),pickColor)==(cc);
  List_Input(Machine(Ludo),unpickColor)==(cc);
  List_Input(Machine(Ludo),initGame)==(?);
  List_Input(Machine(Ludo),free)==(pp);
  List_Input(Machine(Ludo),rollDice)==(?);
  List_Input(Machine(Ludo),nextTurn)==(?);
  List_Input(Machine(Ludo),walk)==(pp);
  List_Input(Machine(Ludo),getDiceValue)==(?);
  List_Input(Machine(Ludo),getBoard)==(?);
  List_Input(Machine(Ludo),getTurn)==(?);
  List_Input(Machine(Ludo),finishGame)==(?);
  List_Input(Machine(Ludo),pre_pickColor)==(cc);
  List_Input(Machine(Ludo),pre_unpickColor)==(cc);
  List_Input(Machine(Ludo),pre_initGame)==(?);
  List_Input(Machine(Ludo),pre_free)==(pp);
  List_Input(Machine(Ludo),pre_rollDice)==(?);
  List_Input(Machine(Ludo),pre_nextTurn)==(?);
  List_Input(Machine(Ludo),pre_walk)==(pp)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Ludo),pickColor)==(?);
  List_Output(Machine(Ludo),unpickColor)==(?);
  List_Output(Machine(Ludo),initGame)==(?);
  List_Output(Machine(Ludo),free)==(?);
  List_Output(Machine(Ludo),rollDice)==(vv);
  List_Output(Machine(Ludo),nextTurn)==(?);
  List_Output(Machine(Ludo),walk)==(?);
  List_Output(Machine(Ludo),getDiceValue)==(dd);
  List_Output(Machine(Ludo),getBoard)==(ee,ii);
  List_Output(Machine(Ludo),getTurn)==(cc);
  List_Output(Machine(Ludo),finishGame)==(oo);
  List_Output(Machine(Ludo),pre_pickColor)==(rr);
  List_Output(Machine(Ludo),pre_unpickColor)==(rr);
  List_Output(Machine(Ludo),pre_initGame)==(rr);
  List_Output(Machine(Ludo),pre_free)==(rr);
  List_Output(Machine(Ludo),pre_rollDice)==(rr);
  List_Output(Machine(Ludo),pre_nextTurn)==(rr);
  List_Output(Machine(Ludo),pre_walk)==(rr)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Ludo),pickColor)==(pickColor(cc));
  List_Header(Machine(Ludo),unpickColor)==(unpickColor(cc));
  List_Header(Machine(Ludo),initGame)==(initGame);
  List_Header(Machine(Ludo),free)==(free(pp));
  List_Header(Machine(Ludo),rollDice)==(vv <-- rollDice);
  List_Header(Machine(Ludo),nextTurn)==(nextTurn);
  List_Header(Machine(Ludo),walk)==(walk(pp));
  List_Header(Machine(Ludo),getDiceValue)==(dd <-- getDiceValue);
  List_Header(Machine(Ludo),getBoard)==(ee,ii <-- getBoard);
  List_Header(Machine(Ludo),getTurn)==(cc <-- getTurn);
  List_Header(Machine(Ludo),finishGame)==(oo <-- finishGame);
  List_Header(Machine(Ludo),pre_pickColor)==(rr <-- pre_pickColor(cc));
  List_Header(Machine(Ludo),pre_unpickColor)==(rr <-- pre_unpickColor(cc));
  List_Header(Machine(Ludo),pre_initGame)==(rr <-- pre_initGame);
  List_Header(Machine(Ludo),pre_free)==(rr <-- pre_free(pp));
  List_Header(Machine(Ludo),pre_rollDice)==(rr <-- pre_rollDice);
  List_Header(Machine(Ludo),pre_nextTurn)==(rr <-- pre_nextTurn);
  List_Header(Machine(Ludo),pre_walk)==(rr <-- pre_walk(pp))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Ludo),pickColor)==(cc: COLORS & cc/:turnenabledColors & turngameStarted = FALSE);
  List_Precondition(Machine(Ludo),unpickColor)==(cc: COLORS & cc: turnenabledColors & turngameStarted = FALSE);
  List_Precondition(Machine(Ludo),initGame)==(turngameStarted = FALSE & card(turnenabledColors)>=2);
  List_Precondition(Machine(Ludo),free)==(turngameStarted = TRUE & pp: PIECES & colorOf(pp) = turncolor & turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2);
  List_Precondition(Machine(Ludo),rollDice)==(turngameStarted = TRUE & turnhasRoll = TRUE & (turndiceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turncolor & (turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 or turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal))))));
  List_Precondition(Machine(Ludo),nextTurn)==(turngameStarted = TRUE & turnhasRoll = FALSE & (turndiceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turncolor & (turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 or turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal))))) & card(turnfinishOrder)<card(turnenabledColors));
  List_Precondition(Machine(Ludo),walk)==(turngameStarted = TRUE & pp: PIECES & colorOf(pp) = turncolor & turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal));
  List_Precondition(Machine(Ludo),getDiceValue)==(turngameStarted = TRUE & turndiceValue/=0);
  List_Precondition(Machine(Ludo),getBoard)==(turngameStarted = TRUE);
  List_Precondition(Machine(Ludo),getTurn)==(turngameStarted = TRUE & card(turnfinishOrder)<numColors);
  List_Precondition(Machine(Ludo),finishGame)==(turngameStarted = TRUE & card(turnfinishOrder)>=1);
  List_Precondition(Machine(Ludo),pre_pickColor)==(cc: COLORS);
  List_Precondition(Machine(Ludo),pre_unpickColor)==(cc: COLORS);
  List_Precondition(Machine(Ludo),pre_initGame)==(btrue);
  List_Precondition(Machine(Ludo),pre_free)==(pp: PIECES);
  List_Precondition(Machine(Ludo),pre_rollDice)==(btrue);
  List_Precondition(Machine(Ludo),pre_nextTurn)==(btrue);
  List_Precondition(Machine(Ludo),pre_walk)==(pp: PIECES)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Ludo),pre_walk)==(pp: PIECES | rr:=bool(turngameStarted = TRUE & colorOf(pp) = turncolor & turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal)));
  Expanded_List_Substitution(Machine(Ludo),pre_nextTurn)==(btrue | rr:=bool(turngameStarted = TRUE & turnhasRoll = FALSE & (turndiceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turncolor & (turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 or turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal))))) & card(turnfinishOrder)<card(turnenabledColors)));
  Expanded_List_Substitution(Machine(Ludo),pre_rollDice)==(btrue | rr:=bool(turngameStarted = TRUE & turnhasRoll = TRUE & (turndiceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turncolor & (turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 or turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal)))))));
  Expanded_List_Substitution(Machine(Ludo),pre_free)==(pp: PIECES | rr:=bool(turngameStarted = TRUE & colorOf(pp) = turncolor & turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2));
  Expanded_List_Substitution(Machine(Ludo),pre_initGame)==(btrue | rr:=bool(turngameStarted = FALSE & card(turnenabledColors)>=2));
  Expanded_List_Substitution(Machine(Ludo),pre_unpickColor)==(cc: COLORS | rr:=bool(cc/:turnenabledColors & turngameStarted = FALSE));
  Expanded_List_Substitution(Machine(Ludo),pre_pickColor)==(cc: COLORS | rr:=bool(cc/:turnenabledColors & turngameStarted = FALSE));
  Expanded_List_Substitution(Machine(Ludo),finishGame)==(turngameStarted = TRUE & card(turnfinishOrder)>=1 & turngameStarted = TRUE & card(turnfinishOrder)>=1 | oo:=turnfinishOrder || turngameStarted:=FALSE);
  Expanded_List_Substitution(Machine(Ludo),getTurn)==(turngameStarted = TRUE & card(turnfinishOrder)<numColors | cc:=turncolor);
  Expanded_List_Substitution(Machine(Ludo),getBoard)==(turngameStarted = TRUE | ee,ii:=boardexternalPos,boardinternalPos);
  Expanded_List_Substitution(Machine(Ludo),getDiceValue)==(turngameStarted = TRUE & turndiceValue/=0 | dd:=turndiceValue);
  Expanded_List_Substitution(Machine(Ludo),walk)==(turngameStarted = TRUE & pp: PIECES & colorOf(pp) = turncolor & turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal) | pp: dom(boardexternalPos) & turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal ==> @newPos.(newPos = (turndiceValue+boardexternalPos(pp)) mod numExternal ==> (pp: PIECES & pp/:boardlockedPieces & pp/:dom(boardinternalPos) & newPos: 0..numExternal-1 & card(boardexternalPos|>{newPos})<2 | newPos/:(stars\/ran(startPoint)) & (boardexternalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={} ==> boardexternalPos,boardlockedPieces:=boardexternalPos|>>{newPos}<+{pp|->newPos},boardlockedPieces\/boardexternalPos~[{newPos}] [] not(newPos/:(stars\/ran(startPoint)) & (boardexternalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={}) ==> boardexternalPos:=boardexternalPos<+{pp|->newPos} || (newPos/:(stars\/ran(startPoint)) & (boardexternalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={} ==> (turngameStarted = TRUE & turndiceValue/=0 & TRUE: BOOL & FALSE: BOOL & (TRUE = TRUE => FALSE = FALSE) | turndiceValue:=0 || (FALSE = TRUE ==> turnfinishOrder,turnhasRoll:=turnfinishOrder<+{card(turnfinishOrder)|->turncolor},FALSE [] not(FALSE = TRUE) ==> (TRUE = TRUE ==> turnhasRoll:=TRUE [] not(TRUE = TRUE) ==> skip))) [] not(newPos/:(stars\/ran(startPoint)) & (boardexternalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={}) ==> (turngameStarted = TRUE & turndiceValue/=0 & FALSE: BOOL & FALSE: BOOL & (FALSE = TRUE => FALSE = FALSE) | turndiceValue:=0 || (FALSE = TRUE ==> turnfinishOrder,turnhasRoll:=turnfinishOrder<+{card(turnfinishOrder)|->turncolor},FALSE [] not(FALSE = TRUE) ==> (FALSE = TRUE ==> turnhasRoll:=TRUE [] not(FALSE = TRUE) ==> skip)))))) [] not(pp: dom(boardexternalPos) & turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal) ==> (pp: dom(boardexternalPos) ==> (pp: PIECES & pp/:boardlockedPieces & turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1: 0..numInternal-1 | boardinternalPos,boardexternalPos:=boardinternalPos<+{pp|->turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1},{pp}<<|boardexternalPos) [] not(pp: dom(boardexternalPos)) ==> (pp: PIECES & pp/:boardlockedPieces & turndiceValue+boardinternalPos(pp): 0..numInternal-1 | boardinternalPos,boardexternalPos:=boardinternalPos<+{pp|->turndiceValue+boardinternalPos(pp)},{pp}<<|boardexternalPos) || (pp: dom(boardinternalPos) & turndiceValue+boardinternalPos(pp) = numInternal-1 or (pp: dom(boardexternalPos) & turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1 = numInternal-1) ==> (card(boardinternalPos~[{numInternal-1}]/\colorOf~[{turncolor}]) = numPiecesByColor-1 ==> (turngameStarted = TRUE & turndiceValue/=0 & FALSE: BOOL & TRUE: BOOL & (FALSE = TRUE => TRUE = FALSE) | turndiceValue:=0 || (TRUE = TRUE ==> turnfinishOrder,turnhasRoll:=turnfinishOrder<+{card(turnfinishOrder)|->turncolor},FALSE [] not(TRUE = TRUE) ==> (FALSE = TRUE ==> turnhasRoll:=TRUE [] not(FALSE = TRUE) ==> skip))) [] not(card(boardinternalPos~[{numInternal-1}]/\colorOf~[{turncolor}]) = numPiecesByColor-1) ==> (turngameStarted = TRUE & turndiceValue/=0 & TRUE: BOOL & FALSE: BOOL & (TRUE = TRUE => FALSE = FALSE) | turndiceValue:=0 || (FALSE = TRUE ==> turnfinishOrder,turnhasRoll:=turnfinishOrder<+{card(turnfinishOrder)|->turncolor},FALSE [] not(FALSE = TRUE) ==> (TRUE = TRUE ==> turnhasRoll:=TRUE [] not(TRUE = TRUE) ==> skip)))) [] not(pp: dom(boardinternalPos) & turndiceValue+boardinternalPos(pp) = numInternal-1 or (pp: dom(boardexternalPos) & turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1 = numInternal-1)) ==> (turngameStarted = TRUE & turndiceValue/=0 & FALSE: BOOL & FALSE: BOOL & (FALSE = TRUE => FALSE = FALSE) | turndiceValue:=0 || (FALSE = TRUE ==> turnfinishOrder,turnhasRoll:=turnfinishOrder<+{card(turnfinishOrder)|->turncolor},FALSE [] not(FALSE = TRUE) ==> (FALSE = TRUE ==> turnhasRoll:=TRUE [] not(FALSE = TRUE) ==> skip))))));
  Expanded_List_Substitution(Machine(Ludo),nextTurn)==(turngameStarted = TRUE & turnhasRoll = FALSE & (turndiceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turncolor & (turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 or turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal))))) & card(turnfinishOrder)<card(turnenabledColors) & turngameStarted = TRUE & turnhasRoll = FALSE & card(turnfinishOrder)<card(turnenabledColors) | turnhasRoll,turnsixSequenceCount,turndiceValue:=TRUE,0,0 || @numJumps.(numJumps = min({nn | nn: 1..numColors & colorsOrder((colorsOrder~(turncolor)+nn) mod numColors): turnenabledColors-ran(turnfinishOrder)}) ==> turncolor:=colorsOrder((colorsOrder~(turncolor)+numJumps) mod numColors)));
  Expanded_List_Substitution(Machine(Ludo),rollDice)==(turngameStarted = TRUE & turnhasRoll = TRUE & (turndiceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turncolor & (turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 or turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal))))) & turngameStarted = TRUE & turnhasRoll = TRUE | @dd.(dd: 1..6 ==> (vv:=dd || (dd = 6 ==> (turnsixSequenceCount<2 ==> turnsixSequenceCount,turndiceValue:=turnsixSequenceCount+1,dd [] not(turnsixSequenceCount<2) ==> turnsixSequenceCount,turnhasRoll,turndiceValue:=0,FALSE,0) [] not(dd = 6) ==> turnhasRoll,turndiceValue:=FALSE,dd))));
  Expanded_List_Substitution(Machine(Ludo),free)==(turngameStarted = TRUE & pp: PIECES & colorOf(pp) = turncolor & turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 & turngameStarted = TRUE & turndiceValue/=0 & FALSE: BOOL & FALSE: BOOL & (FALSE = TRUE => FALSE = FALSE) & pp: PIECES & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 | turndiceValue:=0 || (FALSE = TRUE ==> turnfinishOrder,turnhasRoll:=turnfinishOrder<+{card(turnfinishOrder)|->turncolor},FALSE [] not(FALSE = TRUE) ==> (FALSE = TRUE ==> turnhasRoll:=TRUE [] not(FALSE = TRUE) ==> skip)) || boardlockedPieces,boardexternalPos:=boardlockedPieces-{pp},boardexternalPos<+{pp|->startPoint(colorOf(pp))});
  Expanded_List_Substitution(Machine(Ludo),initGame)==(turngameStarted = FALSE & card(turnenabledColors)>=2 & turngameStarted = FALSE & card(turnenabledColors)>=2 & btrue | turngameStarted:=TRUE || @(color$0).(color$0: turnenabledColors ==> turncolor:=color$0) || turnhasRoll:=TRUE || turndiceValue:=0 || turnsixSequenceCount:=0 || turnfinishOrder:={} || boardlockedPieces,boardexternalPos,boardinternalPos:=PIECES,{},{});
  Expanded_List_Substitution(Machine(Ludo),unpickColor)==(cc: COLORS & cc: turnenabledColors & turngameStarted = FALSE & cc: COLORS & cc: turnenabledColors & turngameStarted = FALSE | turnenabledColors:=turnenabledColors-{cc});
  Expanded_List_Substitution(Machine(Ludo),pickColor)==(cc: COLORS & cc/:turnenabledColors & turngameStarted = FALSE & cc: COLORS & cc/:turnenabledColors & turngameStarted = FALSE | turnenabledColors:=turnenabledColors\/{cc});
  List_Substitution(Machine(Ludo),pickColor)==((turn.pickColor)(cc));
  List_Substitution(Machine(Ludo),unpickColor)==((turn.unpickColor)(cc));
  List_Substitution(Machine(Ludo),initGame)==(turn.initGame || board.clear);
  List_Substitution(Machine(Ludo),free)==((turn.computeAction)(FALSE,FALSE) || (board.setFree)(pp));
  List_Substitution(Machine(Ludo),rollDice)==(vv <-- turn.rollDice);
  List_Substitution(Machine(Ludo),nextTurn)==(turn.nextTurn);
  List_Substitution(Machine(Ludo),walk)==(IF pp: dom(board.externalPos) & turn.diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal THEN LET newPos BE newPos = (turn.diceValue+(board.externalPos)(pp)) mod numExternal IN (board.setExternalPos)(pp,newPos) || IF newPos/:(stars\/ran(startPoint)) & ((board.externalPos)~;colorOf)[{newPos}]-{colorOf(pp)}/={} THEN (turn.computeAction)(TRUE,FALSE) ELSE (turn.computeAction)(FALSE,FALSE) END END ELSE IF pp: dom(board.externalPos) THEN (board.setInternalPos)(pp,turn.diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal-1) ELSE (board.setInternalPos)(pp,turn.diceValue+(board.internalPos)(pp)) END || IF pp: dom(board.internalPos) & turn.diceValue+(board.internalPos)(pp) = numInternal-1 or (pp: dom(board.externalPos) & turn.diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal-1 = numInternal-1) THEN IF card((board.internalPos)~[{numInternal-1}]/\colorOf~[{turn.color}]) = numPiecesByColor-1 THEN (turn.computeAction)(FALSE,TRUE) ELSE (turn.computeAction)(TRUE,FALSE) END ELSE (turn.computeAction)(FALSE,FALSE) END END);
  List_Substitution(Machine(Ludo),getDiceValue)==(dd:=turn.diceValue);
  List_Substitution(Machine(Ludo),getBoard)==(ee,ii:=board.externalPos,board.internalPos);
  List_Substitution(Machine(Ludo),getTurn)==(cc:=turn.color);
  List_Substitution(Machine(Ludo),finishGame)==(oo:=turn.finishOrder || turn.endGame);
  List_Substitution(Machine(Ludo),pre_pickColor)==(rr:=bool(cc/:turn.enabledColors & turn.gameStarted = FALSE));
  List_Substitution(Machine(Ludo),pre_unpickColor)==(rr:=bool(cc/:turn.enabledColors & turn.gameStarted = FALSE));
  List_Substitution(Machine(Ludo),pre_initGame)==(rr:=bool(turn.gameStarted = FALSE & card(turn.enabledColors)>=2));
  List_Substitution(Machine(Ludo),pre_free)==(rr:=bool(turn.gameStarted = TRUE & colorOf(pp) = turn.color & turn.diceValue = 6 & pp: board.lockedPieces & card(board.externalPos|>{startPoint(colorOf(pp))})<2));
  List_Substitution(Machine(Ludo),pre_rollDice)==(rr:=bool(turn.gameStarted = TRUE & turn.hasRoll = TRUE & (turn.diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turn.color & (turn.diceValue = 6 & pp: board.lockedPieces & card(board.externalPos|>{startPoint(colorOf(pp))})<2 or turn.diceValue/=0 & pp/:board.lockedPieces & (pp: dom(board.externalPos) => turn.diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=(board.externalPos)(pp) & (nn-(board.externalPos)(pp)+numExternal) mod numExternal<=(((board.externalPos)(pp)+turn.diceValue) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal => card(board.externalPos|>{nn})<2) or (turn.diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=(board.externalPos)(pp) & (nn-(board.externalPos)(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal => card(board.externalPos|>{nn})<2))) & (pp: dom(board.internalPos) => (board.internalPos)(pp)+turn.diceValue<numInternal)))))));
  List_Substitution(Machine(Ludo),pre_nextTurn)==(rr:=bool(turn.gameStarted = TRUE & turn.hasRoll = FALSE & (turn.diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turn.color & (turn.diceValue = 6 & pp: board.lockedPieces & card(board.externalPos|>{startPoint(colorOf(pp))})<2 or turn.diceValue/=0 & pp/:board.lockedPieces & (pp: dom(board.externalPos) => turn.diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=(board.externalPos)(pp) & (nn-(board.externalPos)(pp)+numExternal) mod numExternal<=(((board.externalPos)(pp)+turn.diceValue) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal => card(board.externalPos|>{nn})<2) or (turn.diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=(board.externalPos)(pp) & (nn-(board.externalPos)(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal => card(board.externalPos|>{nn})<2))) & (pp: dom(board.internalPos) => (board.internalPos)(pp)+turn.diceValue<numInternal))))) & card(turn.finishOrder)<card(turn.enabledColors)));
  List_Substitution(Machine(Ludo),pre_walk)==(rr:=bool(turn.gameStarted = TRUE & colorOf(pp) = turn.color & turn.diceValue/=0 & pp/:board.lockedPieces & (pp: dom(board.externalPos) => turn.diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=(board.externalPos)(pp) & (nn-(board.externalPos)(pp)+numExternal) mod numExternal<=(((board.externalPos)(pp)+turn.diceValue) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal => card(board.externalPos|>{nn})<2) or (turn.diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=(board.externalPos)(pp) & (nn-(board.externalPos)(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-(board.externalPos)(pp)+numExternal) mod numExternal => card(board.externalPos|>{nn})<2))) & (pp: dom(board.internalPos) => (board.internalPos)(pp)+turn.diceValue<numInternal)))
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
  List_ANY_Var(Machine(Ludo),pickColor)==(?);
  List_ANY_Var(Machine(Ludo),unpickColor)==(?);
  List_ANY_Var(Machine(Ludo),initGame)==(?);
  List_ANY_Var(Machine(Ludo),free)==(?);
  List_ANY_Var(Machine(Ludo),rollDice)==(?);
  List_ANY_Var(Machine(Ludo),nextTurn)==(?);
  List_ANY_Var(Machine(Ludo),walk)==(?);
  List_ANY_Var(Machine(Ludo),getDiceValue)==(?);
  List_ANY_Var(Machine(Ludo),getBoard)==(?);
  List_ANY_Var(Machine(Ludo),getTurn)==(?);
  List_ANY_Var(Machine(Ludo),finishGame)==(?);
  List_ANY_Var(Machine(Ludo),pre_pickColor)==(?);
  List_ANY_Var(Machine(Ludo),pre_unpickColor)==(?);
  List_ANY_Var(Machine(Ludo),pre_initGame)==(?);
  List_ANY_Var(Machine(Ludo),pre_free)==(?);
  List_ANY_Var(Machine(Ludo),pre_rollDice)==(?);
  List_ANY_Var(Machine(Ludo),pre_nextTurn)==(?);
  List_ANY_Var(Machine(Ludo),pre_walk)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Ludo)) == (? | ? | ? | turngameStarted,turnenabledColors,turncolor,turnhasRoll,turndiceValue,turnsixSequenceCount,turnfinishOrder,boardlockedPieces,boardexternalPos,boardinternalPos | pickColor,unpickColor,initGame,free,rollDice,nextTurn,walk,getDiceValue,getBoard,getTurn,finishGame,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_nextTurn,pre_walk | ? | seen(Machine(Ludo_ctx)),included(Machine(board.Ludo_board)),included(Machine(turn.Ludo_turn)) | ? | Ludo);
  List_Of_HiddenCst_Ids(Machine(Ludo)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo)) == (?);
  List_Of_VisibleVar_Ids(Machine(Ludo)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo)) == (seen(Machine(Ludo_ctx)): (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | stars,diceOptions | ? | ?));
  List_Of_Ids(Machine(Ludo_turn)) == (? | ? | finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted | ? | pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame | ? | seen(Machine(Ludo_ctx)) | ? | Ludo_turn);
  List_Of_HiddenCst_Ids(Machine(Ludo_turn)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_turn)) == (?);
  List_Of_VisibleVar_Ids(Machine(Ludo_turn)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_turn)) == (?: ?);
  List_Of_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | ? | ? | Ludo_ctx);
  List_Of_HiddenCst_Ids(Machine(Ludo_ctx)) == (stars,diceOptions | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Of_VisibleVar_Ids(Machine(Ludo_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_ctx)) == (?: ?);
  List_Of_Ids(Machine(Ludo_board)) == (? | ? | internalPos,externalPos,lockedPieces | ? | clear,setFree,setExternalPos,setInternalPos,isFinished | ? | seen(Machine(Ludo_ctx)) | ? | Ludo_board);
  List_Of_HiddenCst_Ids(Machine(Ludo_board)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_board)) == (?);
  List_Of_VisibleVar_Ids(Machine(Ludo_board)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_board)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Ludo)) == (Type(board.internalPos) == Mvl(SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?)));Type(board.externalPos) == Mvl(SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?)));Type(board.lockedPieces) == Mvl(SetOf(atype(PIECES,?,?)));Type(turn.finishOrder) == Mvl(SetOf(btype(INTEGER,?,?)*atype(COLORS,?,?)));Type(turn.sixSequenceCount) == Mvl(btype(INTEGER,?,?));Type(turn.diceValue) == Mvl(btype(INTEGER,?,?));Type(turn.hasRoll) == Mvl(btype(BOOL,?,?));Type(turn.color) == Mvl(atype(COLORS,?,?));Type(turn.enabledColors) == Mvl(SetOf(atype(COLORS,?,?)));Type(turn.gameStarted) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Ludo)) == (Type(pre_walk) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_nextTurn) == Cst(btype(BOOL,?,?),No_type);Type(pre_rollDice) == Cst(btype(BOOL,?,?),No_type);Type(pre_free) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_initGame) == Cst(btype(BOOL,?,?),No_type);Type(pre_unpickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(pre_pickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(finishGame) == Cst(SetOf(btype(INTEGER,?,?)*atype(COLORS,?,?)),No_type);Type(getTurn) == Cst(atype(COLORS,?,?),No_type);Type(getBoard) == Cst(SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?))*SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?)),No_type);Type(getDiceValue) == Cst(btype(INTEGER,?,?),No_type);Type(walk) == Cst(No_type,atype(PIECES,?,?));Type(nextTurn) == Cst(No_type,No_type);Type(rollDice) == Cst(btype(INTEGER,?,?),No_type);Type(free) == Cst(No_type,atype(PIECES,?,?));Type(initGame) == Cst(No_type,No_type);Type(unpickColor) == Cst(No_type,atype(COLORS,?,?));Type(pickColor) == Cst(No_type,atype(COLORS,?,?)));
  Observers(Machine(Ludo)) == (Type(pre_walk) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_nextTurn) == Cst(btype(BOOL,?,?),No_type);Type(pre_rollDice) == Cst(btype(BOOL,?,?),No_type);Type(pre_free) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_initGame) == Cst(btype(BOOL,?,?),No_type);Type(pre_unpickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(pre_pickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(getTurn) == Cst(atype(COLORS,?,?),No_type);Type(getBoard) == Cst(SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?))*SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?)),No_type);Type(getDiceValue) == Cst(btype(INTEGER,?,?),No_type);Type(rollDice) == Cst(btype(INTEGER,?,?),No_type))
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
