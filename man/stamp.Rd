\name{stamp}
\alias{stamp}
\docType{data}
\concept{mode}
\concept{kernel density estimation}
\concept{stamp}
\title{ Data on Thickness of Stamps  }
\description{
    Thickness in millimeters of 485 postal stamps, printed in 1872. The stamp 
    issue of that year was thought to be a "philatelic mixture", that is, printed 
    on more than one type of paper. It is of historical interest to determine
    how many different types of paper were used. 
}
\usage{data(stamp)}
\format{
  A data frame with 485 observations on the following variable.
  \describe{
    \item{Thickness}{Thickness in millimeters, a numeric vector}
  }
}
\details{
  In the book, this is used to exemplify determination of number of modes. It is also
   used for kernel density estimation.
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
  Chapman and Hall, New York, London.
}
\examples{
data(stamp)
summary(stamp)
hist(stamp$Thickness)
plot(density(stamp$Thickness))
}
\keyword{datasets}
