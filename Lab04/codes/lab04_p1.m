close all
clear all
syms Y s t

t = 0:1/10:10;

%%% first H(t) %%%%%%

A = sym([-1 1 (1+6/s) 0; 0 -1 1 1 ; 0 0 -1/2 0; -1 1 0 3/s]);
B = sym([0; 0; Y; -Y]);
inv(A)*B;

ff = - (Y*s)/3 - (2*Y*(s^2 + 12*s + 18))/(3*s);
simplify(ff)

H = sym(-s/(s^2 + 8*s +12));
ht1 = ilaplace(H,t);
Yt = ilaplace(H);
ht1=single(ht1); %%% for conv data type
subplot(211)
plot(ht1)
title('x2(t) "h(t) box 1"')
axis([0 100 -1 1])


b = [-1];
a = [1 8 12];
w = logspace(-5,5);
%freqs(b,a,w); %% if you want frequency domain

%%% second H(t) %%%%%%

A2 = sym([-1 10/s ; 0 10]);
B2 = sym([0; Y]);
inv(A2)*B2;
 
H2 = sym(s)
ht2 = ilaplace(H2,t);
%%% for inf or -inf dirac(x)=1 if x=0 %%%
for i=1:length(t)
    if ht2(i) == inf   
        ht2(i) = 1;
    elseif ht2(i) == -inf
        ht2(i) = -1;
    else
        continue
    end    
end
ht2 = single(ht2); %%% for conv data type
        
b2 = [-1];
a2 = [1];
w2 = logspace(-1,1);
%freqs(b2,a2,w2); %% if you want frequency domain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Part2%%%%%%%%%%%%%%%%%%%%%%%%%%
A3 = sym([1 200 0 200+1e6/2*s 0 
       ; 1 1e6/s 0 0 100 
       ; 0 -1000 -1200 1e6/2*s 1000 
       ; 0 -1000-1e6/s -1000 0 1100+1e6/s 
       ; 0 1000 1000 0 -1000])
B3 = sym([0; 0; 0; 0; Y])
inv(A3)*B3
ff3 = -(Y*(55000001*s^2 + 150000022000*s + 60000000))/(s^2 + 125000000000*s)
simplify(ff3)
% 
H3 = sym(-(s^2 + 125000000000*s)/(55000001*s^2 + 150000022000*s + 60000000))
imp_response = ilaplace(H3);
ht = ilaplace(H3,t);
ht = subs(ht);
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
%plot(ht)

b = [-1 125000000000];
a = [55000001 150000022000 60000000];
w = logspace(-1,1);
%freqs(b,a,w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(212)
plot(conv(ht2,ht1))
axis([0 100 -1 1])
title('y(t) "conv(h(t)box 2 with h(t)box 1"')

ht1diff = diff(ilaplace(H));
ht1d=subs(ht1diff);
%plot(ht1d)
Yt=diff(Yt)
Ys=laplace(ht1diff)

isstable(Yt) 

plot(conv(ht,ht1))