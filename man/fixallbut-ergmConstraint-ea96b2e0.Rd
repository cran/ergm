% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/InitErgmConstraint.R
\name{fixallbut-ergmConstraint}
\alias{fixallbut-ergmConstraint}
\alias{InitErgmConstraint.fixallbut}
\title{Preserve the dyad status in all but the given edges}
\usage{
# fixallbut(free.dyads)
}
\arguments{
\item{free.dyads}{edgelist or network. Networks will be converted to the corresponding edgelist.}
}
\description{
Preserve the dyad status in all but \code{free.dyads}.
}
\seealso{
\code{\link{ergmConstraint}} for index of constraints and hints currently visible to the package.

\Sexpr[results=rd,stage=render]{ergm:::.formatTermKeywords("ergmConstraint", "fixallbut", "subsection")}
}
\concept{directed}
\concept{dyad-independent}
\concept{undirected}
