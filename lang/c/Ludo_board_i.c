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

    {
        int32_t ii;
        Ludo_ctx__PIECES pp;

        ii = 0;
        while((ii) < (Ludo_ctx__numPieces))
        {
            pp = Ludo_ctx__piecesOrder[ii];
            Ludo_board__externalBoard[pp] = -1;
            Ludo_board__internalBoard[pp] = -1;
            ii = ii+1;
        }
    }
}

/* Clause OPERATIONS */

void Ludo_board__clear(void)
{
    {
        int32_t ii;
        Ludo_ctx__PIECES pp;

        ii = 0;
        while((ii) < (Ludo_ctx__numPieces))
        {
            pp = Ludo_ctx__piecesOrder[ii];
            Ludo_board__externalBoard[pp] = -1;
            Ludo_board__internalBoard[pp] = -1;
            ii = ii+1;
        }
    }
}

void Ludo_board__setFree(Ludo_ctx__PIECES pp)
{
    Ludo_board__externalBoard[pp] = Ludo_ctx__startPoint[Ludo_ctx__colorOf[pp]];
}

void Ludo_board__setExternalPos(Ludo_ctx__PIECES pp, int32_t nn, bool *atePiece)
{
    {
        int32_t rest;
        Ludo_ctx__COLORS currentColor;
        bool atePiece;
        Ludo_ctx__COLORS otherColor;
        int32_t otherPos;
        int32_t ii;

        rest = nn % 13;
        if(((rest) != (0)) &&
        ((rest) != (8)))
        {
            ii = 0;
            currentColor = Ludo_ctx__colorOf[pp];
            atePiece = false;
            while(((ii) < (Ludo_ctx__numPieces)) &&
            (atePiece == false))
            {
                otherColor = Ludo_ctx__colorOf[Ludo_ctx__piecesOrder[ii]];
                otherPos = Ludo_board__externalBoard[Ludo_ctx__piecesOrder[ii]];
                if(((otherColor) != (currentColor)) &&
                (otherPos == nn))
                {
                    Ludo_board__externalBoard[Ludo_ctx__piecesOrder[ii]] = -1;
                    atePiece = true;
                }
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

void Ludo_board__getPos(Ludo_ctx__PIECES pp, int32_t *ee, int32_t *ii)
{
    (*ee) = Ludo_board__externalBoard[pp];
    (*ii) = Ludo_board__internalBoard[pp];
}

