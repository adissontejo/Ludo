Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Ludo_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Ludo_i))==(Machine(Ludo));
  Level(Implementation(Ludo_i))==(1);
  Upper_Level(Implementation(Ludo_i))==(Machine(Ludo))
END
&
THEORY LoadedStructureX IS
  Implementation(Ludo_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Ludo_i))==(Ludo_ctx)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Ludo_i))==(board.Ludo_board,turn.Ludo_turn);
  Inherited_List_Includes(Implementation(Ludo_i))==(turn.Ludo_turn,board.Ludo_board)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Ludo_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Ludo_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Ludo_i))==(?);
  Context_List_Variables(Implementation(Ludo_i))==(?);
  Abstract_List_Variables(Implementation(Ludo_i))==(boardinternalPos,boardexternalPos,boardlockedPieces,turnfinishOrder,turnsixSequenceCount,turndiceValue,turnhasRoll,turncolor,turnenabledColors,turngameStarted);
  Local_List_Variables(Implementation(Ludo_i))==(?);
  List_Variables(Implementation(Ludo_i))==(boardinternalPos,boardexternalPos,boardlockedPieces,turnfinishOrder,turnsixSequenceCount,turndiceValue,turnhasRoll,turncolor,turnenabledColors,turngameStarted);
  External_List_Variables(Implementation(Ludo_i))==(board.internalPos,board.externalPos,board.lockedPieces,turn.finishOrder,turn.sixSequenceCount,turn.diceValue,turn.hasRoll,turn.color,turn.enabledColors,turn.gameStarted)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Ludo_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Ludo_i))==(?);
  External_List_VisibleVariables(Implementation(Ludo_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Ludo_i))==(?);
  List_VisibleVariables(Implementation(Ludo_i))==(?);
  Internal_List_VisibleVariables(Implementation(Ludo_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Ludo_i))==(btrue);
  Abstract_List_Invariant(Implementation(Ludo_i))==(!cc.(cc: ran(turnfinishOrder) => colorOf~[{cc}] <: boardinternalPos~[{numInternal-1}]) & !pp.(pp: PIECES => (colorOf(pp)/:turnenabledColors => pp: boardlockedPieces)) & boardlockedPieces: POW(PIECES) & boardexternalPos: PIECES +-> 0..numExternal-1 & boardinternalPos: PIECES +-> 0..numInternal-1 & dom(boardexternalPos)/\dom(boardinternalPos) = {} & dom(boardexternalPos)/\boardlockedPieces = {} & dom(boardinternalPos)/\boardlockedPieces = {} & dom(boardexternalPos)\/dom(boardinternalPos)\/boardlockedPieces = PIECES & !nn.(nn: 0..numExternal-1 => card(boardexternalPos|>{nn})<=2 & (nn/:(stars\/ran(startPoint)) => card((boardexternalPos~;colorOf)[{nn}])<=1)) & turngameStarted: BOOL & turnenabledColors: POW(COLORS) & turnenabledColors: FIN(turnenabledColors) & turncolor: COLORS & turnhasRoll: BOOL & turndiceValue: 0..6 & turnsixSequenceCount: 0..2 & turnfinishOrder: 0..numColors-1 >+> COLORS & turnfinishOrder: FIN(turnfinishOrder) & (turngameStarted = FALSE or (card(turnenabledColors)>=2 & turncolor: turnenabledColors & ran(turnfinishOrder) <: turnenabledColors)));
  Expanded_List_Invariant(Implementation(Ludo_i))==(boardlockedPieces: POW(PIECES) & boardexternalPos: PIECES +-> 0..numExternal-1 & boardinternalPos: PIECES +-> 0..numInternal-1 & dom(boardexternalPos)/\dom(boardinternalPos) = {} & dom(boardexternalPos)/\boardlockedPieces = {} & dom(boardinternalPos)/\boardlockedPieces = {} & dom(boardexternalPos)\/dom(boardinternalPos)\/boardlockedPieces = PIECES & !nn.(nn: 0..numExternal-1 => card(boardexternalPos|>{nn})<=2 & (nn/:(stars\/ran(startPoint)) => card((boardexternalPos~;colorOf)[{nn}])<=1)) & turngameStarted: BOOL & turnenabledColors: POW(COLORS) & turnenabledColors: FIN(turnenabledColors) & turncolor: COLORS & turnhasRoll: BOOL & turndiceValue: 0..6 & turnsixSequenceCount: 0..2 & turnfinishOrder: 0..numColors-1 >+> COLORS & turnfinishOrder: FIN(turnfinishOrder) & (turngameStarted = FALSE or (card(turnenabledColors)>=2 & turncolor: turnenabledColors & ran(turnfinishOrder) <: turnenabledColors)));
  Context_List_Invariant(Implementation(Ludo_i))==(btrue);
  List_Invariant(Implementation(Ludo_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(Ludo_i))==(btrue);
  Expanded_List_Assertions(Implementation(Ludo_i))==(btrue);
  Context_List_Assertions(Implementation(Ludo_i))==(btrue);
  List_Assertions(Implementation(Ludo_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Ludo_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Ludo_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Ludo_i))==(boardlockedPieces,boardexternalPos,boardinternalPos:=PIECES,{},{};(turngameStarted,turnenabledColors:=FALSE,{} || @(color$0).(color$0: COLORS ==> turncolor:=color$0) || turnhasRoll:=FALSE || turndiceValue:=0 || turnsixSequenceCount:=0 || turnfinishOrder:={}));
  Context_List_Initialisation(Implementation(Ludo_i))==(skip);
  List_Initialisation(Implementation(Ludo_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Ludo_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(Ludo_i),Machine(board.Ludo_board))==(?);
  List_Instanciated_Parameters(Implementation(Ludo_i),Machine(turn.Ludo_turn))==(?);
  List_Instanciated_Parameters(Implementation(Ludo_i),Machine(Ludo_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Ludo_i),Machine(turn.Ludo_turn))==(btrue);
  List_Constraints(Implementation(Ludo_i))==(btrue);
  List_Context_Constraints(Implementation(Ludo_i))==(btrue);
  List_Constraints(Implementation(Ludo_i),Machine(board.Ludo_board))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Ludo_i))==(isFinished,canFree,isPathFree,canWalk,pickColor,unpickColor,initGame,free,rollDice,nextTurn,walk,getDiceValue,getBoard,getTurn,finishGame,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_walk,pre_nextTurn);
  List_Operations(Implementation(Ludo_i))==(isFinished,canFree,isPathFree,canWalk,pickColor,unpickColor,initGame,free,rollDice,nextTurn,walk,getDiceValue,getBoard,getTurn,finishGame,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_walk,pre_nextTurn)
END
&
THEORY ListInputX IS
  List_Input(Implementation(Ludo_i),isFinished)==(color);
  List_Input(Implementation(Ludo_i),canFree)==(pp);
  List_Input(Implementation(Ludo_i),isPathFree)==(n1,n2);
  List_Input(Implementation(Ludo_i),canWalk)==(pp);
  List_Input(Implementation(Ludo_i),pickColor)==(cc);
  List_Input(Implementation(Ludo_i),unpickColor)==(cc);
  List_Input(Implementation(Ludo_i),initGame)==(?);
  List_Input(Implementation(Ludo_i),free)==(pp);
  List_Input(Implementation(Ludo_i),rollDice)==(?);
  List_Input(Implementation(Ludo_i),nextTurn)==(?);
  List_Input(Implementation(Ludo_i),walk)==(pp);
  List_Input(Implementation(Ludo_i),getDiceValue)==(?);
  List_Input(Implementation(Ludo_i),getBoard)==(?);
  List_Input(Implementation(Ludo_i),getTurn)==(?);
  List_Input(Implementation(Ludo_i),finishGame)==(?);
  List_Input(Implementation(Ludo_i),pre_pickColor)==(cc);
  List_Input(Implementation(Ludo_i),pre_unpickColor)==(cc);
  List_Input(Implementation(Ludo_i),pre_initGame)==(?);
  List_Input(Implementation(Ludo_i),pre_free)==(pp);
  List_Input(Implementation(Ludo_i),pre_rollDice)==(?);
  List_Input(Implementation(Ludo_i),pre_walk)==(pp);
  List_Input(Implementation(Ludo_i),pre_nextTurn)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Ludo_i),isFinished)==(bb);
  List_Output(Implementation(Ludo_i),canFree)==(bb);
  List_Output(Implementation(Ludo_i),isPathFree)==(bb);
  List_Output(Implementation(Ludo_i),canWalk)==(bb);
  List_Output(Implementation(Ludo_i),pickColor)==(?);
  List_Output(Implementation(Ludo_i),unpickColor)==(?);
  List_Output(Implementation(Ludo_i),initGame)==(?);
  List_Output(Implementation(Ludo_i),free)==(?);
  List_Output(Implementation(Ludo_i),rollDice)==(vv);
  List_Output(Implementation(Ludo_i),nextTurn)==(?);
  List_Output(Implementation(Ludo_i),walk)==(?);
  List_Output(Implementation(Ludo_i),getDiceValue)==(dd);
  List_Output(Implementation(Ludo_i),getBoard)==(ee,ii);
  List_Output(Implementation(Ludo_i),getTurn)==(cc);
  List_Output(Implementation(Ludo_i),finishGame)==(oo);
  List_Output(Implementation(Ludo_i),pre_pickColor)==(rr);
  List_Output(Implementation(Ludo_i),pre_unpickColor)==(rr);
  List_Output(Implementation(Ludo_i),pre_initGame)==(rr);
  List_Output(Implementation(Ludo_i),pre_free)==(rr);
  List_Output(Implementation(Ludo_i),pre_rollDice)==(rr);
  List_Output(Implementation(Ludo_i),pre_walk)==(rr);
  List_Output(Implementation(Ludo_i),pre_nextTurn)==(rr)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Ludo_i),isFinished)==(bb <-- isFinished(color));
  List_Header(Implementation(Ludo_i),canFree)==(bb <-- canFree(pp));
  List_Header(Implementation(Ludo_i),isPathFree)==(bb <-- isPathFree(n1,n2));
  List_Header(Implementation(Ludo_i),canWalk)==(bb <-- canWalk(pp));
  List_Header(Implementation(Ludo_i),pickColor)==(pickColor(cc));
  List_Header(Implementation(Ludo_i),unpickColor)==(unpickColor(cc));
  List_Header(Implementation(Ludo_i),initGame)==(initGame);
  List_Header(Implementation(Ludo_i),free)==(free(pp));
  List_Header(Implementation(Ludo_i),rollDice)==(vv <-- rollDice);
  List_Header(Implementation(Ludo_i),nextTurn)==(nextTurn);
  List_Header(Implementation(Ludo_i),walk)==(walk(pp));
  List_Header(Implementation(Ludo_i),getDiceValue)==(dd <-- getDiceValue);
  List_Header(Implementation(Ludo_i),getBoard)==(ee,ii <-- getBoard);
  List_Header(Implementation(Ludo_i),getTurn)==(cc <-- getTurn);
  List_Header(Implementation(Ludo_i),finishGame)==(oo <-- finishGame);
  List_Header(Implementation(Ludo_i),pre_pickColor)==(rr <-- pre_pickColor(cc));
  List_Header(Implementation(Ludo_i),pre_unpickColor)==(rr <-- pre_unpickColor(cc));
  List_Header(Implementation(Ludo_i),pre_initGame)==(rr <-- pre_initGame);
  List_Header(Implementation(Ludo_i),pre_free)==(rr <-- pre_free(pp));
  List_Header(Implementation(Ludo_i),pre_rollDice)==(rr <-- pre_rollDice);
  List_Header(Implementation(Ludo_i),pre_walk)==(rr <-- pre_walk(pp));
  List_Header(Implementation(Ludo_i),pre_nextTurn)==(rr <-- pre_nextTurn)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(Ludo_i),isFinished)==(btrue);
  List_Precondition(Implementation(Ludo_i),isFinished)==(color: COLORS);
  Own_Precondition(Implementation(Ludo_i),canFree)==(btrue);
  List_Precondition(Implementation(Ludo_i),canFree)==(pp: PIECES);
  Own_Precondition(Implementation(Ludo_i),isPathFree)==(btrue);
  List_Precondition(Implementation(Ludo_i),isPathFree)==(n1: 0..51 & n2: 0..51);
  Own_Precondition(Implementation(Ludo_i),canWalk)==(btrue);
  List_Precondition(Implementation(Ludo_i),canWalk)==(pp: PIECES);
  Own_Precondition(Implementation(Ludo_i),pickColor)==(btrue);
  List_Precondition(Implementation(Ludo_i),pickColor)==(cc: COLORS & cc/:turnenabledColors & turngameStarted = FALSE);
  Own_Precondition(Implementation(Ludo_i),unpickColor)==(btrue);
  List_Precondition(Implementation(Ludo_i),unpickColor)==(cc: COLORS & cc: turnenabledColors & turngameStarted = FALSE);
  Own_Precondition(Implementation(Ludo_i),initGame)==(btrue);
  List_Precondition(Implementation(Ludo_i),initGame)==(turngameStarted = FALSE & card(turnenabledColors)>=2);
  Own_Precondition(Implementation(Ludo_i),free)==(btrue);
  List_Precondition(Implementation(Ludo_i),free)==(turngameStarted = TRUE & pp: PIECES & colorOf(pp) = turncolor & turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2);
  Own_Precondition(Implementation(Ludo_i),rollDice)==(btrue);
  List_Precondition(Implementation(Ludo_i),rollDice)==(turngameStarted = TRUE & turnhasRoll = TRUE & (turndiceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turncolor & (turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 or turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal))))));
  Own_Precondition(Implementation(Ludo_i),nextTurn)==(btrue);
  List_Precondition(Implementation(Ludo_i),nextTurn)==(turngameStarted = TRUE & turnhasRoll = FALSE & (turndiceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turncolor & (turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 or turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal))))) & card(turnfinishOrder)<card(turnenabledColors));
  Own_Precondition(Implementation(Ludo_i),walk)==(btrue);
  List_Precondition(Implementation(Ludo_i),walk)==(turngameStarted = TRUE & pp: PIECES & colorOf(pp) = turncolor & turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal));
  Own_Precondition(Implementation(Ludo_i),getDiceValue)==(btrue);
  List_Precondition(Implementation(Ludo_i),getDiceValue)==(turngameStarted = TRUE & turndiceValue/=0);
  Own_Precondition(Implementation(Ludo_i),getBoard)==(btrue);
  List_Precondition(Implementation(Ludo_i),getBoard)==(turngameStarted = TRUE);
  Own_Precondition(Implementation(Ludo_i),getTurn)==(btrue);
  List_Precondition(Implementation(Ludo_i),getTurn)==(turngameStarted = TRUE & card(turnfinishOrder)<numColors);
  Own_Precondition(Implementation(Ludo_i),finishGame)==(btrue);
  List_Precondition(Implementation(Ludo_i),finishGame)==(turngameStarted = TRUE & card(turnfinishOrder)>=1);
  Own_Precondition(Implementation(Ludo_i),pre_pickColor)==(btrue);
  List_Precondition(Implementation(Ludo_i),pre_pickColor)==(cc: COLORS);
  Own_Precondition(Implementation(Ludo_i),pre_unpickColor)==(btrue);
  List_Precondition(Implementation(Ludo_i),pre_unpickColor)==(cc: COLORS);
  Own_Precondition(Implementation(Ludo_i),pre_initGame)==(btrue);
  List_Precondition(Implementation(Ludo_i),pre_initGame)==(btrue);
  Own_Precondition(Implementation(Ludo_i),pre_free)==(btrue);
  List_Precondition(Implementation(Ludo_i),pre_free)==(pp: PIECES);
  Own_Precondition(Implementation(Ludo_i),pre_rollDice)==(btrue);
  List_Precondition(Implementation(Ludo_i),pre_rollDice)==(btrue);
  Own_Precondition(Implementation(Ludo_i),pre_walk)==(btrue);
  List_Precondition(Implementation(Ludo_i),pre_walk)==(pp: PIECES);
  Own_Precondition(Implementation(Ludo_i),pre_nextTurn)==(btrue);
  List_Precondition(Implementation(Ludo_i),pre_nextTurn)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Ludo_i),pre_nextTurn)==(btrue | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_walk)==(pp: PIECES | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_rollDice)==(btrue | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_free)==(pp: PIECES | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_initGame)==(btrue | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_unpickColor)==(cc: COLORS | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_pickColor)==(cc: COLORS | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),finishGame)==(turngameStarted = TRUE & card(turnfinishOrder)>=1 | turngameStarted:=FALSE);
  Expanded_List_Substitution(Implementation(Ludo_i),getTurn)==(turngameStarted = TRUE & card(turnfinishOrder)<numColors | skip);
  Expanded_List_Substitution(Implementation(Ludo_i),getBoard)==(turngameStarted = TRUE | skip);
  Expanded_List_Substitution(Implementation(Ludo_i),getDiceValue)==(turngameStarted = TRUE & turndiceValue/=0 | skip);
  Expanded_List_Substitution(Implementation(Ludo_i),walk)==(turngameStarted = TRUE & pp: PIECES & colorOf(pp) = turncolor & turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal) | skip);
  Expanded_List_Substitution(Implementation(Ludo_i),nextTurn)==(turngameStarted = TRUE & turnhasRoll = FALSE & (turndiceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turncolor & (turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 or turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal))))) & card(turnfinishOrder)<card(turnenabledColors) & turngameStarted = TRUE & turnhasRoll = FALSE & card(turnfinishOrder)<card(turnenabledColors) | turnhasRoll,turnsixSequenceCount,turndiceValue:=TRUE,0,0 || @numJumps.(numJumps = min({nn | nn: 1..numColors & colorsOrder((colorsOrder~(turncolor)+nn) mod numColors): turnenabledColors-ran(turnfinishOrder)}) ==> turncolor:=colorsOrder((colorsOrder~(turncolor)+numJumps) mod numColors)));
  Expanded_List_Substitution(Implementation(Ludo_i),rollDice)==(turngameStarted = TRUE & turnhasRoll = TRUE & (turndiceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = turncolor & (turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 or turndiceValue/=0 & pp/:boardlockedPieces & (pp: dom(boardexternalPos) => turndiceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((boardexternalPos(pp)+turndiceValue) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2) or (turndiceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=boardexternalPos(pp) & (nn-boardexternalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-boardexternalPos(pp)+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2))) & (pp: dom(boardinternalPos) => boardinternalPos(pp)+turndiceValue<numInternal))))) & turngameStarted = TRUE & turnhasRoll = TRUE | @dd.(dd: 1..6 ==> (vv:=dd || (dd = 6 ==> (turnsixSequenceCount<2 ==> turnsixSequenceCount,turndiceValue:=turnsixSequenceCount+1,dd [] not(turnsixSequenceCount<2) ==> turnsixSequenceCount,turnhasRoll,turndiceValue:=0,FALSE,0) [] not(dd = 6) ==> turnhasRoll,turndiceValue:=FALSE,dd))));
  Expanded_List_Substitution(Implementation(Ludo_i),free)==(turngameStarted = TRUE & pp: PIECES & colorOf(pp) = turncolor & turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 | (turngameStarted = TRUE & turndiceValue/=0 & FALSE: BOOL & FALSE: BOOL & (FALSE = TRUE => FALSE = FALSE) | turndiceValue:=0 || (FALSE = TRUE ==> turnfinishOrder,turnhasRoll:=turnfinishOrder<+{card(turnfinishOrder)|->turncolor},FALSE [] not(FALSE = TRUE) ==> (FALSE = TRUE ==> turnhasRoll:=TRUE [] not(FALSE = TRUE) ==> skip)));(pp: PIECES & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2 | boardlockedPieces,boardexternalPos:=boardlockedPieces-{pp},boardexternalPos<+{pp|->startPoint(colorOf(pp))}));
  Expanded_List_Substitution(Implementation(Ludo_i),initGame)==(turngameStarted = FALSE & card(turnenabledColors)>=2 | (turngameStarted = FALSE & card(turnenabledColors)>=2 | turngameStarted:=TRUE || @(color$0).(color$0: turnenabledColors ==> turncolor:=color$0) || turnhasRoll:=TRUE || turndiceValue:=0 || turnsixSequenceCount:=0 || turnfinishOrder:={});(btrue | boardlockedPieces,boardexternalPos,boardinternalPos:=PIECES,{},{}));
  Expanded_List_Substitution(Implementation(Ludo_i),unpickColor)==(cc: COLORS & cc: turnenabledColors & turngameStarted = FALSE | turnenabledColors:=turnenabledColors-{cc});
  Expanded_List_Substitution(Implementation(Ludo_i),pickColor)==(cc: COLORS & cc/:turnenabledColors & turngameStarted = FALSE | turnenabledColors:=turnenabledColors\/{cc});
  Expanded_List_Substitution(Implementation(Ludo_i),canWalk)==(pp: PIECES | bb:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),isPathFree)==(n1: 0..51 & n2: 0..51 | bb:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),canFree)==(pp: PIECES | bb:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),isFinished)==(color: COLORS | bb:=TRUE;@(ii,piece,pieceColor,externalPos,internalPos,endPos).((0: INT | ii:=0);(numInternal-1: INT & numInternal: INT & 1: INT | endPos:=numInternal-1);WHILE ii<numPieces & bb = TRUE DO (ii: dom(piecesOrder) | piece:=piecesOrder(ii));(piece: dom(colorOf) | pieceColor:=colorOf(piece));(piece: PIECES | piece: dom(boardexternalPos) ==> externalPos,internalPos:=boardexternalPos(piece), -1 [] not(piece: dom(boardexternalPos)) ==> (piece: dom(boardinternalPos) ==> externalPos,internalPos:= -1,boardinternalPos(piece) [] not(piece: dom(boardinternalPos)) ==> externalPos,internalPos:= -1, -1));(pieceColor = color & internalPos/=endPos ==> bb:=FALSE [] not(pieceColor = color & internalPos/=endPos) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..numPieces & boardinternalPos: PIECES +-> 0..numInternal-1 & bb = TRUE <=> colorOf~[{color}]/\piecesOrder[0..ii-1] <: boardinternalPos~[{numInternal-1}] VARIANT numPieces-ii END));
  List_Substitution(Implementation(Ludo_i),isFinished)==(bb:=TRUE;VAR ii,piece,pieceColor,externalPos,internalPos,endPos IN ii:=0;endPos:=numInternal-1;WHILE ii<numPieces & bb = TRUE DO piece:=piecesOrder(ii);pieceColor:=colorOf(piece);externalPos,internalPos <-- (board.getPos)(piece);IF pieceColor = color & internalPos/=endPos THEN bb:=FALSE END;ii:=ii+1 INVARIANT ii: 0..numPieces & board.internalPos: PIECES +-> 0..numInternal-1 & bb = TRUE <=> colorOf~[{color}]/\piecesOrder[0..ii-1] <: (board.internalPos)~[{numInternal-1}] VARIANT numPieces-ii END END);
  List_Substitution(Implementation(Ludo_i),canFree)==(bb:=TRUE);
  List_Substitution(Implementation(Ludo_i),isPathFree)==(bb:=TRUE);
  List_Substitution(Implementation(Ludo_i),canWalk)==(bb:=TRUE);
  List_Substitution(Implementation(Ludo_i),pickColor)==((turn.pickColor)(cc));
  List_Substitution(Implementation(Ludo_i),unpickColor)==((turn.unpickColor)(cc));
  List_Substitution(Implementation(Ludo_i),initGame)==(turn.initGame;board.clear);
  List_Substitution(Implementation(Ludo_i),free)==((turn.computeAction)(FALSE,FALSE);(board.setFree)(pp));
  List_Substitution(Implementation(Ludo_i),rollDice)==(vv <-- turn.rollDice);
  List_Substitution(Implementation(Ludo_i),nextTurn)==(turn.nextTurn);
  List_Substitution(Implementation(Ludo_i),walk)==(skip);
  List_Substitution(Implementation(Ludo_i),getDiceValue)==(skip);
  List_Substitution(Implementation(Ludo_i),getBoard)==(skip);
  List_Substitution(Implementation(Ludo_i),getTurn)==(skip);
  List_Substitution(Implementation(Ludo_i),finishGame)==(turn.endGame);
  List_Substitution(Implementation(Ludo_i),pre_pickColor)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_unpickColor)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_initGame)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_free)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_rollDice)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_walk)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_nextTurn)==(rr:=TRUE)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Ludo_i))==(?);
  Inherited_List_Constants(Implementation(Ludo_i))==(?);
  List_Constants(Implementation(Ludo_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(Ludo_i))==(?);
  Context_List_Defered(Implementation(Ludo_i))==(COLORS,PIECES);
  Context_List_Sets(Implementation(Ludo_i))==(COLORS,PIECES);
  List_Own_Enumerated(Implementation(Ludo_i))==(?);
  List_Valuable_Sets(Implementation(Ludo_i))==(?);
  Inherited_List_Enumerated(Implementation(Ludo_i))==(?);
  Inherited_List_Defered(Implementation(Ludo_i))==(?);
  Inherited_List_Sets(Implementation(Ludo_i))==(?);
  List_Enumerated(Implementation(Ludo_i))==(?);
  List_Defered(Implementation(Ludo_i))==(?);
  List_Sets(Implementation(Ludo_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Ludo_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Ludo_i))==(?);
  List_HiddenConstants(Implementation(Ludo_i))==(?);
  External_List_HiddenConstants(Implementation(Ludo_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Ludo_i))==(btrue);
  Context_List_Properties(Implementation(Ludo_i))==(numPiecesByColor = 4 & numExternal = 52 & numInternal = 6 & numColors = 4 & card(COLORS) = numColors & numPieces: NAT & numPieces = numPiecesByColor*numColors & diceOptions = 1..6 & stars <: 0..numExternal-1 & stars = {8,21,34,47} & startPoint: COLORS >-> 0..51 & card(PIECES) = numPiecesByColor*numColors & colorsOrder: 0..3 >->> COLORS & colorOf: PIECES -->> COLORS & !cc.(cc: COLORS => colorOf~[{cc}]: FIN(PIECES) & card(colorOf~[{cc}]) = numPiecesByColor) & piecesOrder: 0..15 >->> PIECES & COLORS: FIN(INTEGER) & not(COLORS = {}) & PIECES: FIN(INTEGER) & not(PIECES = {}));
  Inherited_List_Properties(Implementation(Ludo_i))==(btrue);
  List_Properties(Implementation(Ludo_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(Ludo_i))==(aa: aa);
  List_Values(Implementation(Ludo_i))==(?)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Implementation(Ludo_i),Machine(Ludo_ctx))==(?);
  Seen_Context_List_Enumerated(Implementation(Ludo_i))==(?);
  Seen_Context_List_Invariant(Implementation(Ludo_i))==(btrue);
  Seen_Context_List_Assertions(Implementation(Ludo_i))==(btrue);
  Seen_Context_List_Properties(Implementation(Ludo_i))==(btrue);
  Seen_List_Constraints(Implementation(Ludo_i))==(btrue);
  Seen_List_Operations(Implementation(Ludo_i),Machine(Ludo_ctx))==(?);
  Seen_Expanded_List_Invariant(Implementation(Ludo_i),Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(Ludo_i),Machine(Ludo_turn))==(pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame);
  List_Included_Operations(Implementation(Ludo_i),Machine(Ludo_board))==(clear,setFree,setExternalPos,setInternalPos,getPos)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(Ludo_i))==(Type(pre_walk) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_nextTurn) == Cst(btype(BOOL,?,?),No_type);Type(pre_rollDice) == Cst(btype(BOOL,?,?),No_type);Type(pre_free) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_initGame) == Cst(btype(BOOL,?,?),No_type);Type(pre_unpickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(pre_pickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(finishGame) == Cst(SetOf(btype(INTEGER,?,?)*atype(COLORS,?,?)),No_type);Type(getTurn) == Cst(atype(COLORS,?,?),No_type);Type(getBoard) == Cst(SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?))*SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?)),No_type);Type(getDiceValue) == Cst(btype(INTEGER,?,?),No_type);Type(walk) == Cst(No_type,atype(PIECES,?,?));Type(nextTurn) == Cst(No_type,No_type);Type(rollDice) == Cst(btype(INTEGER,?,?),No_type);Type(free) == Cst(No_type,atype(PIECES,?,?));Type(initGame) == Cst(No_type,No_type);Type(unpickColor) == Cst(No_type,atype(COLORS,?,?));Type(pickColor) == Cst(No_type,atype(COLORS,?,?)))
END
&
THEORY ListVisibleStaticX IS
  List_Constants(Implementation(Ludo_i),Machine(Ludo_ctx))==(colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Constants_Env(Implementation(Ludo_i),Machine(Ludo_ctx))==(Type(colorOf) == Cst(SetOf(atype(PIECES,"[PIECES","]PIECES")*atype(COLORS,"[COLORS","]COLORS")));Type(startPoint) == Cst(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(INTEGER,0,51)));Type(colorsOrder) == Cst(SetOf(btype(INTEGER,0,3)*atype(COLORS,"[COLORS","]COLORS")));Type(piecesOrder) == Cst(SetOf(btype(INTEGER,0,15)*atype(PIECES,"[PIECES","]PIECES")));Type(numColors) == Cst(btype(INTEGER,?,?));Type(numPiecesByColor) == Cst(btype(INTEGER,?,?));Type(numPieces) == Cst(btype(INTEGER,?,?));Type(numExternal) == Cst(btype(INTEGER,?,?));Type(numInternal) == Cst(btype(INTEGER,?,?)));
  List_Defered_Sets(Implementation(Ludo_i),Machine(Ludo_ctx))==(COLORS,PIECES)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Ludo_i)) == (? | ? | ? | turngameStarted,turnenabledColors,turncolor,turnhasRoll,turndiceValue,turnsixSequenceCount,turnfinishOrder,boardlockedPieces,boardexternalPos,boardinternalPos | isFinished,canFree,isPathFree,canWalk,pickColor,unpickColor,initGame,free,rollDice,nextTurn,walk,getDiceValue,getBoard,getTurn,finishGame,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_walk,pre_nextTurn,refinement_of_canWalk,refinement_of_isPathFree,refinement_of_canFree,refinement_of_isFinished | ? | seen(Machine(Ludo_ctx)),imported(Machine(board.Ludo_board)),imported(Machine(turn.Ludo_turn)) | ? | Ludo_i);
  List_Of_HiddenCst_Ids(Implementation(Ludo_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Ludo_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Ludo_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(Ludo_i)) == (seen(Machine(Ludo_ctx)): (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | stars,diceOptions | ? | ?));
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
  List_Of_Ids(Machine(Ludo_board)) == (? | ? | internalPos,externalPos,lockedPieces | ? | clear,setFree,setExternalPos,setInternalPos,getPos | ? | seen(Machine(Ludo_ctx)) | ? | Ludo_board);
  List_Of_HiddenCst_Ids(Machine(Ludo_board)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_board)) == (?);
  List_Of_VisibleVar_Ids(Machine(Ludo_board)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_board)) == (?: ?)
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(Ludo_i),isFinished, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(piece) == Lvl(atype(PIECES,?,?));Type(pieceColor) == Lvl(atype(COLORS,?,?));Type(externalPos) == Lvl(btype(INTEGER,?,?));Type(internalPos) == Lvl(btype(INTEGER,?,?));Type(endPos) == Lvl(btype(INTEGER,?,?)))
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
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(Ludo_i))==(isFinished,canFree,isPathFree,canWalk)
END
&
THEORY ListLocalInputX IS
  List_Local_Input(Implementation(Ludo_i),isFinished)==(color);
  List_Local_Input(Implementation(Ludo_i),canFree)==(pp);
  List_Local_Input(Implementation(Ludo_i),isPathFree)==(n1,n2);
  List_Local_Input(Implementation(Ludo_i),canWalk)==(pp)
END
&
THEORY ListLocalOutputX IS
  List_Local_Output(Implementation(Ludo_i),isFinished)==(bb);
  List_Local_Output(Implementation(Ludo_i),canFree)==(bb);
  List_Local_Output(Implementation(Ludo_i),isPathFree)==(bb);
  List_Local_Output(Implementation(Ludo_i),canWalk)==(bb)
END
&
THEORY ListLocalHeaderX IS
  List_Local_Header(Implementation(Ludo_i),isFinished)==(bb <-- isFinished(color));
  List_Local_Header(Implementation(Ludo_i),canFree)==(bb <-- canFree(pp));
  List_Local_Header(Implementation(Ludo_i),isPathFree)==(bb <-- isPathFree(n1,n2));
  List_Local_Header(Implementation(Ludo_i),canWalk)==(bb <-- canWalk(pp))
END
&
THEORY ListLocalPreconditionX IS
  List_Local_Precondition(Implementation(Ludo_i),isFinished)==(color: COLORS);
  List_Local_Precondition(Implementation(Ludo_i),canFree)==(pp: PIECES);
  List_Local_Precondition(Implementation(Ludo_i),isPathFree)==(n1: 0..51 & n2: 0..51);
  List_Local_Precondition(Implementation(Ludo_i),canWalk)==(pp: PIECES)
END
&
THEORY ListLocalSubstitutionX IS
  Expanded_List_Local_Substitution(Implementation(Ludo_i),canWalk)==(pp: PIECES | bb:=TRUE);
  Expanded_List_Local_Substitution(Implementation(Ludo_i),isPathFree)==(n1: 0..51 & n2: 0..51 | bb:=bool(!nn.(nn: 0..numExternal-1 & nn/=n1 & (nn-n1+numExternal) mod numExternal<=(n2-n1+numExternal) mod numExternal => card(boardexternalPos|>{nn})<2)));
  Expanded_List_Local_Substitution(Implementation(Ludo_i),canFree)==(pp: PIECES | bb:=bool(turndiceValue = 6 & pp: boardlockedPieces & card(boardexternalPos|>{startPoint(colorOf(pp))})<2));
  Expanded_List_Local_Substitution(Implementation(Ludo_i),isFinished)==(color: COLORS | bb:=bool(colorOf~[{color}] <: boardinternalPos~[{numInternal-1}]));
  List_Local_Substitution(Implementation(Ludo_i),isFinished)==(bb:=bool(colorOf~[{color}] <: (board.internalPos)~[{numInternal-1}]));
  List_Local_Substitution(Implementation(Ludo_i),canFree)==(bb:=bool(turn.diceValue = 6 & pp: board.lockedPieces & card(board.externalPos|>{startPoint(colorOf(pp))})<2));
  List_Local_Substitution(Implementation(Ludo_i),isPathFree)==(bb:=bool(!nn.(nn: 0..numExternal-1 & nn/=n1 & (nn-n1+numExternal) mod numExternal<=(n2-n1+numExternal) mod numExternal => card(board.externalPos|>{nn})<2)));
  List_Local_Substitution(Implementation(Ludo_i),canWalk)==(bb:=TRUE)
END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(Ludo_i))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(Ludo_i),Machine(board.Ludo_board))==(board.lockedPieces,board.externalPos,board.internalPos);
  ImportedVisVariablesList(Implementation(Ludo_i),Machine(board.Ludo_board))==(?);
  ImportedVariablesList(Implementation(Ludo_i),Machine(turn.Ludo_turn))==(turn.gameStarted,turn.enabledColors,turn.color,turn.hasRoll,turn.diceValue,turn.sixSequenceCount,turn.finishOrder);
  ImportedVisVariablesList(Implementation(Ludo_i),Machine(turn.Ludo_turn))==(?)
END
&
THEORY ListLocalOpInvariantX IS
  LocalOp_Expanded_Invariant(Implementation(Ludo_i),canWalk)==(btrue);
  LocalOp_Expanded_Invariant(Implementation(Ludo_i),isPathFree)==(btrue);
  LocalOp_Expanded_Invariant(Implementation(Ludo_i),canFree)==(btrue);
  LocalOp_Expanded_Invariant(Implementation(Ludo_i),isFinished)==(btrue)
END
)
