% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/InitErgmTerm.R
\name{ergm_edgecov_args}
\alias{ergm_edgecov_args}
\title{A common pattern for obtaining an edge covariate}
\usage{
ergm_edgecov_args(name, nw, a)
}
\arguments{
\item{name}{a string containing the name of the calling term.}

\item{nw}{the LHS network.}

\item{a}{list returned by \code{\link[=check.ErgmTerm]{check.ErgmTerm()}}.}
}
\value{
A list with two elements: \code{xm} for the obtained predictor
matrix and \code{cn} for the standard coefficient name.
}
\description{
A common pattern for obtaining an edge covariate
}
\keyword{internal}
