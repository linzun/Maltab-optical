%% Parameters
close all;
clc
clear ;
N = 500;
w0 =1e-3;  
f = 1.5e-3;
p = 1;
k =1;
lamda = 3628e-9;
n = 0.8;
l =2.5;
zR = pi*(w0)/lamda;       % 瑞利长度
z=1*f;
%z = 5*zR;
w_z =w0*sqrt(1+(z/zR)^2);  % z位置的光束径   
x = linspace(-40000*w0,40000*w0,N);    
y = linspace(-40000*w0,40000*w0,N);
[X,Y] = meshgrid(x,y);
[theta,r] = cart2pol(X,Y);
A = 1;                              %归一化常数
Eta = p+(l-n)/2;
psi =1;                      % elliptic parameter
w1 = 2*f/(k*w0);
w2 = psi*w1;



for alpha = 0.5:0.5:5
    R1 = 0;
    E_alpha = 0;
    for n= -5000:5000
        R1 = ((-1i).^(abs(n)+1))./(alpha-n)...
        .*exp(1i*n*theta)...
        .*((besseli(((abs(n)-1)/2),(k*w0*r*sqrt(2)/(4*z)).^2))-(besseli(((abs(n)+1)/2),(k*w0*r*sqrt(2)/(4*z)).^2)));
        E_alpha =E_alpha+ (exp(1i*pi*alpha).*sin(pi*alpha))./(sqrt(pi))...
        .*(r.*(k.^2).*(w0.^3))./(8*(z.^2)).*exp(1i*k*z)...
        .*exp(1i*(k.*r.^2)/(2*z)).*exp(-(k*w0*r*sqrt(2)/(4*z)).^2)...
        .*R1;
    end
    I_alpha = E_alpha.*conj(E_alpha);
    I_alpha = I_alpha./max(max(I_alpha));
    figure;
    h3 = pcolor(X,Y,I_alpha);
    %h3 = mesh(X,Y,FV1/30);    %3D 
    colormap jet;
    colorbar;
    shading interp;
    axis off;
    axis ;
    figure;
    h4 = pcolor(X,Y,angle(E_alpha));
    colormap jet;
    colorbar;
    shading interp;
    axis off;
    axis;
    str1 = ['l=',num2str(alpha),'z=f_Fractional_Vorext.bmp'];
    str2 = ['l=',num2str(alpha),'z=f_Fractional_Vorext_phase.bmp'];
    imwrite (h3,str1,'bmp') ;
    imwrite (h4,str2,'bmp') ;
    colormap jet;
end