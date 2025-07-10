Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Ludo_board_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Ludo_board_i))==(Machine(Ludo_board));
  Level(Implementation(Ludo_board_i))==(1);
  Upper_Level(Implementation(Ludo_board_i))==(Machine(Ludo_board))
END
&
THEORY LoadedStructureX IS
  Implementation(Ludo_board_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Ludo_board_i))==(Ludo_ctx)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Ludo_board_i))==(?);
  Inherited_List_Includes(Implementation(Ludo_board_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Ludo_board_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Ludo_board_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Ludo_board_i))==(?);
  Context_List_Variables(Implementation(Ludo_board_i))==(?);
  Abstract_List_Variables(Implementation(Ludo_board_i))==(internalPos,externalPos,lockedPieces);
  Local_List_Variables(Implementation(Ludo_board_i))==(?);
  List_Variables(Implementation(Ludo_board_i))==(?);
  External_List_Variables(Implementation(Ludo_board_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Ludo_board_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Ludo_board_i))==(?);
  External_List_VisibleVariables(Implementation(Ludo_board_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Ludo_board_i))==(?);
  List_VisibleVariables(Implementation(Ludo_board_i))==(internalBoard,externalBoard);
  Internal_List_VisibleVariables(Implementation(Ludo_board_i))==(internalBoard,externalBoard)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Ludo_board_i))==(btrue);
  Expanded_List_Invariant(Implementation(Ludo_board_i))==(btrue);
  Abstract_List_Invariant(Implementation(Ludo_board_i))==(lockedPieces: POW(PIECES) & externalPos: PIECES +-> 0..numExternal-1 & internalPos: PIECES +-> 0..numInternal-1 & dom(externalPos)/\dom(internalPos) = {} & dom(externalPos)/\lockedPieces = {} & dom(internalPos)/\lockedPieces = {} & dom(externalPos)\/dom(internalPos)\/lockedPieces = PIECES & !nn.(nn: 0..numExternal-1 => card(externalPos|>{nn})<=2 & (nn/:(stars\/ran(startPoint)) => card((externalPos~;colorOf)[{nn}])<=1)));
  Context_List_Invariant(Implementation(Ludo_board_i))==(btrue);
  List_Invariant(Implementation(Ludo_board_i))==(externalBoard: PIECES --> -1..numExternal-1 & internalBoard: PIECES --> -1..numInternal-1 & dom(externalBoard|>{ -1})/\dom(internalBoard|>{ -1}) = lockedPieces & externalBoard|>>{ -1} = externalPos & internalBoard|>>{ -1} = internalPos)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(Ludo_board_i))==(btrue);
  Abstract_List_Assertions(Implementation(Ludo_board_i))==(btrue);
  Context_List_Assertions(Implementation(Ludo_board_i))==(btrue);
  List_Assertions(Implementation(Ludo_board_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Ludo_board_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Ludo_board_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Ludo_board_i))==((-1: INT & 0: INT & 1: INT | externalBoard:=PIECES*{ -1});(-1: INT & 0: INT & 1: INT | internalBoard:=PIECES*{ -1}));
  Context_List_Initialisation(Implementation(Ludo_board_i))==(skip);
  List_Initialisation(Implementation(Ludo_board_i))==(externalBoard:=PIECES*{ -1};internalBoard:=PIECES*{ -1})
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Ludo_board_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(Ludo_board_i),Machine(Ludo_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Ludo_board_i))==(btrue);
  List_Context_Constraints(Implementation(Ludo_board_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Ludo_board_i))==(clear,setFree,setExternalPos,setInternalPos,getPos);
  List_Operations(Implementation(Ludo_board_i))==(clear,setFree,setExternalPos,setInternalPos,getPos)
END
&
THEORY ListInputX IS
  List_Input(Implementation(Ludo_board_i),clear)==(?);
  List_Input(Implementation(Ludo_board_i),setFree)==(pp);
  List_Input(Implementation(Ludo_board_i),setExternalPos)==(pp,nn);
  List_Input(Implementation(Ludo_board_i),setInternalPos)==(pp,nn);
  List_Input(Implementation(Ludo_board_i),getPos)==(pp)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Ludo_board_i),clear)==(?);
  List_Output(Implementation(Ludo_board_i),setFree)==(?);
  List_Output(Implementation(Ludo_board_i),setExternalPos)==(atePiece);
  List_Output(Implementation(Ludo_board_i),setInternalPos)==(?);
  List_Output(Implementation(Ludo_board_i),getPos)==(ee,ii)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Ludo_board_i),clear)==(clear);
  List_Header(Implementation(Ludo_board_i),setFree)==(setFree(pp));
  List_Header(Implementation(Ludo_board_i),setExternalPos)==(atePiece <-- setExternalPos(pp,nn));
  List_Header(Implementation(Ludo_board_i),setInternalPos)==(setInternalPos(pp,nn));
  List_Header(Implementation(Ludo_board_i),getPos)==(ee,ii <-- getPos(pp))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(Ludo_board_i),clear)==(btrue);
  List_Precondition(Implementation(Ludo_board_i),clear)==(btrue);
  Own_Precondition(Implementation(Ludo_board_i),setFree)==(btrue);
  List_Precondition(Implementation(Ludo_board_i),setFree)==(pp: PIECES & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2);
  Own_Precondition(Implementation(Ludo_board_i),setExternalPos)==(btrue);
  List_Precondition(Implementation(Ludo_board_i),setExternalPos)==(pp: PIECES & pp/:lockedPieces & pp/:dom(internalPos) & nn: 0..numExternal-1 & card(externalPos|>{nn})<2);
  Own_Precondition(Implementation(Ludo_board_i),setInternalPos)==(btrue);
  List_Precondition(Implementation(Ludo_board_i),setInternalPos)==(pp: PIECES & pp/:lockedPieces & nn: 0..numInternal-1);
  Own_Precondition(Implementation(Ludo_board_i),getPos)==(btrue);
  List_Precondition(Implementation(Ludo_board_i),getPos)==(pp: PIECES)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Ludo_board_i),getPos)==(pp: PIECES | (externalBoard(pp): INT & pp: dom(externalBoard) | ee:=externalBoard(pp));(internalBoard(pp): INT & pp: dom(internalBoard) | ii:=internalBoard(pp)));
  Expanded_List_Substitution(Implementation(Ludo_board_i),setInternalPos)==(pp: PIECES & pp/:lockedPieces & nn: 0..numInternal-1 | (pp: dom(externalBoard) & -1: INT & 0: INT & 1: INT | externalBoard:=externalBoard<+{pp|-> -1});(pp: dom(internalBoard) & nn: INT | internalBoard:=internalBoard<+{pp|->nn}));
  Expanded_List_Substitution(Implementation(Ludo_board_i),setExternalPos)==(pp: PIECES & pp/:lockedPieces & pp/:dom(internalPos) & nn: 0..numExternal-1 & card(externalPos|>{nn})<2 | @(rest,currentColor,atePiece,otherColor,otherPos,ii).((nn mod 13: NAT & nn: NAT & 13: NAT1 | rest:=nn mod 13);(rest/=0 & rest/=8 ==> ((0: INT | ii:=0);(pp: dom(colorOf) | currentColor:=colorOf(pp));atePiece:=FALSE;WHILE ii<numPieces & atePiece = FALSE DO (ii: dom(piecesOrder) & piecesOrder(ii): dom(colorOf) | otherColor:=colorOf(piecesOrder(ii)));(ii: dom(piecesOrder) & piecesOrder(ii): dom(externalBoard) | otherPos:=externalBoard(piecesOrder(ii)));(otherColor/=currentColor & otherPos = nn ==> ((ii: dom(piecesOrder) & piecesOrder(ii): dom(externalBoard) & -1: INT & 0: INT & 1: INT | externalBoard:=externalBoard<+{piecesOrder(ii)|-> -1});atePiece:=TRUE) [] not(otherColor/=currentColor & otherPos = nn) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT externalBoard: PIECES --> -1..numExternal-1 & ii: NAT & ii<=numPieces & atePiece = TRUE <=> ((piecesOrder[0..ii-1]<|externalPos)~;colorOf)[{nn}]-{colorOf(pp)}/={} & (atePiece = TRUE => card(externalBoard|>{nn}) = 0) VARIANT numPieces-ii END) [] not(rest/=0 & rest/=8) ==> skip));(pp: dom(externalBoard) & nn: INT | externalBoard:=externalBoard<+{pp|->nn}));
  Expanded_List_Substitution(Implementation(Ludo_board_i),setFree)==(pp: PIECES & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 & pp: dom(externalBoard) & 0: INT | externalBoard:=externalBoard<+{pp|->0});
  Expanded_List_Substitution(Implementation(Ludo_board_i),clear)==(btrue | (-1: INT & 0: INT & 1: INT | externalBoard:=PIECES*{ -1});(-1: INT & 0: INT & 1: INT | internalBoard:=PIECES*{ -1}));
  List_Substitution(Implementation(Ludo_board_i),clear)==(externalBoard:=PIECES*{ -1};internalBoard:=PIECES*{ -1});
  List_Substitution(Implementation(Ludo_board_i),setFree)==(externalBoard(pp):=0);
  List_Substitution(Implementation(Ludo_board_i),setExternalPos)==(VAR rest,currentColor,atePiece,otherColor,otherPos,ii IN rest:=nn mod 13;IF rest/=0 & rest/=8 THEN ii:=0;currentColor:=colorOf(pp);atePiece:=FALSE;WHILE ii<numPieces & atePiece = FALSE DO otherColor:=colorOf(piecesOrder(ii));otherPos:=externalBoard(piecesOrder(ii));IF otherColor/=currentColor & otherPos = nn THEN externalBoard(piecesOrder(ii)):= -1;atePiece:=TRUE END;ii:=ii+1 INVARIANT externalBoard: PIECES --> -1..numExternal-1 & ii: NAT & ii<=numPieces & atePiece = TRUE <=> ((piecesOrder[0..ii-1]<|externalPos)~;colorOf)[{nn}]-{colorOf(pp)}/={} & (atePiece = TRUE => card(externalBoard|>{nn}) = 0) VARIANT numPieces-ii END END END;externalBoard(pp):=nn);
  List_Substitution(Implementation(Ludo_board_i),setInternalPos)==(externalBoard(pp):= -1;internalBoard(pp):=nn);
  List_Substitution(Implementation(Ludo_board_i),getPos)==(ee:=externalBoard(pp);ii:=internalBoard(pp))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Ludo_board_i))==(?);
  Inherited_List_Constants(Implementation(Ludo_board_i))==(?);
  List_Constants(Implementation(Ludo_board_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(Ludo_board_i))==(?);
  Context_List_Defered(Implementation(Ludo_board_i))==(COLORS,PIECES);
  Context_List_Sets(Implementation(Ludo_board_i))==(COLORS,PIECES);
  List_Own_Enumerated(Implementation(Ludo_board_i))==(?);
  List_Valuable_Sets(Implementation(Ludo_board_i))==(?);
  Inherited_List_Enumerated(Implementation(Ludo_board_i))==(?);
  Inherited_List_Defered(Implementation(Ludo_board_i))==(?);
  Inherited_List_Sets(Implementation(Ludo_board_i))==(?);
  List_Enumerated(Implementation(Ludo_board_i))==(?);
  List_Defered(Implementation(Ludo_board_i))==(?);
  List_Sets(Implementation(Ludo_board_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Ludo_board_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Ludo_board_i))==(?);
  List_HiddenConstants(Implementation(Ludo_board_i))==(?);
  External_List_HiddenConstants(Implementation(Ludo_board_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Ludo_board_i))==(btrue);
  Context_List_Properties(Implementation(Ludo_board_i))==(numPiecesByColor = 4 & numExternal = 52 & numInternal = 6 & numColors = 4 & card(COLORS) = numColors & numPieces: NAT & numPieces = numPiecesByColor*numColors & diceOptions = 1..6 & stars <: 0..numExternal-1 & stars = {8,21,34,47} & startPoint: COLORS >-> 0..51 & card(PIECES) = numPiecesByColor*numColors & colorsOrder: 0..3 >->> COLORS & colorOf: PIECES -->> COLORS & !cc.(cc: COLORS => colorOf~[{cc}]: FIN(PIECES) & card(colorOf~[{cc}]) = numPiecesByColor) & piecesOrder: 0..15 >->> PIECES & COLORS: FIN(INTEGER) & not(COLORS = {}) & PIECES: FIN(INTEGER) & not(PIECES = {}));
  Inherited_List_Properties(Implementation(Ludo_board_i))==(btrue);
  List_Properties(Implementation(Ludo_board_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(Ludo_board_i))==(aa: aa);
  List_Values(Implementation(Ludo_board_i))==(?)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Implementation(Ludo_board_i),Machine(Ludo_ctx))==(?);
  Seen_Context_List_Enumerated(Implementation(Ludo_board_i))==(?);
  Seen_Context_List_Invariant(Implementation(Ludo_board_i))==(btrue);
  Seen_Context_List_Assertions(Implementation(Ludo_board_i))==(btrue);
  Seen_Context_List_Properties(Implementation(Ludo_board_i))==(btrue);
  Seen_List_Constraints(Implementation(Ludo_board_i))==(btrue);
  Seen_List_Operations(Implementation(Ludo_board_i),Machine(Ludo_ctx))==(?);
  Seen_Expanded_List_Invariant(Implementation(Ludo_board_i),Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(Ludo_board_i))==(Type(externalBoard) == Mvv(SetOf(atype(PIECES,"[PIECES","]PIECES")*btype(INTEGER, -1,numExternal-1)));Type(internalBoard) == Mvv(SetOf(atype(PIECES,"[PIECES","]PIECES")*btype(INTEGER, -1,numInternal-1))));
  Operations(Implementation(Ludo_board_i))==(Type(getPos) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),atype(PIECES,?,?));Type(setInternalPos) == Cst(No_type,atype(PIECES,?,?)*btype(INTEGER,?,?));Type(setExternalPos) == Cst(btype(BOOL,?,?),atype(PIECES,?,?)*btype(INTEGER,?,?));Type(setFree) == Cst(No_type,atype(PIECES,?,?));Type(clear) == Cst(No_type,No_type))
END
&
THEORY ListVisibleStaticX IS
  List_Constants(Implementation(Ludo_board_i),Machine(Ludo_ctx))==(colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Constants_Env(Implementation(Ludo_board_i),Machine(Ludo_ctx))==(Type(colorOf) == Cst(SetOf(atype(PIECES,"[PIECES","]PIECES")*atype(COLORS,"[COLORS","]COLORS")));Type(startPoint) == Cst(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(INTEGER,0,51)));Type(colorsOrder) == Cst(SetOf(btype(INTEGER,0,3)*atype(COLORS,"[COLORS","]COLORS")));Type(piecesOrder) == Cst(SetOf(btype(INTEGER,0,15)*atype(PIECES,"[PIECES","]PIECES")));Type(numColors) == Cst(btype(INTEGER,?,?));Type(numPiecesByColor) == Cst(btype(INTEGER,?,?));Type(numPieces) == Cst(btype(INTEGER,?,?));Type(numExternal) == Cst(btype(INTEGER,?,?));Type(numInternal) == Cst(btype(INTEGER,?,?)));
  List_Defered_Sets(Implementation(Ludo_board_i),Machine(Ludo_ctx))==(COLORS,PIECES)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Ludo_board_i)) == (? | ? | ? | ? | clear,setFree,setExternalPos,setInternalPos,getPos | ? | seen(Machine(Ludo_ctx)) | ? | Ludo_board_i);
  List_Of_HiddenCst_Ids(Implementation(Ludo_board_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Ludo_board_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Ludo_board_i)) == (internalBoard,externalBoard | ?);
  List_Of_Ids_SeenBNU(Implementation(Ludo_board_i)) == (?: ?);
  List_Of_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | ? | ? | Ludo_ctx);
  List_Of_HiddenCst_Ids(Machine(Ludo_ctx)) == (stars,diceOptions | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Of_VisibleVar_Ids(Machine(Ludo_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_ctx)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(Ludo_board_i)) == (Type(internalBoard) == Mvv(SetOf(atype(PIECES,"[PIECES","]PIECES")*btype(INTEGER, -1,numInternal-1)));Type(externalBoard) == Mvv(SetOf(atype(PIECES,"[PIECES","]PIECES")*btype(INTEGER, -1,numExternal-1))))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(Ludo_board_i),setExternalPos, 1) == (Type(rest) == Lvl(btype(INTEGER,?,?));Type(currentColor) == Lvl(atype(COLORS,?,?));Type(atePiece) == Lvl(btype(BOOL,?,?));Type(otherColor) == Lvl(atype(COLORS,?,?));Type(otherPos) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(Ludo_board_i))==(?)
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
  TypingPredicate(Implementation(Ludo_board_i))==(externalBoard: POW(PIECES*INTEGER) & internalBoard: POW(PIECES*INTEGER))
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
