## ---- node-attr-spec, message=FALSE--------------------------------------
library(ergm)
data(faux.mesa.high)
summary(faux.mesa.high~nodecov("Grade")) # String
summary(faux.mesa.high~nodecov(~Grade)) # Formula
summary(faux.mesa.high~nodecov(function(nw) nw%v%"Grade")) # Function

## ---- node-attr-cbind----------------------------------------------------
summary(faux.mesa.high~nodecov(~cbind(Grade,Grade^2)))

## ---- cbind-colnames-1---------------------------------------------------
x <- 1:2
cbind(x,x^2)
cbind(x,x2=x^2)
cbind(x,`x^2`=x^2) # Backticks for arbitrary names.

## ---- node-attr-cbind-name-----------------------------------------------
summary(faux.mesa.high~nodecov(~cbind(Grade,Grade2=Grade^2)))

## ---- node-attr-poly-----------------------------------------------------
summary(faux.mesa.high~nodecov(~poly(Grade,2)))

## ---- node-attr-rand-----------------------------------------------------
randomcov <- structure(I(rbinom(network.size(faux.mesa.high),1,0.5)), name="random")
summary(faux.mesa.high~nodefactor(I(randomcov)))

## ---- node-attr-cats-----------------------------------------------------
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

## ---- node-attr-levels2--------------------------------------------------
# Here is the full list of combinations of sexes in an undirected network:
summary(faux.mesa.high~mm("Sex", levels2=TRUE))
# Select only the second combination:
summary(faux.mesa.high~mm("Sex", levels2=2))
# Equivalently,
summary(faux.mesa.high~mm("Sex", levels2=-c(1,3)))
# or
summary(faux.mesa.high~mm("Sex", levels2=c(FALSE,TRUE,FALSE)))
# Select all *but* the second one:
summary(faux.mesa.high~mm("Sex", levels2=-2))
# We can select via a mixing matrix: (Network is undirected and
# attributes are the same on both sides, so we can use either M or
# its transpose.)
(M <- matrix(c(FALSE,TRUE,FALSE,FALSE),2,2))
summary(faux.mesa.high~mm("Sex", levels2=M)+mm("Sex", levels2=t(M)))
# Select via an index of a cell:
idx <- cbind(1,2)
summary(faux.mesa.high~mm("Sex", levels2=idx))

## ---- mm-2sided----------------------------------------------------------
summary(faux.mesa.high~mm(Grade~Race, levels2=TRUE))
# It is possible to have collapsing functions in the formula; note
# the parentheses around "~Race": this is because a formula
# operator (~) has lower precedence than pipe (|>):
summary(faux.mesa.high~mm(Grade~(~Race) %>% COLLAPSE_SMALLEST(3,"BWO"), levels2=TRUE))

