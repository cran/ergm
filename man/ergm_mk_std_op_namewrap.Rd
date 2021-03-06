% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/InitErgmTerm.operator.R
\name{ergm_mk_std_op_namewrap}
\alias{ergm_mk_std_op_namewrap}
\title{Combine an operator term's and a subterm's name in a standard fashion.}
\usage{
ergm_mk_std_op_namewrap(opname, opargs = NULL)
}
\arguments{
\item{opname}{Name of the operator (or an abbreviation thereof).}

\item{opargs}{A character vector describing arguments passed to the operator (excluding the model); if lengths exceeds one, will be concatenated with commas.}
}
\value{
A function with 1 required argument, \code{subterms} and one optional argument, \code{subargs}, returning a character vector of length equal to the length of \code{subterms} wrapped in the operator's name and arguments appropriately.
}
\description{
Combine an operator term's and a subterm's name in a standard fashion.
}
\keyword{internal}
