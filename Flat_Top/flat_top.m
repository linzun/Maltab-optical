
clc
clear all
%% 设置（基础参数)
N=2000;              % x-y-plain 中的网格点（ NxN）

l=0.01;
z0_0=l/2;           % 源和目标之间的距离[m] 

E0=1;               % 最大场强

d=4;          % 目标的可观察区域[m]
targetsize=2*d;     % 预期目标尺寸[m]
                    % 目标尺寸应大于观察区域
                    %防止目标出现观察不全的情况
lambda=632*10^-9;   % 波长

 p = 2;     % 高斯光束阶数
                    %   2   ... 正态高斯分布
                    %   100 ... 绝对平顶高斯分布

w0min=sqrt(lambda*l/2/pi);  %不同位置光束 半径（1/e）[m]
z0 = 2;
gamma = 2;

%% 函数调用
[E_complex,X,Y] = super_gauss( N,targetsize,z0,E0,lambda,gamma*w0min,p ) ;
    %计算出目标区域内的场区分布情况
[EFT_complex,XFT,YFT] = fourier( E_complex,X,Y,z0,lambda );
%%  画图
I=abs(E_complex).^2;
figure
% subplot(1,3,1)
mesh(X,Y,I);
colormap jet;
 figure
pcolor(X,Y,I);
shading interp
colormap jet;
axis off;
axis equal;
% IFT=abs(EFT_complex.^2);

I1 =abs(E_complex)/max(abs(E_complex(:)));
figure
% subplot(1,3,2)
% %   surf(X,Y,IFT);                  black
% mesh(X,Y,IFT)
% I1 = I/max(max(I));
%2D
h3 = pcolor(I1);
shading interp
colormap jet;
axis off;
axis equal;
colormap jet;
% colorbar;
set(h3,'edgecolor','none','facecolor','interp');

figure
% subplot(1,3,3)
y_amplifer = I1(:,1000);
plot(Y,y_amplifer);