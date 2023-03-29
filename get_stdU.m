function [net] = get_stdU(z,stdW,U,V,stdU)

%% Create a Fitting Network
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 10; 
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