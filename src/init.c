/*  File src/init.c in package ergm, part of the Statnet suite
 *  of packages for network analysis, http://statnet.org .
 *
 *  This software is distributed under the GPL-3 license.  It is free,
 *  open source, and has the attribution requirements (GPL Section 7) at
 *  http://statnet.org/attribution
 *
 *  Copyright 2003-2017 Statnet Commons
 */
/* This code was procedurally generated by running

   > tools::package_native_routine_registration_skeleton(".", "./src/init.c")

   in R started in the package's root directory, then changing

   "R_useDynamicSymbols(dll, FALSE)" to "R_useDynamicSymbols(dll, TRUE)".
*/

#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .C calls */
extern void AllStatistics(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void CD_wrapper(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void full_geodesic_distribution(void *, void *, void *, void *, void *, void *, void *, void *);
extern void geodesic_matrix(void *, void *, void *, void *, void *, void *, void *);
extern void MCMC_wrapper(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void MCMCPhase12(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void MPLE_wrapper(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void MPLEconddeg_wrapper(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void network_stats_wrapper(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void node_geodesics(void *, void *, void *, void *, void *, void *, void *, void *);
extern void pair_geodesic(void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void SAN_wrapper(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void wt_network_stats_wrapper(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void WtCD_wrapper(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void WtMCMC_wrapper(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void WtSAN_wrapper(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);

static const R_CMethodDef CEntries[] = {
    {"AllStatistics",              (DL_FUNC) &AllStatistics,              13},
    {"CD_wrapper",                 (DL_FUNC) &CD_wrapper,                 26},
    {"full_geodesic_distribution", (DL_FUNC) &full_geodesic_distribution,  8},
    {"geodesic_matrix",            (DL_FUNC) &geodesic_matrix,             7},
    {"MCMC_wrapper",               (DL_FUNC) &MCMC_wrapper,               30},
    {"MCMCPhase12",                (DL_FUNC) &MCMCPhase12,                35},
    {"MPLE_wrapper",               (DL_FUNC) &MPLE_wrapper,               17},
    {"MPLEconddeg_wrapper",        (DL_FUNC) &MPLEconddeg_wrapper,        30},
    {"network_stats_wrapper",      (DL_FUNC) &network_stats_wrapper,      14},
    {"node_geodesics",             (DL_FUNC) &node_geodesics,              8},
    {"pair_geodesic",              (DL_FUNC) &pair_geodesic,               9},
    {"SAN_wrapper",                (DL_FUNC) &SAN_wrapper,                32},
    {"wt_network_stats_wrapper",   (DL_FUNC) &wt_network_stats_wrapper,   15},
    {"WtCD_wrapper",               (DL_FUNC) &WtCD_wrapper,               20},
    {"WtMCMC_wrapper",             (DL_FUNC) &WtMCMC_wrapper,             25},
    {"WtSAN_wrapper",              (DL_FUNC) &WtSAN_wrapper,              34},
    {NULL, NULL, 0}
};

void R_init_ergm(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
    R_useDynamicSymbols(dll, TRUE);
}
