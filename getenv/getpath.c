#include <stdlib.h>
#include <stdio.h>

int main(){
    char *msg=getenv("PATH");
    if (!msg) msg = "PATH not set?";

    printf("%s\n", msg);
}
