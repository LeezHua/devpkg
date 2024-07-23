#include <assert.h>
#include <stdio.h>
#include <stdio.h>

#include "bstrlib.h"
#include "dbg.h"
#include "db.h"

#define dividing for(int i = 0; i < 32; ++i) putchar('-'); putchar('\n');

// Testify bstring can cause memory leak without bdestroy().
// Run with `vagrind ./test`.
void test_bstring() {
    dividing;
    printf("test_bstring()\n");
    dividing;

    char *cstr = "Hello World!";
    bstring bstr = bfromcstr(cstr);
    printf("bstr: %s, mlen: %d, slen: %d\n", bstr->data, bstr->mlen, bstr->slen);
    printf("test_bstring() passed\n");
}

void test_DB() {
    dividing;
    printf("test_DB()\n");

    DB_init();
    DB_list();
    DB_update("www.123.com");
    DB_update("www.234.com");
    DB_update("www.345.com");
    DB_list();
    assert(DB_find("www.234.com") == 1);
    assert(DB_find("www.456.com") == 0);
    
    printf("test_DB() passed\n");
}

int main() {
    test_bstring();
    test_DB();

    return 0;
}