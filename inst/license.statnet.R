cat("'ergm' is part of the statnet suite of packages.\n",
"If you are using the 'ergm' package for research that will be published,\n",
"we request that you acknowledge this with the following citation:\n\n",
"  Mark S. Handcock, David R. Hunter, Carter T. Butts, Steven M. Goodreau,\n",
"  and Martina Morris (2003) statnet: A suite of R packages for the\n",
"  Statistical Modeling of Social Networks. Version 2.0,\n",
"  URL http://statnetproject.org.\n\n",
"A BibTeX entry for LaTeX users is\n\n",
"  @Manual{,\n",
"    title = {statnet: A suite of R packages for the Statistical Modeling of Social Networks},\n",
"    author = {Mark S. Handcock and David R. Hunter and Carter T. Butts and Steven M. Goodreau and Martina Morris},\n",
"    year = {2003},\n",
"    note = {Version 2.0},\n",
"    address = {Seattle, WA},\n",
"    url = {http://statnetproject.org},\n",
"  }\n")
citHeader("To cite the individual package 'ergm' please use:")

citEntry(entry="Manual",
         title = "ergm: A package to fit, simulate and analyze Exponential-family models for networks",
         author = personList(as.person("Mark S. Handcock"),
                             as.person("David R. Hunter"),
                             as.person("Carter T. Butts"),
                             as.person("Steven M. Goodreau"),
                             as.person("Martina Morris")), 
         year         = 2003,
         note         = paste("Version",substring(library(help="ergm",lib.loc=NULL,character.only=TRUE)$info[[1]][2],first=16)),
         address      = "Seattle, WA",
         url          = "http://statnetproject.org",
         
         textVersion = 
         paste("Mark S. Handcock, David R. Hunter, Carter T. Butts, Steven M. Goodreau, and Martina Morris (2003) ", 
               "ergm: A package to fit, simulate and analyze Exponential-family models for networks. Version ",
substring(library(help="ergm",lib.loc=NULL,character.only=TRUE)$info[[1]][2],first=16),
         ",", " URL http://statnetproject.org.",
               sep="")
         )

citFooter("We have invested a lot of time and effort in creating the",
          "'statnet' suite of packages for use by other researchers.",
          "Please cite it in all papers where it is used.")
#cat("Enjoy!\n\n",
#    "Mark S. Handcock, University of Washington\n",
#    "David R. Hunter, Penn State University\n",
#    "Carter T. Butts, University of California-Irvine\n",
#    "Steven M. Goodreau, University of Washington\n",
#    "Martina Morris, University of Washington\n\n",
#    "The 'statnet' development team")
#if(.Platform$OS.type="unix" & .Platform$GUI!="AQUA"){
# cat("This is the license.  For citation information see the R console window.
#}

#if (getRversion() >= 2.5) {
#  RShowDoc("LICENSE",package="ergm")
#} else {
#  cat("Full license avaialable in LICENSE file in 'ergm' package subdirectory.\n")
#}

#if (.Platform$OS.type == "windows"){
# shell.exec(chartr("/", "\\", path))
#}else{
#htmlb <- try(statnetbrowseURL("http://www.csde.washington.edu/statnet/attribution/ergm.shtml"))
# if(htmlb!=0){
# htmlb <- try(statnetbrowseURL("http://www.csde.washington.edu/statnet/attribution/ergm.shtml", browser="lynx"))
# }
#}
#statnetShowDoc("LICENSE",package="ergm")

cat(
"------------------\n",
"License for 'ergm'\n",
"------------------\n",
"This is the license.  For citation information see the R console window.\n",
"\n",
"This software is distributed under the GPL-3 license.  It is free,\n",
"open source, and has the following attribution requirements (GPL Section 7):\n",
"\n",
"(a) you agree to retain in 'ergm' and any modifications to\n",
"     'ergm' the copyright, author attribution and URL\n",
"     information as provided at http://statnetproject.org/attribution\n",
"(b) you agree that 'ergm' and any modifications to\n",
"     'ergm' will, when used, display the attribution:\n",
"     `Based on 'statnet' project software (http://statnetproject.org).\n",
"      For license and citation information see http://statnetproject.org/attribution'\n",
"(c) you agree that 'ergm' and any modifications to 'ergm' will display\n",
"    the citation information, as provided in the original\n",
"    CITATION file, when the 'citation' function in executed with the name\n",
"    of the package given.\n",
"(d) you agree to retain in the documentation contained within this software, \n",
"    and any modifications of it, the author attribution (GPL Section 7, clause c).\n",
"\n",
"\n",
"\n",
"What does this mean?\n",
"====================\n",
"\n",
"If you are modifying 'ergm' or adopting any source code from 'ergm' for use\n",
"in another application, you must ensure that the copyright and attributions\n",
"mentioned in the license above appear in the code of your modified version or\n",
"application.  These attributions must also appear when the package is loaded\n",
"(e.g., via 'library' or 'require'). \n",
"\n",
"Enjoy!\n",
"\n",
"Mark S. Handcock, University of Washington\n",
"David R. Hunter, Penn State University\n",
"Carter T. Butts, University of California-Irvine\n",
"Steven M. Goodreau, University of Washington\n",
"Martina Morris, University of Washington\n",
"\n",
"The 'statnet' development team\n",
"\n",
"Copyright 2007\n")
