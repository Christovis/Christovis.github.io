---
title: Virgo Meeting - Accelerating Cosmic Simulations through Machine Learning
type: talks
date: 2021-01-07
author: Christoph Becker
---

In this years [Virgo](http://www.virgo.dur.ac.uk/) meeting I have moderated the discussion on how machine learning can be used to accelerate simulations.

My own [work](https://slides.com/carolcuesta/a-tree-grows-in-illustris-tng-the-galaxy-halo-connection-learnedby-boosted-decision-trees), which is done in collaboration with Carolina L. Cuesta, was presented at the 2020 [Mock conference](https://www.uibk.ac.at/congress/mockinnsbruck/) in Innsbruck.

### Abstract

We use the state-of-the-art cosmological, magnetohydrodynamical IllustrisTNG (TNG) simulations to explore the galaxy-halo connection as inferred from gradient boosted decision trees (GBDT). With the large 300 Mpc (TNG300) volume, we establish the mean occupancy of central and satellite galaxies and their dependence on the properties of the dark matter haloes hosting them. 19 halo properties. Through the interpretable machine learning approach, we can achieve two things. Firstly, the generation of an optimal model to populate dark-matter only simulations with galaxies that reproduce the observed clustering. Secondly, understand what effect each of the 19 halo properties has on the physics of galaxy formation. Through bagging and boosting we find the optimal tree depth and obtain the uncertainties predicting for each halo.

![dendogram](/assets/talk_gahaco_dendo_cm.png)

_Left_: Dendogram of halo properties. _Right_: Correlation matrix. Halo properties with red boxes are chosen for the final model.
