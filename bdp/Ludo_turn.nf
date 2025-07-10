Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Ludo_turn))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Ludo_turn))==(Machine(Ludo_turn));
  Level(Machine(Ludo_turn))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Ludo_turn)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Ludo_turn))==(Ludo_ctx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Ludo_turn))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Ludo_turn))==(?);
  List_Includes(Machine(Ludo_turn))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Ludo_turn))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Ludo_turn))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Ludo_turn))==(?);
  Context_List_Variables(Machine(Ludo_turn))==(?);
  Abstract_List_Variables(Machine(Ludo_turn))==(?);
  Local_List_Variables(Machine(Ludo_turn))==(finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted);
  List_Variables(Machine(Ludo_turn))==(finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted);
  External_List_Variables(Machine(Ludo_turn))==(finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Ludo_turn))==(?);
  Abstract_List_VisibleVariables(Machine(Ludo_turn))==(?);
  External_List_VisibleVariables(Machine(Ludo_turn))==(?);
  Expanded_List_VisibleVariables(Machine(Ludo_turn))==(?);
  List_VisibleVariables(Machine(Ludo_turn))==(?);
  Internal_List_VisibleVariables(Machine(Ludo_turn))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Ludo_turn))==(btrue);
  Gluing_List_Invariant(Machine(Ludo_turn))==(btrue);
  Expanded_List_Invariant(Machine(Ludo_turn))==(btrue);
  Abstract_List_Invariant(Machine(Ludo_turn))==(btrue);
  Context_List_Invariant(Machine(Ludo_turn))==(btrue);
  List_Invariant(Machine(Ludo_turn))==(gameStarted: BOOL & enabledColors: POW(COLORS) & enabledColors: FIN(enabledColors) & color: COLORS & hasRoll: BOOL & diceValue: 0..6 & sixSequenceCount: 0..2 & finishOrder: 0..numColors-1 >+> COLORS & finishOrder: FIN(finishOrder) & dom(finishOrder) = 0..card(finishOrder)-1 & (gameStarted = FALSE or (card(enabledColors)>=2 & color: enabledColors & ran(finishOrder) <: enabledColors)))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Ludo_turn))==(btrue);
  Abstract_List_Assertions(Machine(Ludo_turn))==(btrue);
  Context_List_Assertions(Machine(Ludo_turn))==(btrue);
  List_Assertions(Machine(Ludo_turn))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Ludo_turn))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Ludo_turn))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Ludo_turn))==(gameStarted,enabledColors:=FALSE,{} || @(color$0).(color$0: COLORS ==> color:=color$0) || hasRoll:=FALSE || diceValue:=0 || sixSequenceCount:=0 || finishOrder:={});
  Context_List_Initialisation(Machine(Ludo_turn))==(skip);
  List_Initialisation(Machine(Ludo_turn))==(gameStarted:=FALSE || enabledColors:={} || color:: COLORS || hasRoll:=FALSE || diceValue:=0 || sixSequenceCount:=0 || finishOrder:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Ludo_turn))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Ludo_turn),Machine(Ludo_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Ludo_turn))==(btrue);
  List_Constraints(Machine(Ludo_turn))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Ludo_turn))==(pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame,getDiceValue,getColor,numWinners,placement);
  List_Operations(Machine(Ludo_turn))==(pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame,getDiceValue,getColor,numWinners,placement)
END
&
THEORY ListInputX IS
  List_Input(Machine(Ludo_turn),pickColor)==(cc);
  List_Input(Machine(Ludo_turn),unpickColor)==(cc);
  List_Input(Machine(Ludo_turn),initGame)==(?);
  List_Input(Machine(Ludo_turn),computeAction)==(extraTurn,finished);
  List_Input(Machine(Ludo_turn),nextTurn)==(?);
  List_Input(Machine(Ludo_turn),rollDice)==(?);
  List_Input(Machine(Ludo_turn),endGame)==(?);
  List_Input(Machine(Ludo_turn),getDiceValue)==(?);
  List_Input(Machine(Ludo_turn),getColor)==(?);
  List_Input(Machine(Ludo_turn),numWinners)==(?);
  List_Input(Machine(Ludo_turn),placement)==(nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Ludo_turn),pickColor)==(?);
  List_Output(Machine(Ludo_turn),unpickColor)==(?);
  List_Output(Machine(Ludo_turn),initGame)==(?);
  List_Output(Machine(Ludo_turn),computeAction)==(?);
  List_Output(Machine(Ludo_turn),nextTurn)==(?);
  List_Output(Machine(Ludo_turn),rollDice)==(value);
  List_Output(Machine(Ludo_turn),endGame)==(?);
  List_Output(Machine(Ludo_turn),getDiceValue)==(value);
  List_Output(Machine(Ludo_turn),getColor)==(cc);
  List_Output(Machine(Ludo_turn),numWinners)==(nn);
  List_Output(Machine(Ludo_turn),placement)==(cc)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Ludo_turn),pickColor)==(pickColor(cc));
  List_Header(Machine(Ludo_turn),unpickColor)==(unpickColor(cc));
  List_Header(Machine(Ludo_turn),initGame)==(initGame);
  List_Header(Machine(Ludo_turn),computeAction)==(computeAction(extraTurn,finished));
  List_Header(Machine(Ludo_turn),nextTurn)==(nextTurn);
  List_Header(Machine(Ludo_turn),rollDice)==(value <-- rollDice);
  List_Header(Machine(Ludo_turn),endGame)==(endGame);
  List_Header(Machine(Ludo_turn),getDiceValue)==(value <-- getDiceValue);
  List_Header(Machine(Ludo_turn),getColor)==(cc <-- getColor);
  List_Header(Machine(Ludo_turn),numWinners)==(nn <-- numWinners);
  List_Header(Machine(Ludo_turn),placement)==(cc <-- placement(nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Ludo_turn),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE);
  List_Precondition(Machine(Ludo_turn),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE);
  List_Precondition(Machine(Ludo_turn),initGame)==(gameStarted = FALSE & card(enabledColors)>=2);
  List_Precondition(Machine(Ludo_turn),computeAction)==(gameStarted = TRUE & diceValue/=0 & extraTurn: BOOL & finished: BOOL & (extraTurn = TRUE => finished = FALSE));
  List_Precondition(Machine(Ludo_turn),nextTurn)==(gameStarted = TRUE & hasRoll = FALSE & card(finishOrder)<card(enabledColors));
  List_Precondition(Machine(Ludo_turn),rollDice)==(gameStarted = TRUE & hasRoll = TRUE);
  List_Precondition(Machine(Ludo_turn),endGame)==(gameStarted = TRUE & card(finishOrder)>=1);
  List_Precondition(Machine(Ludo_turn),getDiceValue)==(btrue);
  List_Precondition(Machine(Ludo_turn),getColor)==(btrue);
  List_Precondition(Machine(Ludo_turn),numWinners)==(btrue);
  List_Precondition(Machine(Ludo_turn),placement)==(nn: NAT & nn: dom(finishOrder))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Ludo_turn),placement)==(nn: NAT & nn: dom(finishOrder) | cc:=finishOrder(nn));
  Expanded_List_Substitution(Machine(Ludo_turn),numWinners)==(btrue | nn:=card(finishOrder));
  Expanded_List_Substitution(Machine(Ludo_turn),getColor)==(btrue | cc:=color);
  Expanded_List_Substitution(Machine(Ludo_turn),getDiceValue)==(btrue | value:=diceValue);
  Expanded_List_Substitution(Machine(Ludo_turn),endGame)==(gameStarted = TRUE & card(finishOrder)>=1 | gameStarted:=FALSE);
  Expanded_List_Substitution(Machine(Ludo_turn),rollDice)==(gameStarted = TRUE & hasRoll = TRUE | @dd.(dd: 1..6 ==> (value:=dd || (dd = 6 ==> (sixSequenceCount<2 ==> sixSequenceCount,diceValue:=sixSequenceCount+1,dd [] not(sixSequenceCount<2) ==> sixSequenceCount,hasRoll,diceValue:=0,FALSE,0) [] not(dd = 6) ==> hasRoll,diceValue:=FALSE,dd))));
  Expanded_List_Substitution(Machine(Ludo_turn),nextTurn)==(gameStarted = TRUE & hasRoll = FALSE & card(finishOrder)<card(enabledColors) | hasRoll,sixSequenceCount,diceValue:=TRUE,0,0 || @numJumps.(numJumps = min({nn | nn: 1..numColors & colorsOrder((colorsOrder~(color)+nn) mod numColors): enabledColors-ran(finishOrder)}) ==> color:=colorsOrder((colorsOrder~(color)+numJumps) mod numColors)));
  Expanded_List_Substitution(Machine(Ludo_turn),computeAction)==(gameStarted = TRUE & diceValue/=0 & extraTurn: BOOL & finished: BOOL & (extraTurn = TRUE => finished = FALSE) | diceValue:=0 || (finished = TRUE ==> finishOrder,hasRoll:=finishOrder<+{card(finishOrder)|->color},FALSE [] not(finished = TRUE) ==> (extraTurn = TRUE ==> hasRoll:=TRUE [] not(extraTurn = TRUE) ==> skip)));
  Expanded_List_Substitution(Machine(Ludo_turn),initGame)==(gameStarted = FALSE & card(enabledColors)>=2 | gameStarted:=TRUE || @(color$0).(color$0: enabledColors ==> color:=color$0) || hasRoll:=TRUE || diceValue:=0 || sixSequenceCount:=0 || finishOrder:={});
  Expanded_List_Substitution(Machine(Ludo_turn),unpickColor)==(cc: COLORS & cc: enabledColors & gameStarted = FALSE | enabledColors:=enabledColors-{cc});
  Expanded_List_Substitution(Machine(Ludo_turn),pickColor)==(cc: COLORS & cc/:enabledColors & gameStarted = FALSE | enabledColors:=enabledColors\/{cc});
  List_Substitution(Machine(Ludo_turn),pickColor)==(enabledColors:=enabledColors\/{cc});
  List_Substitution(Machine(Ludo_turn),unpickColor)==(enabledColors:=enabledColors-{cc});
  List_Substitution(Machine(Ludo_turn),initGame)==(gameStarted:=TRUE || color:: enabledColors || hasRoll:=TRUE || diceValue:=0 || sixSequenceCount:=0 || finishOrder:={});
  List_Substitution(Machine(Ludo_turn),computeAction)==(diceValue:=0 || IF finished = TRUE THEN finishOrder(card(finishOrder)):=color || hasRoll:=FALSE ELSIF extraTurn = TRUE THEN hasRoll:=TRUE END);
  List_Substitution(Machine(Ludo_turn),nextTurn)==(hasRoll:=TRUE || sixSequenceCount:=0 || diceValue:=0 || LET numJumps BE numJumps = min({nn | nn: 1..numColors & colorsOrder((colorsOrder~(color)+nn) mod numColors): enabledColors-ran(finishOrder)}) IN color:=colorsOrder((colorsOrder~(color)+numJumps) mod numColors) END);
  List_Substitution(Machine(Ludo_turn),rollDice)==(ANY dd WHERE dd: 1..6 THEN value:=dd || IF dd = 6 THEN IF sixSequenceCount<2 THEN sixSequenceCount:=sixSequenceCount+1 || diceValue:=dd ELSE sixSequenceCount:=0 || hasRoll:=FALSE || diceValue:=0 END ELSE hasRoll:=FALSE || diceValue:=dd END END);
  List_Substitution(Machine(Ludo_turn),endGame)==(gameStarted:=FALSE);
  List_Substitution(Machine(Ludo_turn),getDiceValue)==(value:=diceValue);
  List_Substitution(Machine(Ludo_turn),getColor)==(cc:=color);
  List_Substitution(Machine(Ludo_turn),numWinners)==(nn:=card(finishOrder));
  List_Substitution(Machine(Ludo_turn),placement)==(cc:=finishOrder(nn))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Ludo_turn))==(?);
  Inherited_List_Constants(Machine(Ludo_turn))==(?);
  List_Constants(Machine(Ludo_turn))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Ludo_turn))==(?);
  Context_List_Defered(Machine(Ludo_turn))==(COLORS,PIECES);
  Context_List_Sets(Machine(Ludo_turn))==(COLORS,PIECES);
  List_Valuable_Sets(Machine(Ludo_turn))==(?);
  Inherited_List_Enumerated(Machine(Ludo_turn))==(?);
  Inherited_List_Defered(Machine(Ludo_turn))==(?);
  Inherited_List_Sets(Machine(Ludo_turn))==(?);
  List_Enumerated(Machine(Ludo_turn))==(?);
  List_Defered(Machine(Ludo_turn))==(?);
  List_Sets(Machine(Ludo_turn))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Ludo_turn))==(?);
  Expanded_List_HiddenConstants(Machine(Ludo_turn))==(?);
  List_HiddenConstants(Machine(Ludo_turn))==(?);
  External_List_HiddenConstants(Machine(Ludo_turn))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Ludo_turn))==(btrue);
  Context_List_Properties(Machine(Ludo_turn))==(numPiecesByColor = 4 & numExternal = 52 & numInternal = 6 & numColors = 4 & card(COLORS) = numColors & numPieces: NAT & numPieces = numPiecesByColor*numColors & diceOptions = 1..6 & stars <: 0..numExternal-1 & stars = {8,21,34,47} & startPoint: COLORS >-> 0..51 & card(PIECES) = numPiecesByColor*numColors & colorsOrder: 0..3 >->> COLORS & colorOf: PIECES -->> COLORS & !cc.(cc: COLORS => colorOf~[{cc}]: FIN(PIECES) & card(colorOf~[{cc}]) = numPiecesByColor) & piecesOrder: 0..15 >->> PIECES & COLORS: FIN(INTEGER) & not(COLORS = {}) & PIECES: FIN(INTEGER) & not(PIECES = {}));
  Inherited_List_Properties(Machine(Ludo_turn))==(btrue);
  List_Properties(Machine(Ludo_turn))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Ludo_turn),Machine(Ludo_ctx))==(?);
  Seen_Context_List_Enumerated(Machine(Ludo_turn))==(?);
  Seen_Context_List_Invariant(Machine(Ludo_turn))==(btrue);
  Seen_Context_List_Assertions(Machine(Ludo_turn))==(btrue);
  Seen_Context_List_Properties(Machine(Ludo_turn))==(btrue);
  Seen_List_Constraints(Machine(Ludo_turn))==(btrue);
  Seen_List_Operations(Machine(Ludo_turn),Machine(Ludo_ctx))==(?);
  Seen_Expanded_List_Invariant(Machine(Ludo_turn),Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Ludo_turn),pickColor)==(?);
  List_ANY_Var(Machine(Ludo_turn),unpickColor)==(?);
  List_ANY_Var(Machine(Ludo_turn),initGame)==(?);
  List_ANY_Var(Machine(Ludo_turn),computeAction)==(?);
  List_ANY_Var(Machine(Ludo_turn),nextTurn)==(?);
  List_ANY_Var(Machine(Ludo_turn),rollDice)==(Var(dd) == btype(INTEGER,?,?));
  List_ANY_Var(Machine(Ludo_turn),endGame)==(?);
  List_ANY_Var(Machine(Ludo_turn),getDiceValue)==(?);
  List_ANY_Var(Machine(Ludo_turn),getColor)==(?);
  List_ANY_Var(Machine(Ludo_turn),numWinners)==(?);
  List_ANY_Var(Machine(Ludo_turn),placement)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Ludo_turn)) == (? | ? | finishOrder,sixSequenceCount,diceValue,hasRoll,color,enabledColors,gameStarted | ? | pickColor,unpickColor,initGame,computeAction,nextTurn,rollDice,endGame,getDiceValue,getColor,numWinners,placement | ? | seen(Machine(Ludo_ctx)) | ? | Ludo_turn);
  List_Of_HiddenCst_Ids(Machine(Ludo_turn)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_turn)) == (?);
  List_Of_VisibleVar_Ids(Machine(Ludo_turn)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_turn)) == (?: ?);
  List_Of_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | ? | ? | Ludo_ctx);
  List_Of_HiddenCst_Ids(Machine(Ludo_ctx)) == (stars,diceOptions | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Of_VisibleVar_Ids(Machine(Ludo_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_ctx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Ludo_turn)) == (Type(finishOrder) == Mvl(SetOf(btype(INTEGER,?,?)*atype(COLORS,?,?)));Type(sixSequenceCount) == Mvl(btype(INTEGER,?,?));Type(diceValue) == Mvl(btype(INTEGER,?,?));Type(hasRoll) == Mvl(btype(BOOL,?,?));Type(color) == Mvl(atype(COLORS,?,?));Type(enabledColors) == Mvl(SetOf(atype(COLORS,?,?)));Type(gameStarted) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Ludo_turn)) == (Type(placement) == Cst(atype(COLORS,?,?),btype(INTEGER,?,?));Type(numWinners) == Cst(btype(INTEGER,?,?),No_type);Type(getColor) == Cst(atype(COLORS,?,?),No_type);Type(getDiceValue) == Cst(btype(INTEGER,?,?),No_type);Type(endGame) == Cst(No_type,No_type);Type(rollDice) == Cst(btype(INTEGER,?,?),No_type);Type(nextTurn) == Cst(No_type,No_type);Type(computeAction) == Cst(No_type,btype(BOOL,?,?)*btype(BOOL,?,?));Type(initGame) == Cst(No_type,No_type);Type(unpickColor) == Cst(No_type,atype(COLORS,?,?));Type(pickColor) == Cst(No_type,atype(COLORS,?,?)));
  Observers(Machine(Ludo_turn)) == (Type(placement) == Cst(atype(COLORS,?,?),btype(INTEGER,?,?));Type(numWinners) == Cst(btype(INTEGER,?,?),No_type);Type(getColor) == Cst(atype(COLORS,?,?),No_type);Type(getDiceValue) == Cst(btype(INTEGER,?,?),No_type))
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
