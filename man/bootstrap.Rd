\name{bootstrap}
\title{Non-Parametric Bootstrapping}
\description{See Efron and Tibshirani (1993) for details on this
  function.}
\keyword{nonparametric}
\alias{bootstrap}
\usage{
    bootstrap(x,nboot,theta,..., func=NULL)
}
\arguments{
   \item{x}{a vector containing the data. To bootstrap more complex data
       structures (e.g. bivariate data) see the last example below.}
   \item{nboot}{The number of bootstrap samples desired.}
   \item{theta}{function to be bootstrapped. Takes \code{x} as an argument, and
       may take additional arguments (see below and last example).}
   \item{...}{any additional arguments to be passed to \code{theta}}
   \item{func}{(optional) argument specifying the functional the
      distribution of thetahat that is desired. 
     If func is specified, the jackknife after-bootstrap estimate of its standard
     error is also returned. See example below.}
}
\value{
  list with the following components:
  \item{thetastar}{the \code{nboot} bootstrap values of \code{theta}}
  \item{func.thetastar}{the functional \code{func} of the bootstrap
    distribution of thetastar, if \code{func} was specified} 
  \item{jack.boot.val}{the jackknife-after-bootstrap values for \code{func}, 
            if \code{func} was specified}
  \item{jack.boot.se}{the jackknife-after-bootstrap standard error
         estimate of \code{func}, if \code{func} was specified} 
  \item{call}{the deparsed call}
}
\references{
  Efron, B. and   Tibshirani, R. (1986).  The bootstrap
  method for standard errors, confidence intervals,
  and other measures of   statistical accuracy.
  Statistical Science, Vol 1., No. 1, pp 1-35.

  Efron, B. (1992) Jackknife-after-bootstrap standard errors and
  influence functions. J. Roy. Stat. Soc. B, vol 54, pages 83-127
  
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
  Chapman and Hall, New York, London.
}
\examples{
# 100 bootstraps of the sample mean 
# (this is for illustration;  since "mean" is  a 
# built in function, bootstrap(x,100,mean) would be simpler!)
    x <- rnorm(20)                
    theta <- function(x)\{mean(x)\} 
                              
    results <- bootstrap(x,100,theta)     
                             
# as above, but also estimate the 95th percentile   
# of the bootstrap dist'n of the mean, and         
# its jackknife-after-bootstrap  standard error    
                              
    perc95 <- function(x)\{quantile(x, .95)\}
                             
                             
    results <-  bootstrap(x,100,theta, func=perc95)                                   
                                   
# To bootstrap functions of more complex data structures, 
# write theta so that its argument x
#  is the set of observation numbers  
#  and simply  pass as data to bootstrap the vector 1,2,..n. 
# For example, to bootstrap
# the correlation coefficient from a set of 15 data pairs:
   xdata <- matrix(rnorm(30),ncol=2)
   n <- 15
   theta <- function(x,xdata)\{ cor(xdata[x,1],xdata[x,2]) \}
   results <- bootstrap(1:n,20,theta,xdata)
}

