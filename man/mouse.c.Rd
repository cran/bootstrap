\name{mouse.c}
\alias{mouse.c}
\docType{data}
\title{ Experiments with mouse    }
\description{
   A small randomized experiment were done with 16 mouse, 7 to treatment group
  and 9 to control group. Treatment was intended to prolong survival 
  after a test surgery.
}
\usage{data(mouse.c)}
\format{
  The format is:
 num [1:9] 52 104 146 10 50 31 40 27 46
}
\details{
   The treatment group is is dataset \code{\link{mouse.t}}. \code{mouse.c}
   is the control group. The book uses this example to illustrate 
   bootstrapping a sample mean. Measurement unit is days of survival following
   surgery.
}
\source{
  Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap. 
  Chapman and Hall, New York, London.
}
\examples{
str(mouse.c)
if(interactive())par(ask=TRUE)
stripchart(list(treatment=mouse.t, control=mouse.c))
cat("bootstrapping the difference of means, treatment - control:\n")
cat("bootstrapping is done independently for the two groups\n")
mouse.boot.c <- bootstrap(mouse.c, 2000, mean)
mouse.boot.t <- bootstrap(mouse.t, 2000, mean)
mouse.boot.diff <- mouse.boot.t$thetastar - mouse.boot.c$thetastar
hist(mouse.boot.diff)
abline(v=0, col="red2")
sd(mouse.boot.diff)
}
\keyword{datasets}
