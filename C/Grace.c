#include <stdio.h>
#define TAB 9
#define NL 10
#define MAIN int main(void) { grace(); }

void	grace() {
	char	*s;
	char	path[30];
	FILE	*child;

	s = "#include <stdio.h>%2$c#define TAB 9%2$c#define NL 10%2$c#define MAIN int main(void) { grace(); }%2$c%2$cvoid%1$cgrace() {%2$c%1$cchar%1$c*s;%2$c%1$cchar%1$cpath[30];%2$c%1$cFILE%1$c*child;%2$c%2$c%1$cs = %3$c%4$s%3$c;%2$c%1$c/*%2$c%1$c%1$cUn commentaire%2$c%1$c*/%2$c%1$csprintf(path, %3$cGrace_kid.c%3$c);%2$c%1$cchild = fopen(path, %3$cw%3$c);%2$c%1$cif (child > 0)%2$c%1$c%1$cfprintf(child, s, TAB, NL, 34, s);%2$c}%2$c%2$cMAIN%2$c";
	/*
		Un commentaire
	*/
	sprintf(path, "Grace_kid.c");
	child = fopen(path, "w");
	if (child > 0)
		fprintf(child, s, TAB, NL, 34, s);
}

MAIN
