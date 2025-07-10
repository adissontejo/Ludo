/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Ludo.h"

/* Clause SEES */
#include "Ludo_ctx.h"

/* Clause IMPORTS */
#include "Ludo_board.h"
#include "Ludo_turn.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause LOCAL_OPERATIONS */

static void Ludo__stepsToFinish(Ludo_ctx__PIECES piece, int32_t *nn);
static void Ludo__isFinished(Ludo_ctx__COLORS cc, bool *bb);
static void Ludo__canFree(Ludo_ctx__PIECES pp, bool *bb);
static void Ludo__isPathFree(int32_t n1, int32_t n2, bool *bb);
static void Ludo__canWalk(Ludo_ctx__PIECES pp, bool *bb);
/* Clause INITIALISATION */
void Ludo__INITIALISATION(void)
{
    
    Ludo_board__INITIALISATION();
    Ludo_turn__INITIALISATION();
}

/* Clause OPERATIONS */

void Ludo__stepsToFinish(Ludo_ctx__PIECES piece, int32_t *nn)
{
    int32_t externalPos;
    int32_t internalPos;
    
    Ludo_board__getPos(piece, &externalPos, &internalPos);
    (*nn) = ((Ludo_ctx__startPoint[Ludo_ctx__colorOf[piece]]+Ludo_ctx__numExternal-2) % Ludo_ctx__numExternal-externalPos+Ludo_ctx__numExternal) % Ludo_ctx__numExternal;
}

void Ludo__isFinished(Ludo_ctx__COLORS cc, bool *bb)
{
    (*bb) = true;
    {
        int32_t ii;
        Ludo_ctx__PIECES piece;
        Ludo_ctx__COLORS pieceColor;
        int32_t dummy;
        int32_t pos;
        int32_t endPos;
        
        ii = 0;
        endPos = Ludo_ctx__numInternal-1;
        while(((ii) < (Ludo_ctx__numPieces)) &&
        ((*bb) == true))
        {
            piece = Ludo_ctx__piecesOrder[ii];
            pieceColor = Ludo_ctx__colorOf[piece];
            Ludo_board__getPos(piece, &dummy, &pos);
            if((pieceColor == cc) &&
            ((pos) != (endPos)))
            {
                (*bb) = false;
            }
            ii = ii+1;
        }
    }
}

void Ludo__canFree(Ludo_ctx__PIECES pp, bool *bb)
{
    (*bb) = true;
}

void Ludo__isPathFree(int32_t n1, int32_t n2, bool *bb)
{
    unsigned int i = 0;
    {
        int32_t countPerPos[Ludo_ctx__numExternal+1];
        int32_t ii;
        Ludo_ctx__PIECES piece;
        int32_t pos;
        int32_t dummy;
        int32_t numSteps;
        int32_t count;
        
        for(i = 0; i <= Ludo_ctx__numExternal;i++)
        {
            countPerPos[i] = 0;
        }
        ii = 0;
        while((ii) < (Ludo_ctx__numPieces))
        {
            piece = Ludo_ctx__piecesOrder[ii];
            Ludo_board__getPos(piece, &pos, &dummy);
            countPerPos[pos] = countPerPos[pos]+1;
            ii = ii+1;
        }
        ii = 1;
        numSteps = (n2-n1+Ludo_ctx__numExternal) % Ludo_ctx__numExternal;
        (*bb) = true;
        while(((ii) <= (numSteps)) &&
        ((*bb) == true))
        {
            count = countPerPos[(n1+ii) % Ludo_ctx__numExternal];
            if((count) >= (2))
            {
                (*bb) = false;
            }
            ii = ii+1;
        }
    }
}

void Ludo__canWalk(Ludo_ctx__PIECES pp, bool *bb)
{
    (*bb) = true;
}

void Ludo__startGame(void)
{
    Ludo_turn__initGame();
    Ludo_board__clear();
}

void Ludo__free(Ludo_ctx__PIECES pp)
{
    Ludo_turn__computeAction(false, false);
    Ludo_board__setFree(pp);
}

void Ludo__throwDice(int32_t *vv)
{
    Ludo_turn__rollDice(vv);
}

void Ludo__skipTurn(void)
{
    Ludo_turn__nextTurn();
}

void Ludo__walk(Ludo_ctx__PIECES pp)
{
    int32_t externalPos;
    int32_t internalPos;
    int32_t diceValue;
    int32_t nn;
    int32_t newPos;
    int32_t endPos;
    bool atePiece;
    bool finished;
    
    Ludo_board__getPos(pp, &externalPos, &internalPos);
    Ludo_turn__getDiceValue(&diceValue);
    Ludo__stepsToFinish(pp, &nn);
    if((((externalPos) != (-1)) &&
        ((diceValue) <= (nn))))
    {
        newPos = (diceValue+externalPos) % Ludo_ctx__numExternal;
        Ludo_board__setExternalPos(pp, newPos, &atePiece);
        Ludo_turn__computeAction(atePiece, false);
    }
    else
    {
        if((externalPos) != (-1))
        {
            newPos = diceValue-nn-1;
        }
        else
        {
            newPos = diceValue+internalPos;
        }
        Ludo_board__setInternalPos(pp, newPos);
        endPos = Ludo_ctx__numInternal-1;
        if(newPos == endPos)
        {
            Ludo__isFinished(Ludo_ctx__colorOf[pp], &finished);
            if(finished == true)
            {
                Ludo_turn__computeAction(false, true);
            }
            else
            {
                Ludo_turn__computeAction(true, false);
            }
        }
    }
}

void Ludo__getPiecePos(Ludo_ctx__PIECES pp, int32_t *ee, int32_t *ii)
{
    Ludo_board__getPos(pp, ee, ii);
}

void Ludo__getTurn(Ludo_ctx__COLORS *cc)
{
    Ludo_turn__getColor(cc);
}

void Ludo__getNumWinners(int32_t *nn)
{
    Ludo_turn__numWinners(nn);
}

void Ludo__getPlacement(int32_t nn, Ludo_ctx__COLORS *cc)
{
    Ludo_turn__placement(nn, cc);
}

void Ludo__pre_pickColor(Ludo_ctx__COLORS cc, bool *rr)
{
    (*rr) = true;
}

void Ludo__pre_unpickColor(Ludo_ctx__COLORS cc, bool *rr)
{
    (*rr) = true;
}

void Ludo__pre_initGame(bool *rr)
{
    (*rr) = true;
}

void Ludo__pre_free(Ludo_ctx__PIECES pp, bool *rr)
{
    (*rr) = true;
}

void Ludo__pre_rollDice(bool *rr)
{
    (*rr) = true;
}

void Ludo__pre_walk(Ludo_ctx__PIECES pp, bool *rr)
{
    (*rr) = true;
}

void Ludo__pre_nextTurn(bool *rr)
{
    (*rr) = true;
}

void Ludo__pre_finishGame(bool *rr)
{
    (*rr) = true;
}

