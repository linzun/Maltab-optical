%% clear
clc
clear all;
close all;

%% Parameters
load BlackJet.mat
N = 500;
w0 = 1;  
k = 1;
lamda = 1064e-9;   
l1=4;
l2=1;
D = sqrt(2);
x = linspace(-100*w0,100*w0,N);    
y = linspace(-100*w0,100*w0,N);
[X,Y] = meshgrid(x,y);
delta =0*  w0;
[theta,r] = cart2pol(X,Y);
z_0 = (k*w0^2)./2;
z=18*z_0;
w_z =w0*sqrt(1+(z/z_0)^2);
R_z = z.*(1+(z./z_0).^2);
q_z = 1 +(1i.*z)./z_0;
alpha = -18*w0;
f_c = 200e-3;      
%% beam
E = 1.*exp(-(r.^2)./(w_z.^2))...
    .*((X-delta)-1i*(Y-delta)).^abs(l1);

I = E.*conj(E); 
I = I/max(max(I));
figure;
s=abs ( E ).^2;
y_amplifer = s(1:500,500);
plot(y_amplifer);
