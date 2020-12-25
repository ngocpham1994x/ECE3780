syms Y s t

%t = 0:1/10:10;

A = sym([-1 200 0 0 500000/s 0 0; 
    0 0 0 -200 500000/s 0 0; 
    -1 0 1000000/s 0 0 100 0; 
    0 0 0 0 0 100 -1000000/s; 
    0 -1 0 1 1 0 0; 
    0 0 -1 0 0 1 1;
    0 0 0 1 0 0 1]);

B = sym([0; Y; 0; Y; 0; 0; 0]);
an=inv(A)*B;

Xs = (10000*Y*(s + 2500))/(s^2 + 25000000) + (Y*(s^2 + 10000*s))/(s^2 + 25000000);  %%%%
X = simplify(Xs);

%(s^2 + 100000000)/(s^2 + 40000*s + 100000000)

Hs = sym((s^2 + 20000*s + 25000000)/(s^2 + 25000000)) ;
ht = ilaplace(Hs); %h(t) is impulse response from x(t) = delta(t)

%frequency response using coefficients of H(s)
figure;
b = [1 20000 25000000]; 
a = [1 0 25000000]; 
w = logspace(-1,1); 
freqs(b,a,w);


figure;
H=tf([1 20000 25000000],[1 0 25000000]);
bode(H);
grid
title('H(s)')

