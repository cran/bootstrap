\name{jackknife}
\title{Jackknife Estimation}
\description{See Efron and Tibshirani (1993) for details on this
  function.}
\keyword{nonparametric}
\alias{jackknife}
\usage{
jackknife(x, theta, ...)
}
\arguments{
  \item{x}{a vector containing the data. To jackknife  more complex data
    structures (e.g. bivariate data) see the last example below.}
  \item{theta}{function to be jackknifed. Takes \code{x} as an argument, and
    may take additional arguments (see below and last example).}
  \item{...}{any additional arguments to be passed to \code{theta}}
}
\value{
  list with the following components
  \item{jack.se}{The jackknife estimate of standard error of \code{theta}.
    The leave-one out jackknife is used.}
  \item{jack.bias}{The jackknife estimate of bias of \code{theta}.
    The leave-one out jackknife is used.}
  \item{jack.values}{The n leave-one-out values of \code{theta}, 
    where n is the number of observations.
    That is, \code{theta} applied to \code{x} with
    the 1st observation deleted, \code{theta} applied to \code{x} with
    the 2nd observation deleted, etc.}
}
\references{
  Efron, B. and   Tibshirani, R. (1986).  The Bootstrap
  Method for standard errors, confidence intervals,
  and other measures of   statistical accuracy.
  Statistical Science, Vol 1., No. 1, pp 1-35.

  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
  Chapman and Hall, New York, London.
}
\examples{
# jackknife values for the sample mean 
# (this is for illustration;  # since "mean" is  a 
#  built in function,  jackknife(x,mean) would be simpler!)
x <- rnorm(20)               
theta <- function(x)\{mean(x)\}
                             
results <- jackknife(x,theta)        
                              
# To jackknife functions of more  complex data structures, 
# write theta so that its argument x
#  is the set of observation numbers  
#  and simply  pass as data to jackknife the vector 1,2,..n. 
# For example, to jackknife
# the correlation coefficient from a set of 15 data pairs:      
                        
xdata <- matrix(rnorm(30),ncol=2)
n <- 15
theta <- function(x,xdata)\{ cor(xdata[x,1],xdata[x,2]) \}
results <- jackknife(1:n,theta,xdata)
}

