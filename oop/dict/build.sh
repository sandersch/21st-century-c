mkdir -p hash
cp dict_use.c dict.h dict.c keyval.c keyval.h dict_test.c Makefile.am hash
# cp dict.automake hash/Makefile.am
cd hash

touch NEWS README AUTHORS ChangeLog #still cheating

autoscan
sed -e 's/FULL-PACKAGE-NAME/hashdict/'        \
    -e 's/VERSION/1/'                         \
    -e 's|BUG-REPORT-ADDRESS|/dev/null|'      \
    -e '12i\
    AM_INIT_AUTOMAKE'                   \
    -e '13i\
    LT_INIT'                            \
    -e '14i\
    AC_CHECK_LIB([glib-2.0],[g_free])'  \
    -e 's|PROG_CC|PROG_CC_C99|'               \
    < configure.scan > configure.ac

autoreconf -i > /dev/null
./configure
make distcheck
make
