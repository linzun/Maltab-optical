%% clear
clc
clear
close all;
%% Parameters
N = 500;
w0 = 1;  
k = 2;
lamda = 1064e-9;   
l=0;
n = abs(l)+0;
D = sqrt(2);
x = linspace(-100*w0,100*w0,N);    
y = linspace(-100*w0,100*w0,N);
[X,Y] = meshgrid(x,y);
delta = 0.3*w0;
delta1 = 10*w0;
[theta,r] = cart2pol(X,Y);

z_0 = (k*w0^2)./2;
z=30*z_0;
w_z =w0*sqrt(1+(z/z_0)^2);
R_z = z.*(1+(z./z_0).^2);
q_z = 1 +(1i.*z)./z_0;

%% Vortex