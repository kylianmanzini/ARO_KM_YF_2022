# 
# Auteur :	Florent Duployer
# Date : 	1.11.2012
#
# Description :
#
# Makefile de code assembleur pour ARM 16 bits (Thumb Code).
# Ce makefile va g�n�rer les fichiers .o, .hex ainsi que 
# le .raw directement importable dans logisim.
#
# De plus, il va g�n�rer un fichier .lss, qui contient le code
# list� avec les adresses de chaque instruction, ce qui rend
# le code plus lisible pendant la simulation.
#
# Ce makefile a pour but d'�tre utilis� avec les labos de 
# logisim.
#
# Note : Le code assembleur doit s'appeler main.S !
#
# Modifications:
# Sylvain Krieg, adaptation pour Linux. Necessite arm-elf-raw disponible
# dans le git prodis/dev/arm-elf-raw.
#

# R�gle pour compil� en thumb code
THUMB    = -mthumb

# Compilateur ARM Assembleur
#CAS = arm-elf-as
CAS = arm-linux-gnueabihf-as

# Instruction pour copie de l'objet en .hex et en .lss
#OBJCOPY = arm-elf-objcopy
#OBJDUMP = arm-elf-objdump
OBJCOPY = arm-linux-gnueabihf-objcopy
OBJDUMP = arm-linux-gnueabihf-objdump

# Commande de cr�ation pour le fichier .raw
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

#Commande pour supprimer les fichier et rep�rtoires
REMOVE_FILE = rm -f
REMOVE_DIR = rm -r

# D�finition des sources
SRC = main.S

# D�finitions des fichiers � utiliser, en fonction
# de la source
OBJO = $(SRC:.S=.o)
OBJHEX = $(SRC:.S=.hex)
OBJRAW = $(SRC:.S=.raw)
OBJLSS = $(SRC:.S=.lss)

# Nom du r�pertoire pour les fichiers de compilation
# Inutile pour l'�l�ve
FILENAME_REP_COMPILE = bin

all: dir_creation main

# Cr�ation du r�pertoire des fichiers .o et .hex
dir_creation:	
	mkdir -p $(FILENAME_REP_COMPILE)
	
# Main : Cr�ation des fichiers .o, .hex, .raw et .lss
#main: $(OBJO) $(OBJHEX) $(OBJRAW) $(OBJLSS)
main:  $(OBJRAW) $(OBJLSS)
	
# R�gles pour la cr�ation de l'objet .o, � partir du .S
%.o: %.S
	$(CAS) $(THUMB) -o $(FILENAME_REP_COMPILE)\$@ $<
	$(CAS) $(THUMB) -o $@ $<

# R�gle pour la cr�ation du .hex, � partir du .o
%.hex: %.o
	$(OBJCOPY) -O ihex $(FILENAME_REP_COMPILE)\$< $(FILENAME_REP_COMPILE)\$@
	$(OBJCOPY) -O ihex $(FILENAME_REP_COMPILE)\$< $@
	
# R�gle pour la cr�ation du .raw, � partir du .hex
%.raw: %.hex
	$(OBJCOPY) -I ihex --output-target=binary  $< ./tmp.bin	
	printf "$(HEADER_RAW)" > $@
	$(HEXDUMP_RAW) tmp.bin >> $@
	rm -f $< ./tmp.bin
	
# R�gle pour la cr�ation du .lss, � partir du .o
%.lss: %.o
	$(OBJDUMP) -h -S -M force-thumb $< > $@
	rm -f $<
	rm -f binmain.o
	rm -f main.mem
	#rm -f binmain.hex

# Supression du r�pertoire ainsi que de touts les fichiers
# cr�er par le makefile
clean:
	$(REMOVE_DIR) $(FILENAME_REP_COMPILE)
	$(REMOVE_FILE) *.raw
	$(REMOVE_FILE) *.lss
	#$(REMOVE_FILE) *.hex
    #$(REMOVE_FILE) *.o
  #$(REMOVE_FILE) *.hex
	
