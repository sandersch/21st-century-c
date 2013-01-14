/* Compile with:
CFLAGS="-g -Wall" CC=c99 make constchange
*/
#include <stdio.h>

void set_elmt(int *a, int const *b){
    a[0] = 3;
}

int main(){
    int a[10] = {};
    int const *b = a;
    set_elmt(a, b);
    printf("a: %i\n", a[0]);
    printf("b: %i\n", b[0]);
}
