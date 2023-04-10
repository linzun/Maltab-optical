clc;
clear;

lamda=536e-6;
alpha=1;
a=10*lamda;  %改
b=5*lamda;   %改
m=4;         %改
X=(-200*lamda:lamda:200*lamda);
Y=(-200*lamda:lamda:200*lamda);
[x,y]=meshgrid(X,Y);
theta=mod(atan2(a.*y,b.*x),2*pi);
B=besselj(m,alpha.*sqrt((x.^2./a^2)+(y.^2./b^2)));
E=exp(1i*m.*theta);
E=B.*E;
I=E.*conj(E);
% I=I.*(sqrt((x.^2./a^2)+(y.^2./b^2))<=4);%加光阑
phase=angle(E);
figure;
surf(x,y,I);
view(2);
shading interp
colormap hot;
axis off;
axis equal
figure
surf(x,y,phase);
view(2);
shading interp
colormap hot;
axis off;
axis equal;