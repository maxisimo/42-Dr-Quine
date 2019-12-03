#include <stdio.h>
/*
    Un commentaire
*/

void    function(){};

int     main() {
    char    *s;

    /*
        Un commentaire
    */
    function();
    s = "#include <stdio.h>%c/*%c    Un commentaire%c*/%c%cvoid    function(){};%c%cint     main() {%c    char    *s;%c%c    /*%c        Un commentaire%c    */%c    function();%c    s = %c%s%c;%c    printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10);%c}%c";
    printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10);
}
