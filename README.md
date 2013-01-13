# Static Linking

    :::bash    
    gcc erf.c -o erf -lm -g -Wall -O3 -std=gnu11

-g adds symbols for debugging. Without it, your debugger won’t be able to give you variable or function names. They don’t slow down the program, and we don’t care if the program is a kilobyte larger, so there’s little reason to not use this.

-std=gnu11 is gcc-specific, and specifies that gcc should allow code conforming to the C11 and POSIX standards. Otherwise, gcc will count certain now-valid bits of syntax as invalid. As of this writing, some systems still predate C11, in which case, use -std=gnu99. gcc only; everybody else switched to C99 being the default a long time ago.

-O3 indicates optimization level three, which tries every trick known to build faster code. If, when you run the debugger, you find that too many variables have been optimized out for you to follow what’s going on, then change this to -O0.

-Wall adds compiler warnings.

    :::bash   
    gcc -I/usr/local/include use_useful.c -o use_useful -L/usr/local/lib -luseful

-I adds the given path to the include search path, which the compiler searches for header files you #included in your code.

-L adds to the library search path.

Order matters. If you have a file named specific.o that depends on the Libbroad library, and Libbroad depends on Libgeneral, then you will need:

    :::bash   
    gcc specific.o -lbroad -lgeneral
Any other ordering, such as gcc -lbroad -lgeneral specific.o, will probably fail.


    :::bash   
    pkg-config --libs gsl libxml-2.0
    # -lgsl -lgslcblas -lm -lxml2

    pkg-config --cflags gsl libxml-2.0
    # -I/usr/include/libxml2
 
    gcc `pkg-config --cflags --libs gsl libxml-2.0` -o specific specific.c
    # equal to
    gcc -I/usr/include/libxml2 -lgsl -lgslcblas -lm -lxml2 -o specific specific.c


# Runtime Linking

    :::bash   
    export LD_LIBRARY_PATH=libpath:$LD_LIBRARY_PATH
    # or
    gcc ... LDADD=-Llibpath -Wl,-Rlibpath ...


# Makefile

    :::bash  
    export CFLAGS='-g -Wall -O3'

    # Set a makefile variable.
    make CFLAGS="-g -Wall" 
    # Set an environment variable that only make and its children see.
    CFLAGS="-g -Wall" make

# Pointers

Structures Get Copied, Arrays Get Aliased

Bear in mind that when you see *i on a declaration line, it is a pointer to something; when you see *i on a nondeclaration line, it is the pointed-to value.





