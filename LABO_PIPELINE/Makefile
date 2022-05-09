# 
# Auteur :	Florent Duployer
# Date : 	1.11.2012
#
# Description :
#
# Makefile de code assembleur pour ARM 16 bits (Thumb Code).
# Ce makefile va générer les fichiers .o, .hex ainsi que 
# le .raw directement importable dans logisim.
#
# De plus, il va générer un fichier .lss, qui contient le code
# listé avec les adresses de chaque instruction, ce qui rend
# le code plus lisible pendant la simulation.
#
# Ce makefile a pour but d'être utilisé avec les labos de 
# logisim.
#
# Note : Le code assembleur doit s'appeler main.S !
#
# Modifications:
# Sylvain Krieg, adaptation pour Linux. Necessite arm-elf-raw disponible
# dans le git prodis/dev/arm-elf-raw.
#

# Règle pour compilé en thumb code
THUMB    = -mthumb

# Compilateur ARM Assembleur
#CAS = arm-elf-as
CAS = arm-linux-gnueabihf-as

# Instruction pour copie de l'objet en .hex et en .lss
#OBJCOPY = arm-elf-objcopy
#OBJDUMP = arm-elf-objdump
OBJCOPY = arm-linux-gnueabihf-objcopy
OBJDUMP = arm-linux-gnueabihf-objdump

# Commande de création pour le fichier .raw
HEXDUMP_RAW = hexdump -v -e '8/2 "%04x " "\n"' 
HEADER_RAW=v2.0 raw\n\
\#Fichier genere automatiquement a partir\n\
\#d'un fichier de type .hex compile pour cible\n\
\#ARM en Thumb code.\n\
\#Ce fichier peut etre importe\n\
\#directement dans la RAM d'instruction du processeur\n\
\#PRODIS1 dans logisim.\n
#RAW = arm-elf-raw
#RAW = ./a.out 

#Commande pour supprimer les fichier et repértoires
REMOVE_FILE = rm -f
REMOVE_DIR = rm -r

# Définition des sources
SRC = main.S

# Définitions des fichiers à utiliser, en fonction
# de la source
OBJO = $(SRC:.S=.o)
OBJHEX = $(SRC:.S=.hex)
OBJRAW = $(SRC:.S=.raw)
OBJLSS = $(SRC:.S=.lss)

# Nom du répertoire pour les fichiers de compilation
# Inutile pour l'élève
FILENAME_REP_COMPILE = bin

all: dir_creation main

# Création du répertoire des fichiers .o et .hex
dir_creation:	
	mkdir -p $(FILENAME_REP_COMPILE)
	
# Main : Création des fichiers .o, .hex, .raw et .lss
#main: $(OBJO) $(OBJHEX) $(OBJRAW) $(OBJLSS)
main:  $(OBJRAW) $(OBJLSS)
	
# Règles pour la création de l'objet .o, à partir du .S
%.o: %.S
	$(CAS) $(THUMB) -o $(FILENAME_REP_COMPILE)\$@ $<
	$(CAS) $(THUMB) -o $@ $<

# Règle pour la création du .hex, à partir du .o
%.hex: %.o
	$(OBJCOPY) -O ihex $(FILENAME_REP_COMPILE)\$< $(FILENAME_REP_COMPILE)\$@
	$(OBJCOPY) -O ihex $(FILENAME_REP_COMPILE)\$< $@
	
# Règle pour la création du .raw, à partir du .hex
%.raw: %.hex
	$(OBJCOPY) -I ihex --output-target=binary  $< ./tmp.bin	
	printf "$(HEADER_RAW)" > $@
	$(HEXDUMP_RAW) tmp.bin >> $@
	rm -f $< ./tmp.bin
	
# Règle pour la création du .lss, à partir du .o
%.lss: %.o
	$(OBJDUMP) -h -S -M force-thumb $< > $@
	rm -f $<
	rm -f binmain.o
	rm -f main.mem
	#rm -f binmain.hex

# Supression du répertoire ainsi que de touts les fichiers
# créer par le makefile
clean:
	$(REMOVE_DIR) $(FILENAME_REP_COMPILE)
	$(REMOVE_FILE) *.raw
	$(REMOVE_FILE) *.lss
	#$(REMOVE_FILE) *.hex
    #$(REMOVE_FILE) *.o
  #$(REMOVE_FILE) *.hex
	
