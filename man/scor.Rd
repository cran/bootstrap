\name{scor}
\alias{scor}
\docType{data}
\concept{bootstrap principal component analysis}
\title{ Open/Closed Book Examination Data    }
\description{
  This is data form mardia, Kent and Bibby on 88 students who took
  examinations in 5 subjects. Some where with open book and other with closed book.
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
data(scor)
str(scor) 
plot(scor) 
}
\keyword{datasets}
