\name{hormone}
\alias{hormone}
\docType{data}
\title{ Hormone Data from page 107  }
\description{
   The hormone data. Amount in milligrams of anti-inflammatory hormone
   remaining in 27 devices, after a certain number of hours (hrs)
   of wear.
}
\usage{data(hormone)}
\format{
  A data frame with 27 observations on the following 3 variables.
  \describe{
    \item{Lot}{a character vector}
    \item{hrs}{a numeric vector}
    \item{amount}{a numeric vector}
  }
}
\details{
   The hormone data. Amount in milligrams of anti-inflammatory hormone
   remaining in 27 devices, after a certain number of hours (hrs)
   of wear. The devices were sampled from 3 different manufacturing lots, 
   called A, B and C. Lot C looks like it had greater amounts of
   remaining hormone, but it also was worn the least number of hours. 

   The book uses this as an example for regression analysis. 
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
  Chapman and Hall, New York, London.
}
\examples{
str(hormone) 
if(interactive())par(ask=TRUE)
with(hormone, stripchart(amount ~ Lot))
with(hormone, plot(amount ~ hrs, pch=Lot))
abline( lm(amount ~ hrs, data=hormone, col="red2"))
}
\keyword{datasets}
