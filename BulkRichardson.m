function [Ri] = BulkRichardson(T,U,V,z)
% [Ri] = Richardson(T,U,V,zU,zT) computes the Gradient Richardson number.
%
% INPUTS:
%   T: [1x2] or [2x1] vector  of the potential (or virtual) potential
%   temperature in K
%   U: [1x2] or [2x1] vector of the northern mean wind velocity component in
%   m/s
%   V: [1x2] or [2x1] vector of the eastern mean wind velocity component in
%   m/s
%   z: [1x2] or [2x1] height vector in m
% OUTPUTS:
%  Ri:  [1x1] Bulk richardson number
% 
% Author: E Cheynet - UiB - last modified 29/03/2023

%%
g = 9.81; % gravitational acceleration
if isempty(V) | V==0,    V = zeros(size(U));end

dT = diff(T);
dU = diff(U);
dV = diff(V);
dZ = diff(z);
Tv = mean(T);

% Ri = (g./Tv)*(dT+9.8*dZ/1000).*dZ/(dU^2+dV^2);

Ri = (g./Tv)*(dT).*dZ/(dU^2+dV^2);



end