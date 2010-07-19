/*
 *  File ergm/src/MPLE.h
 *  Part of the statnet package, http://statnetproject.org
 *
 *  This software is distributed under the GPL-3 license.  It is free,
 *  open source, and has the attribution requirements (GPL Section 7) in
 *    http://statnetproject.org/attribution
 *
 *  Copyright 2010 the statnet development team
 */
#ifndef MPLE_H
#define MPLE_H

#include "edgetree.h"
#include "changestats.h"
#include "model.h"
void MPLE_wrapper (int *heads, int *tails, int *dnedges,
       int *maxpossibleedges,
		   int *dn, int *dflag, int *bipartite, int *nterms, 
		   char **funnames, char **sonames, double *inputs,  
		   int *responsevec, double *covmat,
		   int *weightsvector,
		   double * offset, double * compressedOffset,
		   int *maxNumDyadTypes, int *maxMPLEsamplesize, 
       int *compressflag);
void MpleInit_hash (int *responsevec, double *covmat, int *weightsvector,
		    double *offset, double *compressedOffset,
		    int maxNumDyadTypes, Edge maxMPLE, Network *nwp, Model *m);
void MpleInit_no_compress (int *responsevec, double *covmat, int *weightsvector,
         double * offset, double * compressedOffset,
		     int maxNumDyadTypes, Edge maxMPLE, Network *nwp, Model *m);
int rowsAreSame(double *rowA,double *rowB,int rowLength);
int findCovMatRow(double *newRow,double *matrix, int rowLength, 
		  int numRows, int *responsevec, 
		  double * offset, double * compressedOffset, 
		  int curDyadNum); 
#endif
