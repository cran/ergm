#  File ergm/R/ergm.design.R
#  Part of the statnet package, http://statnetproject.org
#
#  This software is distributed under the GPL-3 license.  It is free,
#  open source, and has the attribution requirements (GPL Section 7) in
#    http://statnetproject.org/attribution
#
#  Copyright 2010 the statnet development team
######################################################################
ergm.design <- function(nw, model, verbose=FALSE){
  if(network.naedgecount(nw)==0){
    Clist.miss <- list(heads=NULL, tails=NULL, nedges=0, dir=is.directed(nw))
  }else{
    Clist.miss <- ergm.Cprepare(is.na(nw), model)
    if(verbose){
      cat("Design matrix:\n")
      print(summary(is.na(nw)))
    }
  }
  Clist.miss
}
