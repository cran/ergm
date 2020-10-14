## ----include=FALSE------------------------------------------------------------
library(knitr)
opts_chunk$set(
concordance=TRUE,
error=FALSE
)

## ----include=FALSE------------------------------------------------------------
library(knitr)
opts_chunk$set(
width=6,fig.height=6
)

## ----foo,include=FALSE,echo=FALSE---------------------------------------------

foo <- packageDescription("ergm")

## ----echo=FALSE----------------------------------------------------------
options(width=75)

## ----eval=FALSE----------------------------------------------------------
#  setwd('full.path.for.the.folder')

## ----eval=FALSE----------------------------------------------------------
#  install.packages('statnet')
#  library(statnet)

## ----eval=FALSE----------------------------------------------------------
#  install.packages('network')
#  install.packages('ergm')
#  install.packages('sna')
#  library(network)
#  library(ergm)
#  library(sna)

## ----eval=FALSE----------------------------------------------------------
#  update.packages('name.of.package')

## ----eval=FALSE----------------------------------------------------------
#  install.packages('coda')
#  library(coda)

## ----eval=FALSE----------------------------------------------------------
#  library(statnet)

## ----results='hide'------------------------------------------------------
library(ergm)
library(sna)
set.seed(1)

## ------------------------------------------------------------------------
data(package='ergm') # tells us the datasets in our packages
data(florentine) # loads flomarriage and flobusiness data
flomarriage # Let's look at the flomarriage data
plot(flomarriage) # Let's view the flomarriage network

## ------------------------------------------------------------------------
flomodel.01 <- ergm(flomarriage~edges) # fit model
flomodel.01 

summary(flomodel.01) # look in more depth

## ------------------------------------------------------------------------
flomodel.02 <- ergm(flomarriage~edges+triangle) 
summary(flomodel.02)

## ----results='hide'------------------------------------------------------
coef1 = flomodel.02$coef[1]
coef2 = flomodel.02$coef[2]
logodds = coef1 + c(0,1,2) * coef2
expit = function(x) 1/(1+exp(-x))
ps = expit(logodds)
coef1 = round(coef1, 3)
coef2 = round(coef2, 3)
logodds = round(logodds, 3)
ps = round(ps, 3)

## ------------------------------------------------------------------------
class(flomodel.02) # this has the class ergm

names(flomodel.02) # let's look straight at the ERGM obj.

## ------------------------------------------------------------------------
flomodel.02$coef 
flomodel.02$formula 
flomodel.02$mle.lik
wealth <- flomarriage %v% 'wealth' # the %v% extracts vertex
wealth # attributes from a network
plot(flomarriage, vertex.cex=wealth/25) # network plot with vertex size 
                                        # proportional to wealth

## ------------------------------------------------------------------------
flomodel.03 <- ergm(flomarriage~edges+nodecov('wealth'))
summary(flomodel.03)

## ----eval=FALSE----------------------------------------------------------
#  data(samplk)
#  ls() # directed data: Sampson's Monks
#  samplk3
#  plot(samplk3)
#  sampmodel.01 <- ergm(samplk3~edges+mutual)
#  summary(sampmodel.01)

## ------------------------------------------------------------------------
data(faux.mesa.high) 
mesa <- faux.mesa.high

## ----eval=FALSE----------------------------------------------------------
#  plot(mesa)
#  mesa
#  plot(mesa, vertex.col='Grade')
#  legend('bottomleft',fill=7:12,legend=paste('Grade',7:12),cex=0.75)
#  fauxmodel.01 <- ergm(mesa ~edges + nodematch('Grade',diff=T) + nodematch('Race',diff=T))
#  summary(fauxmodel.01)

## ------------------------------------------------------------------------
table(mesa %v% 'Race') # Frequencies of race
mixingmatrix(mesa, "Race")

## ----eval=FALSE----------------------------------------------------------
#  missnet <- network.initialize(10,directed=F)
#  missnet[1,2] <- missnet[2,7] <- missnet[3,6] <- 1
#  missnet[4,6] <- missnet[4,9] <- NA
#  missnet
#  plot(missnet)
#  ergm(missnet~edges)

## ----eval=FALSE----------------------------------------------------------
#  ergm(missnet~edges+degree(2))
#  missnet[4,6] <- missnet[4,9] <- 0
#  ergm(missnet~edges+degree(2))

## ----eval=FALSE,echo=TRUE------------------------------------------------
#  help('ergm-terms')

## ------------------------------------------------------------------------
flomodel.03.sim <- simulate(flomodel.03,nsim=10)
class(flomodel.03.sim) 
summary(flomodel.03.sim)
length(flomodel.03.sim)
flomodel.03.sim[[1]]
plot(flomodel.03.sim[[1]], label= flomodel.03.sim[[1]] %v% "vertex.names")

## ------------------------------------------------------------------------
flomodel.03.gof <- gof(flomodel.03~degree)

flomodel.03.gof
plot(flomodel.03.gof)

## ------------------------------------------------------------------------
mesamodel.02 <- ergm(mesa~edges)
mesamodel.02.gof <- gof(mesamodel.02~distance,control=control.gof.ergm(nsim=10))
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
#  fit <- ergm(magnolia~edges+gwesp(0.5,fixed=T),
#   control =  control.ergm(seed=1))
#  mcmc.diagnostics(fit)

## ----eval=FALSE----------------------------------------------------------
#  fit <- ergm(magnolia~edges+gwesp(0.5,fixed=T)+nodematch('Grade')+nodematch('Race')+
#    nodematch('Sex'),
#   control = control.ergm(seed=1),
#   verbose=T)
#  
#  pdf('diagnostics1.pdf')	#Use the recording function if possible, otherwise send to pdf
#  mcmc.diagnostics(fit)
#  dev.off()			#If you saved to pdf, look at the file
#  
#  fit <- ergm(magnolia~edges+gwesp(0.25,fixed=T)+nodematch('Grade')+nodematch('Race')+
#  	nodematch('Sex'),
#   control = control.ergm(seed=1))
#  mcmc.diagnostics(fit)
#  

## ----results='hide'------------------------------------------------------
fit <- ergm(magnolia~edges+gwesp(0.25,fixed=T)+nodematch('Grade')+nodematch('Race')+
  nodematch('Sex'),
 control = control.ergm(seed=1,MCMC.samplesize=4096,MCMC.interval=8192),
 verbose=T)

## ----fig1----------------------------------------------------------------
mcmc.diagnostics(fit)

