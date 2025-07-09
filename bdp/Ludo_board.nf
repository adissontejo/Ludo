Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Ludo_board))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Ludo_board))==(Machine(Ludo_board));
  Level(Machine(Ludo_board))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Ludo_board)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Ludo_board))==(Ludo_ctx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Ludo_board))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Ludo_board))==(?);
  List_Includes(Machine(Ludo_board))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Ludo_board))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Ludo_board))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Ludo_board))==(?);
  Context_List_Variables(Machine(Ludo_board))==(?);
  Abstract_List_Variables(Machine(Ludo_board))==(?);
  Local_List_Variables(Machine(Ludo_board))==(internalPos,externalPos,lockedPieces);
  List_Variables(Machine(Ludo_board))==(internalPos,externalPos,lockedPieces);
  External_List_Variables(Machine(Ludo_board))==(internalPos,externalPos,lockedPieces)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Ludo_board))==(?);
  Abstract_List_VisibleVariables(Machine(Ludo_board))==(?);
  External_List_VisibleVariables(Machine(Ludo_board))==(?);
  Expanded_List_VisibleVariables(Machine(Ludo_board))==(?);
  List_VisibleVariables(Machine(Ludo_board))==(?);
  Internal_List_VisibleVariables(Machine(Ludo_board))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Ludo_board))==(btrue);
  Gluing_List_Invariant(Machine(Ludo_board))==(btrue);
  Expanded_List_Invariant(Machine(Ludo_board))==(btrue);
  Abstract_List_Invariant(Machine(Ludo_board))==(btrue);
  Context_List_Invariant(Machine(Ludo_board))==(btrue);
  List_Invariant(Machine(Ludo_board))==(lockedPieces: POW(PIECES) & externalPos: PIECES +-> 0..numExternal-1 & internalPos: PIECES +-> 0..numInternal-1 & dom(externalPos)/\dom(internalPos) = {} & dom(externalPos)/\lockedPieces = {} & dom(internalPos)/\lockedPieces = {} & dom(externalPos)\/dom(internalPos)\/lockedPieces = PIECES & !nn.(nn: 0..numExternal-1 => card(externalPos|>{nn})<=2 & (nn/:(stars\/ran(startPoint)) => card((externalPos~;colorOf)[{nn}])<=1)))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Ludo_board))==(btrue);
  Abstract_List_Assertions(Machine(Ludo_board))==(btrue);
  Context_List_Assertions(Machine(Ludo_board))==(btrue);
  List_Assertions(Machine(Ludo_board))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Ludo_board))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Ludo_board))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Ludo_board))==(lockedPieces,externalPos,internalPos:=PIECES,{},{});
  Context_List_Initialisation(Machine(Ludo_board))==(skip);
  List_Initialisation(Machine(Ludo_board))==(lockedPieces:=PIECES || externalPos:={} || internalPos:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Ludo_board))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Ludo_board),Machine(Ludo_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Ludo_board))==(btrue);
  List_Constraints(Machine(Ludo_board))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Ludo_board))==(clear,setFree,setExternalPos,setInternalPos,getPos);
  List_Operations(Machine(Ludo_board))==(clear,setFree,setExternalPos,setInternalPos,getPos)
END
&
THEORY ListInputX IS
  List_Input(Machine(Ludo_board),clear)==(?);
  List_Input(Machine(Ludo_board),setFree)==(pp);
  List_Input(Machine(Ludo_board),setExternalPos)==(pp,nn);
  List_Input(Machine(Ludo_board),setInternalPos)==(pp,nn);
  List_Input(Machine(Ludo_board),getPos)==(pp)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Ludo_board),clear)==(?);
  List_Output(Machine(Ludo_board),setFree)==(?);
  List_Output(Machine(Ludo_board),setExternalPos)==(?);
  List_Output(Machine(Ludo_board),setInternalPos)==(?);
  List_Output(Machine(Ludo_board),getPos)==(ee,ii)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Ludo_board),clear)==(clear);
  List_Header(Machine(Ludo_board),setFree)==(setFree(pp));
  List_Header(Machine(Ludo_board),setExternalPos)==(setExternalPos(pp,nn));
  List_Header(Machine(Ludo_board),setInternalPos)==(setInternalPos(pp,nn));
  List_Header(Machine(Ludo_board),getPos)==(ee,ii <-- getPos(pp))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Ludo_board),clear)==(btrue);
  List_Precondition(Machine(Ludo_board),setFree)==(pp: PIECES & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2);
  List_Precondition(Machine(Ludo_board),setExternalPos)==(pp: PIECES & pp/:lockedPieces & pp/:dom(internalPos) & nn: 0..numExternal-1 & card(externalPos|>{nn})<2);
  List_Precondition(Machine(Ludo_board),setInternalPos)==(pp: PIECES & pp/:lockedPieces & nn: 0..numInternal-1);
  List_Precondition(Machine(Ludo_board),getPos)==(pp: PIECES)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Ludo_board),getPos)==(pp: PIECES | pp: dom(externalPos) ==> ee,ii:=externalPos(pp), -1 [] not(pp: dom(externalPos)) ==> (pp: dom(internalPos) ==> ee,ii:= -1,internalPos(pp) [] not(pp: dom(internalPos)) ==> ee,ii:= -1, -1));
  Expanded_List_Substitution(Machine(Ludo_board),setInternalPos)==(pp: PIECES & pp/:lockedPieces & nn: 0..numInternal-1 | internalPos,externalPos:=internalPos<+{pp|->nn},{pp}<<|externalPos);
  Expanded_List_Substitution(Machine(Ludo_board),setExternalPos)==(pp: PIECES & pp/:lockedPieces & pp/:dom(internalPos) & nn: 0..numExternal-1 & card(externalPos|>{nn})<2 | nn/:(stars\/ran(startPoint)) & (externalPos~;colorOf)[{nn}]-{colorOf(pp)}/={} ==> externalPos,lockedPieces:=externalPos|>>{nn}<+{pp|->nn},lockedPieces\/externalPos~[{nn}] [] not(nn/:(stars\/ran(startPoint)) & (externalPos~;colorOf)[{nn}]-{colorOf(pp)}/={}) ==> externalPos:=externalPos<+{pp|->nn});
  Expanded_List_Substitution(Machine(Ludo_board),setFree)==(pp: PIECES & pp: lockedPieces & card(externalPos|>{startPoint(colorOf(pp))})<2 | lockedPieces,externalPos:=lockedPieces-{pp},externalPos<+{pp|->startPoint(colorOf(pp))});
  Expanded_List_Substitution(Machine(Ludo_board),clear)==(btrue | lockedPieces,externalPos,internalPos:=PIECES,{},{});
  List_Substitution(Machine(Ludo_board),clear)==(lockedPieces,externalPos,internalPos:=PIECES,{},{});
  List_Substitution(Machine(Ludo_board),setFree)==(lockedPieces:=lockedPieces-{pp} || externalPos(pp):=startPoint(colorOf(pp)));
  List_Substitution(Machine(Ludo_board),setExternalPos)==(IF nn/:(stars\/ran(startPoint)) & (externalPos~;colorOf)[{nn}]-{colorOf(pp)}/={} THEN externalPos:=externalPos|>>{nn}<+{pp|->nn} || lockedPieces:=lockedPieces\/externalPos~[{nn}] ELSE externalPos(pp):=nn END);
  List_Substitution(Machine(Ludo_board),setInternalPos)==(internalPos(pp):=nn || externalPos:={pp}<<|externalPos);
  List_Substitution(Machine(Ludo_board),getPos)==(IF pp: dom(externalPos) THEN ee,ii:=externalPos(pp), -1 ELSIF pp: dom(internalPos) THEN ee,ii:= -1,internalPos(pp) ELSE ee,ii:= -1, -1 END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Ludo_board))==(?);
  Inherited_List_Constants(Machine(Ludo_board))==(?);
  List_Constants(Machine(Ludo_board))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Ludo_board))==(?);
  Context_List_Defered(Machine(Ludo_board))==(COLORS,PIECES);
  Context_List_Sets(Machine(Ludo_board))==(COLORS,PIECES);
  List_Valuable_Sets(Machine(Ludo_board))==(?);
  Inherited_List_Enumerated(Machine(Ludo_board))==(?);
  Inherited_List_Defered(Machine(Ludo_board))==(?);
  Inherited_List_Sets(Machine(Ludo_board))==(?);
  List_Enumerated(Machine(Ludo_board))==(?);
  List_Defered(Machine(Ludo_board))==(?);
  List_Sets(Machine(Ludo_board))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Ludo_board))==(?);
  Expanded_List_HiddenConstants(Machine(Ludo_board))==(?);
  List_HiddenConstants(Machine(Ludo_board))==(?);
  External_List_HiddenConstants(Machine(Ludo_board))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Ludo_board))==(btrue);
  Context_List_Properties(Machine(Ludo_board))==(numPiecesByColor = 4 & numExternal = 52 & numInternal = 6 & numColors = 4 & card(COLORS) = numColors & numPieces: NAT & numPieces = numPiecesByColor*numColors & diceOptions = 1..6 & stars <: 0..numExternal-1 & stars = {8,21,34,47} & startPoint: COLORS >-> 0..51 & card(PIECES) = numPiecesByColor*numColors & colorsOrder: 0..3 >->> COLORS & colorOf: PIECES -->> COLORS & !cc.(cc: COLORS => colorOf~[{cc}]: FIN(PIECES) & card(colorOf~[{cc}]) = numPiecesByColor) & piecesOrder: 0..15 >->> PIECES & COLORS: FIN(INTEGER) & not(COLORS = {}) & PIECES: FIN(INTEGER) & not(PIECES = {}));
  Inherited_List_Properties(Machine(Ludo_board))==(btrue);
  List_Properties(Machine(Ludo_board))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Ludo_board),Machine(Ludo_ctx))==(?);
  Seen_Context_List_Enumerated(Machine(Ludo_board))==(?);
  Seen_Context_List_Invariant(Machine(Ludo_board))==(btrue);
  Seen_Context_List_Assertions(Machine(Ludo_board))==(btrue);
  Seen_Context_List_Properties(Machine(Ludo_board))==(btrue);
  Seen_List_Constraints(Machine(Ludo_board))==(btrue);
  Seen_List_Operations(Machine(Ludo_board),Machine(Ludo_ctx))==(?);
  Seen_Expanded_List_Invariant(Machine(Ludo_board),Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Ludo_board),clear)==(?);
  List_ANY_Var(Machine(Ludo_board),setFree)==(?);
  List_ANY_Var(Machine(Ludo_board),setExternalPos)==(?);
  List_ANY_Var(Machine(Ludo_board),setInternalPos)==(?);
  List_ANY_Var(Machine(Ludo_board),getPos)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Ludo_board)) == (? | ? | internalPos,externalPos,lockedPieces | ? | clear,setFree,setExternalPos,setInternalPos,getPos | ? | seen(Machine(Ludo_ctx)) | ? | Ludo_board);
  List_Of_HiddenCst_Ids(Machine(Ludo_board)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_board)) == (?);
  List_Of_VisibleVar_Ids(Machine(Ludo_board)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_board)) == (?: ?);
  List_Of_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | ? | ? | Ludo_ctx);
  List_Of_HiddenCst_Ids(Machine(Ludo_ctx)) == (stars,diceOptions | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Of_VisibleVar_Ids(Machine(Ludo_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_ctx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Ludo_board)) == (Type(internalPos) == Mvl(SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?)));Type(externalPos) == Mvl(SetOf(atype(PIECES,?,?)*btype(INTEGER,?,?)));Type(lockedPieces) == Mvl(SetOf(atype(PIECES,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Ludo_board)) == (Type(getPos) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),atype(PIECES,?,?));Type(setInternalPos) == Cst(No_type,atype(PIECES,?,?)*btype(INTEGER,?,?));Type(setExternalPos) == Cst(No_type,atype(PIECES,?,?)*btype(INTEGER,?,?));Type(setFree) == Cst(No_type,atype(PIECES,?,?));Type(clear) == Cst(No_type,No_type));
  Observers(Machine(Ludo_board)) == (Type(getPos) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),atype(PIECES,?,?)))
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
