#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <strings.h>
#define TAB 9
#define NL 10
#define DQUOTE 34

int		main() {
	char	*s = "#include <stdio.h>%2$c#include <unistd.h>%2$c#include <stdlib.h>%2$c#include <strings.h>%2$c#define TAB 9%2$c#define NL 10%2$c#define DQUOTE 34%2$c%2$cint%1$c%1$cmain() {%2$c%1$cchar%1$c*s = %3$c%5$s%3$c;%2$c%1$cFILE%1$c*fd;%2$c%1$cint%1$c%1$ci = %4$d;%2$c%1$cchar%1$cpath[30];%2$c%1$cchar%1$cfn[30];%2$c%1$cchar%1$ctmp[100];%2$c%2$c%1$cif (i < 0)%2$c%1$c%1$creturn(0);%2$c%1$c#ifdef VAR%2$c%1$c%1$ci--;%2$c%1$c#endif%2$c%1$csprintf(fn, %3$cSully_%%d%3$c, i);%2$c%1$csprintf(path, %3$cSully_%%d.c%3$c, i);%2$c%1$cfd = fopen(path, %3$cw%3$c);%2$c%1$cif (fd > 0)%2$c%1$c{%2$c%1$c%1$cfprintf(fd, s, TAB, NL, DQUOTE, i, s);%2$c%1$c%1$cfclose(fd);%2$c%1$c%1$cif (i >= 0)%2$c%1$c%1$c{%2$c%1$c%1$c%1$csprintf(tmp, %3$cgcc -D VAR %%s -o %%s%3$c, path, fn);%2$c%1$c%1$c%1$csystem(tmp);%2$c%1$c%1$c%1$cbzero(tmp, 100);%2$c%1$c%1$c%1$cif (i > 0)%2$c%1$c%1$c%1$c{%2$c%1$c%1$c%1$c%1$csprintf(tmp, %3$c./%%s%3$c,fn);%2$c%1$c%1$c%1$c%1$csystem(tmp);%2$c%1$c%1$c%1$c}%2$c%1$c%1$c}%2$c%1$c}%2$c%1$creturn(0);%2$c}%2$c";
	FILE	*fd;
	int		i = 5;
	char	path[30];
	char	fn[30];
	char	tmp[100];

	if (i < 0)
		return(0);
	#ifdef VAR
		i--;
	#endif
	sprintf(fn, "Sully_%d", i);
	sprintf(path, "Sully_%d.c", i);
	fd = fopen(path, "w");
	if (fd > 0)
	{
		fprintf(fd, s, TAB, NL, DQUOTE, i, s);
		fclose(fd);
		if (i >= 0)
		{
			sprintf(tmp, "gcc -D VAR %s -o %s", path, fn);
			system(tmp);
			bzero(tmp, 100);
			if (i > 0)
			{
				sprintf(tmp, "./%s",fn);
				system(tmp);
			}
		}
	}
	return(0);
}
