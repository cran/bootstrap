\name{tooth}
\alias{tooth}
\docType{data}
\title{ Tooth Strength Data}
\description{
  Thirteen accident victims have had the strength of their teeth measured, 
  It is desired to predict teeth strength from measurements not requiring
  destructive testing. Four such bvariables have been obtained for 
  each subject, (\code{D1},\code{D2}) are difficult to obtain, 
  (\code{E1},\code{E2}) are easy to obtain.
}
\usage{data(tooth)}
\format{
  A data frame with 13 observations on the following 6 variables.
  \describe{
    \item{patient}{a numeric vector}
    \item{D1}{a numeric vector}
    \item{D2}{a numeric vector}
    \item{E1}{a numeric vector}
    \item{E2}{a numeric vector}
    \item{strength}{a numeric vector}
  }
}
\details{
  Do the easy to obtain variables give as good prediction as the difficult 
to obtain ones?
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
  Chapman and Hall, New York, London.
}
\examples{
str(tooth)
mod.easy <-  lm(strength ~ E1+E2, data=tooth)
mod.diffi <- lm(strength ~ D1+D2, data=tooth)
summary(mod.easy)
summary(mod.diffi)
if(interactive())par(ask=TRUE)
theta <- function(ind) {
    easy <- lm(strength ~ E1+E2, data=tooth, subset=ind)
    diffi<- lm(strength ~ D1+D2, data=tooth, subset=ind)
    (sum(resid(easy)^2) - sum(resid(diffi)^2))/13   }
tooth.boot <- bootstrap(1:13, 2000, theta)
hist(tooth.boot$thetastar)
abline(v=0, col="red2") 
qqnorm(tooth.boot$thetastar)
qqline(tooth.boot$thetastar, col="red2")
}
\keyword{datasets}
