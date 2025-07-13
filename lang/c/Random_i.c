/* WARNING if type checker is not performed, translation could contain errors ! */

#include <stdlib.h>
#include "Random.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void Random__INITIALISATION(void)
{

}

/* Clause OPERATIONS */

void Random__getRandomInt(int32_t n1, int32_t n2, int32_t *vv)
{
    (*vv) = n1 + rand() % (n2 - n1 + 1);
}

