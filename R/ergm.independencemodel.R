#  File ergm/R/ergm.independencemodel.R
#  Part of the statnet package, http://statnetproject.org
#
#  This software is distributed under the GPL-3 license.  It is free,
#  open source, and has the attribution requirements (GPL Section 7) in
#    http://statnetproject.org/attribution
#
#  Copyright 2010 the statnet development team
######################################################################
ergm.independencemodel <- function(m) {
# Return TRUE or FALSE, depending on whether the model object m has
# every term with dependence=FALSE set.

  ans <- TRUE
  for (i in 1:length(m$terms)) {
    if(is.null(m$terms[[i]]$dependence) || m$terms[[i]]$dependence)
      ans <- FALSE
  }
  ans
}
