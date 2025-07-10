#include <ncurses.h>

typedef enum Color {
    RED,
    GREEN,
    YELLOW,
    BLUE,
    WHITE,
    OTHER,
} Color;

void init_colors() {
    start_color();
    init_pair(1, COLOR_WHITE, COLOR_RED);
    init_pair(2, COLOR_WHITE, COLOR_GREEN);
    init_pair(3, COLOR_BLACK, COLOR_YELLOW);
    init_pair(4, COLOR_WHITE, COLOR_CYAN);    // Azul como CIANO
    init_pair(5, COLOR_BLACK, COLOR_WHITE);
    init_pair(6, COLOR_WHITE, COLOR_BLACK);
}

void get_cell_data(int row, int col, int* external_pos, int* internal_pos, int* lock_piece, Color* color, int* is_house) {
    *external_pos = -1;
    *internal_pos = -1;
    *lock_piece = -1;
    *is_house = 0;

    if (row < 6 && col < 6) {
        *color = RED;
        if ((row == 1 || row == 4) && (col == 1 || col == 4)) {
            *lock_piece = (row == 4) * 2 + (col == 4);
        }
    } else if (row < 6 && col > 8) {
        *color = GREEN;
        if ((row == 1 || row == 4) && (col == 10 || col == 13)) {
            *lock_piece = (row == 4) * 2 + (col == 13) + 4;
        }
    } else if (row > 8 && col > 8) {
        *color = YELLOW;
        if ((row == 10 || row == 13) && (col == 10 || col == 13)) {
            *lock_piece = (row == 13) * 2 + (col == 13) + 8;
        }
    } else if (row > 8 && col < 6) {
        *color = BLUE;
        if ((row == 10 || row == 13) && (col == 1 || col == 4)) {
            *lock_piece = (row == 13) * 2 + (col == 4) + 12;
        }
    } else if (row == 7 && col >= 1 && col <= 6 || row == 6 && col == 1) {
        *color = RED;
        *is_house = 1;
    } else if (col == 7 && row >= 1 && row <= 6 || col == 8 && row == 1) {
        *color = GREEN;
        *is_house = 1;
    } else if (row == 7 && col >= 8 && col <= 13 || row == 8 && col == 13) {
        *color = YELLOW;
        *is_house = 1;
    } else if (col == 7 && row >= 8 && row <= 13 || col == 6 && row == 13) {
        *color = BLUE;
        *is_house = 1;
    } else if (row >= 6 && row <= 8 && col >= 6 && col <= 8) {
        *color = OTHER;
    } else {
        *color = WHITE;
        *is_house = 1;
    }
}

void print_cell(WINDOW *win, Color color, int is_house, char p1, char p2) {
    int color_pair = 6;
    switch (color) {
        case RED: color_pair = 1; break;
        case GREEN: color_pair = 2; break;
        case YELLOW: color_pair = 3; break;
        case BLUE: color_pair = 4; break;
        case WHITE: color_pair = 5; break;
        default: color_pair = 6; break;
    }

    wattron(win, COLOR_PAIR(color_pair));
    if (is_house)
        wprintw(win, "[%c%c]", p1, p2);
    else
        wprintw(win, " %c%c ", p1, p2);
    wattroff(win, COLOR_PAIR(color_pair));
}

void print_ludo_board_with_pieces(WINDOW *win) {
    char colors_codes[] = {'R', 'G', 'Y', 'B'};

    for (int row = 0; row < 15; ++row) {
        wmove(win, row, 0);
        for (int col = 0; col < 15; ++col) {
            Color color;
            int external_pos, internal_pos, lock_piece, is_house;

            get_cell_data(row, col, &external_pos, &internal_pos, &lock_piece, &color, &is_house);

            char p1 = ' ', p2 = ' ';

            if (lock_piece != -1) {
                char lock_code = colors_codes[lock_piece / 4];
                if (lock_piece % 2 == 0) p2 = lock_code;
                else p1 = lock_code;
            }

            print_cell(win, color, is_house, p1, p2);
        }
    }
}

void print_menu(WINDOW *win, const char *options[], int total, int selected) {
    int y = 16;
    for (int i = 0; i < total; i++) {
        if (i == selected) {
            wattron(win, A_REVERSE);
            mvwprintw(win, y++, 0, "> %s", options[i]);
            wattroff(win, A_REVERSE);
        } else {
            mvwprintw(win, y++, 0, "  %s", options[i]);
        }
    }
}

int main() {
    initscr();
    noecho();
    cbreak();
    curs_set(0);
    keypad(stdscr, TRUE);

    init_colors();

    const char *menu[] = {
        "Iniciar Jogo",
        "Carregar Jogo",
        "Configurações",
        "Sair"
    };
    int num_options = sizeof(menu) / sizeof(menu[0]);
    int selected = 0;

    while (1) {
        clear();
        print_ludo_board_with_pieces(stdscr);
        print_menu(stdscr, menu, num_options, selected);
        refresh();

        int key = getch();

        if (key == KEY_UP) {
            selected = (selected - 1 + num_options) % num_options;
        } else if (key == KEY_DOWN) {
            selected = (selected + 1) % num_options;
        } else if (key == '\n') {
            clear();
            mvprintw(20, 0, "Você selecionou: %s", menu[selected]);
            refresh();
            getch();
            break;
        }
    }

    endwin();
    return 0;
}
