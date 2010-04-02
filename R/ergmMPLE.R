#  File ergm/R/ergmMPLE.R
#  Part of the statnet package, http://statnetproject.org
#
#  This software is distributed under the GPL-3 license.  It is free,
#  open source, and has the attribution requirements (GPL Section 7) in
#    http://statnetproject.org/attribution
#
#  Copyright 2010 the statnet development team
######################################################################
ergmMPLE <- function(formula, fitmodel=FALSE, control=control.ergm(),
                     verbose=FALSE, ...) 
{
  if (fitmodel) {
    return(ergm(formula, MPLEonly=TRUE, control=control, verbose=verbose, ...))
  }
  nw <- ergm.getnetwork(formula)
  model <- ergm.getmodel(formula, nw, drop=FALSE, initialfit=TRUE)
  Clist <- ergm.Cprepare(nw, model)
  Clist.miss <- ergm.design(nw, model, verbose=verbose)
  MPLEsetup <- ergm.pl(Clist, Clist.miss, model, verbose=verbose, ...)
  list(response = MPLEsetup$zy, predictor = MPLEsetup$xmat, 
       weights = MPLEsetup$wend)
}

