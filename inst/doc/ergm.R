## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(
cache=TRUE,
autodep=TRUE,
concordance=TRUE,
error=FALSE,
width=6,fig.height=6
)
options(width=75)

## ----eval=FALSE----------------------------------------------------------
#  install.packages('ergm')

## ------------------------------------------------------------------------
library(ergm)

## ------------------------------------------------------------------------
set.seed(0)

## ----eval=FALSE----------------------------------------------------------
#  ergmTerm

## ----eval=FALSE----------------------------------------------------------
#  ergmTerm?edges

## ------------------------------------------------------------------------
search.ergmTerms(keyword='homophily')

## ----eval=FALSE----------------------------------------------------------
#  vignette('ergm-term-crossRef')

## ----eval=FALSE----------------------------------------------------------
#  vignette("networkVignette")

## ----eval=FALSE----------------------------------------------------------
#  data(package='ergm') # tells us the datasets in our packages

## ------------------------------------------------------------------------
data(florentine) # loads flomarriage and flobusiness data
flomarriage # Look at the flomarriage network properties (uses `network`), esp. the vertex attributes
par(mfrow=c(1,2)) # Setup a 2 panel plot
plot(flomarriage, 
     main="Florentine Marriage", 
     cex.main=0.8, 
     label = network.vertex.names(flomarriage)) # Plot the network
wealth <- flomarriage %v% 'wealth' # %v% references vertex attributes
wealth
plot(flomarriage, 
     vertex.cex=wealth/25, 
     main="Florentine marriage by wealth", cex.main=0.8) # Plot the network with vertex size proportional to wealth

## ------------------------------------------------------------------------
summary(flomarriage ~ edges) # Look at the $g(y)$ statistic for this model
flomodel.01 <- ergm(flomarriage ~ edges) # Estimate the model 
summary(flomodel.01) # Look at the fitted model object

## ----message = FALSE-----------------------------------------------------
summary(flomarriage~edges+triangle) # Look at the g(y) stats for this model
flomodel.02 <- ergm(flomarriage~edges+triangle) 
summary(flomodel.02)

## ------------------------------------------------------------------------
class(flomodel.02) # this has the class ergm

names(flomodel.02) # the ERGM object contains lots of components.

## ------------------------------------------------------------------------
coef(flomodel.02) # you can extract/inspect individual components

## ------------------------------------------------------------------------
summary(wealth) # summarize the distribution of wealth
# plot(flomarriage, 
#      vertex.cex=wealth/25, 
#      main="Florentine marriage by wealth", 
#      cex.main=0.8) # network plot with vertex size proportional to wealth
summary(flomarriage~edges+nodecov('wealth')) # observed statistics for the model
flomodel.03 <- ergm(flomarriage~edges+nodecov('wealth'))
summary(flomodel.03)

## ------------------------------------------------------------------------
data(faux.mesa.high) 
mesa <- faux.mesa.high

## ------------------------------------------------------------------------
mesa
par(mfrow=c(1,1)) # Back to 1-panel plots
plot(mesa, vertex.col='Grade')
legend('bottomleft',fill=7:12,
       legend=paste('Grade',7:12),cex=0.75)

## ------------------------------------------------------------------------
fauxmodel.01 <- ergm(mesa ~edges + 
                       nodefactor('Grade') + nodematch('Grade',diff=T) +
                       nodefactor('Race') + nodematch('Race',diff=T))
summary(fauxmodel.01)

## ------------------------------------------------------------------------
table(mesa %v% 'Race') # Frequencies of race
mixingmatrix(mesa, "Race")

## ------------------------------------------------------------------------
summary(mesa ~edges  + 
          nodefactor('Grade') + nodematch('Grade',diff=T) +
          nodefactor('Race') + nodematch('Race',diff=T))

## ------------------------------------------------------------------------
data(samplk) 
ls() # directed data: Sampson's Monks
samplk3
plot(samplk3)
summary(samplk3~edges+mutual)

## ----message = F---------------------------------------------------------
sampmodel.01 <- ergm(samplk3~edges+mutual)
summary(sampmodel.01)

## ------------------------------------------------------------------------
missnet <- network.initialize(10,directed=F) # initialize an empty net with 10 nodes
missnet[1,2] <- missnet[2,7] <- missnet[3,6] <- 1 # add a few ties
missnet[4,6] <- missnet[4,9] <- missnet[5,6] <- NA # mark a few dyads missing
summary(missnet)

# plot missnet with missing dyads colored red. 
tempnet <- missnet
tempnet[4,6] <- tempnet[4,9] <- tempnet[5,6] <- 1
missnetmat <- as.matrix(missnet)
missnetmat[is.na(missnetmat)] <- 2
plot(tempnet,label = network.vertex.names(tempnet),
     edge.col = missnetmat)

# fit an ergm to the network with missing data identified
summary(missnet~edges)
summary(ergm(missnet~edges))

## ------------------------------------------------------------------------
missnet_bad <- missnet # create network with missing dyads set to 0
missnet_bad[4,6] <- missnet_bad[4,9] <- missnet_bad[5,6] <- 0

# fit an ergm to the network with missing dyads set to 0
summary(missnet_bad)
summary(ergm(missnet_bad~edges))

## ----message = F---------------------------------------------------------
summary(flobusiness~edges+degree(1))
fit <- ergm(flobusiness~edges+degree(1))
summary(fit)
mcmc.diagnostics(fit)

## ------------------------------------------------------------------------
flomodel.03.sim <- simulate(flomodel.03,nsim=10)

class(flomodel.03.sim) # what does this produce?
summary(flomodel.03.sim) # quick summary
attributes(flomodel.03.sim) # what's in this object?

# are the simulated stats centered on the observed stats?
rbind("obs"=summary(flomarriage~edges+nodecov("wealth")),
      "sim mean"=colMeans(attr(flomodel.03.sim, "stats"))) 

# we can also plot individual simulations
flomodel.03.sim[[1]]
plot(flomodel.03.sim[[1]], 
     label= flomodel.03.sim[[1]] %v% "vertex.names",
     vertex.cex = (flomodel.03.sim[[1]] %v% "wealth")/25)

## ------------------------------------------------------------------------
flomodel.03.gof <- gof(flomodel.03)
flomodel.03.gof
plot(flomodel.03.gof)

## ------------------------------------------------------------------------
mesamodel.02 <- ergm(mesa~edges)
mesamodel.02.gof <- gof(mesamodel.02~degree + esp + distance, 
                        control = control.gof.ergm(nsim=10))
plot(mesamodel.02.gof)


## ----eval=FALSE----------------------------------------------------------
#  fit <- ergm(flobusiness~edges+degree(1),
#    control=control.ergm(MCMC.interval=1, MCMC.burnin=1000, seed=1))

## ----eval=FALSE----------------------------------------------------------
#  mcmc.diagnostics(fit, center=F)

## ----eval=FALSE----------------------------------------------------------
#  fit <- ergm(flobusiness~edges+degree(1))
#  mcmc.diagnostics(fit, center=F)

## ------------------------------------------------------------------------
data('faux.magnolia.high')
magnolia <- faux.magnolia.high
plot(magnolia, vertex.cex=.5)

## ----error=TRUE----------------------------------------------------------
fit <- ergm(magnolia~edges+triangle, control=control.ergm(seed=1))

## ----eval=FALSE----------------------------------------------------------
#  fit <- ergm(magnolia~edges+triangle, control=control.ergm(seed=1), verbose=T)

## ----eval=FALSE----------------------------------------------------------
#  fit <- ergm(magnolia~edges+triangle,seed=1,
#   control = control.ergm(seed=1, MCMC.samplesize=20000),
#   verbose=T)
#  mcmc.diagnostics(fit, center=F)

## ----eval=FALSE----------------------------------------------------------
#  fit <- ergm(magnolia~edges+gwesp(0.5,fixed=T)+nodematch('Grade')+nodematch('Race')+
#    nodematch('Sex'),
#   control =  control.ergm(seed=1, MCMLE.MCMC.precision=2))
#  mcmc.diagnostics(fit)

## ----results='hide'------------------------------------------------------
fit <- ergm(magnolia~edges+gwesp(0.25,fixed=T)+nodematch('Grade')+nodematch('Race')+
  nodematch('Sex'),
 control = control.ergm(seed=1, MCMLE.MCMC.precision=2),
 verbose=T)

## ----fig1----------------------------------------------------------------
mcmc.diagnostics(fit)

