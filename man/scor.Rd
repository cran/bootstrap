\name{scor}
\alias{scor}
\docType{data}
\concept{bootstrap principal component analysis}
\title{ Open/Closed Book Examination Data    }
\description{
  This is data form mardia, Kent and Bibby on 88 students who took
  examinations in 5 subjects. Some where with open book and other with 
   closed book.
}
\usage{data(scor)}
\format{
  A data frame with 88 observations on the following 5 variables.
  \describe{
    \item{mec}{mechanics, closed book note}
    \item{vec}{vectors, closed book note}
    \item{alg}{algebra, open book note}
    \item{ana}{analysis, open book note}
    \item{sta}{statistics, open book note}
  }
}
\details{
  The book uses this for bootstrap in principal component analysis.
}
\source{
   Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
   Chapman and Hall, New York, London.
}
\examples{
str(scor) 
if(interactive())par(ask=TRUE)
plot(scor) 
# The parameter of interest (theta) is the fraction of variance explained 
# by the first principal component.
# For principal components analysis svd is better numerically than 
# eigen-decomposistion, but for bootstrapping the latter is _much_ faster.
theta <- function(ind) {
   vals <- eigen(var(scor[ind,]), symmetric=TRUE, only.values=TRUE)$values
   vals[1] / sum(vals) }
scor.boot <- bootstrap(1:88, 500, theta)
sd(scor.boot$thetastar) # bootstrap standard error
hist(scor.boot$thetastar)
abline(v=theta(1:88), col="red2")
abline(v=mean(scor.boot$thetastar), col="blue")
}
\keyword{datasets}
