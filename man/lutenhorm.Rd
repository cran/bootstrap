\name{lutenhorm}
\alias{lutenhorm}
\docType{data}
\title{ Luteinizing Hormone   }
\concept{time series}
\concept{block bootstrap}
\concept{Luteinizing hormone}
\description{
 Five sets of levels of luteinizing hormone for each of 48 time periods
}
\usage{data(lutenhorm)}
\format{
  A data frame with 48 observations on the following 5 variables.
  \describe{
    \item{V1}{a numeric vector}
    \item{V2}{a numeric vector}
    \item{V3}{a numeric vector}
    \item{V4}{a numeric vector}
    \item{V5}{a numeric vector}
  }
}
\details{
  Five sets of levels of luteinizing hormone for each of 48 time periods, 
  taken from Diggle (1990). These are hormone levels measured on a
  healty woman in 10 minute intervals over a period of 8 hours. The luteinizing
  hormone is one of the hormones that orchestrate the menstrual cycle
  and hence it is important to understand its daily variation.  

  This is a time series. The book gives only one time series, which 
  correspond to \code{V4}. I don't know what are the other four series, 
  the book does'nt mention them. They could be block bootstrap 
  replicates?
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
  Chapman and Hall, New York, London.
}
\examples{
str(lutenhorm) 
matplot(lutenhorm)
}
\keyword{datasets}
