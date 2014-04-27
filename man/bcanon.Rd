\name{bcanon}
\title{ Nonparametric BCa Confidence Limits }
\description{See Efron and Tibshirani (1993) for details on this
  function.}
\keyword{nonparametric}
\alias{bcanon}
\usage{
bcanon(x, nboot, theta, ..., 
       alpha=c(0.025, 0.05, 0.1, 0.16, 0.84, 0.9, 0.95, 0.975))
}
\arguments{
\item{x}{a vector containing the data. To bootstrap  more complex data
  structures (e.g. bivariate data) see the last example below.}
\item{nboot}{number of bootstrap replications}
\item{theta}{function defining the estimator used in constructing the
  confidence points} 
\item{...}{additional arguments for \code{theta}}
\item{alpha}{optional argument specifying confidence levels desired}
}
\value{
  list with the following components
  \item{confpoint}{estimated bca confidence limits}
  \item{z0}{estimated bias correction}
  \item{acc}{estimated acceleration constant}
  \item{u}{jackknife influence values}
  \item{call}{The deparsed call}
}
\references{
Efron, B. and   Tibshirani, R. (1986).  The Bootstrap
Method for standard errors, confidence intervals,
and other measures of   statistical accuracy.
Statistical Science, Vol 1., No. 1, pp 1-35.

Efron, B. (1987). Better bootstrap confidence intervals (with discussion).
J. Amer. Stat. Assoc. vol 82, pg 171

Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
Chapman and Hall, New York, London.
}
\examples{
#  bca limits for the  mean 
#  (this is for illustration; 
#   since "mean" is a built in function,
#   bcanon(x,100,mean) would be simpler!)
   x <- rnorm(20)                
   theta <- function(x)\{mean(x)\}
   results <- bcanon(x,100,theta)   
                              
# To obtain bca limits for functions of more 
# complex data structures, write theta
# so that its argument x is the set of observation
# numbers and simply pass as data to bcanon 
# the vector 1,2,..n. 
# For example, find bca limits for
# the correlation coefficient from a set of 15 data pairs:
   xdata <- matrix(rnorm(30),ncol=2)
   n <- 15
   theta <- function(x,xdata)\{ cor(xdata[x,1],xdata[x,2]) \}
   results <- bcanon(1:n,100,theta,xdata)
}

