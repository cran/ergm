% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{faux.desert.high}
\alias{faux.desert.high}
\title{Faux desert High School as a network object}
\format{
\code{faux.desert.high} is a \code{\link[network:network]{network}} object
with 107 vertices (students, in this case) and 439 directed edges
(friendship nominations). To obtain additional summary information about it,
type \code{summary(faux.desert.high)}.

The vertex attributes are \code{Grade}, \code{Sex}, and \code{Race}. The
\code{Grade} attribute has values 7 through 12, indicating each student's
grade in school.  The \code{Race} attribute is based on the answers to two
questions, one on Hispanic identity and one on race, and takes six possible
values: White (non-Hisp.), Black (non-Hisp.), Hispanic, Asian (non-Hisp.),
Native American, and Other (non-Hisp.)
}
\source{
The data set is simulation based upon an ergm model fit to data from
one school community from the AddHealth Study, Wave I (Resnick et al.,
1997). It was constructed as follows:

The school in question (a single school with 7th through 12th grades) was
selected from the Add Health "structure files."  Documentation on these
files can be found here:
\url{https://addhealth.cpc.unc.edu/documentation/codebooks/}.

The stucture file contains directed out-ties representing each instance of a
student who named another student as a friend.  Students could nominate up
to 5 male and 5 female friends. Note that registered students who did not
take the AddHealth survey or who were not listed by name on the schools'
student roster are not included in the stucture files.  In addition, we
removed any students with missing values for race, grade or sex.

The following \code{\link[=ergm]{ergm()}} specification was fit to the original data
(with code updated for modern syntax):

\preformatted{ desert.fit <- ergm(original.net ~ edges + mutual +
absdiff("grade") + nodefactor("race", base=5) + nodefactor("grade", base=3)
+ nodefactor("sex") + nodematch("race", diff = TRUE) + nodematch("grade",
diff = TRUE) + nodematch("sex", diff = FALSE) + idegree(0:1) + odegree(0:1)
+ gwesp(0.1,fixed=T), constraints = ~bd(maxout=10), control =
control.ergm(MCMLE.steplength = .25, MCMC.burnin = 100000, MCMC.interval =
10000, MCMC.samplesize = 2500, MCMLE.maxit = 100), verbose=T) }

Then the faux.desert.high dataset was created by simulating a single network
from the above model fit:

\preformatted{ faux.desert.high <- simulate(desert.fit, nsim=1,
                 control=snctrl(MCMC.burnin=1e+8),
                 constraints = ~edges) }
}
\usage{
data(faux.desert.high)
}
\description{
This data set represents a simulation of a directed in-school friendship
network.  The network is named faux.desert.high.
}
\section{Licenses and Citation}{
 If the source of the data set does not
specified otherwise, this data set is protected by the Creative Commons
License \url{https://creativecommons.org/licenses/by-nc-nd/2.5/}.

When publishing results obtained using this data set, the original authors
(Resnick et al, 1997) should be cited. In addition this package should be
cited as:

Mark S. Handcock, David R. Hunter, Carter T. Butts, Steven M. Goodreau, and
Martina Morris. 2003 \emph{statnet: Software tools for the Statistical
Modeling of Network Data} \cr \url{https://statnet.org}.
}

\references{
Resnick M.D., Bearman, P.S., Blum R.W. et al. (1997). \emph{Protecting
adolescents from harm. Findings from the National Longitudinal Study on
Adolescent Health}, \emph{Journal of the American Medical Association}, 278:
823-32.
}
\seealso{
\code{\link[network:network]{network}},
\code{\link[network:plot.network]{plot.network()}}, \code{\link[=ergm]{ergm()}},
\code{\link{faux.desert.high}}, \code{\link{faux.mesa.high}},
\code{\link{faux.magnolia.high}}
}
\keyword{datasets}
