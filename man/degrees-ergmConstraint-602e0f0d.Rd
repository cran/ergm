% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/InitErgmConstraint.R
\name{degrees-ergmConstraint}
\alias{degrees-ergmConstraint}
\alias{InitErgmConstraint.degrees}
\alias{InitErgmConstraint.nodedegrees}
\alias{nodedegrees-ergmConstraint}
\title{Preserve the degree of each vertex of the given network}
\usage{
# degrees

# nodedegrees
}
\description{
Only networks
whose vertex degrees are the same as those in the network passed
in the model formula have non-zero probability. If the network is
directed, both indegree and outdegree are preserved.
}
\seealso{
\code{\link{ergmConstraint}} for index of constraints and hints currently visible to the package.

\Sexpr[results=rd,stage=render]{ergm:::.formatTermKeywords("ergmConstraint", "degrees", "subsection")}
}
\concept{directed}
\concept{undirected}
