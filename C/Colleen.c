#include <stdio.h>
#define TAB 9
#define NL 10
#define DQUOTE 34
/*
	Un commentaire
*/

void	function(char *s) {
	printf(s, TAB, NL, DQUOTE, s);
}

int		main(void) {
	char	*s;

	s = "#include <stdio.h>%2$c#define TAB 9%2$c#define NL 10%2$c#define DQUOTE 34%2$c/*%2$c%1$cUn commentaire%2$c*/%2$c%2$cvoid%1$cfunction(char *s) {%2$c%1$cprintf(s, TAB, NL, DQUOTE, s);%2$c}%2$c%2$cint%1$c%1$cmain(void) {%2$c%1$cchar%1$c*s;%2$c%2$c%1$cs = %3$c%4$s%3$c;%2$c%1$c/*%2$c%1$c%1$cUn commentaire%2$c%1$c*/%2$c%1$cfunction(s);%2$c}%2$c";
	/*
		Un commentaire
	*/
	function(s);
}
