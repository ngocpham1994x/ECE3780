syms t;
syms n;

%setup symbolic variables
n=1:10;
pi=sym(pi);

%setup x(t) Triangular Pulse function
A=0.5;
To=2;
wo=(2*pi)/(To);
x = 2*A*(triangularPulse(0,1,2,t))-A;

%setup Fourier coefficients for Fourier series of x(t)
%sin/cos representation of Fourier series
ao = int((1/To)*x, 0,2);
ao_coeff = eval(ao);

an = int(((2/To)*x*sym(cos(n*wo*t))),t, 0,2);
an_coeffs= eval(an);

bn = int(((2/To)*x*sym(sin(n*wo*t))),t, 0,2);
bn_coeffs = eval(bn);

x_fs = ao_coeff + sum(an_coeffs.*cos(pi*n*t)) + sum(bn_coeffs.*sin(pi*n*t));

%compact trigonometry representation
co=ao;
cn = sqrt(an_coeffs.^2 + bn_coeffs.^2);
angles=atan(-bn_coeffs./an_coeffs);

%plotting
inde = 0:10;

%Magnitude plot
subplot(311);
stem(inde,[ao_coeff cn]);
title('Example 6.2: x(t-0.5) - Magnitude plot');
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
title('x(t-0.5) Fourier series approx');
xlabel('Time');
ylabel('Amplitude');