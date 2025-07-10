#ifndef _Ludo_turn_h
#define _Ludo_turn_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
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

extern void Ludo_turn__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Ludo_turn__pickColor(Ludo_ctx__COLORS cc);
extern void Ludo_turn__unpickColor(Ludo_ctx__COLORS cc);
extern void Ludo_turn__initGame(void);
extern void Ludo_turn__computeAction(bool extraTurn, bool finished);
extern void Ludo_turn__nextTurn(void);
extern void Ludo_turn__rollDice(int32_t *value);
extern void Ludo_turn__endGame(void);
extern void Ludo_turn__getDiceValue(int32_t *value);
extern void Ludo_turn__getColor(Ludo_ctx__COLORS *cc);
extern void Ludo_turn__numWinners(int32_t *nn);
extern void Ludo_turn__placement(int32_t nn, Ludo_ctx__COLORS *cc);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Ludo_turn_h */
