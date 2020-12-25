clc
close all
clear all


N = 32;
signal_frequency = 243;    %f
sampling_frequency = 1000; %f_s
w = 2*pi*signal_frequency;
t = 0 : 1/sampling_frequency : (N-1) / sampling_frequency;         % Time step                                     
%t_s=1/(f_s)
%t=t_s*(0:N-1)

x=sin(w*t);
figure                                                             % figure 1
stem(abs(fft(x)))
xlabel('frequency (Hz)'); ylabel('Amplitude');
title('Fourier Series Spectra')

figure                                                             % figure 2
stem(abs(fft(x,256)))
xlabel('frequency (Hz)'); ylabel('Amplitude');
title('Fourier Series Spectra')
