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
  List_VisibleVariables(Implementation(Ludo_turn_i))==(finishOrder,sixSequenceCount,diceValue,hasRoll,color,colorEnabled,gameStarted);
  Internal_List_VisibleVariables(Implementation(Ludo_turn_i))==(finishOrder,sixSequenceCount,diceValue,hasRoll,color,colorEnabled,gameStarted)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Ludo_turn_i))==(btrue);
  Expanded_List_Invariant(Implementation(Ludo_turn_i))==(btrue);
  Abstract_List_Invariant(Implementation(Ludo_turn_i))==(gameStarted: BOOL & enabledColors: POW(COLORS) & enabledColors: FIN(enabledColors) & color: COLORS & hasRoll: BOOL & diceValue: 0..6 & sixSequenceCount: 0..2 & finishOrder: 0..numColors-1 >+> COLORS & finishOrder: FIN(finishOrder) & (gameStarted = FALSE or (card(enabledColors)>=2 & color: enabledColors & ran(finishOrder) <: enabledColors)));
  Context_List_Invariant(Implementation(Ludo_turn_i))==(btrue);
  List_Invariant(Implementation(Ludo_turn_i))==(colorEnabled: COLORS --> BOOL & dom(colorEnabled|>{TRUE}) = enabledColors)
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
  Expanded_List_Initialisation(Implementation(Ludo_turn_i))==(gameStarted:=FALSE;colorEnabled:=COLORS*{FALSE};(0: dom(colorsOrder) | color:=colorsOrder(0));hasRoll:=FALSE;(0: INT | diceValue:=0);(0: INT | sixSequenceCount:=0);finishOrder:={});
  Context_List_Initialisation(Implementation(Ludo_turn_i))==(skip);
  List_Initialisation(Implementation(Ludo_turn_i))==(gameStarted:=FALSE;colorEnabled:=COLORS*{FALSE};color:=colorsOrder(0);hasRoll:=FALSE;diceValue:=0;sixSequenceCount:=0;finishOrder:={})
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
  Internal_List_Operations(Implementation(Ludo_turn_i))==(pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame);
  List_Operations(Implementation(Ludo_turn_i))==(pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame)
END
&
THEORY ListInputX IS
  List_Input(Implementation(Ludo_turn_i),pickColor)==(cc);
  List_Input(Implementation(Ludo_turn_i),unpickColor)==(cc);
  List_Input(Implementation(Ludo_turn_i),initGame)==(?);
  List_Input(Implementation(Ludo_turn_i),computeAction)==(extraTurn,finished);
  List_Input(Implementation(Ludo_turn_i),nextTurn)==(?);
  List_Input(Implementation(Ludo_turn_i),rollDice)==(?);
  List_Input(Implementation(Ludo_turn_i),endGame)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Ludo_turn_i),pickColor)==(?);
  List_Output(Implementation(Ludo_turn_i),unpickColor)==(?);
  List_Output(Implementation(Ludo_turn_i),initGame)==(?);
  List_Output(Implementation(Ludo_turn_i),computeAction)==(?);
  List_Output(Implementation(Ludo_turn_i),nextTurn)==(?);
  List_Output(Implementation(Ludo_turn_i),rollDice)==(value);
  List_Output(Implementation(Ludo_turn_i),endGame)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Ludo_turn_i),pickColor)==(pickColor(cc));
  List_Header(Implementation(Ludo_turn_i),unpickColor)==(unpickColor(cc));
  List_Header(Implementation(Ludo_turn_i),initGame)==(initGame);
  List_Header(Implementation(Ludo_turn_i),computeAction)==(computeAction(extraTurn,finished));
  List_Header(Implementation(Ludo_turn_i),nextTurn)==(nextTurn);
  List_Header(Implementation(Ludo_turn_i),rollDice)==(value <-- rollDice);
  List_Header(Implementation(Ludo_turn_i),endGame)==(endGame)
END
&
THEORY ListPreconditionX IS
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
  List_Precondition(Implementation(Ludo_turn_i),endGame)==(gameStarted = TRUE & card(finishOrder)>=1)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Ludo_turn_i),endGame)==(gameStarted = TRUE & card(finishOrder)>=1 | gameStarted:=FALSE);
  Expanded_List_Substitution(Implementation(Ludo_turn_i),rollDice)==(gameStarted = TRUE & hasRoll = TRUE | @dd.((5: INT | dd:=5);(dd: INT | value:=dd);(dd = 6 ==> (sixSequenceCount<2 ==> ((sixSequenceCount+1: INT & sixSequenceCount: INT & 1: INT | sixSequenceCount:=sixSequenceCount+1);(dd: INT | diceValue:=dd)) [] not(sixSequenceCount<2) ==> ((0: INT | sixSequenceCount:=0);hasRoll:=FALSE;(0: INT | diceValue:=0))) [] not(dd = 6) ==> (hasRoll:=FALSE;(dd: INT | diceValue:=dd)))));
  Expanded_List_Substitution(Implementation(Ludo_turn_i),nextTurn)==(gameStarted = TRUE & hasRoll = FALSE & card(finishOrder)<card(enabledColors) | skip);
  Expanded_List_Substitution(Implementation(Ludo_turn_i),computeAction)==(gameStarted = TRUE & diceValue/=0 & extraTurn: BOOL & finished: BOOL & (extraTurn = TRUE => finished = FALSE) | (0: INT | diceValue:=0);(finished = TRUE ==> ((card(finishOrder): dom(finishOrder) | finishOrder:=finishOrder<+{card(finishOrder)|->color});hasRoll:=FALSE) [] not(finished = TRUE) ==> (extraTurn = TRUE ==> hasRoll:=TRUE [] not(extraTurn = TRUE) ==> skip)));
  Expanded_List_Substitution(Implementation(Ludo_turn_i),initGame)==(gameStarted = FALSE & card(enabledColors)>=2 | gameStarted:=TRUE;@ii.((0: INT | ii:=0);WHILE colorEnabled(colorsOrder(ii)) = FALSE DO ii+1: INT & ii: INT & 1: INT | ii:=ii+1 INVARIANT ii: 0..numColors-1 VARIANT numColors-ii END;(ii: dom(colorsOrder) | color:=colorsOrder(ii)));hasRoll:=TRUE;(0: INT | diceValue:=0);(0: INT | sixSequenceCount:=0);finishOrder:={});
  Expanded_List_Substitution(Implementation(Ludo_turn_i),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE & cc: dom(colorEnabled) | colorEnabled:=colorEnabled<+{cc|->FALSE});
  Expanded_List_Substitution(Implementation(Ludo_turn_i),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE & cc: dom(colorEnabled) | colorEnabled:=colorEnabled<+{cc|->TRUE});
  List_Substitution(Implementation(Ludo_turn_i),pickColor)==(colorEnabled(cc):=TRUE);
  List_Substitution(Implementation(Ludo_turn_i),unpickColor)==(colorEnabled(cc):=FALSE);
  List_Substitution(Implementation(Ludo_turn_i),initGame)==(gameStarted:=TRUE;VAR ii IN ii:=0;WHILE colorEnabled(colorsOrder(ii)) = FALSE DO ii:=ii+1 INVARIANT ii: 0..numColors-1 VARIANT numColors-ii END;color:=colorsOrder(ii) END;hasRoll:=TRUE;diceValue:=0;sixSequenceCount:=0;finishOrder:={});
  List_Substitution(Implementation(Ludo_turn_i),computeAction)==(diceValue:=0;IF finished = TRUE THEN finishOrder(card(finishOrder)):=color;hasRoll:=FALSE ELSIF extraTurn = TRUE THEN hasRoll:=TRUE END);
  List_Substitution(Implementation(Ludo_turn_i),nextTurn)==(skip);
  List_Substitution(Implementation(Ludo_turn_i),rollDice)==(VAR dd IN dd:=5;value:=dd;IF dd = 6 THEN IF sixSequenceCount<2 THEN sixSequenceCount:=sixSequenceCount+1;diceValue:=dd ELSE sixSequenceCount:=0;hasRoll:=FALSE;diceValue:=0 END ELSE hasRoll:=FALSE;diceValue:=dd END END);
  List_Substitution(Implementation(Ludo_turn_i),endGame)==(gameStarted:=FALSE)
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
  VisibleVariables(Implementation(Ludo_turn_i))==(Type(gameStarted) == Mvv(btype(BOOL,?,?));Type(colorEnabled) == Mvv(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(BOOL,0,1)));Type(color) == Mvv(atype(COLORS,?,?));Type(hasRoll) == Mvv(btype(BOOL,?,?));Type(diceValue) == Mvv(btype(INTEGER,?,?));Type(sixSequenceCount) == Mvv(btype(INTEGER,?,?));Type(finishOrder) == Mvv(SetOf(btype(INTEGER,?,?)*atype(COLORS,?,?))));
  Operations(Implementation(Ludo_turn_i))==(Type(endGame) == Cst(No_type,No_type);Type(rollDice) == Cst(btype(INTEGER,?,?),No_type);Type(nextTurn) == Cst(No_type,No_type);Type(computeAction) == Cst(No_type,btype(BOOL,?,?)*btype(BOOL,?,?));Type(initGame) == Cst(No_type,No_type);Type(unpickColor) == Cst(No_type,atype(COLORS,?,?));Type(pickColor) == Cst(No_type,atype(COLORS,?,?)))
END
&
THEORY ListVisibleStaticX IS
  List_Constants(Implementation(Ludo_turn_i),Machine(Ludo_ctx))==(colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Constants_Env(Implementation(Ludo_turn_i),Machine(Ludo_ctx))==(Type(colorOf) == Cst(SetOf(atype(PIECES,"[PIECES","]PIECES")*atype(COLORS,"[COLORS","]COLORS")));Type(startPoint) == Cst(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(INTEGER,0,51)));Type(colorsOrder) == Cst(SetOf(btype(INTEGER,0,3)*atype(COLORS,"[COLORS","]COLORS")));Type(piecesOrder) == Cst(SetOf(btype(INTEGER,0,15)*atype(PIECES,"[PIECES","]PIECES")));Type(numColors) == Cst(btype(INTEGER,?,?));Type(numPiecesByColor) == Cst(btype(INTEGER,?,?));Type(numPieces) == Cst(btype(INTEGER,?,?));Type(numExternal) == Cst(btype(INTEGER,?,?));Type(numInternal) == Cst(btype(INTEGER,?,?)));
  List_Defered_Sets(Implementation(Ludo_turn_i),Machine(Ludo_ctx))==(COLORS,PIECES)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Ludo_turn_i)) == (? | ? | ? | ? | pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame | ? | seen(Machine(Ludo_ctx)) | ? | Ludo_turn_i);
  List_Of_HiddenCst_Ids(Implementation(Ludo_turn_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Ludo_turn_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Ludo_turn_i)) == (finishOrder,sixSequenceCount,diceValue,hasRoll,color,colorEnabled,gameStarted | ?);
  List_Of_Ids_SeenBNU(Implementation(Ludo_turn_i)) == (?: ?);
  List_Of_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | ? | ? | Ludo_ctx);
  List_Of_HiddenCst_Ids(Machine(Ludo_ctx)) == (stars,diceOptions | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Of_VisibleVar_Ids(Machine(Ludo_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_ctx)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(Ludo_turn_i)) == (Type(finishOrder) == Mvv(SetOf(btype(INTEGER,?,?)*atype(COLORS,?,?)));Type(sixSequenceCount) == Mvv(btype(INTEGER,?,?));Type(diceValue) == Mvv(btype(INTEGER,?,?));Type(hasRoll) == Mvv(btype(BOOL,?,?));Type(color) == Mvv(atype(COLORS,?,?));Type(colorEnabled) == Mvv(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(BOOL,0,1)));Type(gameStarted) == Mvv(btype(BOOL,?,?)))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(Ludo_turn_i),initGame, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)));
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
  List_Local_Operations(Implementation(Ludo_turn_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(Ludo_turn_i))==(gameStarted: BOOL & colorEnabled: POW(COLORS*BOOL) & color: COLORS & hasRoll: BOOL & diceValue: INTEGER & sixSequenceCount: INTEGER & finishOrder: POW(INTEGER*COLORS))
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
