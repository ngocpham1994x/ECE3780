% pi = sym(pi);
syms t s;
% T = 2;
% N = 200; 
% Ts = T/N;
% n = 0:N-1;
% x = sqrt(n*Ts).*cos(5*3.14*n*Ts ); 
% X = Ts *fft(x); 
% km = 0:N/2; 
% D = 2*pi/(N*Ts ); 
% plot(km*D, abs(X(km+1)))
% % axis square, axis([0 pi/Ts 0 8])
% title('Amplitude spectra |X(w)| with N=200')

% t = 0:0.01:10;

% xt=sqrt(t)*cos(5*3.14*t);
% Xs=laplace(xt)
% X=tf(Xw);
% bode(X);


H=tf([-5 0],[1 3 2]);
bode(H);
grid on;
t=0:0.01:10;
x=sqrt(t).*cos(5*3.14*t);
figure;
lsim(H,x,t); grid on