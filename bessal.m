clear all; close all; clc;
% ideal bessel beam intensity distribution
% set the coordinate
x=linspace(-45,45,300);%mm
y=linspace(-45,45,300);
z=linspace(0,300,900);%mm
[X,Y]=meshgrid(x,y);
[~,rho]=cart2pol(X,Y);
% set the initial conditions
f=3.0*1e11;%frequency f=300GHz
c=3.0*1e11;%speed =mm/s
lambd=1.0; %wavelength mm
theta=5/180*pi;
k=2*pi/lambd; %
alpha=k*sin(theta);

% the cross-section intensity distribution
E0=besselj(0,alpha.*rho);
figure;
imagesc(E0);
axis square;
axis off;

% the propagation 
[X,Y,Z]=meshgrid(x,y,z);
[THETA,rho,Z]=cart2pol(X,Y,Z);
t=Z./c;
E=abs(exp(1i.*(k*cos(theta)-f.*t)).*besselj(0,alpha.*rho));
E2d=squeeze(E(:,150,:));
figure;
imagesc(E2d);














%1111
