\name{cholost}
\alias{cholost}
\concept{cholostyramine}
\concept{cholesterol}
\concept{curve fitting}
\docType{data}
\title{ The Cholostyramine Data  }
\description{
    \eqn{n=164}{n=164} men took part in an experiment to see if the drug cholostyramine
    lowered blood cholesterol levels.  The men were supposed to take six packets of 
    cholostyramine per day, but many actually took much less.
}
\usage{data(cholost)}
\format{
  A data frame with 164 observations on the following 2 variables.
  \describe{
    \item{z}{Compliance, a numeric vector}
    \item{y}{Improvement, a numeric vector}
  }
}
\details{
    In the book, this is used as an example for curve fitting, with two methods, 
    traditional least-squares fitting and modern \code{\link{loess}}. In the book 
    is considered linear and polynomial models for the dependence of Improvement 
    upon Compliance.
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
   Chapman and Hall, New York, London.
}
\examples{
data(cholost)
str(cholost)
summary(cholost)
plot(y ~ z, data=cholost, xlab="Compliance", 
            ylab="Improvement")
abline(lm(y ~ z, data=cholost), col="red")
}
\keyword{datasets}
