
"yinter"<-
  function(x, y, z, increasing = T)
{
  if(increasing == F) {
    x <- -1 * x
    x <- x[length(x):1]
    y <- y[length(y):1]
    z <- -1 * z
  }
  zz <- .Fortran("yinter",
		 as.double(x),
		 as.double(y),
		 length(x),
		 as.double(z),
		 result = double(1))
  return(zz$result)
}
