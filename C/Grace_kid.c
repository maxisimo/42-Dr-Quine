#include <stdio.h>
#define x 1
#define com 1
/*
    Un commentaire
*/
#define MAIN int main() {char*s="#include <stdio.h>%c#define x 1%c#define com 1%c/*%c    Un commentaire%c*/%c#define MAIN int main() {char*s=%c%s%c;printf(s, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10);}%cMAIN%c";printf(s, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10);}
MAIN
