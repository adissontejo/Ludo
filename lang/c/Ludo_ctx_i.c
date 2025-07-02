/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Ludo_ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

#define Ludo_ctx__numColors 4
#define Ludo_ctx__numPiecesByColor 4
#define Ludo_ctx__numPieces 16
#define Ludo_ctx__numExternal 52
#define Ludo_ctx__numInternal 6
/* Array and record constants */

const Ludo_ctx__COLORS Ludo_ctx__colorOf[Ludo_ctx__PIECES__max+1] = {0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3};

const int32_t Ludo_ctx__startPoint[Ludo_ctx__COLORS__max+1] = {0,13,26,39};

const Ludo_ctx__COLORS Ludo_ctx__colorsOrder[4] = {0,1,2,3};

const Ludo_ctx__PIECES Ludo_ctx__piecesOrder[16] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void Ludo_ctx__INITIALISATION(void)
{
    
    ;
}

