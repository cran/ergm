/*  File src/wtmodel.c in package ergm, part of the Statnet suite
 *  of packages for network analysis, https://statnet.org .
 *
 *  This software is distributed under the GPL-3 license.  It is free,
 *  open source, and has the attribution requirements (GPL Section 7) at
 *  https://statnet.org/attribution
 *
 *  Copyright 2003-2020 Statnet Commons
 */
#include <string.h>
#include "ergm_wtmodel.h"

/*****************
  void WtModelDestroy
******************/
void WtModelDestroy(WtModel *m)
{  
  int i;

  for(i=0; i < m->n_terms; i++){
    Free(m->dstatarray[i]);
    Free(m->termarray[i].statcache);
  }
  Free(m->dstatarray);
  Free(m->termarray);
  Free(m->workspace); 
  Free(m);
}

/*****************
 int WtModelInitialize

 Allocate and initialize the WtModelTerm structures, each of which contains
 all necessary information about how to compute one term in the model.
*****************/
WtModel* WtModelInitialize (char *fnames, char *sonames, double **inputsp,
			int n_terms) {
  int i, j, k, l, offset;
  WtModelTerm *thisterm;
  char *fn,*sn;
  WtModel *m;
  double *inputs=*inputsp;
  
  m = (WtModel *) Calloc(1, WtModel);
  m->n_terms = n_terms;
  m->termarray = (WtModelTerm *) Calloc(n_terms, WtModelTerm);
  m->dstatarray = (double **) Calloc(n_terms, double *);
  m->n_stats = 0;
  for (l=0; l < n_terms; l++) {
      thisterm = m->termarray + l;

      /* fnames points to a single character string, consisting of the names
      of the selected options concatenated together and separated by spaces.
      This is passed by the calling R function.  These names are matched with
      their respective C functions that calculate the appropriate statistics. 
      Similarly, sonames points to a character string containing the names
      of the shared object files associated with the respective functions.*/
      for (; *fnames == ' ' || *fnames == 0; fnames++);
      for (i = 0; fnames[i] != ' ' && fnames[i] != 0; i++);
      fnames[i] = 0;
      for (; *sonames == ' ' || *sonames == 0; sonames++);
      for (j = 0; sonames[j] != ' ' && sonames[j] != 0; j++);
      sonames[j] = 0;
      /* Extract the required string information from the relevant sources */
      fn = Calloc(i+3, char);
      fn[0]='d';
      fn[1]='_';
      for(k=0;k<i;k++)
        fn[k+2]=fnames[k];
      fn[i+2]='\0';
      /* fn is now the string 'd_[name]', where [name] is fname */
/*      Rprintf("fn: %s\n",fn); */
      sn = Calloc(j+1, char);
      sn=strncpy(sn,sonames,j);
      sn[j]='\0';
      
      /*  Most important part of the WtModelTerm:  A pointer to a
      function that will compute the change in the network statistic of 
      interest for a particular edge toggle.  This function is obtained by
      searching for symbols associated with the object file with prefix
      sn, having the name fn.  Assuming that one is found, we're golden.*/ 
      thisterm->d_func = 
	(void (*)(Edge, Vertex*, Vertex*, double *, WtModelTerm*, WtNetwork*))
	R_FindSymbol(fn,sn,NULL);
      if(thisterm->d_func==NULL){
        error("Error in WtModelInitialize: could not find function %s in "
                "namespace for package %s. Memory has not been deallocated, so restart R sometime soon.\n",fn,sn);
      }      

      /* Optional function to compute the statistic of interest for
	 the network given. It can be more efficient than going one
	 edge at a time. */
      fn[0]='s';
      thisterm->s_func = 
	(void (*)(WtModelTerm*, WtNetwork*)) R_FindSymbol(fn,sn,NULL);

      /*Clean up by freeing sn and fn*/
      Free(fn);
      Free(sn);

      /*  Now process the values in model$option[[optionnumber]]$inputs;
          See comments in InitErgm.r for details.    */
      offset = (int) *inputs++;  /* Set offset for attr vector */
/*      Rprintf("offsets: %f %f %f %f %f\n",inputs[0],inputs[1],inputs[2], */
/*		         inputs[3],inputs[4],inputs[5]); */
      thisterm->nstats = (int) *inputs++; /* Set # of statistics returned */
/*      Rprintf("l %d offset %d thisterm %d\n",l,offset,thisterm->nstats); */
      if (thisterm->nstats <= 0)
	{ /* Must return at least one statistic */
	  Rprintf("Error in WtModelInitialize:  Option %s cannot return %d \
               statistics.\n", fnames, thisterm->nstats);
	  return NULL;
	}
      /*  Update the running total of statistics */
      m->n_stats += thisterm->nstats; 
      m->dstatarray[l] = (double *) Calloc(thisterm->nstats, double);
      thisterm->dstats = m->dstatarray[l];  /* This line is important for
                                               eventually freeing up malloc'ed
					       memory, since thisterm->dstats
					       can be modified but 
					       m->dstatarray[l] cannot be.  */
      thisterm->statcache = (double *) Calloc(thisterm->nstats, double);

      thisterm->ninputparams = (int) *inputs++; /* Set # of inputs */
      /* thisterm->inputparams is a ptr to inputs */
      thisterm->inputparams = (thisterm->ninputparams ==0) ? 0 : inputs; 
      
      thisterm->attrib = inputs + offset; /* Ptr to attributes */
      inputs += thisterm->ninputparams;  /* Skip to next model option */

      /*  The lines above set thisterm->inputparams to point to needed input
      parameters (or zero if none) and then increments the inputs pointer so
      that it points to the inputs for the next model option for the next pass
      through the loop. */

      fnames += i;
      sonames += j;
    }
  
  m->workspace = (double *) Calloc(m->n_stats, double);
  for(i=0; i < m->n_stats; i++)
    m->workspace[i] = 0.0;

  *inputsp = inputs;
  return m;
}

/*
  MCMCChangeStats
  A helper's helper function to compute change statistics.
  The vector of changes is written to m->workspace.
*/
void WtChangeStats(unsigned int ntoggles, Vertex *toggletail, Vertex *togglehead, double *toggleweight,
				 WtNetwork *nwp, WtModel *m){
  WtModelTerm *mtp = m->termarray;
  double *dstats = m->workspace;
  
  for (unsigned int i=0; i < m->n_terms; i++){
    /* Calculate change statistics */
    mtp->dstats = dstats; /* Stuck the change statistic here.*/
    (*(mtp->d_func))(ntoggles, toggletail, togglehead, toggleweight,
		   mtp, nwp);  /* Call d_??? function */
    dstats += (mtp++)->nstats;
  }
}
