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
  List_Includes(Implementation(Ludo_i))==(Ludo_board,Ludo_turn);
  Inherited_List_Includes(Implementation(Ludo_i))==(Ludo_turn,Ludo_board)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Ludo_i))==(pickColor,unpickColor,endGame,getDiceValue)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Ludo_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Ludo_i))==(?);
  Context_List_Variables(Implementation(Ludo_i))==(?);
  Abstract_List_Variables(Implementation(Ludo_i))==(atePieceDummy,internalPos,externalPos,lockedPieces,finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted);
  Local_List_Variables(Implementation(Ludo_i))==(?);
  List_Variables(Implementation(Ludo_i))==(internalPos,externalPos,lockedPieces,finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted);
  External_List_Variables(Implementation(Ludo_i))==(internalPos,externalPos,lockedPieces,finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted)
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
  Abstract_List_Invariant(Implementation(Ludo_i))==(!cc.(cc: ran(finishOrder) => colorOf~[{cc}] <: internalPos~[{numInternal-1}]) & !pp.(pp: PIECES => (colorOf(pp)/:enabledColors => pp: lockedPieces)) & atePieceDummy: BOOL & lockedPieces: POW(PIECES) & externalPos: PIECES +-> 0..numExternal-1 & internalPos: PIECES +-> 0..numInternal-1 & dom(externalPos)/\dom(internalPos) = {} & dom(externalPos)/\lockedPieces = {} & dom(internalPos)/\lockedPieces = {} & dom(externalPos)\/dom(internalPos)\/lockedPieces = PIECES & !nn.(nn: 0..numExternal-1 => card(externalPos|>{nn})<=2 & (nn/:(stars\/ran(startPoint)) => card((externalPos~;colorOf)[{nn}])<=1)) & gameStarted: BOOL & enabledColors: POW(COLORS) & enabledColors: FIN(enabledColors) & color: COLORS & hasRoll: BOOL & diceValue: 0..6 & sixSequenceCount: 0..2 & finishOrder: 0..numColors-1 >+> COLORS & finishOrder: FIN(finishOrder) & dom(finishOrder) = 0..card(finishOrder)-1 & (gameStarted = FALSE or (card(enabledColors)>=2 & color: enabledColors & ran(finishOrder) <: enabledColors)));
  Expanded_List_Invariant(Implementation(Ludo_i))==(lockedPieces: POW(PIECES) & externalPos: PIECES +-> 0..numExternal-1 & internalPos: PIECES +-> 0..numInternal-1 & dom(externalPos)/\dom(internalPos) = {} & dom(externalPos)/\lockedPieces = {} & dom(internalPos)/\lockedPieces = {} & dom(externalPos)\/dom(internalPos)\/lockedPieces = PIECES & !nn.(nn: 0..numExternal-1 => card(externalPos|>{nn})<=2 & (nn/:(stars\/ran(startPoint)) => card((externalPos~;colorOf)[{nn}])<=1)) & gameStarted: BOOL & enabledColors: POW(COLORS) & enabledColors: FIN(enabledColors) & color: COLORS & hasRoll: BOOL & diceValue: 0..6 & sixSequenceCount: 0..2 & finishOrder: 0..numColors-1 >+> COLORS & finishOrder: FIN(finishOrder) & dom(finishOrder) = 0..card(finishOrder)-1 & (gameStarted = FALSE or (card(enabledColors)>=2 & color: enabledColors & ran(finishOrder) <: enabledColors)));
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
  Expanded_List_Initialisation(Implementation(Ludo_i))==(lockedPieces,externalPos,internalPos:=PIECES,{},{};(gameStarted,enabledColors:=FALSE,{} || @(color$0).(color$0: COLORS ==> color:=color$0) || hasRoll:=FALSE || diceValue:=0 || sixSequenceCount:=0 || finishOrder:={}));
  Context_List_Initialisation(Implementation(Ludo_i))==(skip);
  List_Initialisation(Implementation(Ludo_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Ludo_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(Ludo_i),Machine(Ludo_board))==(?);
  List_Instanciated_Parameters(Implementation(Ludo_i),Machine(Ludo_turn))==(?);
  List_Instanciated_Parameters(Implementation(Ludo_i),Machine(Ludo_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Ludo_i),Machine(Ludo_turn))==(btrue);
  List_Constraints(Implementation(Ludo_i))==(btrue);
  List_Context_Constraints(Implementation(Ludo_i))==(btrue);
  List_Constraints(Implementation(Ludo_i),Machine(Ludo_board))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Ludo_i))==(stepsToFinish,isFinished,canFree,isPathFree,canWalk,startGame,free,throwDice,skipTurn,walk,getPiecePos,getTurn,getNumWinners,getPlacement,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_walk,pre_nextTurn,pre_finishGame,pickColor,unpickColor,endGame,getDiceValue);
  List_Operations(Implementation(Ludo_i))==(stepsToFinish,isFinished,canFree,isPathFree,canWalk,startGame,free,throwDice,skipTurn,walk,getPiecePos,getTurn,getNumWinners,getPlacement,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_walk,pre_nextTurn,pre_finishGame,pickColor,unpickColor,endGame,getDiceValue)
END
&
THEORY ListInputX IS
  List_Input(Implementation(Ludo_i),getDiceValue)==(?);
  List_Input(Implementation(Ludo_i),endGame)==(?);
  List_Input(Implementation(Ludo_i),unpickColor)==(cc);
  List_Input(Implementation(Ludo_i),pickColor)==(cc);
  List_Input(Implementation(Ludo_i),stepsToFinish)==(piece);
  List_Input(Implementation(Ludo_i),isFinished)==(cc);
  List_Input(Implementation(Ludo_i),canFree)==(pp);
  List_Input(Implementation(Ludo_i),isPathFree)==(n1,n2);
  List_Input(Implementation(Ludo_i),canWalk)==(pp);
  List_Input(Implementation(Ludo_i),startGame)==(?);
  List_Input(Implementation(Ludo_i),free)==(pp);
  List_Input(Implementation(Ludo_i),throwDice)==(?);
  List_Input(Implementation(Ludo_i),skipTurn)==(?);
  List_Input(Implementation(Ludo_i),walk)==(pp);
  List_Input(Implementation(Ludo_i),getPiecePos)==(pp);
  List_Input(Implementation(Ludo_i),getTurn)==(?);
  List_Input(Implementation(Ludo_i),getNumWinners)==(?);
  List_Input(Implementation(Ludo_i),getPlacement)==(nn);
  List_Input(Implementation(Ludo_i),pre_pickColor)==(cc);
  List_Input(Implementation(Ludo_i),pre_unpickColor)==(cc);
  List_Input(Implementation(Ludo_i),pre_initGame)==(?);
  List_Input(Implementation(Ludo_i),pre_free)==(pp);
  List_Input(Implementation(Ludo_i),pre_rollDice)==(?);
  List_Input(Implementation(Ludo_i),pre_walk)==(pp);
  List_Input(Implementation(Ludo_i),pre_nextTurn)==(?);
  List_Input(Implementation(Ludo_i),pre_finishGame)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Ludo_i),getDiceValue)==(value);
  List_Output(Implementation(Ludo_i),endGame)==(?);
  List_Output(Implementation(Ludo_i),unpickColor)==(?);
  List_Output(Implementation(Ludo_i),pickColor)==(?);
  List_Output(Implementation(Ludo_i),stepsToFinish)==(nn);
  List_Output(Implementation(Ludo_i),isFinished)==(bb);
  List_Output(Implementation(Ludo_i),canFree)==(bb);
  List_Output(Implementation(Ludo_i),isPathFree)==(bb);
  List_Output(Implementation(Ludo_i),canWalk)==(bb);
  List_Output(Implementation(Ludo_i),startGame)==(?);
  List_Output(Implementation(Ludo_i),free)==(?);
  List_Output(Implementation(Ludo_i),throwDice)==(vv);
  List_Output(Implementation(Ludo_i),skipTurn)==(?);
  List_Output(Implementation(Ludo_i),walk)==(?);
  List_Output(Implementation(Ludo_i),getPiecePos)==(ee,ii);
  List_Output(Implementation(Ludo_i),getTurn)==(cc);
  List_Output(Implementation(Ludo_i),getNumWinners)==(nn);
  List_Output(Implementation(Ludo_i),getPlacement)==(cc);
  List_Output(Implementation(Ludo_i),pre_pickColor)==(rr);
  List_Output(Implementation(Ludo_i),pre_unpickColor)==(rr);
  List_Output(Implementation(Ludo_i),pre_initGame)==(rr);
  List_Output(Implementation(Ludo_i),pre_free)==(rr);
  List_Output(Implementation(Ludo_i),pre_rollDice)==(rr);
  List_Output(Implementation(Ludo_i),pre_walk)==(rr);
  List_Output(Implementation(Ludo_i),pre_nextTurn)==(rr);
  List_Output(Implementation(Ludo_i),pre_finishGame)==(rr)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Ludo_i),getDiceValue)==(value <-- getDiceValue);
  List_Header(Implementation(Ludo_i),endGame)==(endGame);
  List_Header(Implementation(Ludo_i),unpickColor)==(unpickColor(cc));
  List_Header(Implementation(Ludo_i),pickColor)==(pickColor(cc));
  List_Header(Implementation(Ludo_i),stepsToFinish)==(nn <-- stepsToFinish(piece));
  List_Header(Implementation(Ludo_i),isFinished)==(bb <-- isFinished(cc));
  List_Header(Implementation(Ludo_i),canFree)==(bb <-- canFree(pp));
  List_Header(Implementation(Ludo_i),isPathFree)==(bb <-- isPathFree(n1,n2));
  List_Header(Implementation(Ludo_i),canWalk)==(bb <-- canWalk(pp));
  List_Header(Implementation(Ludo_i),startGame)==(startGame);
  List_Header(Implementation(Ludo_i),free)==(free(pp));
  List_Header(Implementation(Ludo_i),throwDice)==(vv <-- throwDice);
  List_Header(Implementation(Ludo_i),skipTurn)==(skipTurn);
  List_Header(Implementation(Ludo_i),walk)==(walk(pp));
  List_Header(Implementation(Ludo_i),getPiecePos)==(ee,ii <-- getPiecePos(pp));
  List_Header(Implementation(Ludo_i),getTurn)==(cc <-- getTurn);
  List_Header(Implementation(Ludo_i),getNumWinners)==(nn <-- getNumWinners);
  List_Header(Implementation(Ludo_i),getPlacement)==(cc <-- getPlacement(nn));
  List_Header(Implementation(Ludo_i),pre_pickColor)==(rr <-- pre_pickColor(cc));
  List_Header(Implementation(Ludo_i),pre_unpickColor)==(rr <-- pre_unpickColor(cc));
  List_Header(Implementation(Ludo_i),pre_initGame)==(rr <-- pre_initGame);
  List_Header(Implementation(Ludo_i),pre_free)==(rr <-- pre_free(pp));
  List_Header(Implementation(Ludo_i),pre_rollDice)==(rr <-- pre_rollDice);
  List_Header(Implementation(Ludo_i),pre_walk)==(rr <-- pre_walk(pp));
  List_Header(Implementation(Ludo_i),pre_nextTurn)==(rr <-- pre_nextTurn);
  List_Header(Implementation(Ludo_i),pre_finishGame)==(rr <-- pre_finishGame)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(Ludo_i),getDiceValue)==(btrue);
  List_Precondition(Implementation(Ludo_i),getDiceValue)==(btrue);
  Own_Precondition(Implementation(Ludo_i),endGame)==(gameStarted = TRUE & card(finishOrder)>=1);
  List_Precondition(Implementation(Ludo_i),endGame)==(gameStarted = TRUE & card(finishOrder)>=1);
  Own_Precondition(Implementation(Ludo_i),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE);
  List_Precondition(Implementation(Ludo_i),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE);
  Own_Precondition(Implementation(Ludo_i),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE);
  List_Precondition(Implementation(Ludo_i),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE);
  Own_Precondition(Implementation(Ludo_i),stepsToFinish)==(btrue);
  List_Precondition(Implementation(Ludo_i),stepsToFinish)==(piece: PIECES);
  Own_Precondition(Implementation(Ludo_i),isFinished)==(btrue);
  List_Precondition(Implementation(Ludo_i),isFinished)==(cc: COLORS);
  Own_Precondition(Implementation(Ludo_i),canFree)==(btrue);
  List_Precondition(Implementation(Ludo_i),canFree)==(pp: PIECES);
  Own_Precondition(Implementation(Ludo_i),isPathFree)==(btrue);
  List_Precondition(Implementation(Ludo_i),isPathFree)==(n1: 0..51 & n2: 0..51);
  Own_Precondition(Implementation(Ludo_i),canWalk)==(btrue);
  List_Precondition(Implementation(Ludo_i),canWalk)==(pp: PIECES);
  Own_Precondition(Implementation(Ludo_i),startGame)==(btrue);
  List_Precondition(Implementation(Ludo_i),startGame)==(gameStarted = FALSE & card(enabledColors)>=2);
  Own_Precondition(Implementation(Ludo_i),free)==(btrue);
  List_Precondition(Implementation(Ludo_i),free)==(gameStarted = TRUE & pp: PIECES & colorOf(pp) = color & diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2);
  Own_Precondition(Implementation(Ludo_i),throwDice)==(btrue);
  List_Precondition(Implementation(Ludo_i),throwDice)==(gameStarted = TRUE & hasRoll = TRUE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal))))));
  Own_Precondition(Implementation(Ludo_i),skipTurn)==(btrue);
  List_Precondition(Implementation(Ludo_i),skipTurn)==(gameStarted = TRUE & hasRoll = FALSE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal))))) & card(finishOrder)<card(enabledColors));
  Own_Precondition(Implementation(Ludo_i),walk)==(btrue);
  List_Precondition(Implementation(Ludo_i),walk)==(gameStarted = TRUE & pp: PIECES & colorOf(pp) = color & diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal));
  Own_Precondition(Implementation(Ludo_i),getPiecePos)==(btrue);
  List_Precondition(Implementation(Ludo_i),getPiecePos)==(pp: PIECES);
  Own_Precondition(Implementation(Ludo_i),getTurn)==(btrue);
  List_Precondition(Implementation(Ludo_i),getTurn)==(btrue);
  Own_Precondition(Implementation(Ludo_i),getNumWinners)==(btrue);
  List_Precondition(Implementation(Ludo_i),getNumWinners)==(btrue);
  Own_Precondition(Implementation(Ludo_i),getPlacement)==(btrue);
  List_Precondition(Implementation(Ludo_i),getPlacement)==(nn: NAT & nn: dom(finishOrder));
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
  List_Precondition(Implementation(Ludo_i),pre_nextTurn)==(btrue);
  Own_Precondition(Implementation(Ludo_i),pre_finishGame)==(btrue);
  List_Precondition(Implementation(Ludo_i),pre_finishGame)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Ludo_i),pre_finishGame)==(btrue | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_nextTurn)==(btrue | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_walk)==(pp: PIECES | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_rollDice)==(btrue | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_free)==(pp: PIECES | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_initGame)==(btrue | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_unpickColor)==(cc: COLORS | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),pre_pickColor)==(cc: COLORS | rr:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),getPlacement)==(nn: NAT & nn: dom(finishOrder) | cc:=finishOrder(nn));
  Expanded_List_Substitution(Implementation(Ludo_i),getNumWinners)==(btrue | nn:=card(finishOrder));
  Expanded_List_Substitution(Implementation(Ludo_i),getTurn)==(btrue | cc:=color);
  Expanded_List_Substitution(Implementation(Ludo_i),getPiecePos)==(pp: PIECES | pp: dom(externalPos) ==> ee,ii:=externalPos(pp), -1 [] not(pp: dom(externalPos)) ==> (pp: dom(internalPos) ==> ee,ii:= -1,internalPos(pp) [] not(pp: dom(internalPos)) ==> ee,ii:= -1, -1));
  Expanded_List_Substitution(Implementation(Ludo_i),walk)==(gameStarted = TRUE & pp: PIECES & colorOf(pp) = color & diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal) | @(externalPos,internalPos,diceValue$0,nn,newPos,endPos,atePiece,finished).((pp: PIECES | pp: dom(externalPos) ==> externalPos,internalPos:=externalPos(pp), -1 [] not(pp: dom(externalPos)) ==> (pp: dom(internalPos) ==> externalPos,internalPos:= -1,internalPos(pp) [] not(pp: dom(internalPos)) ==> externalPos,internalPos:= -1, -1));(btrue | diceValue$0:=diceValue);(pp: PIECES | nn:=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal);(externalPos/= -1 & diceValue$0<=nn ==> ((diceValue$0+externalPos: INT & diceValue$0: INT & externalPos: INT & (diceValue$0+externalPos) mod numExternal: NAT & diceValue$0+externalPos: NAT & numExternal: NAT1 | newPos:=(diceValue$0+externalPos) mod numExternal);(pp: PIECES & pp/:lockedPieces & pp/:dom(internalPos) & newPos: 0..numExternal-1 & card(externalPos|>{newPos})<2 | newPos/:(stars\/ran(startPoint)) & (externalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={} ==> externalPos,lockedPieces,atePiece:=externalPos|>>{newPos}<+{pp|->newPos},lockedPieces\/externalPos~[{newPos}],TRUE [] not(newPos/:(stars\/ran(startPoint)) & (externalPos~;colorOf)[{newPos}]-{colorOf(pp)}/={}) ==> externalPos,atePiece:=externalPos<+{pp|->newPos},FALSE);(gameStarted = TRUE & diceValue/=0 & atePiece: BOOL & FALSE: BOOL & (atePiece = TRUE => FALSE = FALSE) | diceValue:=0 || (FALSE = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(FALSE = TRUE) ==> (atePiece = TRUE ==> hasRoll:=TRUE [] not(atePiece = TRUE) ==> skip)))) [] not(externalPos/= -1 & diceValue$0<=nn) ==> (externalPos/= -1 ==> (diceValue$0-nn-1: INT & diceValue$0-nn: INT & diceValue$0: INT & nn: INT & 1: INT | newPos:=diceValue$0-nn-1) [] not(externalPos/= -1) ==> (diceValue$0+internalPos: INT & diceValue$0: INT & internalPos: INT | newPos:=diceValue$0+internalPos);(pp: PIECES & pp/:lockedPieces & newPos: 0..numInternal-1 | internalPos,externalPos:=internalPos<+{pp|->newPos},{pp}<<|externalPos);(numInternal-1: INT & numInternal: INT & 1: INT | endPos:=numInternal-1);(newPos = endPos ==> ((pp: dom(colorOf) & colorOf(pp): COLORS | finished:=bool(colorOf~[{color}] <: internalPos~[{numInternal-1}]));(finished = TRUE ==> (gameStarted = TRUE & diceValue/=0 & FALSE: BOOL & TRUE: BOOL & (FALSE = TRUE => TRUE = FALSE) | diceValue:=0 || (TRUE = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(TRUE = TRUE) ==> (FALSE = TRUE ==> hasRoll:=TRUE [] not(FALSE = TRUE) ==> skip))) [] not(finished = TRUE) ==> (gameStarted = TRUE & diceValue/=0 & TRUE: BOOL & FALSE: BOOL & (TRUE = TRUE => FALSE = FALSE) | diceValue:=0 || (FALSE = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(FALSE = TRUE) ==> (TRUE = TRUE ==> hasRoll:=TRUE [] not(TRUE = TRUE) ==> skip))))) [] not(newPos = endPos) ==> skip)))));
  Expanded_List_Substitution(Implementation(Ludo_i),skipTurn)==(gameStarted = TRUE & hasRoll = FALSE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal))))) & card(finishOrder)<card(enabledColors) & gameStarted = TRUE & hasRoll = FALSE & card(finishOrder)<card(enabledColors) | hasRoll,sixSequenceCount,diceValue:=TRUE,0,0 || @numJumps.(numJumps = min({nn | nn: 1..numColors & colorsOrder((colorsOrder~(color)+nn) mod numColors): enabledColors-ran(finishOrder)}) ==> color:=colorsOrder((colorsOrder~(color)+numJumps) mod numColors)));
  Expanded_List_Substitution(Implementation(Ludo_i),throwDice)==(gameStarted = TRUE & hasRoll = TRUE & (diceValue = 0 or not(#pp.(pp: PIECES & colorOf(pp) = color & (diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 or diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal))))) & gameStarted = TRUE & hasRoll = TRUE | @dd.(dd: 1..6 ==> (vv:=dd || (dd = 6 ==> (sixSequenceCount<2 ==> sixSequenceCount,diceValue:=sixSequenceCount+1,dd [] not(sixSequenceCount<2) ==> sixSequenceCount,hasRoll,diceValue:=0,FALSE,0) [] not(dd = 6) ==> hasRoll,diceValue:=FALSE,dd))));
  Expanded_List_Substitution(Implementation(Ludo_i),free)==(gameStarted = TRUE & pp: PIECES & colorOf(pp) = color & diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 | (gameStarted = TRUE & diceValue/=0 & FALSE: BOOL & FALSE: BOOL & (FALSE = TRUE => FALSE = FALSE) | diceValue:=0 || (FALSE = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(FALSE = TRUE) ==> (FALSE = TRUE ==> hasRoll:=TRUE [] not(FALSE = TRUE) ==> skip)));(pp: PIECES & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 | lockedPieces,externalPos:=lockedPieces-{pp},externalPos<+{pp|->startPoint(colorOf(pp))}));
  Expanded_List_Substitution(Implementation(Ludo_i),startGame)==(gameStarted = FALSE & card(enabledColors)>=2 | (gameStarted = FALSE & card(enabledColors)>=2 | gameStarted:=TRUE || @(color$0).(color$0: enabledColors ==> color:=color$0) || hasRoll:=TRUE || diceValue:=0 || sixSequenceCount:=0 || finishOrder:={});(btrue | lockedPieces,externalPos,internalPos:=PIECES,{},{}));
  Expanded_List_Substitution(Implementation(Ludo_i),canWalk)==(pp: PIECES | bb:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),isPathFree)==(n1: 0..51 & n2: 0..51 | @(countPerPos,ii,piece,pos,dummy,numSteps,count).(countPerPos:=(0..numExternal)*{0};(0: INT | ii:=0);WHILE ii<numPieces DO (ii: dom(piecesOrder) | piece:=piecesOrder(ii));(piece: PIECES | piece: dom(externalPos) ==> pos,dummy:=externalPos(piece), -1 [] not(piece: dom(externalPos)) ==> (piece: dom(internalPos) ==> pos,dummy:= -1,internalPos(piece) [] not(piece: dom(internalPos)) ==> pos,dummy:= -1, -1));(pos: dom(countPerPos) & countPerPos(pos)+1: INT & countPerPos(pos): INT & 1: INT | countPerPos:=countPerPos<+{pos|->countPerPos(pos)+1});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..numPieces & countPerPos: 0..numExternal --> NAT & countPerPos = %nn.(nn: 0..numExternal-1 | card(piecesOrder[0..ii-1]<|externalPos|>{nn})) VARIANT numPieces-ii END;(1: INT | ii:=1);(n2-n1: INT & n2: INT & n1: INT & n2-n1+numExternal: INT & numExternal: INT & (n2-n1+numExternal) mod numExternal: NAT & n2-n1+numExternal: NAT & numExternal: NAT1 | numSteps:=(n2-n1+numExternal) mod numExternal);bb:=TRUE;WHILE ii<=numSteps & bb = TRUE DO (n1+ii: INT & n1: INT & ii: INT & (n1+ii) mod numExternal: NAT & n1+ii: NAT & numExternal: NAT1 & (n1+ii) mod numExternal: dom(countPerPos) | count:=countPerPos((n1+ii) mod numExternal));(count>=2 ==> bb:=FALSE [] not(count>=2) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..numSteps+1 & bb = bool(!nn.(nn: 0..numExternal-1 & nn/=n1 & (nn-n1+numExternal) mod numExternal<=ii => card(externalPos|>{nn})<2)) VARIANT numSteps-ii+1 END));
  Expanded_List_Substitution(Implementation(Ludo_i),canFree)==(pp: PIECES | bb:=TRUE);
  Expanded_List_Substitution(Implementation(Ludo_i),isFinished)==(cc: COLORS | bb:=TRUE;@(ii,piece,pieceColor,dummy,pos,endPos).((0: INT | ii:=0);(numInternal-1: INT & numInternal: INT & 1: INT | endPos:=numInternal-1);WHILE ii<numPieces & bb = TRUE DO (ii: dom(piecesOrder) | piece:=piecesOrder(ii));(piece: dom(colorOf) | pieceColor:=colorOf(piece));(piece: PIECES | piece: dom(externalPos) ==> dummy,pos:=externalPos(piece), -1 [] not(piece: dom(externalPos)) ==> (piece: dom(internalPos) ==> dummy,pos:= -1,internalPos(piece) [] not(piece: dom(internalPos)) ==> dummy,pos:= -1, -1));(pieceColor = cc & pos/=endPos ==> bb:=FALSE [] not(pieceColor = cc & pos/=endPos) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..numPieces & bb = TRUE <=> colorOf~[{cc}]/\piecesOrder[0..ii-1] <: internalPos~[{numInternal-1}] VARIANT numPieces-ii END));
  Expanded_List_Substitution(Implementation(Ludo_i),stepsToFinish)==(piece: PIECES | @(externalPos$0,internalPos$0).((piece: PIECES | piece: dom(externalPos) ==> externalPos$0,internalPos$0:=externalPos(piece), -1 [] not(piece: dom(externalPos)) ==> (piece: dom(internalPos) ==> externalPos$0,internalPos$0:= -1,internalPos(piece) [] not(piece: dom(internalPos)) ==> externalPos$0,internalPos$0:= -1, -1));(((startPoint(colorOf(piece))+numExternal-2) mod numExternal-externalPos$0+numExternal) mod numExternal: INT & piece: dom(colorOf) & colorOf(piece): dom(startPoint) & startPoint(colorOf(piece))+numExternal: INT & startPoint(colorOf(piece)): INT & numExternal: INT & startPoint(colorOf(piece))+numExternal-2: INT & 2: INT & (startPoint(colorOf(piece))+numExternal-2) mod numExternal: NAT & startPoint(colorOf(piece))+numExternal-2: NAT & numExternal: NAT1 & (startPoint(colorOf(piece))+numExternal-2) mod numExternal-externalPos$0: INT & (startPoint(colorOf(piece))+numExternal-2) mod numExternal: INT & externalPos$0: INT & (startPoint(colorOf(piece))+numExternal-2) mod numExternal-externalPos$0+numExternal: INT & ((startPoint(colorOf(piece))+numExternal-2) mod numExternal-externalPos$0+numExternal) mod numExternal: NAT & (startPoint(colorOf(piece))+numExternal-2) mod numExternal-externalPos$0+numExternal: NAT | nn:=((startPoint(colorOf(piece))+numExternal-2) mod numExternal-externalPos$0+numExternal) mod numExternal)));
  List_Substitution(Implementation(Ludo_i),getDiceValue)==(value:=diceValue);
  Expanded_List_Substitution(Implementation(Ludo_i),getDiceValue)==(btrue | value:=diceValue);
  List_Substitution(Implementation(Ludo_i),endGame)==(gameStarted:=FALSE);
  Expanded_List_Substitution(Implementation(Ludo_i),endGame)==(gameStarted = TRUE & card(finishOrder)>=1 | gameStarted:=FALSE);
  List_Substitution(Implementation(Ludo_i),unpickColor)==(enabledColors:=enabledColors-{cc});
  Expanded_List_Substitution(Implementation(Ludo_i),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE | enabledColors:=enabledColors-{cc});
  List_Substitution(Implementation(Ludo_i),pickColor)==(enabledColors:=enabledColors\/{cc});
  Expanded_List_Substitution(Implementation(Ludo_i),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE | enabledColors:=enabledColors\/{cc});
  List_Substitution(Implementation(Ludo_i),stepsToFinish)==(VAR externalPos,internalPos IN externalPos,internalPos <-- getPos(piece);nn:=((startPoint(colorOf(piece))+numExternal-2) mod numExternal-externalPos+numExternal) mod numExternal END);
  List_Substitution(Implementation(Ludo_i),isFinished)==(bb:=TRUE;VAR ii,piece,pieceColor,dummy,pos,endPos IN ii:=0;endPos:=numInternal-1;WHILE ii<numPieces & bb = TRUE DO piece:=piecesOrder(ii);pieceColor:=colorOf(piece);dummy,pos <-- getPos(piece);IF pieceColor = cc & pos/=endPos THEN bb:=FALSE END;ii:=ii+1 INVARIANT ii: 0..numPieces & bb = TRUE <=> colorOf~[{cc}]/\piecesOrder[0..ii-1] <: internalPos~[{numInternal-1}] VARIANT numPieces-ii END END);
  List_Substitution(Implementation(Ludo_i),canFree)==(bb:=TRUE);
  List_Substitution(Implementation(Ludo_i),isPathFree)==(VAR countPerPos,ii,piece,pos,dummy,numSteps,count IN countPerPos:=(0..numExternal)*{0};ii:=0;WHILE ii<numPieces DO piece:=piecesOrder(ii);pos,dummy <-- getPos(piece);countPerPos(pos):=countPerPos(pos)+1;ii:=ii+1 INVARIANT ii: 0..numPieces & countPerPos: 0..numExternal --> NAT & countPerPos = %nn.(nn: 0..numExternal-1 | card(piecesOrder[0..ii-1]<|externalPos|>{nn})) VARIANT numPieces-ii END;ii:=1;numSteps:=(n2-n1+numExternal) mod numExternal;bb:=TRUE;WHILE ii<=numSteps & bb = TRUE DO count:=countPerPos((n1+ii) mod numExternal);IF count>=2 THEN bb:=FALSE END;ii:=ii+1 INVARIANT ii: 1..numSteps+1 & bb = bool(!nn.(nn: 0..numExternal-1 & nn/=n1 & (nn-n1+numExternal) mod numExternal<=ii => card(externalPos|>{nn})<2)) VARIANT numSteps-ii+1 END END);
  List_Substitution(Implementation(Ludo_i),canWalk)==(bb:=TRUE);
  List_Substitution(Implementation(Ludo_i),startGame)==(initGame;clear);
  List_Substitution(Implementation(Ludo_i),free)==(computeAction(FALSE,FALSE);setFree(pp));
  List_Substitution(Implementation(Ludo_i),throwDice)==(vv <-- rollDice);
  List_Substitution(Implementation(Ludo_i),skipTurn)==(nextTurn);
  List_Substitution(Implementation(Ludo_i),walk)==(VAR externalPos,internalPos,diceValue,nn,newPos,endPos,atePiece,finished IN externalPos,internalPos <-- getPos(pp);diceValue <-- getDiceValue;nn <-- stepsToFinish(pp);IF externalPos/= -1 & diceValue<=nn THEN newPos:=(diceValue+externalPos) mod numExternal;atePiece <-- setExternalPos(pp,newPos);computeAction(atePiece,FALSE) ELSE IF externalPos/= -1 THEN newPos:=diceValue-nn-1 ELSE newPos:=diceValue+internalPos END;setInternalPos(pp,newPos);endPos:=numInternal-1;IF newPos = endPos THEN finished <-- isFinished(colorOf(pp));IF finished = TRUE THEN computeAction(FALSE,TRUE) ELSE computeAction(TRUE,FALSE) END END END END);
  List_Substitution(Implementation(Ludo_i),getPiecePos)==(ee,ii <-- getPos(pp));
  List_Substitution(Implementation(Ludo_i),getTurn)==(cc <-- getColor);
  List_Substitution(Implementation(Ludo_i),getNumWinners)==(nn <-- numWinners);
  List_Substitution(Implementation(Ludo_i),getPlacement)==(cc <-- placement(nn));
  List_Substitution(Implementation(Ludo_i),pre_pickColor)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_unpickColor)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_initGame)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_free)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_rollDice)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_walk)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_nextTurn)==(rr:=TRUE);
  List_Substitution(Implementation(Ludo_i),pre_finishGame)==(rr:=TRUE)
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
  List_Included_Operations(Implementation(Ludo_i),Machine(Ludo_turn))==(pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame,getDiceValue,getColor,numWinners,placement);
  List_Included_Operations(Implementation(Ludo_i),Machine(Ludo_board))==(clear,setFree,setExternalPos,setInternalPos,getPos)
END
&
THEORY InheritedEnvX IS
  Operations(Implementation(Ludo_i))==(Type(pickColor) == Cst(No_type,atype(COLORS,?,?));Type(unpickColor) == Cst(No_type,atype(COLORS,?,?));Type(endGame) == Cst(No_type,No_type);Type(getDiceValue) == Cst(btype(INTEGER,?,?),No_type);Type(pre_finishGame) == Cst(btype(BOOL,?,?),No_type);Type(pre_walk) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_nextTurn) == Cst(btype(BOOL,?,?),No_type);Type(pre_rollDice) == Cst(btype(BOOL,?,?),No_type);Type(pre_free) == Cst(btype(BOOL,?,?),atype(PIECES,?,?));Type(pre_initGame) == Cst(btype(BOOL,?,?),No_type);Type(pre_unpickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(pre_pickColor) == Cst(btype(BOOL,?,?),atype(COLORS,?,?));Type(getPlacement) == Cst(atype(COLORS,?,?),btype(INTEGER,?,?));Type(getNumWinners) == Cst(btype(INTEGER,?,?),No_type);Type(getTurn) == Cst(atype(COLORS,?,?),No_type);Type(getPiecePos) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),atype(PIECES,?,?));Type(walk) == Cst(No_type,atype(PIECES,?,?));Type(skipTurn) == Cst(No_type,No_type);Type(throwDice) == Cst(btype(INTEGER,?,?),No_type);Type(free) == Cst(No_type,atype(PIECES,?,?));Type(startGame) == Cst(No_type,No_type))
END
&
THEORY ListVisibleStaticX IS
  List_Constants(Implementation(Ludo_i),Machine(Ludo_ctx))==(colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Constants_Env(Implementation(Ludo_i),Machine(Ludo_ctx))==(Type(colorOf) == Cst(SetOf(atype(PIECES,"[PIECES","]PIECES")*atype(COLORS,"[COLORS","]COLORS")));Type(startPoint) == Cst(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(INTEGER,0,51)));Type(colorsOrder) == Cst(SetOf(btype(INTEGER,0,3)*atype(COLORS,"[COLORS","]COLORS")));Type(piecesOrder) == Cst(SetOf(btype(INTEGER,0,15)*atype(PIECES,"[PIECES","]PIECES")));Type(numColors) == Cst(btype(INTEGER,?,?));Type(numPiecesByColor) == Cst(btype(INTEGER,?,?));Type(numPieces) == Cst(btype(INTEGER,?,?));Type(numExternal) == Cst(btype(INTEGER,?,?));Type(numInternal) == Cst(btype(INTEGER,?,?)));
  List_Defered_Sets(Implementation(Ludo_i),Machine(Ludo_ctx))==(COLORS,PIECES)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Ludo_i)) == (? | ? | ? | finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted,internalPos,externalPos,lockedPieces | stepsToFinish,isFinished,canFree,isPathFree,canWalk,startGame,free,throwDice,skipTurn,walk,getPiecePos,getTurn,getNumWinners,getPlacement,pre_pickColor,pre_unpickColor,pre_initGame,pre_free,pre_rollDice,pre_walk,pre_nextTurn,pre_finishGame,refinement_of_canWalk,refinement_of_isPathFree,refinement_of_canFree,refinement_of_isFinished,refinement_of_stepsToFinish | ? | seen(Machine(Ludo_ctx)),imported(Machine(Ludo_board)),imported(Machine(Ludo_turn)) | ? | Ludo_i);
  List_Of_HiddenCst_Ids(Implementation(Ludo_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Ludo_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Ludo_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(Ludo_i)) == (seen(Machine(Ludo_ctx)): (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | stars,diceOptions | ? | ?));
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
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(Ludo_i),stepsToFinish, 1) == (Type(externalPos) == Lvl(btype(INTEGER,?,?));Type(internalPos) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Ludo_i),isFinished, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(piece) == Lvl(atype(PIECES,?,?));Type(pieceColor) == Lvl(atype(COLORS,?,?));Type(dummy) == Lvl(btype(INTEGER,?,?));Type(pos) == Lvl(btype(INTEGER,?,?));Type(endPos) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Ludo_i),isPathFree, 1) == (Type(countPerPos) == Lvl(SetOf(btype(INTEGER,0,numExternal)*btype(INTEGER,0,0)));Type(ii) == Lvl(btype(INTEGER,?,?));Type(piece) == Lvl(atype(PIECES,?,?));Type(pos) == Lvl(btype(INTEGER,?,?));Type(dummy) == Lvl(btype(INTEGER,?,?));Type(numSteps) == Lvl(btype(INTEGER,?,?));Type(count) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Ludo_i),walk, 1) == (Type(externalPos) == Lvl(btype(INTEGER,?,?));Type(internalPos) == Lvl(btype(INTEGER,?,?));Type(diceValue) == Lvl(btype(INTEGER,?,?));Type(nn) == Lvl(btype(INTEGER,?,?));Type(newPos) == Lvl(btype(INTEGER,?,?));Type(endPos) == Lvl(btype(INTEGER,?,?));Type(atePiece) == Lvl(btype(BOOL,?,?));Type(finished) == Lvl(btype(BOOL,?,?)))
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
  List_Local_Operations(Implementation(Ludo_i))==(stepsToFinish,isFinished,canFree,isPathFree,canWalk)
END
&
THEORY ListLocalInputX IS
  List_Local_Input(Implementation(Ludo_i),stepsToFinish)==(piece);
  List_Local_Input(Implementation(Ludo_i),isFinished)==(cc);
  List_Local_Input(Implementation(Ludo_i),canFree)==(pp);
  List_Local_Input(Implementation(Ludo_i),isPathFree)==(n1,n2);
  List_Local_Input(Implementation(Ludo_i),canWalk)==(pp)
END
&
THEORY ListLocalOutputX IS
  List_Local_Output(Implementation(Ludo_i),stepsToFinish)==(nn);
  List_Local_Output(Implementation(Ludo_i),isFinished)==(bb);
  List_Local_Output(Implementation(Ludo_i),canFree)==(bb);
  List_Local_Output(Implementation(Ludo_i),isPathFree)==(bb);
  List_Local_Output(Implementation(Ludo_i),canWalk)==(bb)
END
&
THEORY ListLocalHeaderX IS
  List_Local_Header(Implementation(Ludo_i),stepsToFinish)==(nn <-- stepsToFinish(piece));
  List_Local_Header(Implementation(Ludo_i),isFinished)==(bb <-- isFinished(cc));
  List_Local_Header(Implementation(Ludo_i),canFree)==(bb <-- canFree(pp));
  List_Local_Header(Implementation(Ludo_i),isPathFree)==(bb <-- isPathFree(n1,n2));
  List_Local_Header(Implementation(Ludo_i),canWalk)==(bb <-- canWalk(pp))
END
&
THEORY ListLocalPreconditionX IS
  List_Local_Precondition(Implementation(Ludo_i),stepsToFinish)==(piece: PIECES);
  List_Local_Precondition(Implementation(Ludo_i),isFinished)==(cc: COLORS);
  List_Local_Precondition(Implementation(Ludo_i),canFree)==(pp: PIECES);
  List_Local_Precondition(Implementation(Ludo_i),isPathFree)==(n1: 0..51 & n2: 0..51);
  List_Local_Precondition(Implementation(Ludo_i),canWalk)==(pp: PIECES)
END
&
THEORY ListLocalSubstitutionX IS
  Expanded_List_Local_Substitution(Implementation(Ludo_i),canWalk)==(pp: PIECES | bb:=bool(diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal)));
  Expanded_List_Local_Substitution(Implementation(Ludo_i),isPathFree)==(n1: 0..51 & n2: 0..51 | bb:=bool(!nn.(nn: 0..numExternal-1 & nn/=n1 & (nn-n1+numExternal) mod numExternal<=(n2-n1+numExternal) mod numExternal => card(externalPos|>{nn})<2)));
  Expanded_List_Local_Substitution(Implementation(Ludo_i),canFree)==(pp: PIECES | bb:=bool(diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2));
  Expanded_List_Local_Substitution(Implementation(Ludo_i),isFinished)==(cc: COLORS | bb:=bool(colorOf~[{color}] <: internalPos~[{numInternal-1}]));
  Expanded_List_Local_Substitution(Implementation(Ludo_i),stepsToFinish)==(piece: PIECES | nn:=((startPoint(colorOf(piece))+numExternal-2) mod numExternal-externalPos(piece)+numExternal) mod numExternal);
  List_Local_Substitution(Implementation(Ludo_i),stepsToFinish)==(nn:=((startPoint(colorOf(piece))+numExternal-2) mod numExternal-externalPos(piece)+numExternal) mod numExternal);
  List_Local_Substitution(Implementation(Ludo_i),isFinished)==(bb:=bool(colorOf~[{color}] <: internalPos~[{numInternal-1}]));
  List_Local_Substitution(Implementation(Ludo_i),canFree)==(bb:=bool(diceValue = 6 & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2));
  List_Local_Substitution(Implementation(Ludo_i),isPathFree)==(bb:=bool(!nn.(nn: 0..numExternal-1 & nn/=n1 & (nn-n1+numExternal) mod numExternal<=(n2-n1+numExternal) mod numExternal => card(externalPos|>{nn})<2)));
  List_Local_Substitution(Implementation(Ludo_i),canWalk)==(bb:=bool(diceValue/=0 & pp/:lockedPieces & (pp: dom(externalPos) => diceValue<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((externalPos(pp)+diceValue) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2) or (diceValue-((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal-1<numInternal & !nn.(nn: 0..numExternal-1 & nn/=externalPos(pp) & (nn-externalPos(pp)+numExternal) mod numExternal<=((startPoint(colorOf(pp))+numExternal-2) mod numExternal-externalPos(pp)+numExternal) mod numExternal => card(externalPos|>{nn})<2))) & (pp: dom(internalPos) => internalPos(pp)+diceValue<numInternal)))
END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(Ludo_i))==(btrue)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(Ludo_i),Machine(Ludo_board))==(internalPos,externalPos,lockedPieces);
  ImportedVisVariablesList(Implementation(Ludo_i),Machine(Ludo_board))==(?);
  ImportedVariablesList(Implementation(Ludo_i),Machine(Ludo_turn))==(finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted);
  ImportedVisVariablesList(Implementation(Ludo_i),Machine(Ludo_turn))==(?)
END
&
THEORY ListLocalOpInvariantX IS
  LocalOp_Expanded_Invariant(Implementation(Ludo_i),canWalk)==(btrue);
  LocalOp_Expanded_Invariant(Implementation(Ludo_i),isPathFree)==(btrue);
  LocalOp_Expanded_Invariant(Implementation(Ludo_i),canFree)==(btrue);
  LocalOp_Expanded_Invariant(Implementation(Ludo_i),isFinished)==(btrue);
  LocalOp_Expanded_Invariant(Implementation(Ludo_i),stepsToFinish)==(btrue)
END
)
