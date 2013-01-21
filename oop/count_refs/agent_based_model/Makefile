#GNU make knows how to run ctangle groupabm.w to generate groupabm.c.
#If you have LaTeX installed, also try "make groupabm.tex; pdflatex groupabm.tex" .
P = groupabm
objects = groups.o
CFLAGS=`pkg-config --cflags glib-2.0 apophenia` -std=gnu11 -g -Wall -O3
LDLIBS=`pkg-config --libs glib-2.0 apophenia`

$(P): $(objects)
