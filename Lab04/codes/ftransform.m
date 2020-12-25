
%   Detailed explanation goes here
% ftransform is a function which is use to convert time domin no preodic
% function  to frequency domin. It also draw the magnitude and Phase plot.
%syntax is given below..
%ftransform (function, first limit , final limit)

%https://www.mathworks.com/help/symbolic/fourier.html

syms t 
syms w j positive;
pi = sym(pi);

f=(5/(2+j*w))*exp(-j*w)+1;
L1=-inf;
L2=inf;



X= (1/(2*pi))*int(f*exp(j*w*t),w,L1,L2);
%X=simplify(X);
disp(' X(jw)'),pretty(X)

w=-20:.01:20;
inline(X);  
ans(-20:.01:20);

subplot(2,1,1);
plot(w,real(ans),'g','linewidth',2)
title('|X(jw)| Frequency Domain ')
xlabel('(w)   Range')
grid on;

subplot(2,1,2)
plot(w,imag(ans),'r','linewidth',2.5);
title('< X(jw) Angle')
grid on 


