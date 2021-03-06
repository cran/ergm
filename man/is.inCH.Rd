% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is.inCH.R
\name{is.inCH}
\alias{is.inCH}
\title{Determine whether a vector is in the closure of the convex hull of some
sample of vectors}
\usage{
is.inCH(p, M, verbose = FALSE, ...)
}
\arguments{
\item{p}{A \eqn{d}-dimensional vector or a matrix with \eqn{d} columns}

\item{M}{An \eqn{n} by \eqn{d} matrix.  Each row of \code{M} is a
\eqn{d}-dimensional vector.}

\item{verbose}{A logical or an integer to control the amount of
progress and diagnostic information to be printed. \code{FALSE}/\code{0}
produces minimal output, wit higher values producing more
detail. Note that very high values (5+) may significantly slow
down processing.}

\item{\dots}{arguments passed directly to linear program solver}
}
\value{
Logical, telling whether \code{p} is (or all rows of \code{p} are)
in the closed convex hull of the points in \code{M}.
}
\description{
\code{is.inCH} returns \code{TRUE} if and only if \code{p} is contained in
the convex hull of the points given as the rows of \code{M}. If \code{p} is
a matrix, each row is tested individually, and \code{TRUE} is returned if
all rows are in the convex hull.
}
\details{
The \eqn{d}-vector \code{p} is in the convex hull of the \eqn{d}-vectors
forming the rows of \code{M} if and only if there exists no separating
hyperplane between \code{p} and the rows of \code{M}.  This condition may be
reworded as follows:

Letting \eqn{q=(1 p')'} and \eqn{L = (1 M)}, if the minimum value
of \eqn{z'q} for all \eqn{z} such that \eqn{z'L \ge 0} equals zero
(the minimum must be at most zero since z=0 gives zero), then there
is no separating hyperplane and so \code{p} is contained in the
convex hull of the rows of \code{M}. So the question of interest
becomes a constrained optimization problem.

Lastly, in the event of such a hyperplane existing, one can make
the objective function arbitrarily low by multiplying \eqn{z} by a
large positive constant. To prevent it from running away, we
constrain the elements of \eqn{z} to be between \eqn{-1} and
\eqn{+1}.

Solving this problem relies on the package \pkg{lpSolveAPI} to solve a linear
program.

This function is used in the "stepping" algorithm of Hummel et al (2012).
}
\references{
\itemize{ \item
\url{https://www.cs.mcgill.ca/~fukuda/soft/polyfaq/node22.html}

\item Hummel, R. M., Hunter, D. R., and Handcock, M. S. (2012), Improving
Simulation-Based Algorithms for Fitting ERGMs, Journal of Computational and
Graphical Statistics, 21: 920-939. }
}
\keyword{internal}
