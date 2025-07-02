#ifndef _Ludo_ctx_h
#define _Ludo_ctx_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


#define Ludo_ctx__COLORS__max 3
#define Ludo_ctx__PIECES__max 15
/* Clause SETS */
typedef int Ludo_ctx__COLORS;
typedef int Ludo_ctx__PIECES;

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */




#define Ludo_ctx__numColors 4
#define Ludo_ctx__numPiecesByColor 4
#define Ludo_ctx__numPieces 16
#define Ludo_ctx__numExternal 52
#define Ludo_ctx__numInternal 6
/* Array and record constants */
extern const Ludo_ctx__COLORS Ludo_ctx__colorOf[Ludo_ctx__PIECES__max+1];
extern const int32_t Ludo_ctx__startPoint[Ludo_ctx__COLORS__max+1];
extern const Ludo_ctx__COLORS Ludo_ctx__colorsOrder[4];
extern const Ludo_ctx__PIECES Ludo_ctx__piecesOrder[16];






/* Clause CONCRETE_VARIABLES */

extern void Ludo_ctx__INITIALISATION(void);


#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Ludo_ctx_h */
