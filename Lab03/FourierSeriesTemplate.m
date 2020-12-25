syms x(t);
syms n;

%setup symbolic variables
n=1:20;
pi=sym(pi);

%setup x(t) Triangular Pulse function
A=1;
To=1;
wo=(2*pi)/(To);
x1(t) = piecewise(-0.0005<=t<=-0.00025,0, -0.00025<=t<=0.00025,A, 0.00025<=t<=0.0005, 0);
x(t) = x1 / (1i*2*pi*1000*0.1*10^(-3));
fplot(x);

%setup Fourier coefficients for Fourier series of x(t)
%sin/cos representation of Fourier series
ao = int((1/To)*x, -9*pi,9*pi);
ao_coeff = eval(ao);

an = int(((2/To)*x*sym(cos(n*wo*t))),t, -0.00025,0.00025);
an_coeffs= eval(an);

bn = int(((2/To)*x*sym(sin(n*wo*t))),t, -0.00025,0.00025);
bn_coeffs = eval(bn);

x_fs = ao_coeff + sum(an_coeffs.*cos(pi*n*t)) + sum(bn_coeffs.*sin(pi*n*t));

%compact trigonometry representation
co=ao;
cn = sqrt(an_coeffs.^2 + bn_coeffs.^2);
angles=atan(-bn_coeffs./an_coeffs);

%plotting
inde = 0:20;

%Magnitude plot
subplot(311);
stem(inde,[ao_coeff cn]);
title('Magnitude plot');
xlabel('Index (multiple of fundamental frequency)');
ylabel('cn');

%Phase plot
subplot(312);
stem(inde,[0 angles]);
title('Phase plot');
xlabel('Index (multiple of fundamental frequency)');
ylabel('degrees, radian');

%Fourier series of x(t)
subplot(313);
fplot(x_fs);
title('Fourier series approx');
xlabel('Time');
ylabel('Amplitude');