\name{bootpred}
\title{Bootstrap Estimates of Prediction Error}
\description{See Efron and Tibshirani (1993) for details on this
  function.}
\keyword{nonparametric}
\alias{bootpred}
\usage{
bootpred(x,y,nboot,theta.fit,theta.predict,err.meas,...)
}
\arguments{
  \item{x}{a matrix containing the predictor (regressor) values. Each row
    corresponds to an observation.}
  \item{y}{a vector containing the response values}
  \item{nboot}{the number of bootstrap replications}
  \item{theta.fit}{function to be cross-validated. Takes \code{x} and
    \code{y} as an argument. See example below.}
  \item{theta.predict}{function producing predicted values for
    \code{theta.fit}. Arguments are a matrix \code{x} of predictors and
    fit object produced by \code{theta.fit}. See example below.}
  \item{err.meas}{function specifying error measure for a single
    response \code{y} and prediction \code{yhat}. See examples below} 
  \item{\dots}{any additional arguments to be passed to
    \code{theta.fit}}
}
\value{
  list with the following components
  \item{app.err}{the apparent error rate - that is, the mean value of
    \code{err.meas} when \code{theta.fit} is applied to \code{x} and
    \code{y}, and then used to predict \code{y}.} 
  \item{optim}{the bootstrap estimate of optimism in \code{app.err}. A useful
    estimate of prediction error is \code{app.err+optim}} 
  \item{err.632}{the ".632" bootstrap estimate of prediction error.}
}
\references{
  Efron, B. (1983). Estimating the error rate of a prediction rule:
  improvements on cross-validation. J. Amer. Stat. Assoc, vol 78. pages
  316-31. 
  
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
  Chapman and Hall, New York, London.}
}
\examples{
# bootstrap prediction error estimation in least squares
#  regression
x <- rnorm(85)  
y <- 2*x +.5*rnorm(85)                      
theta.fit <- function(x,y)\{lsfit(x,y)\}
theta.predict <- function(fit,x)\{
               cbind(1,x)\%*\%fit$coef         
               \}    
sq.err <- function(y,yhat) \{ (y-yhat)^2\}                   
results <- bootpred(x,y,20,theta.fit,theta.predict,
     err.meas=sq.err)  
                                      
# for a classification problem, a standard choice 
# for err.meas would simply count up the
#  classification errors:
miss.clas <- function(y,yhat)\{ 1*(yhat!=y)\}
# with this specification,  bootpred estimates 
#  misclassification rate
}

