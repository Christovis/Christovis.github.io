---
layout: page
title: Software
---

# <a href="https://github.com/Christovis/astrild">Astrild</a>


A specialized python package for cosmological simulations based on [RAMSES](https://bitbucket.org/rteyssie/ramses/wiki/Home). This contains extensions such as [ECOSMOG](https://arxiv.org/abs/1110.1379), to study the effects of novel theories that modify GR on large scales and late times. In addition it is possible to explore arrays of simulations in parallel as it is needed for ray-tracing simulations based on [Ray-Ramses](https://arxiv.org/pdf/1601.02012.pdf).

The functionality of the package includes:

* analysis of matter, fifth-force, and halo power- and bispectra, supported by [DTFE](https://www.astro.rug.nl/~voronoi/DTFE/dtfe.html) and [halotools](https://github.com/astropy/halotools).
* halo statistics such as halo mass function, correlation functions, mean pairwise velocities, redshift space clustering, and concentration mass relation
* weak lensing statistics for several types of voids
* ISW and RS analysis


# <a href="https://github.com/Christovis/ecosmog-cvg">ECOSMOG-cvG</a>

A open-source N-body simulation code for dark-matter only cosmological structure formation for cubic vector Galileon model of the generalised Proca theory (GP) gravity theory. It is implemented in a modified version of the ECOSMOG which is based on RAMSES. It uses adaptive mesh refinement and adaptive time integration to simulate self-gravitating fluids and is massively parallelizable as it makes use of the MPI communication library.

The code has multiple gravitational solvers to choose from, for which one needs to set corresponding values for the four variables extradof, extradof2, extradof3, and extradof4 in namelist/cosmo.nml (default values for these are all .false.) using the following rule:


# <a href="https://github.com/Christovis/ray-ramses">Ray-Ramses</a>

A open-source ray tracing code to compute integrated cosmological observables on the fly in AMR N-body simulations. Unlike conventional ray tracing techniques, our code takes full advantage of the time and spatial resolution attained by the N-body simulation by computing the integrals along the line of sight on a cell-by-cell basis through the AMR simulation grid. Moroever, since it runs on the fly in the N-body run, our code can produce maps of the desired observables without storing large (or any) amounts of data for post-processing. The ray tracing methodology presented here can be used in several cosmological analysis such as Sunyaev-Zel’dovich and integrated Sachs-Wolfe effect studies as well as modified gravity. Our code can also be used in cross-checks of the more conventional methods, which can be important in tests of theory systematics in preparation for upcoming large scale structure surveys.
