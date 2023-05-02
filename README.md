# Vertical profiles of turbulence with ANN

[![View Vertical profiles of turbulence with ANN on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://se.mathworks.com/matlabcentral/fileexchange/127024-vertical-profiles-of-turbulence-with-ann)
[![DOI](https://zenodo.org/badge/620934552.svg)](https://zenodo.org/badge/latestdoi/620934552)


This code provides information on the vertical profile of the along-wind standard deviation in the atmospheric boundary layer with a shallow neural network.

## Summary

The first part of the documentation uses data from Želi et al. [1], which are openly available on Zenodo at [https://zenodo.org/record/3937500](https://zenodo.org/record/3937500). These data consist of four different simulations of the first and second-order profiles of the flow characteristics in the stable 1D-atmospheric boundary layer.

The second part of the documentation uses data from Allaerts et al. [2], which are openly available at [https://data.4tu.nl/datasets/30bdab8c-dee8-40cf-9761-578c9f8392ae](https://data.4tu.nl/datasets/30bdab8c-dee8-40cf-9761-578c9f8392ae). These data come from two days of LES simulations in the atmospheric boundary layer. The dataset is quite large (5 GB), so the user will have to download the data beforehand.

The script explores the data for two purposes:

 - Check that a simple Matlab implementation of the Bulk Richardson Number gives realistic results.

 - Apply a simple shallow Neural network to predict the profile of the standard deviation of the along-wind velocity component, knowing only the profiles of the two horizontal mean velocity components and the profile of the standard deviation of the vertical velocity component.

## Content 

The submission contains:

 - The dataset data.mat for the first example.

 - The function BulkRichardson.m, which calculates the bulk Richardson number.

 - The function get_stdU, which trains the artificial neural network.

 - The function getSubSamples, used in the second example only.

## References

[1] Želi, V., Brethouwer, G., Wallin, S.,  & Johansson, A. V. (2020). Modelling of stably stratified  atmospheric boundary layers with varying stratifications. Boundary-Layer Meteorology, 176(2), 229-249.

[2] Allaerts, D., Quon, E., & Churchfield, M. (2023). Using observational mean‐flow data to drive large‐eddy simulations of a  diurnal cycle at the SWiFT site. Wind Energy.
