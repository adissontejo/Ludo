# Nome do executável
TARGET = ludo

# Compilador
CC = gcc

# Arquivos de código-fonte
SRC = $(wildcard *.c)

# Arquivos objeto (automaticamente gerados)
OBJ = $(SRC:.c=.o)

# Regra principal: cria o executável
$(TARGET): $(OBJ)
	$(CC) -o $(TARGET) $(OBJ) -lncurses

# Regra para compilar um arquivo .c em .o
%.o: %.c
	$(CC) -c $< -o $@ -lncurses

# Regra para limpar os arquivos gerados
clean:
	rm -f $(OBJ) $(TARGET)
