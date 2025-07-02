/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Ludo_board.h"

/* Clause SEES */
#include "Ludo_ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static int32_t Ludo_board__externalBoard[Ludo_ctx__PIECES__max+1];
static int32_t Ludo_board__internalBoard[Ludo_ctx__PIECES__max+1];
/* Clause INITIALISATION */
void Ludo_board__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= Ludo_ctx__PIECES__max-1;i++)
    {
        Ludo_board__externalBoard[i] = -1;
    }
    for(i = 0; i <= Ludo_ctx__PIECES__max-1;i++)
    {
        Ludo_board__internalBoard[i] = -1;
    }
}

/* Clause OPERATIONS */

void Ludo_board__clear(void)
{
    unsigned int i = 0;
    {
        for(i = 0; i <= Ludo_ctx__PIECES__max-1;i++)
        {
            Ludo_board__externalBoard[i] = -1;
        }
        for(i = 0; i <= Ludo_ctx__PIECES__max-1;i++)
        {
            Ludo_board__internalBoard[i] = -1;
        }
    }
}

void Ludo_board__setFree(Ludo_ctx__PIECES pp)
{
    Ludo_board__externalBoard[pp] = 0;
}

void Ludo_board__setExternalPos(Ludo_ctx__PIECES pp, int32_t nn)
{
    {
        int32_t rest;
        Ludo_ctx__COLORS currentColor;
        bool hasOtherColor;
        Ludo_ctx__COLORS otherColor;
        int32_t otherPos;
        int32_t ii;
        
        rest = nn % 13;
        if(((rest) != (0)) &&
        ((rest) != (8)))
        {
            ii = 0;
            currentColor = Ludo_ctx__colorOf[pp];
            hasOtherColor = false;
            while(((ii) < (Ludo_ctx__numPieces)) &&
            (hasOtherColor == false))
            {
                otherColor = Ludo_ctx__colorOf[Ludo_ctx__piecesOrder[ii]];
                otherPos = Ludo_board__externalBoard[Ludo_ctx__piecesOrder[ii]];
                if(((otherColor) != (currentColor)) &&
                (otherPos == nn))
                {
                    Ludo_board__externalBoard[Ludo_ctx__piecesOrder[ii]] = -1;
                    hasOtherColor = true;
                }
                ;
                ii = ii+1;
            }
        }
    }
    Ludo_board__externalBoard[pp] = nn;
}

void Ludo_board__setInternalPos(Ludo_ctx__PIECES pp, int32_t nn)
{
    Ludo_board__externalBoard[pp] = -1;
    Ludo_board__internalBoard[pp] = nn;
}

void Ludo_board__isFinished(Ludo_ctx__COLORS color, bool *bb)
{
    (*bb) = true;
    {
        int32_t ii;
        Ludo_ctx__PIECES piece;
        Ludo_ctx__COLORS pieceColor;
        int32_t piecePos;
        int32_t endPos;
        
        ii = 0;
        endPos = Ludo_ctx__numInternal-1;
        while(((ii) < (Ludo_ctx__numPieces)) &&
        ((*bb) == true))
        {
            piece = Ludo_ctx__piecesOrder[ii];
            pieceColor = Ludo_ctx__colorOf[piece];
            piecePos = Ludo_board__internalBoard[piece];
            if((pieceColor == color) &&
            ((piecePos) != (endPos)))
            {
                (*bb) = false;
            }
            ii = ii+1;
        }
    }
}

