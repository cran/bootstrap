\name{abcpar}
\title{  Parametric ABC Confidence Limits  }
\description{See Efron and Tibshirani (1993) for details on this
  function.}
\keyword{htest}
\alias{abcpar}
\usage{
abcpar(y, tt, S, etahat, mu, n=rep(1,length(y)),lambda=0.001, 
       alpha=c(0.025, 0.05, 0.1, 0.16))
}
\arguments{
\item{y}{vector of data}
\item{tt}{function of expectation parameter \code{mu} defining the parameter 
                  of interest}
\item{S}{maximum likelihood estimate of the covariance matrix of \code{x}}
\item{etahat}{maximum likelihood estimate of the natural parameter eta}
\item{mu}{function giving expectation of \code{x} in terms of eta}
\item{n}{optional argument containing denominators for binomial (vector of
           length \code{length(x)})} 
\item{lambda}{optional argument specifying step size for finite difference 
              calculation}
\item{alpha}{optional argument specifying confidence levels desired}
}
\value{
list with the following components
\item{call}{the call to abcpar}
\item{limits}{The nominal confidence level, ABC point, quadratic ABC point, 
              and
              standard normal point.} 
\item{stats}{list consisting of  observed value of \code{tt}, estimated 
             standard error and estimated bias}
\item{constants}{list consisting of \code{a}=acceleration constant,
  \code{z0}=bias adjustment, \code{cq}=curvature component}
\item{asym.05}
}
\references{
Efron, B, and DiCiccio, T. (1992) More accurate confidence intervals 
in exponential families. Bimometrika 79, pages 231-245.

Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
Chapman and Hall, New York, London.
}
\examples{
# binomial
# x is a p-vector of successes, n is a p-vector of 
#  number of trials
\dontrun{
S <- matrix(0,nrow=p,ncol=p)
S[row(S)==col(S)] <- x*(1-x/n)
mu <- function(eta,n)\{n/(1+exp(eta))\}
etahat <- log(x/(n-x))
#suppose p=2 and we are interested in mu2-mu1
tt <- function(mu)\{mu[2]-mu[1]\}
x <- c(2,4); n <- c(12,12)
a <- abcpar(x, tt, S, etahat,n)
}}

