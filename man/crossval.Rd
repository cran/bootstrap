\name{crossval}
\title{K-fold Cross-Validation}
\usage{
crossval(x, y, theta.fit, theta.predict, ..., ngroup=n)
}
\arguments{
\item{x}{a matrix containing the predictor (regressor) values. Each row
corresponds to an observation.}
\item{y}{a vector containing the response values}
\item{theta.fit}{function to be cross-validated. Takes \code{x} and
  \code{y} as an argument. See example below.}
\item{theta.predict}{function producing predicted values for
  \code{theta.fit}.
  Arguments are a matrix x of predictors and fit object produced by theta.fit.
  See example below.}
\item{...}{any additional arguments to be passed to theta.fit}
\item{ngroup}{optional argument specifying the number of  groups formed .
  Default is \code{ngroup}=sample size, corresponding to leave-one out
  cross-validation.} 
}
\value{
  list with the following components
  \item{cv.fit}{The  cross-validated fit for each observation.  The
    numbers 1 to n (the sample size) are  partitioned into \code{ngroup}
    mutually disjoint 
    groups  of size "leave.out".  leave.out, the number of observations in
    each group, is the integer part of n/ngroup.  The groups are chosen
    at random if ngroup < n.  (If n/leave.out is not an integer, the last
    group will contain > leave.out observations).  Then theta.fit is applied
    with the kth group of observations deleted, for k=1, 2, ngroup.
    Finally, the fitted value is computed for the kth group using
    \code{theta.predict}.} 
  \item{ngroup}{The number of groups}
  \item{leave.out}{The number of observations in each group}
  \item{groups}{A list of length ngroup containing the indices of the
    observations 
    in each group. Only returned if \code{leave.out > 1}.}
}
\references{
  Stone, M. (1974).  Cross-validation choice and assessment of
  statistical predictions. Journal of the Royal Statistical Society,
  B-36, 111--147.
  
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
  Chapman and Hall, New York, London.
}
\examples{
# cross-validation of least squares regression
# note that crossval is not very efficient, and being a
#  general purpose function, it does not use the
# Sherman-Morrison identity for this special case
x <- rnorm(85)  
y <- 2*x +.5*rnorm(85)                      
theta.fit <- function(x,y)\{lsfit(x,y)\}
theta.predict <- function(fit,x)\{
               cbind(1,x)\%*\%fit$coef         
               \}                       
results <- crossval(x,y,theta.fit,theta.predict,ngroup=6)  
                                      
}

