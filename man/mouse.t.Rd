\name{mouse.t}
\alias{mouse.t}
\docType{data}
\title{ Experiment with mouse     }
\description{
  A small randomized experiment were done with 16 mouse, 7 to treatment group
  and 9 to control group. Treatment was intended to prolong survivl 
  after a test surgery.
}
\usage{data(mouse.t)}
\format{
  The format is:
 num [1:7] 94 197 16 38 99 141 23
}
\details{
  The control group is dataset \code{\link{mouse.c}}. This dataset is 
  the treatment group. The book uses this for exemplifying bootstrapping
  the sample mean. Measurement unit is days of survival following
  surgery.
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
  Chapman and Hall, New York, London.
}
\examples{
data(mouse.t)
data(mouse.c)
str(mouse.t)
stripchart(list(treatment=mouse.t, control=mouse.c))
}
\keyword{datasets}
