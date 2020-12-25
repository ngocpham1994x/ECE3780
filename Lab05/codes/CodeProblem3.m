clc;
clear all
close all;


% Part III
N=1000;
fs = 2500;           % Sampling frequency
ts=1/fs;
t = ts*(0:N-1);
f1 = 500;            % 1st sinusoidal freuency 
f2 = 1000;           % 2nd sinusoidal frequency 
x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);

x3 = x1+x2;

% sound(x1)
% sound(x2)
% sound(x3)

x1_FOURIER_TRANSFORM = fft(x1);
x2_FOURIER_TRANSFORM = fft(x2); 
x3_FOURIER_TRANSFORM = fft(x3);

subplot(311)
plot(abs(x1_FOURIER_TRANSFORM)); 
title('The Discrete Fourier Transform of x_1 500Hz')

subplot(312)
plot(abs(x2_FOURIER_TRANSFORM));
title('The Discrete Fourier Transform of x_2 1000Hz')

subplot(313)
plot(abs(x3_FOURIER_TRANSFORM));
title('The Discrete Fourier Transform of x_3 (500Hz + 1000Hz)')

% filtering
% H[k]
H = zeros(1,1000);
H(201)=1 ; 
H(801)=1;

X3_filtered= H.*(x3_FOURIER_TRANSFORM);
figure
plot(abs(X3_filtered));
title('The Discrete Fourier Transform of x_3 ( filtered by multiplication with H(k) )')

% reconstructing signal to time domain
x3_from_X3_filtered = ifft(X3_filtered,'symmetric')   %for taking only real values after ifft()
figure
subplot(211)
plot(t,x1), title('original x_1')
subplot(212)
plot(t,x3_from_X3_filtered),title('x_3 from inversing filtered X_3')