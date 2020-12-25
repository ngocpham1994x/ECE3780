[x, fs]=audioread('SEASHELL.wav');
%soundsc(x,fs);
%soundsc(conv(x,[1 -1]),fs);
%soundsc(conv(x,[1 1 1 1 1 1 1]),fs);
soundsc(conv(x,[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]),fs);


%plotting for visual
subplot(311)
plot(x)
title('Original Signal of SEASHELL.wav')

x1=conv(x,[1 -1]);
subplot(312)
plot(x1)
title('Convolution 1')

x2=conv(x,[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]);
subplot(313)
plot(x2)
title('Convolution 2')

