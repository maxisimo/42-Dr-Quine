BLUE1 =  \033[38;5;51m
BLUE2 = \033[38;5;99m
END = \033[0m

SRC_C = Colleen.s
SRC_G = Grace.s
SRC_S = Sully.s

OBJ_C = $(SRC_C:.s=.o)
OBJ_G = $(SRC_G:.s=.o)
OBJ_S = $(SRC_S:.s=.o)

all: start Colleen Grace Sully

Colleen: $(OBJ_C)
	@echo "$(BLUE1)[QUINE] :$(END) $(BLUE2)Compiling Colleen ...$(END)";
	@gcc $(OBJ_C) -o Colleen

Grace: $(OBJ_G)
	@echo "$(BLUE1)[QUINE] :$(END) $(BLUE2)Compiling Grace ...$(END)";
	@gcc $(OBJ_G) -o Grace

Sully: $(OBJ_S)
	@echo "$(BLUE1)[QUINE] :$(END) $(BLUE2)Compiling Sully ...$(END)";
	@gcc $(OBJ_S) -o Sully

start:
	@echo "\n";
	@echo "			\\033[38;5;45m       ::::::::    :::    :::  ::::::::::  ::::   ::::  :::::::: $(END)";
	@echo "			\\033[38;5;39m     :+:    :+:   :+:    :+:     :+:      :+:+:   :+:  ::+:      $(END)";
	@echo "			\\033[38;5;33m    +:+    +:+   +:+    +:+     +:+      :+:+:+  +:+  ++:+       $(END)";
	@echo "			\\033[38;5;26m   +#+    +:+   +#+    +:+     +#+      +#+ +:+ +#+  ++#++:++#   $(END)";
	@echo "			\\033[38;5;21m  +#+    +#+   +#+    +#+     +#+      +#+  +#+#+#  #+#+         $(END)";
	@echo "			\\033[38;5;20m #+#+#+##+#   #+#    #+#     #+#      #+#   #+#+#  ##+#          $(END)";
	@echo "			\\033[38;5;19m       ###   ##########  ##########  ##    #####  ##########     $(END)";
	@echo "			\\033[38;5;18m      ###                                                        $(END)";
	@echo "			\\033[38;5;17m     ###                                                         $(END)";
	@echo "\n";


%.o: %.s
	@nasm -f macho64 $<

clean:
	@echo "\033[K$(BLUE1)[QUINE] :$(END) $(BLUE2)Cleaning object files ...$(END)";
	@rm -rf $(OBJ_S) $(OBJ_G) $(OBJ_C)
	@echo "$(BLUE2)Done$(END)";

fclean: clean
	@echo "\033[K$(BLUE1)[QUINE] :$(END) $(BLUE2)Cleaning binary files ...$(END)";
	@rm -rf Sully Colleen Grace Sully_* Grace_kid.s
	@echo "$(BLUE2)Done$(END)";

re: fclean all

.PHONY: all clean fclean re
