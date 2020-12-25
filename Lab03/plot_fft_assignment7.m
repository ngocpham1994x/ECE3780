pi = sym(pi);
N = 16;        %samples in 1 fundamental period
wo = 3;        %funcdamental omega
To = 2*pi/wo;  %fundamental period
Ts = To/N;     %sampling period

%https://www.mathworks.com/help/matlab/math/basic-spectral-analysis.html

x=[17.1118, 12.9256, 4.28245, 0.819564, 3.17177, 4.75012, 3.99446, -2.42787, -3.52597, -1.35505, 1.93673, 2.49199, 0.577056, 2.12732, 6.50166, 12.0705];
figure(3);
plot(x);
C_k = (1/N)* fft(x);
abs(C_k);
phase = angle(C_k);

x1=linspace(0,15,16); %shifting the signal to 0-base

figure(1);
stem(x1,C_k);ylim([0,5]);
grid;
title('Spectra plot');
xlabel('n x wo');
ylabel('C[k]');


figure(2);
stem(x1,phase);
grid;
title('Phase plot');
xlabel('n x wo');
ylabel('Phase of C[k]');