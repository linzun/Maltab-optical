clc
clear al
close all

% Model Parameters
 l =-3;         % topological charge;
 n = abs(l)+0;	% radial index; n=|l|,|l|+2,|l|+4 ...
 D = sqrt(2);   % is a constant for normalization;
   
% Discrete domain
xc=-10:0.01:10; %[-]
yc=-10:0.01:10; %[-]
Z=0.6; %[-] a XY-slice in the z-direction
[X,Y] = meshgrid(xc,yc);
[TH,R] = cart2pol(X,Y);

% Analytical functions
G = @(r,z) D./sqrt(1+z.^2).*exp(-r.^2./(1+z.^2)).*exp(-1i/4*(z.*r.^2)./(1+z.^2));
A = @(r,z) (sqrt(2)*r./sqrt(1+z.^2)).^abs(l).*dlaguerre((n-abs(l))/2,abs(l),2*r.^2./(1+z.^2));
PHI = @(th) exp(1i*l*th);
PSI = @(z) exp(-1i*(n+1)*atan(z));
P = @(th,r,z,t) G(r,z).*A(r,z).*PHI(th).*PSI(z).*exp(-1i*t);

% Compute profile for a seleted time 't':
p1=P(TH,R,Z,0);

% Plot a single slice of the presure profile
figure
imagesc(xc,yc,(abs(p1))); 
colorbar;
colormap jet
axis off;
axis equal;

figure
imagesc(xc,yc,flipud(angle(p1)));
colormap gray
axis off;
axis equal;

