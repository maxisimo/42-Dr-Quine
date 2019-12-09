#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <strings.h>
int main(){
char *s = "#include <stdio.h>%1$c#include <unistd.h>%1$c#include <stdlib.h>%1$c#include <strings.h>%1$cint main(){%1$cchar *s = %2$c%4$s%2$c;%1$cFILE *fd;%1$cint i = %3$d;%1$cchar path[30];%1$cchar fn[30];%1$cchar tmp[100];%1$cif (i < 0){return(0);}%1$cif (access(%2$cSully_5.c%2$c, F_OK) != -1){--i;};%1$csprintf(fn, %2$cSully_%%d%2$c, i);%1$csprintf(path, %2$cSully_%%d.c%2$c, i);%1$cfd = fopen(path, %2$cw%2$c);%1$cif (fd > 0){%1$cfprintf(fd, s, 10, 34, i, s);%1$cfclose(fd);%1$cif (i > 0){%1$csprintf(tmp, %2$ccc -o %%s %%s%2$c,fn,path);%1$csystem(tmp);%1$cbzero(tmp, 100);%1$csprintf(tmp, %2$c./%%s%2$c,fn);%1$csystem(tmp);%1$c}}%1$creturn(0);%1$c}";
FILE *fd;
int i = 5;
char path[30];
char fn[30];
char tmp[100];
if (i < 0){return(0);}
if (access("Sully_5.c", F_OK) != -1){--i;};
sprintf(fn, "Sully_%d", i);
sprintf(path, "Sully_%d.c", i);
fd = fopen(path, "w");
if (fd > 0){
fprintf(fd, s, 10, 34, i, s);
fclose(fd);
if (i > 0){
sprintf(tmp, "cc -o %s %s",fn,path);
system(tmp);
bzero(tmp, 100);
sprintf(tmp, "./%s",fn);
system(tmp);
}}
return(0);
}
