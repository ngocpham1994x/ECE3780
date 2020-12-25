x = [0 0 0 2 3 1 0 0 0 0 0 1 1.5 0.5 0 0 0 0];
subplot(3,1,1), stem(x);
xlabel('Time');
ylabel('Function x with time');
title('Function x vs time');

y = xcorr(x);
subplot(3,1,2), stem(y);
xlabel('Time');
ylabel('Function xcorr with time');
title('Function xcorr vs time');

x_flip = flip(x);  % reverse the 1-D matrix of x
ct=conv(x, x_flip);
subplot(3,1,3), stem(ct);
xlabel('Time');
ylabel('Function cov(x,x-flip) with time');
title('Function cov(x,x-flip) vs time');
