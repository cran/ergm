% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rlebdm.R
\name{as.rlebdm.ergm_conlist}
\alias{as.rlebdm.ergm_conlist}
\title{Extract dyad-level ERGM constraint information into an \code{\link{rlebdm}} object}
\usage{
\method{as.rlebdm}{ergm_conlist}(
  x,
  constraints.obs = NULL,
  which = c("free", "missing", "informative"),
  ...
)
}
\arguments{
\item{x}{an \code{\link{ergm_conlist}} object: a list of initialised
constraints. \code{NULL} is treated as a placeholder for no constraint
(i.e., a constant matrix of \code{TRUE}).}

\item{constraints.obs}{an \code{\link{ergm_conlist}} object specifying the
observation process constraints; defaults to \code{NULL} for all dyads
observed (i.e., a constant matrix of \code{FALSE}).}

\item{which}{which aspect of the constraint to extract: \describe{

\item{\code{free}}{for dyads that \emph{may} be toggled under the constraints
\code{x}; ignores \code{constraints.obs};}

\item{\code{missing}}{for dyads that are free but considered unobserved
under the constraints; and}

\item{\code{informative}}{for dyads that are both free and observed.}

}}

\item{...}{additional arguments, currently unused.}
}
\description{
A function to combine the \code{free_dyads} attributes of the
constraints appropriately to generate an \code{\link{rlebdm}} of dyads
toggleable and/or missing and/or informative under that combination
of constraints.
}
\note{
For \code{which=="free"} or \code{"informative"}, \code{NULL} return value
is a placeholder for a matrix of \code{TRUE}, whereas for
\code{which=="missing"} it is a placeholder for a matrix of \code{FALSE}.

Each element in the constraint list has a sign, which
determins whether the constraint further restricts (for \code{+}) or
potentially relaxes restriction (for \code{-}).
}
\seealso{
\code{\link{ergmConstraint}}
}
\keyword{internal}
