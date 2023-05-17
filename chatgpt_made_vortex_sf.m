%% demo1
% % 定義參數
% N = 100; % 干涉條數
% m = 10; % 高週率模式數
% 
% % 生成渦旋光自干涉圖樣
% x = linspace(-N/2, N/2, N);
% [X, Y] = meshgrid(x, x);
% Z = zeros(N, N);
% for i = 1:m
%     Z = Z + sin(2*pi*(2*i-1)*sqrt(X.^2 + Y.^2)/N);
% end
% 
% % 繪製圖樣
% imagesc(Z);
% colormap gray;
%% demo2
% clc; 
% clear; 
% 
% lambda = 632.8e-9; % 波长
% d = 0.002; % 干涉仪中光栅条之间的间距
% 
% x= -100:0.1:100; % 设置 x 范围
% y= -100:0.1:100; % 设置 y 范围
% 
% [X,Y] = meshgrid(x,y); % 生成 x 与 y 的网格
% 
% I1 = sin(2*pi*X./lambda).*sin(2*pi*Y./lambda); % 生成第一束涡旋光
% I2 = cos(2*pi*X./lambda).*cos(2*pi*Y./lambda); % 生成第二束涡旋光
% I = I1 + I2; % 两束涡旋光干涉后的图像
% 
% surf(X,Y,I); % 画出图形
% xlabel('x');
% ylabel('y');
% 
% % 程序结束

%% demo3
% % Define the parameters of the interference pattern
% lambda = 633e-9; % wavelength of light
% d = 5.0e-6; % separation between slits
% 
% % Define the x and y range of the pattern
% x = linspace(-0.1e-3, 0.1e-3, 1000);
% y = linspace(-0.1e-3, 0.1e-3, 1000);
% 
% % Create a meshgrid of x and y values
% [X,Y] = meshgrid(x,y);
% 
% % Calculate the interference pattern
% I = ((sin(pi*d*X/lambda))./(pi*d*X/lambda)).^2.*(cos(2*pi*X/lambda).^2);
% 
% % Plot the interference pattern
% imagesc(x*1e3, y*1e3, I);
% colormap gray;
% axis equal;
% xlabel('x (mm)');
% ylabel('y (mm)');
% title('Interference Pattern of Two Vortex Beams');

%% demo4
% % Define the parameters of the interference pattern
% lambda = 633e-9; % wavelength of light
% r = 0.5e-3; % radial distance
% 
% % Define the x and y range of the pattern
% x = linspace(-0.1e-3, 0.1e-3, 1000);
% y = linspace(-0.1e-3, 0.1e-3, 1000);
% 
% % Create a meshgrid of x and y values
% [X,Y] = meshgrid(x,y);
% 
% % Calculate the interference pattern
% I = (besselj(1, 2*pi*r*sqrt(X.^2 + Y.^2)/lambda)./(2*pi*r*sqrt(X.^2 + Y.^2)/lambda)).^2;
% 
% % Plot the interference pattern
% imagesc(x*1e3, y*1e3, I);
% colormap gray;
% axis equal;
% xlabel('x (mm)');
% ylabel('y (mm)');
% title('Interference Pattern of a Vortex Beam');

%% demo5 
% Define the parameters of the interference pattern
% lambda = 633e-9; % wavelength of light
% r = 0.5e-3; % radial distance
% d = 0.1e-3; % separation distance between the two vortices
% 
% % Define the x and y range of the pattern
% x = linspace(-0.3e-2, 0.3e-2, 1000);
% y = linspace(-0.3e-2, 0.3e-2, 1000);
% 
% % Create a meshgrid of x and y values
% [X,Y] = meshgrid(x,y);
% 
% % Calculate the first vortex beam
% Vortex1 = (besselj(3, 2*pi*r*sqrt((X + d/2).^2 + Y.^2)/lambda)./(2*pi*r*sqrt((X + d/2).^2 + Y.^2)/lambda));
% 
% % Calculate the second vortex beam
% Vortex2 = (besselj(3, 2*pi*r*sqrt((X - d/2).^2 + Y.^2)/lambda)./(2*pi*r*sqrt((X - d/2).^2 + Y.^2)/lambda));
% 
% % Calculate the interference pattern
% I = abs(Vortex1 + Vortex2).^2;
% 
% % Plot the interference pattern
% imagesc(x, y, I);
% colormap jet;
% axis equal;axis off;                                                                            
% title('Interference Pattern of Two Vortex Beams');

%% demo6 BG!!
% % Define the parameters of the vortex beam
% lambda = 633e-9; % wavelength of light
% r = 0.5e-3; % radial distance
% l = 2; % topological charge
% 
% % Define the x and y range of the beam
% x = linspace(-0.3e-2, 0.3e-2, 1000);
% y = linspace(-0.3e-2, 0.3e-2, 1000);
% 
% % Create a meshgrid of x and y values
% [X,Y] = meshgrid(x,y);
% 
% % Calculate the vortex beam
% Vortex = (besselj(l, 2*pi*r*sqrt(X.^2 + Y.^2)/lambda)./(2*pi*r*sqrt(X.^2 + Y.^2)/lambda)).*exp(1i*l*atan2(Y,X));
% 
% % Plot the magnitude and phase of the vortex beam
% subplot(1,2,1);
% imagesc(x*1e3, y*1e3, abs(Vortex));
% colormap jet;
% axis equal;
% axis off;
% title('Magnitude of the Vortex Beam');
% 
% subplot(1,2,2);
% imagesc(x*1e3, y*1e3, angle(Vortex));
% colormap jet;
% axis equal;
% axis off;
% title('Phase of the Vortex Beam');

%% demo7 LG!!
clc
clear all
% Define the parameters of the Laguerre-Gaussian beam
lambda = 633e-9; % wavelength of light
r = 0.5e-3; % radial distance
p = 1; % radial mode number
l = 1; % topological charge

% Define the x and y range of the beam
x = linspace(-0.3e-3, 0.3e-3, 300);
y = linspace(-0.3e-3, 0.3e-3, 300);

% Create a meshgrid of x and y values
[X,Y] = meshgrid(x,y);

% Calculate the Laguerre-Gaussian beam
LG = sqrt(2*factorial(p)/(pi*factorial(p+abs(l))))*(sqrt(2)*X/r).^abs(l).*exp(-X.^2/r^2).*laguerreL(p,abs(l),2*X.^2/r^2).*exp(-1i*pi*l/2 - 1i*(2*p + abs(l) + 1)*atan2(Y,X));

% Plot the magnitude and phase of the Laguerre-Gaussian beam
subplot(1,2,1);
imagesc(x*1e3, y*1e3, abs(LG));
colormap gray;
axis equal;
axis off;
title('Magnitude of the Laguerre-Gaussian Beam');

subplot(1,2,2);
imagesc(x*1e3, y*1e3, angle(LG));
colormap jet;
axis equal;axis off;
title('Phase of the Laguerre-Gaussian Beam');
