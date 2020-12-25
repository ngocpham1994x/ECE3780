%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%red box H(s) --> h(t)%%


syms Y s t

t = 0:1/10:10;

A1 = sym([-1 1 (1+6/s) 0; 0 -1 1 1 ; 0 0 -1/2 0; -1 1 0 3/s]);
B1 = sym([0; 0; Y; -Y]);
inv(A1)*B1;

ff1 = - (Y*s)/3 - (2*Y*(s^2 + 12*s + 18))/(3*s);
simplify(ff1);

Hs_1 = sym(-s/(s^2 + 8*s +12)) ;
ht_1 = ilaplace(Hs_1,t);  %H(s) --> h(t)
impulse_response_1=ilaplace(Hs_1); %h(t) is impulse response from x(t) = delta(t)

%frequency response using coefficients of H(s)
b1 = [0 -1]; 
a1 = [1 8 12]; 
w1 = logspace(-1,1); 
% freqs(b1,a1,w1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%green box H(s) --> h(t)%%

A2 = sym([-1 10/s ; 0 10]);
B2 = sym([0; -Y]);
inv(A2)*B2;

ff2 = - Y/s;
simplify(ff2);

Hs_2 = sym(-s) ;
ht_2 = ilaplace(Hs_2,t);  %H(s) --> h(t)
impulse_response_2=ilaplace(Hs_2); %h(t) is impulse response from x(t) = delta(t)

%frequency response using coefficients of H(s)
b2 = [0 -1]; 
a2 = [1]; 
w2 = logspace(-1,1); 
% freqs(b2,a2,w2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%total 2 boxes H(s) = H1(s).H2(s) --> h(t)%%
Hs_tot = sym((s^2)/(s^2 + 8*s +12)) ;
ht_tot = ilaplace(Hs_tot,t);  %H(s) --> h(t)


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%https://www.mathworks.com/help/control/ug/plotting-system-responses.html#d122e20066
%https://www.mathworks.com/help/control/ref/lti.step.html#d122e120988
%https://www.mathworks.com/help/symbolic/laplace.html
%%finding Y(s) & y(t) using step(H(s))%%

H_1 = tf ([0 -1 0],[1 8 12]);  %H(s) of red box
H_2 = tf ([0 -1 0],[1]);       %H(s) of green box
H_total = H_1 * H_2;           %H(s) total = H(s) red * H(s) green

%H1(s) = -s/(s^2 + 8*s +12)
figure(1);
subplot(211)
step(H_1)     %step response of Red box, x(t) = u(t)
title('x(t) = u(t) _ Step response y(t) of H_1(s) red box')
subplot(212)
impulse(H_1)  %impulse response of Red box, x(t) = delta(t)
title('x(t) = delta(t) _ Impulse response h_1(t) of H_1(s) red box')
ans=isstable(H_1);


%H2(s) = -s
%H(s) green box is non-causal => can't use step() or impulse() matlab function
% figure(2);
% subplot(211)
% step(H_2)    %step response of Green box, x(t) = u(t)
% subplot(212)
% impulse(H_2) %impulse response of Green box, x(t) = delta(t)
% title('H(s) green box')

%H(s) total = s^2/(s^2 + 8*s +12)
figure(2);
subplot(211)
step(H_total)     % unit step response of Total two boxes, x(t) = u(t)
title('x(t) = u(t) _ y(t) Unit Step response of H_t_o_t_a_l(s) total')
axis([0 10 -0.2 1])
subplot(212)
impulse(H_total)  %impulse response of Total two boxes, x(t) = delta(t)
title('x(t) = delta(t) _ Impulse response h_t_o_t_a_l(t) of H_t_o_t_a_l(s) total')


%Y(s)=H(s).X(s)= H(s).(1/s) = s/(s^2 + 8*s +12)
Ys= tf ([0 1 0],[1 8 12]);  %unit step response in freq domain
figure(3);  
bode(Ys);   
grid;
title('x(t) = u(t) _ Y(s)=H_t_o_t_a_l(s).X(s) Unit Step freq. response of H_t_o_t_a_l(s) total')

%same way to plot freq response as bode() & freqs() function
figure(5);
b3=[0 1 0];
a3=[1 8 12];
w3 = logspace(-1,1); 
freqs(b3,a3,w3);


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%finding y(t)%%

%h(t) = ilaplace(H(s)) Impulse response of Red box
figure(4);
ht_1=single(ht_1); % for conv data type
subplot(311)
plot(ht_1)
title('Impulse response h_1(t) Red box ')
axis([0 100 -1 1])


%h(t) = ilaplace(H(s)) Impulse response of Green box
for i=1:length(t)
    if ht_2(i) == inf   
        ht_2(i) = 1;
    elseif ht_2(i) == -inf
        ht_2(i) = -1;
    else
        continue
    end    
end
ht_2=single(ht_2); % for conv data type
subplot(312)
plot(ht_2)
title('Impulse response h_2(t) Green box')
axis([0 100 -1 1])


%h(t) = h1(t)*h2(t) Total response of Total two boxes
ht_total = conv(ht_1,ht_2);
% x = zeros(1,10);
% x(1:1/10:10) = 1;
subplot(313)
plot(ht_total)  % this is y(t)
title('h_t_o_t_a_l(t) = h_1(t) * h_2(t)') %convolution
axis([0 100 -1 1])

