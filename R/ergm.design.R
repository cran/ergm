#  File ergm/R/ergm.design.R
#  Part of the statnet package, http://statnetproject.org
#
#  This software is distributed under the GPL-3 license.  It is free,
#  open source, and has the attribution requirements (GPL Section 7) in
#    http://statnetproject.org/attribution
#
#  Copyright 2011 the statnet development team
######################################################################
#################################################################################
# The <ergm.design> function functions as <ergm.Cprepare> would, but acts on the
# network of missing edges
#
# --PARAMETERS--
#   nw     : the network
#   model  : the model, as returned by <ergm.getmodel>
#   verbose: whether the design matrix should be printed (T or F); default=FALSE
#
# --RETURNED--
#   Clist.miss
#      if 'nw' has missing edges, see the return list, 'Clist', from the
#                                 <ergm.Cprepare> function header
#      if 'nw' hasn't any missing edges, the list will only contain NULL
#                                 values for the 'tails' and 'heads' components,
#                                 a 0 for 'nedges' and 'dir' appropriately set
################################################################################

ergm.design <- function(nw, model, verbose=FALSE){
  if(network.naedgecount(nw)==0){
    Clist.miss <- list(tails=NULL, heads=NULL, nedges=0, dir=is.directed(nw))
  }else{
    Clist.miss <- ergm.Cprepare(is.na(nw), model)
    if(verbose){
      cat("Design matrix:\n")
      print(summary(is.na(nw)))
    }
  }
  Clist.miss
}
