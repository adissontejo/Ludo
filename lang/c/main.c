#include <stdio.h>
#include <stdlib.h>
#include <ncurses.h>
#include "Ludo_ctx.h"
#include "Ludo.h"

#define MAX_ACTIONS 100

typedef enum ActionKey {
    PICK_COLOR,
    UNPICK_COLOR,
    START_GAME,
    ROLL_DICE,
    WALK,
    FREE,
    NEXT_TURN,
    FINISH_GAME,
} ActionKey;

typedef struct Action {
    ActionKey key;
    int color;
    int piece;
} Action;

const char *color_names[] = {"Vermelho", "Verde", "Amarelo", "Azul"};
int selected = 0;
Action available_actions[MAX_ACTIONS];

void init_colors() {
    start_color();
    use_default_colors();
    init_color(COLOR_RED, 1000, 0, 0);
    init_color(COLOR_GREEN, 0, 1000, 0);
    init_color(COLOR_YELLOW, 1000, 1000, 0);
    init_color(COLOR_BLUE, 0, 0, 1000);
    init_color(COLOR_YELLOW + 100, 900, 800, 0);
    init_pair(1, COLOR_YELLOW + 100, COLOR_RED);
    init_pair(2, COLOR_WHITE, COLOR_GREEN);
    init_pair(3, COLOR_WHITE, COLOR_YELLOW);
    init_pair(4, COLOR_WHITE, COLOR_BLUE);
    init_pair(5, COLOR_BLACK, COLOR_WHITE);
    init_pair(6, COLOR_WHITE, COLOR_BLACK);
    init_pair(7, COLOR_WHITE, COLOR_YELLOW + 100);
    init_pair(8, COLOR_CYAN, -1);
}

int get_external_pos(int row, int col) {
    static const int path[52][2] = {
        {6, 1}, {6, 2}, {6, 3}, {6, 4}, {6, 5},
        {5, 6}, {4, 6}, {3, 6}, {2, 6}, {1, 6}, {0, 6},         // sobe até o topo
        {0, 7}, {0, 8},                                        // vira à direita
        {1, 8}, {2, 8}, {3, 8}, {4, 8}, {5, 8},                // desce
        {6, 9}, {6, 10}, {6, 11}, {6, 12}, {6, 13}, {6, 14},   // vai até a direita
        {7, 14}, {8, 14},                                      // vira para baixo
        {8, 13}, {8, 12}, {8, 11}, {8, 10}, {8, 9},            // vai para esquerda
        {9, 8}, {10, 8}, {11, 8}, {12, 8}, {13, 8}, {14, 8},   // desce até embaixo
        {14, 7}, {14, 6},                                      // vira à esquerda
        {13, 6}, {12, 6}, {11, 6}, {10, 6}, {9, 6},            // sobe
        {8, 5}, {8, 4}, {8, 3}, {8, 2}, {8, 1}, {8, 0},        // vai até a esquerda
        {7, 0}, {6, 0}                                         // vira para cima
    };

    for (int i = 0; i < 52; i++) {
        if (path[i][0] == row && path[i][1] == col) {
            return i;
        }
    }

    return -1; // não é uma casa externa
}

int get_internal_pos(int row, int col) {
    // Vermelho (esquerda → centro)
    if (row == 7 && col >= 1 && col <= 6) {
        return col - 1; // (7,1) → 0 até (7,6) → 5
    }

    // Verde (cima → centro)
    if (col == 7 && row >= 1 && row <= 6) {
        return row - 1; // (1,7) → 0 até (6,7) → 5
    }

    // Amarelo (direita → centro)
    if (row == 7 && col >= 8 && col <= 13) {
        return 13 - col; // (13) → 0, (12) → 1, ..., (8) → 5
    }

    // Azul (baixo → centro)
    if (col == 7 && row >= 8 && row <= 13) {
        return 13 - row; // (13,7) → 0 até (8,7) → 5
    }

    return -1; // não é uma casa do caminho interno
}

void get_cell_data(int row, int col, int* external_pos, int* internal_pos, int* lock_piece, int* color) {
    *external_pos = get_external_pos(row, col);
    *internal_pos = get_internal_pos(row, col);
    *lock_piece = -1;
    *color = -1;

    // Casas vermelhas
    if (row < 6 && col < 6 || row == 7 && col >= 1 && col <= 6 || row == 6 && col == 1) {
        *color = 0;
        if ((row == 1 || row == 4) && (col == 1 || col == 4)) {
            *lock_piece = (row == 4) * 2 + (col == 4);
        }
    }
    // Casas verdes
    else if (row < 6 && col > 8 || col == 7 && row >= 1 && row <= 6 || col == 8 && row == 1) {
        *color = 1;
        if ((row == 1 || row == 4) && (col == 10 || col == 13)) {
            *lock_piece = (row == 4) * 2 + (col == 13) + 4;
        }
    }
    // Casas amarelas
    else if (row > 8 && col > 8 || row == 7 && col >= 8 && col <= 13 || row == 8 && col == 13) {
        *color = 2;
        if ((row == 10 || row == 13) && (col == 10 || col == 13)) {
            *lock_piece = (row == 13) * 2 + (col == 13) + 8;
        }
    }
    // Casas azuis
    else if (row > 8 && col < 6 || col == 7 && row >= 8 && row <= 13 || col == 6 && row == 13) {
        *color = 3;
        if ((row == 10 || row == 13) && (col == 1 || col == 4)) {
            *lock_piece = (row == 13) * 2 + (col == 4) + 12;
        }
    }
}

void get_selectable_pieces(int external_pos, int internal_pos, int lock_piece, int color, int* p1, int* p2, int* count) {
    *p1 = -1;
    *p2 = -1;
    *count = 0;

    for (int i = 0; i < 16; i++) {
        int ee, ii;

        Ludo__getPiecePos(i, &ee, &ii);

        int selectable = 0;

        if (external_pos != -1)
            selectable = (ee == external_pos);
        else if (internal_pos != -1)
            selectable = (color == Ludo_ctx__colorOf[i] && ii == internal_pos);
        else if (lock_piece != -1)
            selectable = (ee == -1 && ii == -1 && i == lock_piece);

        if (selectable) {
            if (*p1 == -1) {
                *p1 = i;
                *count = 1;
            } else if (Ludo_ctx__colorOf[*p1] != Ludo_ctx__colorOf[i]) {
                *p2 = i;
                return;
            } else {
                *count += 1;
            }
        }
    }
}

int push_piece_action(int* selection_offset, int piece) {
    bool can_free, can_walk;

    Ludo__pre_free(piece, &can_free);
    Ludo__pre_walk(piece, &can_walk);

    int code = *selection_offset;

    if (can_free) {
        available_actions[code].key = FREE;
        available_actions[code].piece = piece;
        *selection_offset += 1;
        return code;
    } else if (can_walk) {
        available_actions[code].key = WALK;
        available_actions[code].piece = piece;
        *selection_offset += 1;
        return code;
    } else {
        return -1;
    }
}

void print_ludo_board_with_pieces(WINDOW *win, int* row_offset, int* selection_offset) {
    char colors_codes[] = {'R', 'G', 'Y', 'B'};

    int is_locked[16];
    int external_count[52][4];
    int internal_count[6][4];

    memset(is_locked, 0, sizeof(int) * 16);
    memset(external_count, 0, sizeof(int) * 52 * 4);
    memset(internal_count, 0, sizeof(int) * 6 * 4);

    for (int row = 0; row < 15; ++row) {
        wmove(win, row, 0);
        for (int col = 0; col < 15; ++col) {
            int color;
            int external_pos, internal_pos, lock_piece;

            get_cell_data(row, col, &external_pos, &internal_pos, &lock_piece, &color);

            int p1, p2, count;

            get_selectable_pieces(external_pos, internal_pos, lock_piece, color, &p1, &p2, &count);

            int p1_code = p1 != -1 ? push_piece_action(selection_offset, p1) : -1;
            int p2_code = p2 != -1 ? push_piece_action(selection_offset, p2) : -1;

            char p1_char = p1 != -1 ? colors_codes[Ludo_ctx__colorOf[p1]] : ' ';
            char p2_char =
                count > 1
                    ? count + '0'
                    : (p2 != -1 ? colors_codes[Ludo_ctx__colorOf[p2]] : ' ');

            if (lock_piece != -1 && lock_piece % 2 == 0) {
                p2_char = p1_char;
                p1_char = ' ';
            }

            int color_pair;
            int is_house = (external_pos != -1) || (internal_pos != -1);
            int is_safe_house = external_pos != -1 && external_pos % 13 == 8;
            int is_selected = p1_code == selected || p2_code == selected;

            if (is_selected) {
                color_pair = 8;
            } else if (is_safe_house) {
                color_pair = 7;
            } else if (color != -1) {
                color_pair = color + 1;
            } else if (is_house) {
                color_pair = 5;
            } else {
                color_pair = 6;
            }

            int attrs = COLOR_PAIR(color_pair) | A_BOLD;

            wattron(win, attrs);
            if (is_house)
                wprintw(win, "[%c%c]", p1_char, p2_char);
            else
                wprintw(win, " %c%c ", p1_char, p2_char);
            wattroff(win, attrs);
        }
    }

    *row_offset += 16;
}


void print_colors_selector(WINDOW *win, int* row_offset, int* selection_offset) {
    int is_picking_colors = 0;

    for (int i = 0; i < Ludo_ctx__numColors; i++) {
        bool can_pick, can_unpick;

        Ludo__pre_pickColor(i, &can_pick);
        Ludo__pre_unpickColor(i, &can_unpick);

        if (can_pick || can_unpick) {
            is_picking_colors = 1;
            break;
        }
    }

    if (!is_picking_colors) {
        return;
    }

    int line = *row_offset;
    int selected_color = selected - *selection_offset;

    mvwprintw(win, line, 2, "Selecione duas ou mais cores para iniciar o jogo:");

    for (int i = 0; i < Ludo_ctx__numColors; i++) {
        int code = *selection_offset + i;
        bool is_picked;
        Ludo__pre_unpickColor(i, &is_picked);

        wmove(win, line + 1 + i, 2);

        if (i == selected_color) {
            wattron(win, COLOR_PAIR(8));
            wprintw(win, "> ");
        } else {
            wprintw(win, "  ");
        }

        if (is_picked) {
            wprintw(win, "[x] %s", color_names[i]);
            available_actions[code].key = UNPICK_COLOR;
        } else {
            wprintw(win, "[ ] %s", color_names[i]);
            available_actions[code].key = PICK_COLOR;
        }
        available_actions[code].color = i;

        if (i == selected_color) {
            wattroff(win, COLOR_PAIR(8));
        }
    }

    *row_offset += Ludo_ctx__numColors + 2;
    *selection_offset += 4;
}

void print_menu_action(WINDOW *win, int* row_offset, int* selection_offset, ActionKey action_key) {
    bool can_do = 0;
    char* name;

    switch (action_key) {
        case START_GAME:
            Ludo__pre_initGame(&can_do);
            name = "Iniciar jogo";
            break;
        case ROLL_DICE:
            Ludo__pre_rollDice(&can_do);
            name = "Rolar dado";
            break;
        case NEXT_TURN:
            Ludo__pre_nextTurn(&can_do);
            name = "Próximo turno";
            break;
    }

    if (can_do) {
        if (selected == *selection_offset) {
            wattron(win, COLOR_PAIR(8));
            mvwprintw(win, *row_offset, 0, "> %s", name);
            wattroff(win, COLOR_PAIR(8));
        } else {
            mvwprintw(win, *row_offset, 0, "  %s", name);
        }

        available_actions[*selection_offset].key = action_key;
        *row_offset += 1;
        *selection_offset += 1;
    }
}

void print_menu(WINDOW *win, int* row_offset, int* selection_offset) {
    print_menu_action(win, row_offset, selection_offset, START_GAME);
    print_menu_action(win, row_offset, selection_offset, ROLL_DICE);
    print_menu_action(win, row_offset, selection_offset, NEXT_TURN);
    print_menu_action(win, row_offset, selection_offset, FINISH_GAME);
}

void test() {
    Ludo__pickColor(1);
    Ludo__pickColor(2);
    Ludo__startGame();
    Ludo__skipTurn();
    Ludo__skipTurn();

    exit(0);
}

int main() {
    Ludo__INITIALISATION();

    initscr();
    noecho();
    cbreak();
    curs_set(0);
    keypad(stdscr, TRUE);

    init_colors();

    while (1) {
        int row_offset = 0;
        int selection_offset = 0;

        clear();

        print_ludo_board_with_pieces(stdscr, &row_offset, &selection_offset);
        print_colors_selector(stdscr, &row_offset, &selection_offset);
        print_menu(stdscr, &row_offset, &selection_offset);
        refresh();

        int key = getch();

        if (selection_offset == 0) {
            continue;
        }

        if (key == KEY_UP || key == KEY_LEFT) {
            selected = (selected - 1 + selection_offset) % selection_offset;
        } else if (key == KEY_DOWN || key == KEY_RIGHT) {
            selected = (selected + 1) % selection_offset;
        } else if (key == '\n') {
            Action action = available_actions[selected];

            switch (action.key) {
                case PICK_COLOR:
                    Ludo__pickColor(action.color);
                    break;
                case UNPICK_COLOR:
                    Ludo__unpickColor(action.color);
                    break;
                case START_GAME:
                    Ludo__startGame();
                    selected = 0;
                    break;
                case ROLL_DICE:
                    int v;
                    Ludo__throwDice(&v);
                    selected = 0;
                    break;
                case FREE:
                    Ludo__free(action.piece);
                    selected = 0;
                    break;
                case WALK:
                    Ludo__walk(action.piece);
                    selected = 0;
                    break;
                case NEXT_TURN:
                    Ludo__skipTurn();
                    selected = 0;
                    break;
            }
        }
    }

    endwin();
    return 0;
}
