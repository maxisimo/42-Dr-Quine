FLAG= -Wall -Werror -Wall
CG = \033[92m
CY =  \033[93m
CE = \033[0m
CB = \033[34m

SRC_C = Colleen/Colleen.c
SRC_G = Grace/Grace.c
SRC_S = Sully/Sully.c

OBJ_C = $(SRC_C:.c=.o)
OBJ_G = $(SRC_G:.c=.o)
OBJ_S = $(SRC_S:.c=.o)

all: start Colleen Grace Sully

Colleen: $(OBJ_C)
	@echo "$(CY)[QUINE] :$(CE) $(CG)Compiling Colleen ...$(CE)";
	@clang $(OBJ_C) -o Colleen/Colleen

Grace: $(OBJ_G)
	@echo "$(CY)[QUINE] :$(CE) $(CG)Compiling Grace ...$(CE)";
	@clang $(OBJ_G) -o Grace/Grace

Sully: $(OBJ_S)
	@echo "$(CY)[QUINE] :$(CE) $(CG)Compiling Sully ...$(CE)";
	@clang $(OBJ_S) -o Sully/Sully

start:
	@echo "\n";
	@echo "			$(CG)       ::::::::  :::    ::::::::::::::::::    ::::::::::::: $(CE)";
	@echo "			$(CG)     :+:    :+: :+:    :+:    :+:    :+:+:   :+::+:         $(CE)";
	@echo "			$(CG)    +:+    +:+ +:+    +:+    +:+    :+:+:+  +:++:+          $(CE)";
	@echo "			$(CG)   +#+    +:+ +#+    +:+    +#+    +#+ +:+ +#++#++:++#      $(CE)";
	@echo "			$(CG)  +#+    +#+ +#+    +#+    +#+    +#+  +#+#+#+#+            $(CE)";
	@echo "			$(CG) #+#    #+# #+#    #+#    #+#    #+#   #+#+##+#             $(CE)";
	@echo "			$(CG)################### ##############    ##############       $(CE)";
	@echo "\n";


%.o: %.s
	@echo "$(CY)[QUINE] :$(CE) $(CG)Compiling $<$(CE)";
	@clang $(FLAG) -c $< -o $@ $(INC)

clean: start
	@echo "\033[K$(CY)[QUINE] :$(CE) $(CG)Cleaning object files$(CE)";
	@/bin/rm -rf $(OBJ_S) $(OBJ_G) $(OBJ_C)

fclean: clean
	@echo "\033[K$(CY)[QUINE] :$(CE) $(CG)Cleaning binary files$(CE)";
	@/bin/rm -rf Sully/Sully Colleen/Colleen Grace/Grace Sully/Sully_* Grace/Grace_kid.c

re: fclean all

.PHONY: all clean fclean re
