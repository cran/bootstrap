\name{cell}
\alias{cell}
\docType{data}
\concept{regression without intercept}
\concept{regression through the origin}
\concept{robust regression}
\concept{radiation damage}
\title{  Cell Survival data }
\description{
  Data on cell survival under different radiation 
  doses.
}
\usage{data(cell)}
\format{
  A data frame with 14 observations on the following 2 variables.
  \describe{
    \item{dose}{a numeric vector, unit rads/100 }
    \item{log.surv}{a numeric vector, (natural) logarithm of proportion}
  }
}
\details{
  There are regression situations where the covariates are more naturally considered 
  fixed rather than random. This cell survival data are an example. A radiologist has run
  an experiment involving 14 bacterial plates. The plates where exposed to different 
  doses of radiation, and the proportion of surviving cells measured. Greater doses lead to
  smaller survival proportions, as would be expected. The investigator expressed some 
  doubt as to the validity of observation 13. 

  So there is some interest as to the influence of observation 13 on the conclusions.

  Two different theoretical models as to radiation damage were available, one predicting 
  a linear regresion, 
  \deqn{\mu_i = \mbox{E}(y_i \vert z_i) = \beta_1 z_i}{%
       {mu_i = E(y_i | z_i) = beta_1 z_i}}
  and the other predicting a quadratic regression,
  \deqn{\mu_i = \mbox{E}(y_i \vert z_i) = \beta_1 z_i+\beta_2 z_i^2}{%
       {mu_i = E(y_i | z_i) = beta_1 z_i + beta_2 z_i^2}}
  Hypothesis tests on \eqn{\beta_2}{beta_2} is of interest.
}
\source{
   Efron, B. and Tibshirani, R. (1993) An Introduction to the Bootstrap.
  Chapman and Hall, New York, London.
}
\examples{
data(cell)
plot(cell[,2:1],pch=c(rep(1,12),17,1),
                col=c(rep("black",12),"red", "black"),
                cex=c(rep(1,12), 2, 1))
}
\keyword{datasets}
