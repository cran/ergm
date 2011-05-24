#  File ergm/tests/testgmonkmiss.R
#  Part of the statnet package, http://statnetproject.org
#
#  This software is distributed under the GPL-3 license.  It is free,
#  open source, and has the attribution requirements (GPL Section 7) in
#    http://statnetproject.org/attribution
#
#  Copyright 2011 the statnet development team
######################################################################
library(ergm)
data(sampson)

#
# Create random 25% missing
#
# msamplike <- rergm(network.size(samplike),prob=0.25, directed=FALSE)
# samplike <- set.graph.attribute(samplike, "design", msamplike)
# summary(samplike)

respondent <- rep(FALSE,network.size(samplike))
respondent[sample(1:network.size(samplike), size=network.size(samplike)-2,replace=FALSE)] <- TRUE
respondent

summary(samplike)

degreedist(samplike)

efit <- ergm(samplike~edges + triangle, MPLEonly=T)
summary(efit)

efit <- ergm(samplike~edges + triangle, maxit=3,
 MCMCsamplesize=1000, interval=1000, burnin=1000)
summary(efit)

## Test bounded degrees.
efit <- ergm(samplike~edges + triangle,constraints=~bd(maxout=9))
summary(efit)

samplike <- set.vertex.attribute(samplike, "respondent", respondent)
rm(respondent)
summary(samplike)

efit <- ergm(samplike~edges + triangle, MPLEonly=T)
summary(efit)

efit <- ergm(samplike~edges + triangle, maxit=3,
 MCMCsamplesize=1000, interval=1000, burnin=1000)
summary(efit)

