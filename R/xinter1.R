library.dynam("bootstrap.so")

"xinter"<-
  function(x, y, z, increasing = T)
{
  
  if(increasing == F) {
    x <- -1 * x
    x <- x[length(x):1]
    y <- y[length(y):1]
  }
  zz <- .Fortran("xinter",
		 as.double(x),
		 as.double(y),
		 length(x),
		 as.double(z),
		 result = double(1))
  if(increasing == F) {
    zz$result <- -1 * zz$result
  }
  return(zz$result)
}

