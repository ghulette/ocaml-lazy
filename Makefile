SOURCES = lazylist.mli lazylist.ml
RESULT  = lazy-data

all: native-code-library byte-code-library

include OCamlMakefile
