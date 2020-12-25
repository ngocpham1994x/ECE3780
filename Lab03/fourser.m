function fourser(N);
% N = number of coefficients to be used (input) 
% Plot the Fourier series for f(t) = t for -pi<t<pi 

t = -pi:pi/200:pi;
y = t.*cos(t/2);
fsm = zeros(N-1,length(t));

for i = 1:(N-1) 
    cn = 32*i*((-1)^(i+1))/(pi*((1-4*(i^2))^2)); 
    fsm(i,:) = cn*sin(i*t);
end

%part c) Fourier Series of f(t) = tcos(t/2)
fsm2 = sum(fsm);

plot(t,y+1,t,fsm2) 
title(['Fourier Series of f(t) = tcos(t/2) with ', ' N = ', num2str(N)]) 
xlabel('Time'), ylabel('Amplitude') 
legend('Function f(t) = tcos(t/2)+1 for comparison', 'Fourier series approx')