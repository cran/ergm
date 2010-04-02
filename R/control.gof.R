#  File ergm/R/control.gof.R
#  Part of the statnet package, http://statnetproject.org
#
#  This software is distributed under the GPL-3 license.  It is free,
#  open source, and has the attribution requirements (GPL Section 7) in
#    http://statnetproject.org/attribution
#
#  Copyright 2010 the statnet development team
######################################################################
control.gof.ergm<-function(prop.weights=NULL,prop.args=NULL,
                           drop=TRUE,
                           summarizestats=FALSE,
                           maxchanges=1000000){
  control<-list()
  for(arg in names(formals(sys.function())))
    control[[arg]]<-get(arg)
  control
}

control.gof.formula<-function(prop.weights="default",prop.args=NULL,
                              drop=TRUE,
                              summarizestats=FALSE,
                              maxchanges=1000000){
  control<-list()
  for(arg in names(formals(sys.function())))
    control[[arg]]<-get(arg)
  control
}
