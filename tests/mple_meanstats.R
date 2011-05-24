#  File ergm/tests/mple_meanstats.R
#  Part of the statnet package, http://statnetproject.org
#
#  This software is distributed under the GPL-3 license.  It is free,
#  open source, and has the attribution requirements (GPL Section 7) in
#    http://statnetproject.org/attribution
#
#  Copyright 2011 the statnet development team
######################################################################
library(ergm)
library(coda)
n<-500
base.net <- network.initialize(n=n,directed=FALSE)
norm.stats<-c(.7,.1,.5)
meanstats<-norm.stats*n
print(meanstats)
cat("Structural check:")
cat("Mean degree:", norm.stats[1]*2,".\n")
cat("Average degree among nodes with degree 2 or higher:", (2*norm.stats[1]-norm.stats[3])/(1-norm.stats[2]-norm.stats[3]),".\n")

ergm.fit<-ergm(base.net~edges+degree(c(0,1)),meanstats=n*norm.stats)
summary(ergm.fit)
ergm.sim<-simulate(ergm.fit,nsim=1000,statsonly=TRUE)

meanstats.sim<-apply(ergm.sim,2,mean)
print(meanstats.sim)
print(effectiveSize(mcmc(ergm.sim)))
print((meanstats.sim-meanstats)/sqrt(apply(ergm.sim,2,var)/effectiveSize(mcmc(ergm.sim))))
