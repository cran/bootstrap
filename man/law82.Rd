\name{law82}
\alias{law82}
\docType{data}
\title{  Data for Universe of USA Law Schools  }
\description{
   This is the universe of 82 USA law schools for which the data frame
   \code{\link{law}} provides a sample of size \eqn{15}. See documentation for 
   \code{\link{law}} for more details.
}
\usage{data(law82)}
\format{
  A data frame with 82 observations on the following 3 variables.
  \describe{
    \item{School}{a numeric vector}
    \item{LSAT}{a numeric vector}
    \item{GPA}{a numeric vector}
  }
}
\source{
   Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
  Chapman and Hall, New York, London.
}

\examples{
plot(law82[,2:3])
cor(law82[,2:3])
}
\keyword{datasets}
