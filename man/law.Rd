\name{law}
\alias{law}
\concept{law school}
\docType{data}
\title{  Law school data from Efron and Tibshirani }
\description{
  The law school data. A random sample of size \eqn{n=15}{n=15} from the 
  universe of 82 USA law schools. Two measurements: \acronym{LSAT} (average score on 
  a national law test) and \acronym{GPA} (average undergraduate grade-point average).
  \code{\link{law82}} contains data for the whole universe of 82 law schools.
}
\usage{
        data(law)
}
\format{
  A data frame with 15 observations on the following 2 variables.
  \describe{
    \item{LSAT}{a numeric vector}
    \item{GPA}{a numeric vector}
  }
}
\details{
   In the book for which this package is support software, this example
   is used to bootstrap the correlation coefficient.
}
\seealso{ \code{\link{law82}}. }
\source{
  
 Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
  Chapman and Hall, New York, London.

}
\examples{
data(law)
str(law)
plot(law)
}
\keyword{datasets}
