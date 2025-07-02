Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Ludo_ctx))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Ludo_ctx))==(Machine(Ludo_ctx));
  Level(Machine(Ludo_ctx))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Ludo_ctx)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Ludo_ctx))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Ludo_ctx))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Ludo_ctx))==(?);
  List_Includes(Machine(Ludo_ctx))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Ludo_ctx))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Ludo_ctx))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Ludo_ctx))==(?);
  Context_List_Variables(Machine(Ludo_ctx))==(?);
  Abstract_List_Variables(Machine(Ludo_ctx))==(?);
  Local_List_Variables(Machine(Ludo_ctx))==(?);
  List_Variables(Machine(Ludo_ctx))==(?);
  External_List_Variables(Machine(Ludo_ctx))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Ludo_ctx))==(?);
  Abstract_List_VisibleVariables(Machine(Ludo_ctx))==(?);
  External_List_VisibleVariables(Machine(Ludo_ctx))==(?);
  Expanded_List_VisibleVariables(Machine(Ludo_ctx))==(?);
  List_VisibleVariables(Machine(Ludo_ctx))==(?);
  Internal_List_VisibleVariables(Machine(Ludo_ctx))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Ludo_ctx))==(btrue);
  Gluing_List_Invariant(Machine(Ludo_ctx))==(btrue);
  Expanded_List_Invariant(Machine(Ludo_ctx))==(btrue);
  Abstract_List_Invariant(Machine(Ludo_ctx))==(btrue);
  Context_List_Invariant(Machine(Ludo_ctx))==(btrue);
  List_Invariant(Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Ludo_ctx))==(btrue);
  Abstract_List_Assertions(Machine(Ludo_ctx))==(btrue);
  Context_List_Assertions(Machine(Ludo_ctx))==(btrue);
  List_Assertions(Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Ludo_ctx))==(skip);
  Context_List_Initialisation(Machine(Ludo_ctx))==(skip);
  List_Initialisation(Machine(Ludo_ctx))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Ludo_ctx))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Ludo_ctx))==(btrue);
  List_Constraints(Machine(Ludo_ctx))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Ludo_ctx))==(?);
  List_Operations(Machine(Ludo_ctx))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Ludo_ctx))==(colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  Inherited_List_Constants(Machine(Ludo_ctx))==(?);
  List_Constants(Machine(Ludo_ctx))==(colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Ludo_ctx),COLORS)==(?);
  Context_List_Enumerated(Machine(Ludo_ctx))==(?);
  Context_List_Defered(Machine(Ludo_ctx))==(?);
  Context_List_Sets(Machine(Ludo_ctx))==(?);
  List_Valuable_Sets(Machine(Ludo_ctx))==(COLORS,PIECES);
  Inherited_List_Enumerated(Machine(Ludo_ctx))==(?);
  Inherited_List_Defered(Machine(Ludo_ctx))==(?);
  Inherited_List_Sets(Machine(Ludo_ctx))==(?);
  List_Enumerated(Machine(Ludo_ctx))==(?);
  List_Defered(Machine(Ludo_ctx))==(COLORS,PIECES);
  List_Sets(Machine(Ludo_ctx))==(COLORS,PIECES);
  Set_Definition(Machine(Ludo_ctx),PIECES)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Ludo_ctx))==(?);
  Expanded_List_HiddenConstants(Machine(Ludo_ctx))==(?);
  List_HiddenConstants(Machine(Ludo_ctx))==(stars,diceOptions);
  External_List_HiddenConstants(Machine(Ludo_ctx))==(stars,diceOptions)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Ludo_ctx))==(btrue);
  Context_List_Properties(Machine(Ludo_ctx))==(btrue);
  Inherited_List_Properties(Machine(Ludo_ctx))==(btrue);
  List_Properties(Machine(Ludo_ctx))==(numPiecesByColor = 4 & numExternal = 52 & numInternal = 6 & numColors = 4 & card(COLORS) = numColors & numPieces: NAT & numPieces = numPiecesByColor*numColors & diceOptions = 1..6 & stars <: 0..numExternal-1 & stars = {8,21,34,47} & startPoint: COLORS >-> 0..51 & card(PIECES) = numPiecesByColor*numColors & colorsOrder: 0..3 >->> COLORS & colorOf: PIECES -->> COLORS & !cc.(cc: COLORS => colorOf~[{cc}]: FIN(PIECES) & card(colorOf~[{cc}]) = numPiecesByColor) & piecesOrder: 0..15 >->> PIECES & COLORS: FIN(INTEGER) & not(COLORS = {}) & PIECES: FIN(INTEGER) & not(PIECES = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal,COLORS,PIECES | ? | ? | ? | ? | ? | ? | ? | Ludo_ctx);
  List_Of_HiddenCst_Ids(Machine(Ludo_ctx)) == (stars,diceOptions | ?);
  List_Of_VisibleCst_Ids(Machine(Ludo_ctx)) == (colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Of_VisibleVar_Ids(Machine(Ludo_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Ludo_ctx)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Ludo_ctx)) == (Type(COLORS) == Cst(SetOf(atype(COLORS,"[COLORS","]COLORS")));Type(PIECES) == Cst(SetOf(atype(PIECES,"[PIECES","]PIECES"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Ludo_ctx)) == (Type(colorOf) == Cst(SetOf(atype(PIECES,"[PIECES","]PIECES")*atype(COLORS,"[COLORS","]COLORS")));Type(startPoint) == Cst(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(INTEGER,0,51)));Type(colorsOrder) == Cst(SetOf(btype(INTEGER,0,3)*atype(COLORS,"[COLORS","]COLORS")));Type(piecesOrder) == Cst(SetOf(btype(INTEGER,0,15)*atype(PIECES,"[PIECES","]PIECES")));Type(numColors) == Cst(btype(INTEGER,?,?));Type(numPiecesByColor) == Cst(btype(INTEGER,?,?));Type(numPieces) == Cst(btype(INTEGER,?,?));Type(numExternal) == Cst(btype(INTEGER,?,?));Type(numInternal) == Cst(btype(INTEGER,?,?)))
END
&
THEORY HiddenConstantsEnvX IS
  HiddenConstants(Machine(Ludo_ctx)) == (Type(stars) == HCst(SetOf(btype(INTEGER,?,?)));Type(diceOptions) == HCst(SetOf(btype(INTEGER,1,6))))
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
