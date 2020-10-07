

% part 3.1: plotting signals x(t) with 3 different periods

% interval 0 <= t <= 5
% x(t) = cos(2pi*t/T)sin(2pi*t/T)

% T=4

t1 = 0:pi/100:5;
x1 = cos(2*pi*t1/4).*sin(2*pi*t1/4);

% T=8

t2 = 0:pi/100:5;
x2 = cos(2*pi*t2/8).*sin(2*pi*t2/8);

% T=16

t3 = 0:pi/100:5;
x3 = cos(2*pi*t3/16).*sin(2*pi*t3/16);

 % plotting
 figure;
subplot(3,1,1); plot(t1,x1); title("T=4"); xlabel("t");ylabel("x(t)");
subplot(3,1,2); plot(t2,x2);title("T=8"); xlabel("t");ylabel("x(t)");
subplot(3,1,3); plot(t3,x3);title("T=16"); xlabel("t");ylabel("x(t)");



% part 3.2: plotting following piecewise function from -1<=t<=5
% https://www.mathworks.com/help/symbolic/piecewise.html

% u(t) = 1 (for t >= 0), u(t) = 0 (for t < 0)

syms t;
u = piecewise (t<0,0,t>=0,1);
figure;
fplot(u); xlim([-1 5]); ylim([-1.5 1.5]); title("Unit step signal"); xlabel("t"); ylabel("u(t)");

 % r(t) = t (for t>=0), r(t) = 0 for t<0)

r = piecewise (t<0,0,t>=0,t);
figure;
fplot(r);xlim([-1 5]); ylim([-1.5 1.5]); title("Ramp signal"); xlabel("t"); ylabel("r(t)");

% x(t) = 3e^(-2t)u(t); where u(t) is a unit step function above

x_1 = exp(-2*t).*3*u;
figure;
fplot(x_1);xlim([-1 5]); title("x_1(t) signal");xlabel("t"); ylabel("x_1(t)");


% x(t) = e^(t) (for 0<=t<=2), x(t)=0 otherwise

x_2 = piecewise (0<=t & t<=2,exp(t),t<0 & t>2,0);
figure;
fplot(x_2); xlim([-1 5]);title("x_2(t) Exponential signal");xlabel("t"); ylabel("x_2(t)");


% all plots of part 3.2 in one figure
figure;
subplot(2,2,1);fplot(u); xlim([-1 5]); ylim([-1.5 1.5]); title("Unit step signal"); xlabel("t"); ylabel("u(t)");
subplot(2,2,2);fplot(r);xlim([-1 5]); ylim([-1.5 1.5]); title("Ramp signal"); xlabel("t"); ylabel("r(t)");
subplot(2,2,3);fplot(x_1);xlim([-1 5]); title("x_1(t) signal");xlabel("t"); ylabel("x_1(t)");
subplot(2,2,4);fplot(x_2); xlim([-1 5]); title("x_2(t) Exponential signal");xlabel("t"); ylabel("x_2(t)");

