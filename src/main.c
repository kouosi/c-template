#include <stdio.h>
#include <stdlib.h>

#define ENDL "\n"

void fun (void)
{
    fprintf (stderr, "Exiting!" ENDL);
}

int main (int argc, const char **argv)
{
    fprintf (stderr, "Hello, World!" ENDL);
    atexit (fun);

    return 0;
}
