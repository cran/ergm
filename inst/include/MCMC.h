/*  File inst/include/MCMC.h in package ergm, part of the Statnet suite
 *  of packages for network analysis, https://statnet.org .
 *
 *  This software is distributed under the GPL-3 license.  It is free,
 *  open source, and has the attribution requirements (GPL Section 7) at
 *  https://statnet.org/attribution
 *
 *  Copyright 2003-2020 Statnet Commons
 */
#ifndef _MCMC_H_
#define _MCMC_H_

#include "ergm_constants.h"
#include "ergm_edgetree.h"
#include "ergm_changestat.h"
#include "ergm_MHproposal.h"
#include "ergm_model.h"

void MCMC_wrapper(int *dnedges,
		  int *tails, int *heads,
		  int *dn, int *dflag, int *bipartite, 
		  int *nterms, char **funnames,
		  char **sonames, 
		  char **MHProposaltype, char **MHProposalpackage,
		  double *inputs, double *theta0, int *samplesize, 
		  double *sample, int *burnin, int *interval,  
		  int *newnetworktails, 
		  int *newnetworkheads, 
		  int *fVerbose, 
		  int *attribs, int *maxout, int *maxin, int *minout,
		  int *minin, int *condAllDegExact, int *attriblength, 
		  int *maxedges,
		  int *status);
MCMCStatus MCMCSample(MHProposal *MHp,
		      double *theta, double *networkstatistics, 
		      int samplesize, int burnin, 
		      int interval, int fVerbose, int nmax,
		      Network *nwp, Model *m);
MCMCStatus MetropolisHastings(MHProposal *MHp,
			      double *theta, double *statistics, 
			      int nsteps, int *staken,
			      int fVerbose,
			      Network *nwp, Model *m);
void MCMCPhase12 (int *tails, int *heads, int *dnedges,
		  int *dn, int *dflag, int *bipartite, 
		  int *nterms, char **funnames,
		  char **sonames, 
		  char **MHProposaltype, char **MHProposalpackage,
		  double *inputs, 
		  double *theta0, int *samplesize,
		  double *gain, double *meanstats, int *phase1, int *nsub,
		  double *sample, int *burnin, int *interval,  
		  int *newnetworktails, 
		  int *newnetworkheads, 
		  int *fVerbose, 
		  int *attribs, int *maxout, int *maxin, int *minout,
		  int *minin, int *condAllDegExact, int *attriblength, 
		  int *maxedges,
		  int *mtails, int *mheads, int *mdnedges);

void MCMCSamplePhase12 (MHProposal *MH,
  double *theta, double gain, double *meanstats,
  int nphase1, int nsubphases, double *networkstatistics, 
  int samplesize, int burnin, 
  int interval, int fVerbose,
  Network *nwp, Model *m);

#endif
