#ifndef _Random_h
#define _Random_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */

/* Clause CONCRETE_VARIABLES */

extern void Random__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Random__getRandomInt(int32_t n1, int32_t n2, int32_t *vv);

extern void Random__mockValue(int vv);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Random_h */
