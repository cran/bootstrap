\name{diabetes}
\alias{diabetes}
\docType{data}
\title{ Blood Measurements on 43 Diabetic Children   }
\description{
   Measurements on 43 diabetic children of log-Cpeptide (a blood measurement)
   and age (in years). Interest is predicting the blood measurement from age. 
}
\usage{data(diabetes)}
\format{
  A data frame with 43 observations on the following 3 variables.
  \describe{
    \item{obs}{a numeric vector}
    \item{age}{a numeric vector}
    \item{logCpeptide}{a numeric vector}
  }
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
  Chapman and Hall, New York, London.
}
\examples{
plot(logCpeptide ~ age, data=diabetes)
}
\keyword{datasets}
