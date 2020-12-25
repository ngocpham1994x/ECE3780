
x(1:12) = [1 1 1 1 -1 -1 1 1 -1 1 -1 1];
x(14:200) = 0;

xDelay = circshift(x,20);
SNR = [10,5,1,0.1];
variance = zeros(1,4);  %depending on xDelay and SNR
%https://www.mathworks.com/help/matlab/ref/circshift.html
%https://en.wikipedia.org/wiki/Signal-to-noise_ratio
%https://en.wikipedia.org/wiki/Variance
%this variance has mean = 0
%variance (s^2) formula: s^2 = sigma(x^2) / (n-1)

for i=1:length(variance)
    variance(i) = sum(xDelay.^2)/(SNR(i)*200);
end

%generating random signal
w = rand(1,200);

w1 = w.*variance(1);
w2 = w.*variance(2);
w3 = w.*variance(3);
w4 = w.*variance(4);

%output signal
y1 = w1 + xDelay;
y2 = w2 + xDelay;
y3 = w3 + xDelay;
y4 = w4 + xDelay;

xcorr1 = xcorr(x,y1(1:50));
xcorr2 = xcorr(x,y2(1:50));
xcorr3 = xcorr(x,y3(1:50));
xcorr4 = xcorr(x,y4(1:50));


%plotting: original signal
figure(1);
plot(x); title('Original Signal x(n)');
xlabel('n'); ylabel('x(n)'); ylim([-2 2]);

%plotting: output signal
figure(2);
subplot(2,2,1)
plot(y1)
title('Output y(n) at SNR = 10')
xlabel('n'); ylabel('y(n)'); ylim([-2 2]);

subplot(2,2,2)
plot(y2)
title('Output y(n) at SNR = 5')
xlabel('n'); ylabel('y(n)'); ylim([-2 2]);

subplot(2,2,3)
plot(y3)
title('Output y(n) at SNR = 1')
xlabel('n'); ylabel('y(n)'); ylim([-2 2]);

subplot(2,2,4)
plot(y4)
title('Output y(n) at SNR = 0.1')
xlabel('n'); ylabel('y(n)'); ylim([-2 2]);


%plotting: crosscorrelation of y(n) and x(n)
figure(3);
subplot(2,2,1)
plot(xcorr1)
title('Crosscorrelation x(n) and y(n) at SNR = 10')
xlabel('n x n'); ylabel('Function xcorr');

subplot(2,2,2)
plot(xcorr2)
title('Crosscorrelation x(n) and y(n) at SNR = 5')
xlabel('n x n'); ylabel('Function xcorr');

subplot(2,2,3)
plot(xcorr3)
title('Crosscorrelation x(n) and y(n) at SNR = 1')
xlabel('n x n'); ylabel('Function xcorr');

subplot(2,2,4)
plot(xcorr4)
title('Crosscorrelation x(n) and y(n) at SNR = 0.1')
xlabel('n x n'); ylabel('Function xcorr');
