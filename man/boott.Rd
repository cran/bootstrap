\name{boott}
\title{Bootstrap-t Confidence Limits}
\description{See Efron and Tibshirani (1993) for details on this
  function.}
\keyword{nonparametric}
\alias{boott}
\usage{
boott(x,theta, ..., sdfun=sdfunboot, nbootsd=25, nboott=200,
      VS=FALSE, v.nbootg=100, v.nbootsd=25, v.nboott=200,
      perc=c(.001,.01,.025,.05,.10,.50,.90,.95,.975,.99,.999))
}
\arguments{
  \item{x}{a vector containing the data. Nonparametric bootstrap sampling is
    used. To bootstrap from more complex data structures (e.g.
    bivariate data) see the last example below.}
  \item{theta}{function to be bootstrapped. Takes \code{x} as an argument, and
    may take additional arguments (see below and last example).}
  \item{...}{any additional arguments to be passed to \code{theta}}
  \item{sdfun}{optional name of function for computing standard
    deviation of \code{theta} based on data \code{x}. Should be
    of the form: \code{sdmean <- function(x,nbootsd,theta,...)} where
    \code{nbootsd} 
    is a dummy argument that is not used. If \code{theta} is the mean,
    for example, 
    \code{sdmean <- function(x,nbootsd,theta,...) \{sqrt(var(x)/length(x))\}} .
    If \code{sdfun} is missing, then \code{boott} uses an inner
    bootstrap loop to estimate the 
    standard deviation of \code{theta(x)}}
  \item{nbootsd}{The number of bootstrap samples used to estimate the
    standard deviation of \code{theta(x)}} 
  \item{nboott}{The number of bootstrap samples used to estimate the
    distribution of the bootstrap T statistic. 
    200 is a bare minimum and 1000 or more is needed for 
    reliable  \eqn{\alpha \%} confidence points, \eqn{\alpha > .95} say. 
    Total number of bootstrap samples is 
    \code{nboott*nbootsd}.}
  \item{VS}{If \code{TRUE}, a variance stabilizing transformation is
    estimated, 
    and the interval is constructed on the transformed scale, and then
    is mapped back to the original theta scale. 
    This can improve both the statistical properties of the intervals and
    speed up the computation. See the reference Tibshirani (1988) given below.
    If \code{FALSE}, variance stabilization is not performed.}
  \item{v.nbootg}{The number of bootstrap samples used to estimate the
    variance stabilizing transformation g. 
    Only used if \code{VS=TRUE}.}
  \item{v.nbootsd}{The number of bootstrap samples used to estimate the
    standard deviation of \code{theta(x)}. 
    Only used if \code{VS=TRUE}.}
  \item{v.nboott}{The number of bootstrap samples used to estimate the
    distribution of 
    the bootstrap T statistic. Only used if \code{VS=TRUE}. Total number of
    bootstrap samples is \code{v.nbootg*v.nbootsd + v.nboott}.} 
  \item{perc}{Confidence points desired.}
}
\value{
  list with the following components:
  \item{confpoints}{Estimated confidence points}
  \item{theta, g}{\code{theta}
    and \code{g} are only returned if \code{VS=TRUE} was
    specified. \code{(theta[i],g[i]),  i=1,length(theta)} 
    represents the estimate of the variance stabilizing transformation
    \code{g} at the points
    \code{theta[i]}.}
}
\references{
  Tibshirani, R. (1988) "Variance stabilization and the bootstrap". Biometrika (1988) vol 75
  no 3 pages 433-44.
  
  Hall, P. (1988) Theoretical comparison of bootstrap confidence
  intervals. Ann. Statisi. 16, 1-50.
  
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
  Chapman and Hall, New York, London.
}
\examples{
#  estimated confidence points for the mean
x <- rchisq(20,1)
theta <- function(x)\{mean(x)\}
results <- boott(x,theta)
# estimated confidence points for the mean, 
#  using variance-stabilization bootstrap-T method
results <-  boott(x,theta,VS=TRUE)
results$confpoints          # gives confidence points
# plot the estimated var stabilizing transformation
plot(results$theta,results$g) 
# use standard formula for stand dev of mean
# rather than an inner bootstrap loop
sdmean <- function(x, ...) 
    \{sqrt(var(x)/length(x))\}
results <-  boott(x,theta,sdfun=sdmean) 
                                     
# To bootstrap functions of more  complex data structures, 
# write theta so that its argument x
#  is the set of observation numbers  
#  and simply  pass as data to boot the vector 1,2,..n. 
# For example, to bootstrap
# the correlation coefficient from a set of 15 data pairs:                              
xdata <- matrix(rnorm(30),ncol=2)
n <- 15
theta <- function(x, xdata)\{ cor(xdata[x,1],xdata[x,2]) \}
results <- boott(1:n,theta, xdata)
}

