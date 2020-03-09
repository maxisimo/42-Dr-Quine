#include <stdio.h>
#define CHILD "Grace_kid.c"
#define STRING "#include <stdio.h>%2$c#define CHILD %3$cGrace_kid.c%3$c%2$c#define STRING %3$c%4$s%3$c%2$c#define MAIN int main(void) { char *s; char path[30]; FILE *child; s = STRING; sprintf(path, CHILD); child = fopen(path, %3$cw%3$c); if (child > 0) fprintf(child, s, 9, 10, 34, s); }%2$c/*%2$c%1$cThis program will print its own source in a file named Grace_kid.s%2$c*/%2$c%2$cMAIN%2$c"
#define MAIN int main(void) { char *s; char path[30]; FILE *child; s = STRING; sprintf(path, CHILD); child = fopen(path, "w"); if (child > 0) fprintf(child, s, 9, 10, 34, s); }
/*
	This program will print its own source in a file named Grace_kid.s
*/

MAIN
