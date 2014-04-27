\name{patch}
\alias{patch}
\docType{data}
\concept{bioequivalence}
\concept{ratio estimation}
\title{  The Patch Data  }
\description{
   Eight subjects wore medical patches designed to infuse a naturally-occuring
   hormone into the blood stream.
}
\usage{data(patch)}
\format{
  A data frame with 8 observations on the following 6 variables.
  \describe{
    \item{subject}{a numeric vector}
    \item{placebo}{a numeric vector}
    \item{oldpatch}{a numeric vector}
    \item{newpatch}{a numeric vector}
    \item{z}{a numeric vector, oldpatch - placebo}
    \item{y}{a numeric vector, newpatch - oldpatch}
  }
}
\details{
  Eight subjects wore medical patches designed to infuse a certain
  naturally-occuring hormone into the blood stream. Each subject had his
  blood levels of the hormone measured after wearing three different patches:
  a placebo patch, an "old" patch manufactured at an older plant, and a
  "new" patch manufactured at a newly opened plant. 

  The purpose of the study was to show \emph{bioequivalence}. Patchs from the
old plant was already approved for sale by the FDA (food and drug 
administration). Patches from the new facility would not need a full new
approval, if they could be shown bioequivalent to the patches from 
the old plant. 

Bioequivalence was defined as 
\deqn{\frac{|E(\mbox{new}) - E(\mbox{old})|}{ E(\mbox{old})-E(\mbox{placebo})}
           \le .20}{|E(new)-E(old)|/(E(old)-E(placebo)) <= 0.20}

The book uses this to investigate bias of ratio estimation.
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
  Chapman and Hall, New York, London.
}
\examples{
str(patch) 
 theta <- function(ind){
      Y <- patch[ind,"y"]
      Z <- patch[ind,"z"]
      mean(Y)/mean(Z) }
patch.boot <- bootstrap(1:8, 2000, theta)
names(patch.boot)          
hist(patch.boot$thetastar)
abline(v=c(-0.2, 0.2), col="red2")
theta(1:8) #sample plug-in estimator
abline(v=theta(1:8) , col="blue")
# The bootstrap bias estimate:
mean(patch.boot$thetastar) - theta(1:8)
sd(patch.boot$thetastar) # bootstrapped standard error
}
\keyword{datasets}
