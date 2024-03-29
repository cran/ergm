% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/InitErgmTerm.R
\name{degree-ergmTerm}
\alias{degree-ergmTerm}
\alias{InitErgmTerm.degree}
\title{Degree}
\usage{
# binary: degree(d, by=NULL, homophily=FALSE, levels=NULL)
}
\arguments{
\item{d}{vector of distinct integers}

\item{by, levels, homophily}{the optional argument \code{by} specifies a vertex attribute (see Specifying
Vertex attributes and Levels (\code{?nodal_attributes}) for details).
If this is specified and \code{homophily} is \code{TRUE} ,
then degrees are calculated using the subnetwork consisting of only
edges whose endpoints have the same value of the \code{by} attribute.
If \code{by} is specified and
\code{homophily} is \code{FALSE} (the default), then separate degree range
statistics are calculated for nodes having each separate
value of the attribute. \code{levels} selects which levels of by` to include.}
}
\description{
This term adds one
network statistic to the model for each element in \code{d} ; the \eqn{i} th
such statistic equals the number of nodes in the network of degree
\code{d[i]} , i.e. with exactly \code{d[i]} edges.
This term can only be used with undirected networks; for directed networks
see \code{idegree} and \code{odegree} .
}
\seealso{
\code{\link{ergmTerm}} for index of model terms currently visible to the package.

\Sexpr[results=rd,stage=render]{ergm:::.formatTermKeywords("ergmTerm", "degree", "subsection")}
}
\concept{categorical nodal attribute}
\concept{frequently-used}
\concept{undirected}
