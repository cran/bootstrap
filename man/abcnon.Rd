\name{abcnon}
\title{ Nonparametric ABC Confidence Limits }
\description{See Efron and Tibshirani (1993) for details on this
  function.}
\keyword{nonparametric}
\keyword{htest}
\alias{abcnon}
\usage{
abcnon(x, tt, epsilon=0.001, 
       alpha=c(0.025, 0.05, 0.1, 0.16, 0.84, 0.9, 0.95, 0.975))
}
\arguments{
\item{x}{the data. Must be either a vector, or a matrix whose rows are
the observations} 
\item{tt}{function defining the parameter in the resampling form
\code{tt(p,x)}, where \code{p} is the vector of proportions and \code{x}
is the data} 
\item{epsilon}{optional argument specifying step size for finite
difference calculations} 
\item{alpha}{optional argument specifying confidence levels desired}
}
\value{
list with following components
\item{limits}{The estimated confidence points, from the ABC and standard normal methods}
\item{stats}{list consisting of \code{t0}=observed value of \code{tt},
  \code{sighat}=infinitesimal jackknife estimate 
 of standard error of \code{tt}, \code{bhat}=estimated bias}
\item{constants}{list consisting of \code{a}=acceleration constant,
  \code{z0}=bias adjustment, \code{cq}=curvature component} 
\item{tt.inf}{approximate influence components of \code{tt}}
\item{pp}{matrix whose rows are the resampling points in the least
  favourable family. The abc confidence points are the function \code{tt}
  evaluated at these points}
\item{call}{The deparsed call}
}
\references{
Efron, B, and DiCiccio, T. (1992) More accurate confidence intervals 
in exponential families. Biometrika 79, pages 231-245.

Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
Chapman and Hall, New York, London.
}
\examples{
# compute abc intervals for the mean
x <- rnorm(10)
theta <- function(p,x) \{sum(p*x)/sum(p)\}
results <- abcnon(x, theta)  
# compute abc intervals for the correlation
x <- matrix(rnorm(20),ncol=2)
theta <- function(p, x)
\{
    x1m <- sum(p * x[, 1])/sum(p)
    x2m <- sum(p * x[, 2])/sum(p)
    num <- sum(p * (x[, 1] - x1m) * (x[, 2] - x2m))
    den <- sqrt(sum(p * (x[, 2] - x1m)^2) *
              sum(p * (x[, 2] - x1m)^2))
    return(num/den)
\}
results <- abcnon(x, theta)   
}
