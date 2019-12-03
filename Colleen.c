#include <stdio.h>
/*
* test
*/
void	print(char *c){printf(c,10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 34, c, 34, 10, 9, 10, 9, 10);}

int		main(void)
{
	/*
	* commentaire dans le main
	*/
	char *c="#include <stdio.h>%c/*%c* test%c*/%cvoid	print(char *c){printf(c,10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 34, c, 34, 10, 9, 10, 9, 10);}%c%cint		main(void)%c{%c%c/*%c%c* commentaire dans le main%c%c*/%c%cchar *c=%c%s%c;%c%cprint(c);%c%creturn(0);%c}";
	print(c);
	return(0);
}
