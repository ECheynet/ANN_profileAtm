# ANN_profileAtm

[![View Vertical profiles of turbulence with ANN on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://se.mathworks.com/matlabcentral/fileexchange/127024-vertical-profiles-of-turbulence-with-ann)

Code to get information on the vertical profile of the along-wind standard deviation in the atmospheric boundary layer with a shallow neural network

## Summary

The first part of the documentation use data from Želi et al. [1] which are openly available on Zenodo at https://zenodo.org/record/3937500. These data are four different simulations of the first and second-order profiles of the flow characteristics in the stable 1D-atmospheric boundary layer. 
The second part of the documentation sue data from Allaerts et al. [2], which are openly available on https://data.4tu.nl/datasets/30bdab8c-dee8-40cf-9761-578c9f8392ae These data comes from two days of LES simulations in the atmospheric boundary layer. I cannot put the dataset inside the submission because it is quite big (5 GB). So the user will have to download the data beforehand. 

The script explore the data for two purposes:

- Check that a simple Matlab implementation of the Bulk Richardson Number gives realistic results.

- Apply a simple shallow Neural network to predict the profile of the standard deviation of the along-wind velocity component, knowing only the profiles of the two hroizontal mean velocity component and the profile of the standard deviation of the vertical velocity component.

## References

[1] Želi, V., Brethouwer, G., Wallin, S.,  & Johansson, A. V. (2020). Modelling of stably stratified  atmospheric boundary layers with varying stratifications. Boundary-Layer Meteorology, 176(2), 229-249.

[2] Allaerts, D., Quon, E., & Churchfield, M. (2023). Using observational mean‐flow data to drive large‐eddy simulations of a  diurnal cycle at the SWiFT site. Wind Energy.

## Content 

 The submission contains:
 
  - the dataset data.mat for the first example.
  
  - The function BulkRichardson.m which calculate the bulk Richardson number
  
  - The function get_stdU which train the artificial neural network
  
  - The function getSUbSamples used in the second example only.

## Reference

[1] Želi, V., Brethouwer, G., Wallin, S.,  & Johansson, A. V. (2020). Modelling of stably stratified  atmospheric boundary layers with varying stratifications. Boundary-Layer Meteorology, 176(2), 229-249.
