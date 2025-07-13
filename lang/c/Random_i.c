/* WARNING if type checker is not performed, translation could contain errors ! */

#include <stdlib.h>
#include <time.h>
#include "Random.h"

int mocked_value = -1;

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void Random__INITIALISATION(void)
{
    srand(time(NULL));
}

/* Clause OPERATIONS */

void Random__getRandomInt(int32_t n1, int32_t n2, int32_t *vv)
{
    // Real:
    //(*vv) = n1 + rand() % (n2 - n1 + 1);
    // Mocked:

    (*vv) = n1 + (mocked_value != -1 ? mocked_value : rand()) % (n2 - n1 + 1);
    mocked_value = -1;
}

void Random__mockValue(int vv) {
    mocked_value = vv;
}

