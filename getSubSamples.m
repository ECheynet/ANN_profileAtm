function [U,V,H,stdU1,stdV1,stdW1,u_star1,wT1,theta1,L] = getSubSamples(t,tStart,tEnd,...
    u,v,stdU,stdV,stdW,u_star,wT,theta)
% [U,V,H,stdU1,stdV1,stdW1,u_star1,wT1,theta1,L] = 
% getSubSamples(t,tStart,tEnd,u,v,stdU,stdV,stdW,u_star,wT,theta) takes in 
% the time vector (t) and the start and end times of multiple time intervals
% (tStart and tEnd) and returns the averaged values of the input variables 
% (u, v, stdU, stdV, stdW, u_star, wT, and theta) within each time interval.
% The function also calculates the Obukhov length (L) based on the input values
% of u_star, wT, and theta.
% 
% Input Arguments:
%     t: Time vector (in datetime format) for the entire dataset
%     tStart: Vector containing the start times (in datetime format) of each time interval
%     tEnd: Vector containing the end times (in datetime format) of each time interval
%     u: Matrix containing the profils of  u-component of wind velocity (in m/s) for the entire dataset
%     v: Matrix containing the  profils of v-component of wind velocity (in m/s) for the entire dataset
%     stdU: Matrix containing the  profils of standard deviation of the u-component of wind velocity (in m/s) for the entire dataset
%     stdV: Matrix containing the  profils of standard deviation of the v-component of wind velocity (in m/s) for the entire dataset
%     stdW: Matrix containing the  profils of standard deviation of the w-component of wind velocity (in m/s) for the entire dataset
%     u_star: Matrix containing the  profils of friction velocity (in m/s) for the entire dataset
%     wT: Matrix containing the flux of virtual potential temperature (in K m/s) for the entire dataset
%     theta: Matrix containing the profils of mean virtual potential temperature (in K)
% 
% Output Arguments:
%     U: Matrix containing the averaged values of the u-component of wind velocity (in m/s) within each time interval
%     V: Matrix containing the averaged values of the v-component of wind velocity (in m/s) within each time interval
%     H: Matrix containing the magnitude of wind velocity (in m/s) within each time interval
%     stdU1: Matrix containing the averaged values of the standard deviation of the u-component of wind velocity (in m/s) within each time interval
%     stdV1: Matrix containing the averaged values of the standard deviation of the v-component of wind velocity (in m/s) within each time interval
%     stdW1: Matrix containing the averaged values of the standard deviation of the w-component of wind velocity (in m/s) within each time interval
%     u_star1: Matrix containing the averaged values of the friction velocity (in m/s) within each time interval
%     wT1: Matrix containing the averaged values of the flux of virtual potential temperature (in K m/s) within each time interval
%     theta1: Matrix containing the averaged values of the mean virtual potential temperature (in K) within each time interval
%     L: Matrix containing the calculated Obukhov length (in m) within each time interval
% 
% Author: E Cheynet -- UiB -- last modified 30-03-2023

%% Preallocation
Nsamples = numel(tStart);
Nz = size(u,1);

U = nan(Nsamples,Nz);
V = nan(Nsamples,Nz);
H = nan(Nsamples,Nz);
stdU1 = nan(Nsamples,Nz);
stdV1 = nan(Nsamples,Nz);
stdW1 = nan(Nsamples,Nz);
u_star1 = nan(Nsamples,Nz);
wT1 = nan(Nsamples,Nz);
theta1 = nan(Nsamples,Nz);
L = nan(Nsamples,Nz);

%% Get average for each intervall
for ii=1:Nsamples,

    [p,indStart] = min(abs(t-tStart(ii)));
    [p,indEnd] = min(abs(t-tEnd(ii)));


    U(ii,:) = real(mean(u(:,indStart:indEnd),2,'omitnan'));
    V(ii,:) = real(mean(v(:,indStart:indEnd),2,'omitnan'));
    H(ii,:) = sqrt(U(ii,:).^2 + V(ii,:).^2);

    stdU1(ii,:) = mean(stdU(:,indStart:indEnd),2,'omitnan');
    stdV1(ii,:) = mean(stdV(:,indStart:indEnd),2,'omitnan');
    stdW1(ii,:) = mean(stdW(:,indStart:indEnd),2,'omitnan');
    u_star1(ii,:) = mean(u_star(:,indStart:indEnd),2,'omitnan');
    wT1(ii,:) = real(mean(wT(:,indStart:indEnd),2,'omitnan'));
    theta1(ii,:) = mean(theta(:,indStart:indEnd),2,'omitnan');

    L(ii,:) = obukhovLength(u_star1(ii,:),wT1(ii,:),theta1(ii,:));

end

%% Nested function to get the Obukhov length

    function [L] = obukhovLength(u_star,wT,Theta,varargin)
        % [L] = obukhovLength(u_star,wT,Theta,varargin) computes the Obukhov length
        %
        % Input
        % u_star: [1 x 1] friction velocity at the surface (m/s)
        % wT: [1 x 1] flux of virtual potential temperature at the surface (K m/s)
        % Theta: [1 x 1] mean virtual potential temperature
        % (K)
        %
        % Output
        % L:[1x1]: Obukhov length (m)
        %
        % Author info:
        % E. Cheynet - University of Stavanger -  last modified: 16.06.2017
        %
        % see also similarityFun getStability

        %% Inputparseer
        p = inputParser();
        p.CaseSensitive = false;
        p.addOptional('kappa',0.40);
        p.addOptional('g',9.81);
        p.parse(varargin{:});
        %%%%%%%%%%%%%%%%%%%%%%%%%%
        kappa = p.Results.kappa;
        g = p.Results.g;

        L = -(Theta.*u_star.^3)./(kappa*g.*wT);

    end

end