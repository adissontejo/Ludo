Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Ludo_turn_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Ludo_turn_i))==(Machine(Ludo_turn));
  Level(Implementation(Ludo_turn_i))==(1);
  Upper_Level(Implementation(Ludo_turn_i))==(Machine(Ludo_turn))
END
&
THEORY LoadedStructureX IS
  Implementation(Ludo_turn_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Ludo_turn_i))==(Ludo_ctx)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Ludo_turn_i))==(?);
  Inherited_List_Includes(Implementation(Ludo_turn_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Ludo_turn_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Ludo_turn_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Ludo_turn_i))==(?);
  Context_List_Variables(Implementation(Ludo_turn_i))==(?);
  Abstract_List_Variables(Implementation(Ludo_turn_i))==(finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted);
  Local_List_Variables(Implementation(Ludo_turn_i))==(?);
  List_Variables(Implementation(Ludo_turn_i))==(?);
  External_List_Variables(Implementation(Ludo_turn_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Ludo_turn_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Ludo_turn_i))==(?);
  External_List_VisibleVariables(Implementation(Ludo_turn_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Ludo_turn_i))==(?);
  List_VisibleVariables(Implementation(Ludo_turn_i))==(finishCount,finishList,sixSequenceCount,diceValue,hasRoll,color,colorEnabled,gameStarted);
  Internal_List_VisibleVariables(Implementation(Ludo_turn_i))==(finishCount,finishList,sixSequenceCount,diceValue,hasRoll,color,colorEnabled,gameStarted)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Ludo_turn_i))==(btrue);
  Expanded_List_Invariant(Implementation(Ludo_turn_i))==(btrue);
  Abstract_List_Invariant(Implementation(Ludo_turn_i))==(gameStarted: BOOL & enabledColors: POW(COLORS) & enabledColors: FIN(enabledColors) & color: COLORS & hasRoll: BOOL & diceValue: 0..6 & sixSequenceCount: 0..2 & finishOrder: 0..numColors-1 >+> COLORS & finishOrder: FIN(finishOrder) & dom(finishOrder) = 0..card(finishOrder)-1 & (gameStarted = FALSE or (card(enabledColors)>=2 & color: enabledColors & ran(finishOrder) <: enabledColors)));
  Context_List_Invariant(Implementation(Ludo_turn_i))==(btrue);
  List_Invariant(Implementation(Ludo_turn_i))==(finishList: 0..3 --> COLORS & finishCount: 0..4 & 0..finishCount-1<|finishList = finishOrder & finishCount = card(finishOrder) & colorEnabled: COLORS --> BOOL & dom(colorEnabled|>{TRUE}) = enabledColors)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(Ludo_turn_i))==(btrue);
  Abstract_List_Assertions(Implementation(Ludo_turn_i))==(btrue);
  Context_List_Assertions(Implementation(Ludo_turn_i))==(btrue);
  List_Assertions(Implementation(Ludo_turn_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Ludo_turn_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Ludo_turn_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Ludo_turn_i))==(gameStarted:=FALSE;colorEnabled:=COLORS*{FALSE};(0: dom(colorsOrder) | color:=colorsOrder(0));hasRoll:=FALSE;(0: INT | diceValue:=0);(0: INT | sixSequenceCount:=0);finishList:=colorsOrder;(0: INT | finishCount:=0));
  Context_List_Initialisation(Implementation(Ludo_turn_i))==(skip);
  List_Initialisation(Implementation(Ludo_turn_i))==(gameStarted:=FALSE;colorEnabled:=COLORS*{FALSE};color:=colorsOrder(0);hasRoll:=FALSE;diceValue:=0;sixSequenceCount:=0;finishList:=colorsOrder;finishCount:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Ludo_turn_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(Ludo_turn_i),Machine(Ludo_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Ludo_turn_i))==(btrue);
  List_Context_Constraints(Implementation(Ludo_turn_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Ludo_turn_i))==(isColorFinished,turnIndex,pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame,getDiceValue,getColor,numWinners,placement);
  List_Operations(Implementation(Ludo_turn_i))==(isColorFinished,turnIndex,pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame,getDiceValue,getColor,numWinners,placement)
END
&
THEORY ListInputX IS
  List_Input(Implementation(Ludo_turn_i),isColorFinished)==(cc);
  List_Input(Implementation(Ludo_turn_i),turnIndex)==(?);
  List_Input(Implementation(Ludo_turn_i),pickColor)==(cc);
  List_Input(Implementation(Ludo_turn_i),unpickColor)==(cc);
  List_Input(Implementation(Ludo_turn_i),initGame)==(?);
  List_Input(Implementation(Ludo_turn_i),computeAction)==(extraTurn,finished);
  List_Input(Implementation(Ludo_turn_i),nextTurn)==(?);
  List_Input(Implementation(Ludo_turn_i),rollDice)==(?);
  List_Input(Implementation(Ludo_turn_i),endGame)==(?);
  List_Input(Implementation(Ludo_turn_i),getDiceValue)==(?);
  List_Input(Implementation(Ludo_turn_i),getColor)==(?);
  List_Input(Implementation(Ludo_turn_i),numWinners)==(?);
  List_Input(Implementation(Ludo_turn_i),placement)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Ludo_turn_i),isColorFinished)==(bb);
  List_Output(Implementation(Ludo_turn_i),turnIndex)==(nn);
  List_Output(Implementation(Ludo_turn_i),pickColor)==(?);
  List_Output(Implementation(Ludo_turn_i),unpickColor)==(?);
  List_Output(Implementation(Ludo_turn_i),initGame)==(?);
  List_Output(Implementation(Ludo_turn_i),computeAction)==(?);
  List_Output(Implementation(Ludo_turn_i),nextTurn)==(?);
  List_Output(Implementation(Ludo_turn_i),rollDice)==(value);
  List_Output(Implementation(Ludo_turn_i),endGame)==(?);
  List_Output(Implementation(Ludo_turn_i),getDiceValue)==(value);
  List_Output(Implementation(Ludo_turn_i),getColor)==(cc);
  List_Output(Implementation(Ludo_turn_i),numWinners)==(nn);
  List_Output(Implementation(Ludo_turn_i),placement)==(cc)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Ludo_turn_i),isColorFinished)==(bb <-- isColorFinished(cc));
  List_Header(Implementation(Ludo_turn_i),turnIndex)==(nn <-- turnIndex);
  List_Header(Implementation(Ludo_turn_i),pickColor)==(pickColor(cc));
  List_Header(Implementation(Ludo_turn_i),unpickColor)==(unpickColor(cc));
  List_Header(Implementation(Ludo_turn_i),initGame)==(initGame);
  List_Header(Implementation(Ludo_turn_i),computeAction)==(computeAction(extraTurn,finished));
  List_Header(Implementation(Ludo_turn_i),nextTurn)==(nextTurn);
  List_Header(Implementation(Ludo_turn_i),rollDice)==(value <-- rollDice);
  List_Header(Implementation(Ludo_turn_i),endGame)==(endGame);
  List_Header(Implementation(Ludo_turn_i),getDiceValue)==(value <-- getDiceValue);
  List_Header(Implementation(Ludo_turn_i),getColor)==(cc <-- getColor);
  List_Header(Implementation(Ludo_turn_i),numWinners)==(nn <-- numWinners);
  List_Header(Implementation(Ludo_turn_i),placement)==(cc <-- placement(nn))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(Ludo_turn_i),isColorFinished)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),isColorFinished)==(cc: COLORS);
  Own_Precondition(Implementation(Ludo_turn_i),turnIndex)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),turnIndex)==(btrue);
  Own_Precondition(Implementation(Ludo_turn_i),pickColor)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE);
  Own_Precondition(Implementation(Ludo_turn_i),unpickColor)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE);
  Own_Precondition(Implementation(Ludo_turn_i),initGame)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),initGame)==(gameStarted = FALSE & card(enabledColors)>=2);
  Own_Precondition(Implementation(Ludo_turn_i),computeAction)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),computeAction)==(gameStarted = TRUE & diceValue/=0 & extraTurn: BOOL & finished: BOOL & (extraTurn = TRUE => finished = FALSE));
  Own_Precondition(Implementation(Ludo_turn_i),nextTurn)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),nextTurn)==(gameStarted = TRUE & hasRoll = FALSE & card(finishOrder)<card(enabledColors));
  Own_Precondition(Implementation(Ludo_turn_i),rollDice)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),rollDice)==(gameStarted = TRUE & hasRoll = TRUE);
  Own_Precondition(Implementation(Ludo_turn_i),endGame)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),endGame)==(gameStarted = TRUE & card(finishOrder)>=1);
  Own_Precondition(Implementation(Ludo_turn_i),getDiceValue)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),getDiceValue)==(btrue);
  Own_Precondition(Implementation(Ludo_turn_i),getColor)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),getColor)==(btrue);
  Own_Precondition(Implementation(Ludo_turn_i),numWinners)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),numWinners)==(btrue);
  Own_Precondition(Implementation(Ludo_turn_i),placement)==(btrue);
  List_Precondition(Implementation(Ludo_turn_i),placement)==(nn: NAT & nn: dom(finishOrder))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Ludo_turn_i),placement)==(nn: NAT & nn: dom(finishOrder) & nn: dom(finishList) | cc:=finishList(nn));
  Expanded_List_Substitution(Implementation(Ludo_turn_i),numWinners)==(btrue & finishCount: INT | nn:=finishCount);
  Expanded_List_Substitution(Implementation(Ludo_turn_i),getColor)==(btrue | cc:=color);
  Expanded_List_Substitution(Implementation(Ludo_turn_i),getDiceValue)==(btrue & diceValue: INT | value:=diceValue);
  Expanded_List_Substitution(Implementation(Ludo_turn_i),endGame)==(gameStarted = TRUE & card(finishOrder)>=1 | gameStarted:=FALSE);
  Expanded_List_Substitution(Implementation(Ludo_turn_i),rollDice)==(gameStarted = TRUE & hasRoll = TRUE | @dd.((5: INT | dd:=5);(dd: INT | value:=dd);(dd = 6 ==> (sixSequenceCount<2 ==> ((sixSequenceCount+1: INT & sixSequenceCount: INT & 1: INT | sixSequenceCount:=sixSequenceCount+1);(dd: INT | diceValue:=dd)) [] not(sixSequenceCount<2) ==> ((0: INT | sixSequenceCount:=0);hasRoll:=FALSE;(0: INT | diceValue:=0))) [] not(dd = 6) ==> (hasRoll:=FALSE;(dd: INT | diceValue:=dd)))));
  Expanded_List_Substitution(Implementation(Ludo_turn_i),nextTurn)==(gameStarted = TRUE & hasRoll = FALSE & card(finishOrder)<card(enabledColors) | @(numJumps,color,isFinished,currentIndex,enabled).((0: INT | numJumps:=0);(btrue | currentIndex:=colorsOrder~(color));enabled:=FALSE;isFinished:=FALSE;WHILE numJumps<numColors & (enabled = FALSE or isFinished = TRUE) DO (numJumps+1: INT & numJumps: INT & 1: INT | numJumps:=numJumps+1);(currentIndex+numJumps: INT & currentIndex: INT & numJumps: INT & (currentIndex+numJumps) mod numColors: NAT & currentIndex+numJumps: NAT & numColors: NAT1 & (currentIndex+numJumps) mod numColors: dom(colorsOrder) | color:=colorsOrder((currentIndex+numJumps) mod numColors));(color: COLORS | isFinished:=bool(color: ran(finishList)));(color: dom(colorEnabled) | enabled:=colorEnabled(color)) INVARIANT numJumps<=numColors & enabled: BOOL & isFinished: BOOL & {nn | nn: 1..numJumps-1 & colorsOrder((currentIndex+nn) mod numColors): enabledColors-ran(finishOrder)} = {} VARIANT numColors-numJumps END));
  Expanded_List_Substitution(Implementation(Ludo_turn_i),computeAction)==(gameStarted = TRUE & diceValue/=0 & extraTurn: BOOL & finished: BOOL & (extraTurn = TRUE => finished = FALSE) | (0: INT | diceValue:=0);(finished = TRUE ==> ((finishCount: dom(finishList) | finishList:=finishList<+{finishCount|->color});(finishCount+1: INT & finishCount: INT & 1: INT | finishCount:=finishCount+1);hasRoll:=FALSE) [] not(finished = TRUE) ==> (extraTurn = TRUE ==> hasRoll:=TRUE [] not(extraTurn = TRUE) ==> skip)));
  Expanded_List_Substitution(Implementation(Ludo_turn_i),initGame)==(gameStarted = FALSE & card(enabledColors)>=2 | gameStarted:=TRUE;@(ii,isEnabled).((0: INT | ii:=0);(ii: dom(colorsOrder) & colorsOrder(ii): dom(colorEnabled) | isEnabled:=colorEnabled(colorsOrder(ii)));WHILE isEnabled = FALSE DO (ii+1: INT & ii: INT & 1: INT | ii:=ii+1);(ii: dom(colorsOrder) & colorsOrder(ii): dom(colorEnabled) | isEnabled:=colorEnabled(colorsOrder(ii))) INVARIANT ii: 0..numColors-1 & isEnabled = colorEnabled(colorsOrder(ii)) VARIANT numColors-ii END;(ii: dom(colorsOrder) | color:=colorsOrder(ii)));hasRoll:=TRUE;(0: INT | diceValue:=0);(0: INT | sixSequenceCount:=0);finishList:=colorsOrder;(0: INT | finishCount:=0));
  Expanded_List_Substitution(Implementation(Ludo_turn_i),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE & cc: dom(colorEnabled) | colorEnabled:=colorEnabled<+{cc|->FALSE});
  Expanded_List_Substitution(Implementation(Ludo_turn_i),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE & cc: dom(colorEnabled) | colorEnabled:=colorEnabled<+{cc|->TRUE});
  Expanded_List_Substitution(Implementation(Ludo_turn_i),turnIndex)==(btrue | @(ii,isColorTurn,color).((0: INT | ii:=0);isColorTurn:=FALSE;WHILE ii<numColors & isColorTurn = FALSE DO (ii: dom(finishList) | color:=finishList(ii));isColorTurn:=bool(color = color);(isColorTurn = TRUE ==> (ii: INT | nn:=ii) [] not(isColorTurn = TRUE) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..numColors & isColorTurn: BOOL & isColorTurn = TRUE <=> (nn = colorsOrder~(color)) VARIANT numColors-ii END;(ii: dom(colorsOrder) | color:=colorsOrder(ii))));
  Expanded_List_Substitution(Implementation(Ludo_turn_i),isColorFinished)==(cc: COLORS | @(ii,color).((0: INT | ii:=0);bb:=FALSE;WHILE ii<finishCount & bb = FALSE DO (ii: dom(finishList) | color:=finishList(ii));bb:=bool(color = cc);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..finishCount & bb = TRUE <=> (cc: finishList[0..ii-1]) VARIANT numColors-ii END;(ii: dom(colorsOrder) | color:=colorsOrder(ii))));
  List_Substitution(Implementation(Ludo_turn_i),isColorFinished)==(VAR ii,color IN ii:=0;bb:=FALSE;WHILE ii<finishCount & bb = FALSE DO color:=finishList(ii);bb:=bool(color = cc);ii:=ii+1 INVARIANT ii: 0..finishCount & bb = TRUE <=> (cc: finishList[0..ii-1]) VARIANT numColors-ii END;color:=colorsOrder(ii) END);
  List_Substitution(Implementation(Ludo_turn_i),turnIndex)==(VAR ii,isColorTurn,color IN ii:=0;isColorTurn:=FALSE;WHILE ii<numColors & isColorTurn = FALSE DO color:=finishList(ii);isColorTurn:=bool(color = color);IF isColorTurn = TRUE THEN nn:=ii END;ii:=ii+1 INVARIANT ii: 0..numColors & isColorTurn: BOOL & isColorTurn = TRUE <=> (nn = colorsOrder~(color)) VARIANT numColors-ii END;color:=colorsOrder(ii) END);
  List_Substitution(Implementation(Ludo_turn_i),pickColor)==(colorEnabled(cc):=TRUE);
  List_Substitution(Implementation(Ludo_turn_i),unpickColor)==(colorEnabled(cc):=FALSE);
  List_Substitution(Implementation(Ludo_turn_i),initGame)==(gameStarted:=TRUE;VAR ii,isEnabled IN ii:=0;isEnabled:=colorEnabled(colorsOrder(ii));WHILE isEnabled = FALSE DO ii:=ii+1;isEnabled:=colorEnabled(colorsOrder(ii)) INVARIANT ii: 0..numColors-1 & isEnabled = colorEnabled(colorsOrder(ii)) VARIANT numColors-ii END;color:=colorsOrder(ii) END;hasRoll:=TRUE;diceValue:=0;sixSequenceCount:=0;finishList:=colorsOrder;finishCount:=0);
  List_Substitution(Implementation(Ludo_turn_i),computeAction)==(diceValue:=0;IF finished = TRUE THEN finishList(finishCount):=color;finishCount:=finishCount+1;hasRoll:=FALSE ELSIF extraTurn = TRUE THEN hasRoll:=TRUE END);
  List_Substitution(Implementation(Ludo_turn_i),nextTurn)==(VAR numJumps,color,isFinished,currentIndex,enabled IN numJumps:=0;currentIndex <-- turnIndex;enabled:=FALSE;isFinished:=FALSE;WHILE numJumps<numColors & (enabled = FALSE or isFinished = TRUE) DO numJumps:=numJumps+1;color:=colorsOrder((currentIndex+numJumps) mod numColors);isFinished <-- isColorFinished(color);enabled:=colorEnabled(color) INVARIANT numJumps<=numColors & enabled: BOOL & isFinished: BOOL & {nn | nn: 1..numJumps-1 & colorsOrder((currentIndex+nn) mod numColors): enabledColors-ran(finishOrder)} = {} VARIANT numColors-numJumps END END);
  List_Substitution(Implementation(Ludo_turn_i),rollDice)==(VAR dd IN dd:=5;value:=dd;IF dd = 6 THEN IF sixSequenceCount<2 THEN sixSequenceCount:=sixSequenceCount+1;diceValue:=dd ELSE sixSequenceCount:=0;hasRoll:=FALSE;diceValue:=0 END ELSE hasRoll:=FALSE;diceValue:=dd END END);
  List_Substitution(Implementation(Ludo_turn_i),endGame)==(gameStarted:=FALSE);
  List_Substitution(Implementation(Ludo_turn_i),getDiceValue)==(value:=diceValue);
  List_Substitution(Implementation(Ludo_turn_i),getColor)==(cc:=color);
  List_Substitution(Implementation(Ludo_turn_i),numWinners)==(nn:=finishCount);
  List_Substitution(Implementation(Ludo_turn_i),placement)==(cc:=finishList(nn))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Ludo_turn_i))==(?);
  Inherited_List_Constants(Implementation(Ludo_turn_i))==(?);
  List_Constants(Implementation(Ludo_turn_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(Ludo_turn_i))==(?);
  Context_List_Defered(Implementation(Ludo_turn_i))==(COLORS,PIECES);
  Context_List_Sets(Implementation(Ludo_turn_i))==(COLORS,PIECES);
  List_Own_Enumerated(Implementation(Ludo_turn_i))==(?);
  List_Valuable_Sets(Implementation(Ludo_turn_i))==(?);
  Inherited_List_Enumerated(Implementation(Ludo_turn_i))==(?);
  Inherited_List_Defered(Implementation(Ludo_turn_i))==(?);
  Inherited_List_Sets(Implementation(Ludo_turn_i))==(?);
  List_Enumerated(Implementation(Ludo_turn_i))==(?);
  List_Defered(Implementation(Ludo_turn_i))==(?);
  List_Sets(Implementation(Ludo_turn_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Ludo_turn_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Ludo_turn_i))==(?);
  List_HiddenConstants(Implementation(Ludo_turn_i))==(?);
  External_List_HiddenConstants(Implementation(Ludo_turn_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Ludo_turn_i))==(btrue);
  Context_List_Properties(Implementation(Ludo_turn_i))==(numPiecesByColor = 4 & numExternal = 52 & numInternal = 6 & numColors = 4 & card(COLORS) = numColors & numPieces: NAT & numPieces = numPiecesByColor*numColors & diceOptions = 1..6 & stars <: 0..numExternal-1 & stars = {8,21,34,47} & startPoint: COLORS >-> 0..51 & card(PIECES) = numPiecesByColor*numColors & colorsOrder: 0..3 >->> COLORS & colorOf: PIECES -->> COLORS & !cc.(cc: COLORS => colorOf~[{cc}]: FIN(PIECES) & card(colorOf~[{cc}]) = numPiecesByColor) & piecesOrder: 0..15 >->> PIECES & COLORS: FIN(INTEGER) & not(COLORS = {}) & PIECES: FIN(INTEGER) & not(PIECES = {}));
  Inherited_List_Properties(Implementation(Ludo_turn_i))==(btrue);
  List_Properties(Implementation(Ludo_turn_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(Ludo_turn_i))==(aa: aa);
  List_Values(Implementation(Ludo_turn_i))==(?)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Implementation(Ludo_turn_i),Machine(Ludo_ctx))==(?);
  Seen_Context_List_Enumerated(Implementation(Ludo_turn_i))==(?);
  Seen_Context_List_Invariant(Implementation(Ludo_turn_i))==(btrue);
  Seen_Context_List_Assertions(Implementation(Ludo_turn_i))==(btrue);
  Seen_Context_List_Properties(Implementation(Ludo_turn_i))==(btrue);
  Seen_List_Constraints(Implementation(Ludo_turn_i))==(btrue);
  Seen_List_Operations(Implementation(Ludo_turn_i),Machine(Ludo_ctx))==(?);
  Seen_Expanded_List_Invariant(Implementation(Ludo_turn_i),Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(Ludo_turn_i))==(Type(gameStarted) == Mvv(btype(BOOL,?,?));Type(colorEnabled) == Mvv(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(BOOL,0,1)));Type(color) == Mvv(atype(COLORS,?,?));Type(hasRoll) == Mvv(btype(BOOL,?,?));Type(diceValue) == Mvv(btype(INTEGER,?,?));Type(sixSequenceCount) == Mvv(btype(INTEGER,?,?));Type(finishList) == Mvv(SetOf(btype(INTEGER,0,3)*atype(COLORS,"[COLORS","]COLORS")));Type(finishCount) == Mvv(btype(INTEGER,?,?)));
  Operations(Implementation(Ludo_turn_i))==(Type(placement) == Cst(atype(COLORS,?,?),btype(INTEGER,?,?));Type(numWinners) == Cst(btype(INTEGER,?,?),No_type);Type(getColor) == Cst(atype(COLORS,?,?),No_type);Type(getDiceValue) == Cst(btype(INTEGER,?,?),No_type);Type(endGame) == Cst(No_type,No_type);Type(rollDice) == Cst(btype(INTEGER,?,?),No_type);Type(nextTurn) == Cst(No_type,No_type);Type(computeAction) == Cst(No_type,btype(BOOL,?,?)*btype(BOOL,?,?));Type(initGame) == Cst(No_type,No_type);Type(unpickColor) == Cst(No_type,atype(COLORS,?,?));Type(pickColor) == Cst(No_type,atype(COLORS,?,?)))
END
&
THEORY ListVisibleStaticX IS
  List_Constants(Implementation(Ludo_turn_i),Machine(Ludo_ctx))==(colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Constants_Env(Implementation(Ludo_turn_i),Machine(Ludo_ctx))==(Type(colorOf) == Cst(SetOf(atype(PIECES,"[PIECES","]PIECES")*atype(COLORS,"[COLORS","]COLORS")));Type(startPoint) == Cst(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(INTEGER,0,51)));Type(colorsOrder) == Cst(SetOf(btype(INTEGER,0,3)*atype(COLORS,"[COLORS","]COLORS")));Type(piecesOrder) == Cst(SetOf(btype(INTEGER,0,15)*atype(PIECES,"[PIECES","]PIECES")));Type(numColors) == Cst(btype(INTEGER,?,?));Type(numPiecesByColor) == Cst(btype(INTEGER,?,?));Type(numPieces) == Cst(btype(INTEGER,?,?));Type(numExternal) == Cst(btype(INTEGER,?,?));Type(numInternal) == Cst(btype(INTEGER,?,?)));
  List_Defered_Sets(Implementation(Ludo_turn_i),Machine(Ludo_ctx))==(COLORS,PIECES)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Ludo_turn_i)) == (? | ? | ? | ? | isColorFinished,turnIndex,pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame,getDiceValue,getColor,numWinners,placement,refinement_of_turnIndex,refinement_of_isColorFinished | ? | seen(Machine(Ludo_ctx)) | ? | Ludo_turn_i);
  List_Of_HiddenCst_Ids(Implementation(Ludo_turn_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Ludo_turn_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Ludo_turn_i)) == (finishCount,finishList,sixSequenceCount,diceValue,hasRoll,color,colorEnabled,gameStarted | ?);
  List_Of_Ids_SeenBNU(Implementation(Ludo_turn_i)) == (?: ?);
  List_Of_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | ? | ? | Ludo_ctx);
  List_Of_HiddenCst_Ids(Machine(Ludo_ctx)) == (stars,diceOptions | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Of_VisibleVar_Ids(Machine(Ludo_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_ctx)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(Ludo_turn_i)) == (Type(finishCount) == Mvv(btype(INTEGER,?,?));Type(finishList) == Mvv(SetOf(btype(INTEGER,0,3)*atype(COLORS,"[COLORS","]COLORS")));Type(sixSequenceCount) == Mvv(btype(INTEGER,?,?));Type(diceValue) == Mvv(btype(INTEGER,?,?));Type(hasRoll) == Mvv(btype(BOOL,?,?));Type(color) == Mvv(atype(COLORS,?,?));Type(colorEnabled) == Mvv(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(BOOL,0,1)));Type(gameStarted) == Mvv(btype(BOOL,?,?)))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(Ludo_turn_i),isColorFinished, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(color) == Lvl(atype(COLORS,?,?)));
  Variables_Loc(Implementation(Ludo_turn_i),turnIndex, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(isColorTurn) == Lvl(btype(BOOL,?,?));Type(color) == Lvl(atype(COLORS,?,?)));
  Variables_Loc(Implementation(Ludo_turn_i),initGame, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(isEnabled) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Ludo_turn_i),nextTurn, 1) == (Type(numJumps) == Lvl(btype(INTEGER,?,?));Type(color) == Lvl(atype(COLORS,?,?));Type(isFinished) == Lvl(btype(BOOL,?,?));Type(currentIndex) == Lvl(btype(INTEGER,?,?));Type(enabled) == Lvl(btype(BOOL,?,?)));
  Variables_Loc(Implementation(Ludo_turn_i),rollDice, 1) == (Type(dd) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(Ludo_turn_i))==(isColorFinished,turnIndex)
END
&
THEORY ListLocalInputX IS
  List_Local_Input(Implementation(Ludo_turn_i),isColorFinished)==(cc);
  List_Local_Input(Implementation(Ludo_turn_i),turnIndex)==(?)
END
&
THEORY ListLocalOutputX IS
  List_Local_Output(Implementation(Ludo_turn_i),isColorFinished)==(bb);
  List_Local_Output(Implementation(Ludo_turn_i),turnIndex)==(nn)
END
&
THEORY ListLocalHeaderX IS
  List_Local_Header(Implementation(Ludo_turn_i),isColorFinished)==(bb <-- isColorFinished(cc));
  List_Local_Header(Implementation(Ludo_turn_i),turnIndex)==(nn <-- turnIndex)
END
&
THEORY ListLocalPreconditionX IS
  List_Local_Precondition(Implementation(Ludo_turn_i),isColorFinished)==(cc: COLORS);
  List_Local_Precondition(Implementation(Ludo_turn_i),turnIndex)==(btrue)
END
&
THEORY ListLocalSubstitutionX IS
  Expanded_List_Local_Substitution(Implementation(Ludo_turn_i),turnIndex)==(btrue | nn:=colorsOrder~(color));
  Expanded_List_Local_Substitution(Implementation(Ludo_turn_i),isColorFinished)==(cc: COLORS | bb:=bool(cc: ran(finishList)));
  List_Local_Substitution(Implementation(Ludo_turn_i),isColorFinished)==(bb:=bool(cc: ran(finishList)));
  List_Local_Substitution(Implementation(Ludo_turn_i),turnIndex)==(nn:=colorsOrder~(color))
END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(Ludo_turn_i))==(gameStarted: BOOL & colorEnabled: POW(COLORS*BOOL) & color: COLORS & hasRoll: BOOL & diceValue: INTEGER & sixSequenceCount: INTEGER & finishList: POW(INTEGER*COLORS) & finishCount: INTEGER)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX IS
  LocalOp_Expanded_Invariant(Implementation(Ludo_turn_i),turnIndex)==(btrue);
  LocalOp_Expanded_Invariant(Implementation(Ludo_turn_i),isColorFinished)==(btrue)
END
)
