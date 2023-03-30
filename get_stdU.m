function [net] = get_stdU(z,stdW,U,V,stdU,varargin)
% [net] = get_stdU(z,stdW,U,V,stdU,varargin) trains a shallow ANN to
% estimate the profiles of the standard deviation of the along-wind component 
% knowing only the profile of the mean wind velocities component U and V and the profile of
% the standard deviation of W.
% 
% Inputs
%   z: [Nsamples x N]: matrix of heights (m)
%   stdW: [Nsamples x N]: matrix of profiles of std of w (m/s)
%   U: [Nsamples x N]: matrix of  profiles of mean wind (northerly) velocity component  (m/s)
%   V: [Nsamples x N]: matrix of  profiles of mean wind (easterly) velocity component  (m/s)
%   stdU: [Nsamples x N]: matrix of profiles of std of u (m/s)
%   varargin:
%       hiddenLayerSize: [1x1] integer: size of the hidden layer 
% Outputs
%   net: Fitted Neural network
% Author: E. Cheynet -- UiB -- last modified: 30-03-2023

%% Inputparseer
p = inputParser();
p.CaseSensitive = false;
p.addOptional('hiddenLayerSize',10);
p.parse(varargin{:});
%%%%%%%%%%%%%%%%%%%%%%%%%%
hls = p.Results.hiddenLayerSize ;

%% Create a Fitting Network
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = hls; 
net = fitnet(hiddenLayerSize,trainFcn);
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

%% Collect the data
clear x t

if size(U,1)>size(U,2), U = U'; end
if size(V,1)>size(V,2), U = U'; end
if size(stdU,1)>size(stdU,2), U = U'; end
if size(stdW,1)>size(stdW,2), U = U'; end

Nvar = 4;
[Nsamples,N]=size(U);
x = zeros(Nsamples,N,Nvar);
x(:,:,1) = z; % first input is the height
x(:,:,2) = stdW;  % second input is the std of W
x(:,:,3) = U;  % Third input is the mean wind speed U
x(:,:,4)= V;  % Fourth input is the mean wind speed U
Nvar = size(x,3);
x = reshape(x,[],Nvar)';
t = reshape(stdU,[],1)';
%% Train, validate network
[net,tr] = train(net,x,t);
end