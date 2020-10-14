/*  File src/netstats.h in package ergm, part of the Statnet suite
 *  of packages for network analysis, https://statnet.org .
 *
 *  This software is distributed under the GPL-3 license.  It is free,
 *  open source, and has the attribution requirements (GPL Section 7) at
 *  https://statnet.org/attribution
 *
 *  Copyright 2003-2020 Statnet Commons
 */
#ifndef NETSTATS_H
#define NETSTATS_H

#include "ergm_edgetree.h"
#include "ergm_model.h"
#include "ergm_MHproposal.h"

/* *** don't forget tail -> head, so these functions accept tails first, not heads */

void network_stats_wrapper(int *tails, int *heads, int *timings, int *time, int *lasttoggle_flag, int *lasttoggle, int *dnedges, 
			   int *dn, int *dflag,  int *bipartite,
			   int *nterms, char **funnames,
			   char **sonames, double *inputs,  double *stats);
void SummStats(Edge n_edges, Vertex *tails, Vertex *heads,
	       Network *nwp, Model *m, double *stats);
#endif
