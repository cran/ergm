### R code from vignette source 'ergm.Rnw'

###################################################
### code chunk number 1: foo
###################################################

foo <- packageDescription("ergm")


###################################################
### code chunk number 2: ergm.Rnw:36-37
###################################################
options(width=75)


###################################################
### code chunk number 3: ergm.Rnw:65-66 (eval = FALSE)
###################################################
## setwd('full.path.for.the.folder')


###################################################
### code chunk number 4: ergm.Rnw:71-73 (eval = FALSE)
###################################################
## install.packages('statnet')
## library(statnet)


###################################################
### code chunk number 5: ergm.Rnw:79-85 (eval = FALSE)
###################################################
## install.packages('network')
## install.packages('ergm')
## install.packages('sna')
## library(network)
## library(ergm)
## library(sna)


###################################################
### code chunk number 6: ergm.Rnw:92-93 (eval = FALSE)
###################################################
## update.packages('name.of.package')


###################################################
### code chunk number 7: ergm.Rnw:99-101 (eval = FALSE)
###################################################
## install.packages('coda')
## library(coda)


###################################################
### code chunk number 8: ergm.Rnw:109-110 (eval = FALSE)
###################################################
## library(statnet)


###################################################
### code chunk number 9: ergm.Rnw:115-118
###################################################
library(ergm)
library(sna)
set.seed(1)


###################################################
### code chunk number 10: ergm.Rnw:125-129
###################################################
data(package='ergm') # tells us the datasets in our packages
data(florentine) # loads flomarriage and flobusiness data
flomarriage # Let's look at the flomarriage data
plot(flomarriage) # Let's view the flomarriage network


###################################################
### code chunk number 11: ergm.Rnw:153-157
###################################################
flomodel.01 <- ergm(flomarriage~edges) # fit model
flomodel.01 

summary(flomodel.01) # look in more depth


###################################################
### code chunk number 12: ergm.Rnw:180-182
###################################################
flomodel.02 <- ergm(flomarriage~edges+triangle) 
summary(flomodel.02)


###################################################
### code chunk number 13: ergm.Rnw:185-194
###################################################
coef1 = flomodel.02$coef[1]
coef2 = flomodel.02$coef[2]
logodds = coef1 + c(0,1,2) * coef2
expit = function(x) 1/(1+exp(-x))
ps = expit(logodds)
coef1 = round(coef1, 3)
coef2 = round(coef2, 3)
logodds = round(logodds, 3)
ps = round(ps, 3)


###################################################
### code chunk number 14: ergm.Rnw:213-216
###################################################
class(flomodel.02) # this has the class ergm

names(flomodel.02) # let's look straight at the ERGM obj.


###################################################
### code chunk number 15: ergm.Rnw:219-226
###################################################
flomodel.02$coef 
flomodel.02$formula 
flomodel.02$mle.lik
wealth <- flomarriage %v% 'wealth' # the %v% extracts vertex
wealth # attributes from a network
plot(flomarriage, vertex.cex=wealth/25) # network plot with vertex size 
                                        # proportional to wealth


###################################################
### code chunk number 16: ergm.Rnw:231-233
###################################################
flomodel.03 <- ergm(flomarriage~edges+nodecov('wealth'))
summary(flomodel.03)


###################################################
### code chunk number 17: ergm.Rnw:247-253 (eval = FALSE)
###################################################
## data(samplk) 
## ls() # directed data: Sampson's Monks
## samplk3
## plot(samplk3)
## sampmodel.01 <- ergm(samplk3~edges+mutual)
## summary(sampmodel.01)


###################################################
### code chunk number 18: ergm.Rnw:258-260
###################################################
data(faux.mesa.high) 
mesa <- faux.mesa.high


###################################################
### code chunk number 19: ergm.Rnw:263-269 (eval = FALSE)
###################################################
## plot(mesa) 
## mesa
## plot(mesa, vertex.col='Grade')
## legend('bottomleft',fill=7:12,legend=paste('Grade',7:12),cex=0.75)
## fauxmodel.01 <- ergm(mesa ~edges + nodematch('Grade',diff=T) + nodematch('Race',diff=T))
## summary(fauxmodel.01)


###################################################
### code chunk number 20: ergm.Rnw:275-277
###################################################
table(mesa %v% 'Race') # Frequencies of race
mixingmatrix(mesa, "Race")


###################################################
### code chunk number 21: ergm.Rnw:286-292 (eval = FALSE)
###################################################
## missnet <- network.initialize(10,directed=F)
## missnet[1,2] <- missnet[2,7] <- missnet[3,6] <- 1
## missnet[4,6] <- missnet[4,9] <- NA
## missnet
## plot(missnet)
## ergm(missnet~edges)


###################################################
### code chunk number 22: ergm.Rnw:299-302 (eval = FALSE)
###################################################
## ergm(missnet~edges+degree(2))
## missnet[4,6] <- missnet[4,9] <- 0
## ergm(missnet~edges+degree(2))


###################################################
### code chunk number 23: ergm.Rnw:358-364
###################################################
flomodel.03.sim <- simulate(flomodel.03,nsim=10)
class(flomodel.03.sim) 
summary(flomodel.03.sim)
length(flomodel.03.sim)
flomodel.03.sim[[1]]
plot(flomodel.03.sim[[1]], label= flomodel.03.sim[[1]] %v% "vertex.names")


###################################################
### code chunk number 24: ergm.Rnw:384-388
###################################################
flomodel.03.gof <- gof(flomodel.03~degree)

flomodel.03.gof
plot(flomodel.03.gof)


###################################################
### code chunk number 25: ergm.Rnw:391-395
###################################################
mesamodel.02 <- ergm(mesa~edges)
mesamodel.02.gof <- gof(mesamodel.02~distance,nsim=10)
plot(mesamodel.02.gof)



###################################################
### code chunk number 26: ergm.Rnw:430-432 (eval = FALSE)
###################################################
## fit <- ergm(flobusiness~edges+degree(1), 
##   control=control.ergm(MCMC.interval=1, MCMC.burnin=1000, seed=1))


###################################################
### code chunk number 27: ergm.Rnw:438-439 (eval = FALSE)
###################################################
## mcmc.diagnostics(fit, center=F)


###################################################
### code chunk number 28: ergm.Rnw:444-446 (eval = FALSE)
###################################################
## fit <- ergm(flobusiness~edges+degree(1))
## mcmc.diagnostics(fit, center=F)


###################################################
### code chunk number 29: ergm.Rnw:451-454
###################################################
data('faux.magnolia.high')
magnolia <- faux.magnolia.high
plot(magnolia, vertex.cex=.5)


###################################################
### code chunk number 30: ergm.Rnw:458-460 (eval = FALSE)
###################################################
## fit <- ergm(magnolia~edges+triangle, control=control.ergm(seed=1))
## mcmc.diagnostics(fit, center=F)


###################################################
### code chunk number 31: ergm.Rnw:462-464
###################################################
try_out <- try(ergm(magnolia~edges+triangle, control=control.ergm(seed=1))) 
cat(try_out) 


###################################################
### code chunk number 32: ergm.Rnw:471-472 (eval = FALSE)
###################################################
## fit <- ergm(magnolia~edges+triangle, control=control.ergm(seed=1), verbose=T)


###################################################
### code chunk number 33: ergm.Rnw:477-481 (eval = FALSE)
###################################################
## fit <- ergm(magnolia~edges+triangle,seed=1,
##  control = control.ergm(seed=1, MCMC.samplesize=20000),
##  verbose=T)
## mcmc.diagnostics(fit, center=F)


###################################################
### code chunk number 34: ergm.Rnw:489-492 (eval = FALSE)
###################################################
## fit <- ergm(magnolia~edges+gwesp(0.5,fixed=T),
##  control =  control.ergm(seed=1))
## mcmc.diagnostics(fit)


###################################################
### code chunk number 35: ergm.Rnw:497-511 (eval = FALSE)
###################################################
## fit <- ergm(magnolia~edges+gwesp(0.5,fixed=T)+nodematch('Grade')+nodematch('Race')+
##   nodematch('Sex'),
##  control = control.ergm(seed=1),
##  verbose=T)
## 
## pdf('diagnostics1.pdf')	#Use the recording function if possible, otherwise send to pdf
## mcmc.diagnostics(fit)
## dev.off()			#If you saved to pdf, look at the file
## 
## fit <- ergm(magnolia~edges+gwesp(0.25,fixed=T)+nodematch('Grade')+nodematch('Race')+
## 	nodematch('Sex'),
##  control = control.ergm(seed=1))
## mcmc.diagnostics(fit)
## 


###################################################
### code chunk number 36: ergm.Rnw:515-519
###################################################
fit <- ergm(magnolia~edges+gwesp(0.25,fixed=T)+nodematch('Grade')+nodematch('Race')+
  nodematch('Sex'),
 control = control.ergm(seed=1,MCMC.samplesize=4096,MCMC.interval=8192),
 verbose=T)


###################################################
### code chunk number 37: fig1
###################################################
png( 'fig1-%d.png', width=900, height=900, units='px')
mcmc.diagnostics(fit)
invisible(dev.off())


###################################################
### code chunk number 38: ergm.Rnw:641-643
###################################################
ego.net <- network.initialize(500, directed=F)
ego.net %v% 'sex' <- c(rep(0,250),rep(1,250))


###################################################
### code chunk number 39: ergm.Rnw:650-652
###################################################
ego.deg <- c(180, 245, 60, 15)  				# node distn
ego.mixmat <- matrix(c(164,44,26,176)/2, nrow=2, byrow=T)	# adjusted tie distn


###################################################
### code chunk number 40: ergm.Rnw:660-662
###################################################
ego.edges <- sum(ego.mixmat)
ego.sexmatch <- ego.mixmat[1,1]+ego.mixmat[2,2]


###################################################
### code chunk number 41: ergm.Rnw:667-669
###################################################
ego.target.stats <- c(ego.edges, ego.sexmatch)
ego.target.stats


###################################################
### code chunk number 42: ergm.Rnw:677-679
###################################################
ego.fit <- ergm(ego.net ~ edges + nodematch('sex'),
 target.stats = ego.target.stats)


###################################################
### code chunk number 43: ergm.Rnw:684-685
###################################################
summary(ego.fit) 


###################################################
### code chunk number 44: ergm.Rnw:691-693
###################################################
ego.sim1 <- simulate(ego.fit)
plot(ego.sim1, vertex.cex=.65, vertex.col="sex")


###################################################
### code chunk number 45: ergm.Rnw:699-702
###################################################
rbind(summary(ego.sim1 ~ degree(c(0:3))), ego.deg)
mixingmatrix(ego.sim1, "sex")
ego.mixmat


###################################################
### code chunk number 46: ergm.Rnw:715-717
###################################################
ego.sim100 <- simulate(ego.fit, nsim=100)
ego.sim100


###################################################
### code chunk number 47: ergm.Rnw:721-722 (eval = FALSE)
###################################################
## summary(ego.sim100)


###################################################
### code chunk number 48: ergm.Rnw:729-731
###################################################
sim.stats <- attr(ego.sim100,"stats")
rbind(colMeans(sim.stats), ego.target.stats)


###################################################
### code chunk number 49: ergm.Rnw:738-743
###################################################
matplot(1:nrow(sim.stats), sim.stats, 
  pch=c("e","m","0","+"), cex=.65, 
  main="100 simulations from ego.fit model", sub="(default settings)",
  xlab="Replicate", ylab="frequency")
abline(h=ego.target.stats, col=c(1:4))


###################################################
### code chunk number 50: ergm.Rnw:756-764
###################################################
ego.sim100 <- simulate(ego.fit, nsim=100,
  control=control.simulate.ergm(MCMC.interval=10000))
sim.stats <- attr(ego.sim100,"stats")
matplot(1:nrow(sim.stats), sim.stats,
  pch=c("e","m"), cex=.65,
  main="100 simulations from ego.fit model", sub="(MCMC.interval=10000)",
  xlab="Replicate", ylab="frequency")
abline(h=ego.target.stats, col=c(1:2))


###################################################
### code chunk number 51: ergm.Rnw:784-787
###################################################
sim.fulldeg <- summary(ego.sim100 ~ degree(c(0:10)))
colnames(sim.fulldeg) <- paste("deg",0:10, sep='')
sim.fulldeg[1:5,]


###################################################
### code chunk number 52: ergm.Rnw:804-807
###################################################
sim.deg <- cbind(sim.fulldeg[,1:3], apply(sim.fulldeg[,4:11],1,sum))
colnames(sim.deg) <- c(colnames(sim.fulldeg)[1:3],"degree3+")
rbind(colMeans(sim.deg),ego.deg)


###################################################
### code chunk number 53: ergm.Rnw:815-820
###################################################
matplot(1:nrow(sim.deg), sim.deg, pch=as.character(0:3), cex=.5,
   main="Comparing ego.sims to non-targeted degree frequencies",
   sub = "(only total edges targeted)",
   xlab = "Replicate", ylab = "Frequencies")
abline(h=c(180, 245, 60, 15), col=c(1:4))


###################################################
### code chunk number 54: ergm.Rnw:839-844
###################################################
ego.isolates <- ego.deg[1]
ego.target.stats <- c(ego.edges, ego.sexmatch, ego.isolates)
ego.fit <- ergm(ego.net ~ edges + nodematch('sex') + degree(0),
 target.stats = ego.target.stats) 
summary(ego.fit)


###################################################
### code chunk number 55: ergm.Rnw:849-853
###################################################
ego.sim100 <- simulate(ego.fit, nsim=100,
   control=control.simulate.ergm(MCMC.interval=10000))
sim.stats <- attr(ego.sim100,"stats")
rbind(colMeans(sim.stats), ego.target.stats)


###################################################
### code chunk number 56: ergm.Rnw:858-862
###################################################
sim.fulldeg <- summary(ego.sim100 ~ degree(c(0:10)))
sim.deg <- cbind(sim.fulldeg[,1:3], apply(sim.fulldeg[,4:11],1,sum))
colnames(sim.deg) <- c(colnames(sim.fulldeg)[1:3],"degree3+")
rbind(colMeans(sim.deg),ego.deg)


###################################################
### code chunk number 57: ergm.Rnw:867-872
###################################################
matplot(1:nrow(sim.deg), sim.deg, pch=as.character(0:3), cex=.5,
   main="Comparing ego.sims to non-targeted degree frequencies",
   sub = "(only 0, 2+ and total edges targeted)",
   xlab = "Replicate", ylab = "Frequencies")
abline(h=c(180, 245, 60, 15), col=c(1:4))


