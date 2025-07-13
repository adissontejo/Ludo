#ifndef _Ludo_h
#define _Ludo_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Ludo_ctx.h"

/* Clause INCLUDES */
#include "Ludo_board.h"
#include "Ludo_turn.h"

/* Clause IMPORTS */
#include "Ludo_board.h"
#include "Ludo_turn.h"
#define Ludo__pickColor Ludo_turn__pickColor
#define Ludo__unpickColor Ludo_turn__unpickColor
#define Ludo__endGame Ludo_turn__endGame
#define Ludo__getDiceValue Ludo_turn__getDiceValue
#define Ludo__getGameStarted Ludo_turn__getGameStarted

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */

/* Clause CONCRETE_VARIABLES */

extern void Ludo__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Ludo__startGame(void);
extern void Ludo__free(Ludo_ctx__PIECES pp);
extern void Ludo__throwDice(int32_t *vv);
extern void Ludo__skipTurn(void);
extern void Ludo__walk(Ludo_ctx__PIECES pp);
extern void Ludo__getPiecePos(Ludo_ctx__PIECES pp, int32_t *ee, int32_t *ii);
extern void Ludo__getTurn(Ludo_ctx__COLORS *cc);
extern void Ludo__getNumWinners(int32_t *nn);
extern void Ludo__getPlacement(int32_t nn, Ludo_ctx__COLORS *cc);
extern void Ludo__pre_pickColor(Ludo_ctx__COLORS cc, bool *rr);
extern void Ludo__pre_unpickColor(Ludo_ctx__COLORS cc, bool *rr);
extern void Ludo__pre_initGame(bool *rr);
extern void Ludo__pre_free(Ludo_ctx__PIECES pp, bool *rr);
extern void Ludo__pre_rollDice(bool *rr);
extern void Ludo__pre_nextTurn(bool *rr);
extern void Ludo__pre_walk(Ludo_ctx__PIECES pp, bool *rr);
extern void Ludo__pre_finishGame(bool *rr);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Ludo_h */
