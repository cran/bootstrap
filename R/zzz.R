.First.lib <- function(lib, pkg)
{
    library.dynam("bootstrap", pkg, lib)
}
