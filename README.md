# ANN_profileAtm

[![View Vertical profiles of turbulence with ANN on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://se.mathworks.com/matlabcentral/fileexchange/127024-vertical-profiles-of-turbulence-with-ann)

Code to get information on the vertical profile of the along-wind standard deviation in the atmospheric boundary layer with a shallow neural network

## Summary

The data are taken from Želi et al. [1] which are openly available on Zenodo at https://zenodo.org/record/3937500. These data are four different simulations of the first and second-order profiles of the flow characteristics in the stable 1D-atmospheric boundary layer. 

The script explore the data for two purposes:
Check that a simple Matlab implementation of the Bulk Richardson Number gives realistic results
Apply a simnple shallow Neural network to predict the profile of the standard deviation of the along-wind velocity component, knowing only the profiles of the two hroizontal mean velocity component and the profile of the standard deviation of the vertical velocity component.
[1] Želi, V., Brethouwer, G., Wallin, S.,  & Johansson, A. V. (2020). Modelling of stably stratified  atmospheric boundary layers with varying stratifications. Boundary-Layer Meteorology, 176(2), 229-249.
