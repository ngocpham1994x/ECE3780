clc
close all
clear all


% Part II question 1
N = 64;
fs = 1000;
ts=1/fs;
t=ts*(0:N-1);

A=1; 
B=0.1; 
C=1e-5; 
fo=0.25;
f1=0.28;
f2= -0.2513;

x = A*exp(i*2*pi*fo*t) + B*exp(i*2*pi*f1*t) + C*exp(i*2*pi*f2*t);

xf = abs(fft(x));
xf = xf/max(xf);
xf = 20*log10(xf);

stem(xf)                                                           
hold on;

% part II question 2
                       
w = hann(N);
XHan = x.*w(1:N);
XHanf = abs(fft(XHan));
XHanf = XHanf/max(XHanf);
XHanf = 20*log10(XHanf);

stem(XHanf)                                                             
legend('Nornalized spectrum in dB','Nornalized spectrum of x*w in dB (Hanning WIndow)')
hold off;



