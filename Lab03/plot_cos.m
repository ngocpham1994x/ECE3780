w = 2*pi;
t = (0:0.01:(10*pi))/w;
v = 1/2 + (1/pi)*cos(w*t+pi/2)+(1/(2*pi))*cos(2*w*t+pi/2)+(1/(3*pi))*cos(3*w*t+pi/2)+(1/(4*pi))*cos(4*w*t+pi/2);
% v1 = 10*cos(w*t)
figure
h = plot(t,v)
legend(h,{'y(t)'})