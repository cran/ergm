## ---- node-attr-spec, message=FALSE-------------------------------------------
library(ergm)
data(faux.mesa.high)
summary(faux.mesa.high~nodecov("Grade")) # String
summary(faux.mesa.high~nodecov(~Grade)) # Formula
summary(faux.mesa.high~nodecov(function(nw) nw%v%"Grade")) # Function

## ---- node-attr-mat-----------------------------------------------------------
# Directly:
summary(faux.mesa.high~nodecov(~cbind(Grade,Grade^2)))
# Using stats::poly() function:
summary(faux.mesa.high~nodecov(~poly(Grade,2)))

## ---- node-attr-rand----------------------------------------------------------
randomcov <- structure(I(rbinom(network.size(faux.mesa.high),1,0.5)), name="random")
summary(faux.mesa.high~nodefactor(I(randomcov)))

## ---- node-attr-cats----------------------------------------------------------
# Activity by grade with a baseline grade excluded:
summary(faux.mesa.high~nodefactor(~Grade))
# Retain all levels:
summary(faux.mesa.high~nodefactor(~Grade, levels=TRUE)) # or levels=NULL
# Use the largest grade as baseline (also Grade 7):
table(faux.mesa.high %v% "Grade")
summary(faux.mesa.high~nodefactor(~Grade, levels=-LARGEST))
# Collapse the smallest two grades (11 and 12) into a new category, 99.
library(magrittr) # For the %>% operator.
summary(faux.mesa.high~nodefactor((~Grade) %>% COLLAPSE_SMALLEST(2, 99)))

# Mixing between lower and upper grades:
summary(faux.mesa.high~mm(~Grade>=10))
# Mixing between grades 7 and 8 only:
summary(faux.mesa.high~mm("Grade", levels=I(c(7,8))))
# or
summary(faux.mesa.high~mm("Grade", levels=1:2))
# or using levels2 (see ? mm) to filter the combinations of levels,
summary(faux.mesa.high~mm("Grade",
        levels2=~sapply(.levels,
                        function(l)
                          l[[1]]%in%c(7,8) && l[[2]]%in%c(7,8))))

