\name{Rainfall}
\alias{Rainfall}
\concept{time series}
\docType{data}
\title{ Rainfall Data   }
\description{
  raifall data. The yearly rainfall, in inches, in Nevada City, 
  California, USA, 1873 through 1978.
  An example of time series data.
}
\usage{data(Rainfall)}
\format{
  The format is:
 Time-Series [1:106] from 1873 to 1978: 80 40 65 46 68 32 58 60 61 60 ...
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
  Chapman and Hall, New York, London.
}
\examples{
str(Rainfall)  
plot(Rainfall) 
}
\keyword{datasets}
