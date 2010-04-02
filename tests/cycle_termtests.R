#  File ergm/tests/cycle_termtests.R
#  Part of the statnet package, http://statnetproject.org
#
#  This software is distributed under the GPL-3 license.  It is free,
#  open source, and has the attribution requirements (GPL Section 7) in
#    http://statnetproject.org/attribution
#
#  Copyright 2010 the statnet development team
######################################################################
library(ergm)
data(faux.mesa.high)
data(sampson)

fmh <- faux.mesa.high
s1 <- summary(fmh~cycle(3:6))-c(62,80,138,270)
s2 <- summary(samplike~cycle(2:6))-c(28,39,111,260,651)
if(!all(s1==0) || !all(s2==0)) {
 print(list(s1=s1,s2=s2))
 stop("Failed cycle test")
} else {
 print("Passed cycle test")
}


