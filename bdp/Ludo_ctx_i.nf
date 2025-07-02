Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Ludo_ctx_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Ludo_ctx_i))==(Machine(Ludo_ctx));
  Level(Implementation(Ludo_ctx_i))==(1);
  Upper_Level(Implementation(Ludo_ctx_i))==(Machine(Ludo_ctx))
END
&
THEORY LoadedStructureX IS
  Implementation(Ludo_ctx_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Ludo_ctx_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Ludo_ctx_i))==(?);
  Inherited_List_Includes(Implementation(Ludo_ctx_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Ludo_ctx_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Ludo_ctx_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Ludo_ctx_i))==(?);
  Context_List_Variables(Implementation(Ludo_ctx_i))==(?);
  Abstract_List_Variables(Implementation(Ludo_ctx_i))==(?);
  Local_List_Variables(Implementation(Ludo_ctx_i))==(?);
  List_Variables(Implementation(Ludo_ctx_i))==(?);
  External_List_Variables(Implementation(Ludo_ctx_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Ludo_ctx_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Ludo_ctx_i))==(?);
  External_List_VisibleVariables(Implementation(Ludo_ctx_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Ludo_ctx_i))==(?);
  List_VisibleVariables(Implementation(Ludo_ctx_i))==(?);
  Internal_List_VisibleVariables(Implementation(Ludo_ctx_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Ludo_ctx_i))==(btrue);
  Expanded_List_Invariant(Implementation(Ludo_ctx_i))==(btrue);
  Abstract_List_Invariant(Implementation(Ludo_ctx_i))==(btrue);
  Context_List_Invariant(Implementation(Ludo_ctx_i))==(btrue);
  List_Invariant(Implementation(Ludo_ctx_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(Ludo_ctx_i))==(btrue);
  Abstract_List_Assertions(Implementation(Ludo_ctx_i))==(btrue);
  Context_List_Assertions(Implementation(Ludo_ctx_i))==(btrue);
  List_Assertions(Implementation(Ludo_ctx_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Ludo_ctx_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Ludo_ctx_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Ludo_ctx_i))==(skip);
  Context_List_Initialisation(Implementation(Ludo_ctx_i))==(skip);
  List_Initialisation(Implementation(Ludo_ctx_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Ludo_ctx_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Ludo_ctx_i))==(btrue);
  List_Context_Constraints(Implementation(Ludo_ctx_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Ludo_ctx_i))==(?);
  List_Operations(Implementation(Ludo_ctx_i))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Ludo_ctx_i))==(colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  Inherited_List_Constants(Implementation(Ludo_ctx_i))==(colorOf,startPoint,colorsOrder,piecesOrder,numColors,numPiecesByColor,numPieces,numExternal,numInternal);
  List_Constants(Implementation(Ludo_ctx_i))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Implementation(Ludo_ctx_i),PIECES)==(?);
  Context_List_Enumerated(Implementation(Ludo_ctx_i))==(?);
  Context_List_Defered(Implementation(Ludo_ctx_i))==(?);
  Context_List_Sets(Implementation(Ludo_ctx_i))==(?);
  List_Own_Enumerated(Implementation(Ludo_ctx_i))==(?);
  List_Valuable_Sets(Implementation(Ludo_ctx_i))==(COLORS,PIECES);
  Inherited_List_Enumerated(Implementation(Ludo_ctx_i))==(?);
  Inherited_List_Defered(Implementation(Ludo_ctx_i))==(COLORS,PIECES);
  Inherited_List_Sets(Implementation(Ludo_ctx_i))==(COLORS,PIECES);
  List_Enumerated(Implementation(Ludo_ctx_i))==(?);
  List_Defered(Implementation(Ludo_ctx_i))==(?);
  List_Sets(Implementation(Ludo_ctx_i))==(?);
  Set_Definition(Implementation(Ludo_ctx_i),COLORS)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Ludo_ctx_i))==(stars,diceOptions);
  Expanded_List_HiddenConstants(Implementation(Ludo_ctx_i))==(?);
  List_HiddenConstants(Implementation(Ludo_ctx_i))==(?);
  External_List_HiddenConstants(Implementation(Ludo_ctx_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Ludo_ctx_i))==(numPiecesByColor = 4 & numExternal = 52 & numInternal = 6 & numColors = 4 & card(COLORS) = numColors & numPieces: NAT & numPieces = numPiecesByColor*numColors & diceOptions = 1..6 & stars <: 0..numExternal-1 & stars = {8,21,34,47} & startPoint: COLORS >-> 0..51 & card(PIECES) = numPiecesByColor*numColors & colorsOrder: 0..3 >->> COLORS & colorOf: PIECES -->> COLORS & !cc.(cc: COLORS => colorOf~[{cc}]: FIN(PIECES) & card(colorOf~[{cc}]) = numPiecesByColor) & piecesOrder: 0..15 >->> PIECES & COLORS: FIN(INTEGER) & not(COLORS = {}) & PIECES: FIN(INTEGER) & not(PIECES = {}));
  Context_List_Properties(Implementation(Ludo_ctx_i))==(btrue);
  Inherited_List_Properties(Implementation(Ludo_ctx_i))==(btrue);
  List_Properties(Implementation(Ludo_ctx_i))==(startPoint: COLORS --> 0..51)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(Ludo_ctx_i))==(btrue);
  Values_Subs(Implementation(Ludo_ctx_i))==(COLORS,PIECES,colorOf,numColors,numPiecesByColor,numPieces,numExternal,numInternal,startPoint,colorsOrder,piecesOrder: 0..3,0..15,{0|->0,1|->0,2|->0,3|->0,4|->1,5|->1,6|->1,7|->1,8|->2,9|->2,10|->2,11|->2,12|->3,13|->3,14|->3,15|->3},4,4,16,52,6,{0|->0,1|->13,2|->26,3|->39},{0|->0,1|->1,2|->2,3|->3},{0|->0,1|->1,2|->2,3|->3,4|->4,5|->5,6|->6,7|->7,8|->8,9|->9,10|->10,11|->11,12|->12,13|->13,14|->14,15|->15});
  List_Values(Implementation(Ludo_ctx_i))==(COLORS = 0..3;PIECES = 0..15;colorOf = {0|->0,1|->0,2|->0,3|->0,4|->1,5|->1,6|->1,7|->1,8|->2,9|->2,10|->2,11|->2,12|->3,13|->3,14|->3,15|->3};numColors = 4;numPiecesByColor = 4;numPieces = 16;numExternal = 52;numInternal = 6;startPoint = {0|->0,1|->13,2|->26,3|->39};colorsOrder = {0|->0,1|->1,2|->2,3|->3};piecesOrder = {0|->0,1|->1,2|->2,3|->3,4|->4,5|->5,6|->6,7|->7,8|->8,9|->9,10|->10,11|->11,12|->12,13|->13,14|->14,15|->15})
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Constants(Implementation(Ludo_ctx_i))==(Type(colorOf) == Cst(SetOf(atype(PIECES,"[PIECES","]PIECES")*atype(COLORS,"[COLORS","]COLORS")));Type(startPoint) == Cst(SetOf(atype(COLORS,"[COLORS","]COLORS")*btype(INTEGER,0,51)));Type(colorsOrder) == Cst(SetOf(btype(INTEGER,0,3)*atype(COLORS,"[COLORS","]COLORS")));Type(piecesOrder) == Cst(SetOf(btype(INTEGER,0,15)*atype(PIECES,"[PIECES","]PIECES")));Type(numColors) == Cst(btype(INTEGER,?,?));Type(numPiecesByColor) == Cst(btype(INTEGER,?,?));Type(numPieces) == Cst(btype(INTEGER,?,?));Type(numExternal) == Cst(btype(INTEGER,?,?));Type(numInternal) == Cst(btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Ludo_ctx_i)) == (? | ? | ? | ? | ? | ? | ? | ? | Ludo_ctx_i);
  List_Of_HiddenCst_Ids(Implementation(Ludo_ctx_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Ludo_ctx_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Ludo_ctx_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(Ludo_ctx_i)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Implementation(Ludo_ctx_i)) == (Type(PIECES) == Cst(SetOf(btype(INTEGER,"[PIECES","]PIECES")));Type(COLORS) == Cst(SetOf(btype(INTEGER,"[COLORS","]COLORS"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(Ludo_ctx_i)) == (Type(numInternal) == Cst(btype(INTEGER,?,?));Type(numExternal) == Cst(btype(INTEGER,?,?));Type(numPieces) == Cst(btype(INTEGER,?,?));Type(numPiecesByColor) == Cst(btype(INTEGER,?,?));Type(numColors) == Cst(btype(INTEGER,?,?));Type(piecesOrder) == Cst(SetOf(btype(INTEGER,0,15)*btype(INTEGER,"[PIECES","]PIECES")));Type(colorsOrder) == Cst(SetOf(btype(INTEGER,0,3)*btype(INTEGER,"[COLORS","]COLORS")));Type(startPoint) == Cst(SetOf(btype(INTEGER,"[COLORS","]COLORS")*btype(INTEGER,0,51)));Type(colorOf) == Cst(SetOf(btype(INTEGER,"[PIECES","]PIECES")*btype(INTEGER,"[COLORS","]COLORS"))))
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
  List_Local_Operations(Implementation(Ludo_ctx_i))==(?)
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
  TypingPredicate(Implementation(Ludo_ctx_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
