\name{spatial}
\alias{spatial}
\docType{data}
\concept{better bootstrap confidence intervals}
\title{ Spatial Test Data    }
\description{
    Twenty-six neurologically impaired children have each taken two tests
    of spatial perception, called "A" and "B".
}
\usage{data(spatial)}
\format{
  A data frame with 26 observations on the following 2 variables.
  \describe{
    \item{A}{a numeric vector}
    \item{B}{a numeric vector}
  }
}
\details{
  In the book this is used as a test data set for bootstrapping 
  confidence intervals. 
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
  Chapman and Hall, New York, London.
}
\examples{
str(spatial)
plot(spatial) 
abline(0,1, col="red2")
}
\keyword{datasets}
