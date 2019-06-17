#include <R_ext/RS.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .Fortran calls */
extern void F77_NAME(ctsub)(void *, void *, void *, void *, void *);
extern void F77_NAME(xinter)(void *, void *, void *, void *, void *);
extern void F77_NAME(yinter)(void *, void *, void *, void *, void *);

static const R_FortranMethodDef FortranEntries[] = {
    {"f_ctsub",  (DL_FUNC) &F77_NAME(ctsub),  5},
    {"f_xinter", (DL_FUNC) &F77_NAME(xinter), 5},
    {"f_yinter", (DL_FUNC) &F77_NAME(yinter), 5},
    {NULL, NULL, 0}
};

void R_init_bootstrap(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, NULL, FortranEntries, NULL);
    R_useDynamicSymbols(dll, FALSE);
}

