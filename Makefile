INC_DIR = ./include
SRC_DIR = ./src
OBJ_DIR = ./build
LIB_DIR = ./lib

CC = g++
CFLAGS = -Wall -pedantic -std=c++11 -ansi -I. -I$(INC_DIR)
ARCHIVE = ar

linux: minhalib.a minhalib.so prog_estatico prog_dinamico

windows: minhalib.lib minhalib.dll prog_estatico.exe prog_dinamico.exe

#LINUX

minhalib.a: $(SRC_DIR)/funcoes1.cpp $(SRC_DIR)/funcoes2.cpp $(INC_DIR)/minhalib.h
		$(CC) $(CFLAGS) -c $(SRC_DIR)/funcoes1.cpp -o $(OBJ_DIR)/funcoes1.o
		$(CC) $(CFLAGS) -c $(SRC_DIR)/funcoes2.cpp -o $(OBJ_DIR)/funcoes2.o
		$(AR) rcs $(LIB_DIR)/$@ $(OBJ_DIR)/funcoes1.o $(OBJ_DIR)/funcoes2.o
		@echo "+++ [Biblioteca estatica criada em $(LIB_DIR)/$@] +++"

minhalib.so: $(SRC_DIR)/funcoes1.cpp $(SRC_DIR)/funcoes2.cpp $(INC_DIR)/minhalib.h
		$(CC) $(CFLAGS) -fPIC -c $(SRC_DIR)/funcoes1.cpp -o $(OBJ_DIR)/funcoes1.o
		$(CC) $(CFLAGS) -fPIC -c $(SRC_DIR)/funcoes2.cpp -o $(OBJ_DIR)/funcoes2.o
		$(CC) -shared -fPIC -o $(LIB_DIR)/$@ $(OBJ_DIR)/funcoes1.o $(OBJ_DIR)/funcoes2.o
		@echo "+++ [Biblioteca dinamica criada em $(LIB_DIR)/$@] +++"

prog_estatico:
	$(CC) $(CFLAGS) $(SRC_DIR)/main.cpp $(LIB_DIR)/minhalib.a -o $(OBJ_DIR)/$@

prog_dinamico:
	$(CC) $(CFLAGS) $(SRC_DIR)/main.cpp $(LIB_DIR)/minhalib.so -o $(OBJ_DIR)/$@

#WINDOWS

minhalib.lib: $(SRC_DIR)/funcoes1.cpp $(SRC_DIR)/funcoes2.cpp $(INC_DIR)/minhalib.h
		$(CC) $(CFLAGS) -c $(SRC_DIR)/funcoes1.cpp -o $(OBJ_DIR)/funcoes1.o
		$(CC) $(CFLAGS) -c $(SRC_DIR)/funcoes2.cpp -o $(OBJ_DIR)/funcoes2.o
		$(AR) rcs $(LIB_DIR)/$@ $(OBJ_DIR)/funcoes1.o $(OBJ_DIR)/funcoes2.o
		@echo "+++ [Biblioteca estatica criada em $(LIB_DIR)/$@] +++"

minhalib.dll: $(SRC_DIR)/funcoes1.cpp $(SRC_DIR)/funcoes2.cpp $(INC_DIR)/minhalib.h
		$(CC) $(CFLAGS) -c $(SRC_DIR)/funcoes1.cpp -o $(OBJ_DIR)/funcoes1.o
		$(CC) $(CFLAGS) -c $(SRC_DIR)/funcoes2.cpp -o $(OBJ_DIR)/funcoes2.o
		$(CC) -shared -o $(LIB_DIR)/$@ $(OBJ_DIR)/funcoes1.o $(OBJ_DIR)/funcoes2.o
		@echo "+++ [Biblioteca dinamica criada em $(LIB_DIR)/$@] +++"

prog_estatico.exe:
	$(CC) $(CFLAGS) $(SRC_DIR)/main.cpp $(LIB_DIR)/minhalib.lib -o $(OBJ_DIR)/$@

prog_dinamico.exe:
	$(CC) $(CFLAGS) $(SRC_DIR)/main.cpp $(LIB_DIR)/minhalib.dll -o $(OBJ_DIR)/$@

clean:
	@echo "Removendo arquivos objeto e executaveis/binarios..."
	@rm -rf $(OBJ_DIR)/*

