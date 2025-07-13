#ifndef _Ludo_board_h
#define _Ludo_board_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Ludo_ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */

/* Clause CONCRETE_VARIABLES */

extern void Ludo_board__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Ludo_board__clear(void);
extern void Ludo_board__setFree(Ludo_ctx__PIECES pp);
extern void Ludo_board__setExternalPos(Ludo_ctx__PIECES pp, int32_t nn, bool *atePiece);
extern void Ludo_board__setInternalPos(Ludo_ctx__PIECES pp, int32_t nn);
extern void Ludo_board__getPos(Ludo_ctx__PIECES pp, int32_t *ee, int32_t *ii);
extern void Ludo_board__isLocked(Ludo_ctx__PIECES pp, bool *bb);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Ludo_board_h */
