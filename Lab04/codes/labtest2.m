syms Y s t

t = 0:1/10:10;

A = sym([-1 200 0 0 500000/s 0 0; 
    0 0 0 -200 500000/s 0 0; 
    -1 0 1000000/s 0 0 100 0; 
    0 0 0 0 0 100 -1000000/s; 
    0 -1 0 1 1 0 0; 
    0 0 -1 0 0 1 1;
    0 0 0 1 0 0 1]);

B = sym([0; Y; 0; Y; 0; 0; 0]);
an=inv(A)*B;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Xs = ((1000000/s)^2+10000)/(10000+400000000/s+(1000000/s)^2);  %%%%
X = simplify(Xs);

%(s^2 + 100000000)/(s^2 + 40000*s + 100000000)

Hs = sym((s^2 + 100000000)/(s^2 + 40000*s + 100000000)) ;
ht = ilaplace(Hs,t); %h(t) is impulse response from x(t) = delta(t)

%frequency response using coefficients of H(s)
figure;
b = [1 0 100000000]; 
a = [1 40000 100000000]; 
w = logspace(-1,1); 
freqs(b,a,w);


figure;
H=tf([1 0 100000000],[1 40000 100000000]);
bode(H);
grid
title('H(s)')

figure;
ht = single(ht);
for i=1:length(t)
    if ht(i) == inf   
        ht(i) = 1;
    elseif ht(i) == -inf
        ht(i) = -1;
    else
        continue
    end    
end
plot(ht)
title('Impulse response h(t)')
axis([0 100 -1 1])
