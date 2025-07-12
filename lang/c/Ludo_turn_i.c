/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Ludo_turn.h"

/* Clause SEES */
#include "Ludo_ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool Ludo_turn__gameStarted;
static bool Ludo_turn__colorEnabled[Ludo_ctx__COLORS__max+1];
static Ludo_ctx__COLORS Ludo_turn__color;
static bool Ludo_turn__hasRoll;
static int32_t Ludo_turn__diceValue;
static int32_t Ludo_turn__sixSequenceCount;
static Ludo_ctx__COLORS Ludo_turn__finishList[4];
static int32_t Ludo_turn__finishCount;
/* Clause LOCAL_OPERATIONS */

static void Ludo_turn__isColorFinished(Ludo_ctx__COLORS cc, bool *bb);
static void Ludo_turn__turnIndex(int32_t *nn);
/* Clause INITIALISATION */
void Ludo_turn__INITIALISATION(void)
{
    
    unsigned int i = 0;
    Ludo_turn__gameStarted = false;
    for(i = 0; i <= Ludo_ctx__COLORS__max-1;i++)
    {
        Ludo_turn__colorEnabled[i] = false;
    }
    Ludo_turn__color = Ludo_ctx__colorsOrder[0];
    Ludo_turn__hasRoll = false;
    Ludo_turn__diceValue = 0;
    Ludo_turn__sixSequenceCount = 0;
    memmove(Ludo_turn__finishList,Ludo_ctx__colorsOrder,(4)* sizeof(Ludo_ctx__COLORS));
    Ludo_turn__finishCount = 0;
}

/* Clause OPERATIONS */

void Ludo_turn__isColorFinished(Ludo_ctx__COLORS cc, bool *bb)
{
    {
        int32_t ii;
        Ludo_ctx__COLORS color;
        
        ii = 0;
        (*bb) = false;
        while(((ii) < (Ludo_turn__finishCount)) &&
        ((*bb) == false))
        {
            color = Ludo_turn__finishList[ii];
            (*bb) = ((color == cc) ? true : false);
            ii = ii+1;
        }
    }
}

void Ludo_turn__turnIndex(int32_t *nn)
{
    {
        int32_t ii;
        int32_t maxII;
        bool isColorTurn;
        Ludo_ctx__COLORS cc;
        
        ii = 1;
        maxII = Ludo_ctx__numColors-1;
        cc = Ludo_ctx__colorsOrder[ii];
        isColorTurn = ((cc == Ludo_turn__color) ? true : false);
        while(((ii) < (maxII)) &&
        (isColorTurn == false))
        {
            ii = ii+1;
            cc = Ludo_ctx__colorsOrder[ii];
            isColorTurn = ((cc == Ludo_turn__color) ? true : false);
        }
        (*nn) = ii;
    }
}

void Ludo_turn__pickColor(Ludo_ctx__COLORS cc)
{
    Ludo_turn__colorEnabled[cc] = true;
}

void Ludo_turn__unpickColor(Ludo_ctx__COLORS cc)
{
    Ludo_turn__colorEnabled[cc] = false;
}

void Ludo_turn__initGame(void)
{
    Ludo_turn__gameStarted = true;
    {
        int32_t ii;
        bool isEnabled;
        
        ii = 0;
        isEnabled = Ludo_turn__colorEnabled[Ludo_ctx__colorsOrder[ii]];
        while(isEnabled == false)
        {
            ii = ii+1;
            isEnabled = Ludo_turn__colorEnabled[Ludo_ctx__colorsOrder[ii]];
        }
        Ludo_turn__color = Ludo_ctx__colorsOrder[ii];
    }
    Ludo_turn__hasRoll = true;
    Ludo_turn__diceValue = 0;
    Ludo_turn__sixSequenceCount = 0;
    memmove(Ludo_turn__finishList,Ludo_ctx__colorsOrder,(4)* sizeof(Ludo_ctx__COLORS));
    Ludo_turn__finishCount = 0;
}

void Ludo_turn__computeAction(bool extraTurn, bool finished)
{
    Ludo_turn__diceValue = 0;
    if(finished == true)
    {
        Ludo_turn__finishList[Ludo_turn__finishCount] = Ludo_turn__color;
        Ludo_turn__finishCount = Ludo_turn__finishCount+1;
        Ludo_turn__hasRoll = false;
    }
    else if(extraTurn == true)
    {
        Ludo_turn__hasRoll = true;
    }
}

void Ludo_turn__nextTurn(void)
{
    {
        int32_t numJumps;
        Ludo_ctx__COLORS cc;
        bool isFinished;
        int32_t currentIndex;
        bool enabled;
        
        Ludo_turn__turnIndex(&currentIndex);
        numJumps = 1;
        cc = Ludo_ctx__colorsOrder[(currentIndex+1) % Ludo_ctx__numColors];
        enabled = Ludo_turn__colorEnabled[cc];
        Ludo_turn__isColorFinished(cc, &isFinished);
        while(((numJumps) < (Ludo_ctx__numColors)) &&
        (((enabled == false) ||
                (isFinished == true))))
        {
            numJumps = numJumps+1;
            cc = Ludo_ctx__colorsOrder[(currentIndex+numJumps) % Ludo_ctx__numColors];
            Ludo_turn__isColorFinished(cc, &isFinished);
            enabled = Ludo_turn__colorEnabled[cc];
        }
        Ludo_turn__hasRoll = true;
        Ludo_turn__sixSequenceCount = 0;
        Ludo_turn__diceValue = 0;
        Ludo_turn__color = Ludo_ctx__colorsOrder[(currentIndex+numJumps) % Ludo_ctx__numColors];
    }
}

void Ludo_turn__rollDice(int32_t *value)
{
    {
        int32_t dd;
        
        dd = 5;
        (*value) = dd;
        if(dd == 6)
        {
            if((Ludo_turn__sixSequenceCount) < (2))
            {
                Ludo_turn__sixSequenceCount = Ludo_turn__sixSequenceCount+1;
                Ludo_turn__diceValue = dd;
            }
            else
            {
                Ludo_turn__sixSequenceCount = 0;
                Ludo_turn__hasRoll = false;
                Ludo_turn__diceValue = 0;
            }
        }
        else
        {
            Ludo_turn__hasRoll = false;
            Ludo_turn__diceValue = dd;
        }
    }
}

void Ludo_turn__endGame(void)
{
    Ludo_turn__gameStarted = false;
}

void Ludo_turn__getDiceValue(int32_t *value)
{
    (*value) = Ludo_turn__diceValue;
}

void Ludo_turn__getColor(Ludo_ctx__COLORS *cc)
{
    (*cc) = Ludo_turn__color;
}

void Ludo_turn__numWinners(int32_t *nn)
{
    (*nn) = Ludo_turn__finishCount;
}

void Ludo_turn__placement(int32_t nn, Ludo_ctx__COLORS *cc)
{
    (*cc) = Ludo_turn__finishList[nn];
}

void Ludo_turn__getGameStarted(bool *bb)
{
    (*bb) = Ludo_turn__gameStarted;
}

void Ludo_turn__getHasRoll(bool *bb)
{
    (*bb) = Ludo_turn__hasRoll;
}

void Ludo_turn__isColorEnabled(Ludo_ctx__COLORS cc, bool *bb)
{
    (*bb) = Ludo_turn__colorEnabled[cc];
}

void Ludo_turn__getFinishCount(int32_t *nn)
{
    (*nn) = Ludo_turn__finishCount;
}

