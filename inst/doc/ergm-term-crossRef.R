## ----include=FALSE------------------------------------------------------------
library(ergm)

## -----------------------------------------------------------------------------
search.ergmTerms(search='triangle')

## -----------------------------------------------------------------------------
search.ergmTerms(keywords=c('bipartite','dyad-independent'))

## ----results='asis',echo=FALSE------------------------------------------------
ergm:::.formatMatrixHtml(ergm:::.termMatrix('ergmTerm', keywords=~"frequently-used"%in%., display.keywords = subset(ergm::ergm_keyword(), popular)$name), wrapRdTags=FALSE)

## ----results='asis',echo=FALSE------------------------------------------------
ergm:::.formatMatrixHtml(ergm:::.termMatrix('ergmTerm', keywords=~"operator"%in%., display.keywords = subset(ergm::ergm_keyword(), popular & name!="operator")$name), wrapRdTags=FALSE)

## ----results='asis',echo=FALSE------------------------------------------------
ergm:::.formatMatrixHtml(ergm:::.termMatrix('ergmTerm'), wrapRdTags=FALSE)

## ----results='asis',echo=FALSE------------------------------------------------
terms<-ergm:::ergmTermCache('ergmTerm')
ergm:::.termTable(terms)

## ----results='asis',echo=FALSE------------------------------------------------
cat(ergm:::.formatTocHtml(ergm:::.termToc('ergmTerm'), wrapRdTags=FALSE))

## -----------------------------------------------------------------------------
sessionInfo()

