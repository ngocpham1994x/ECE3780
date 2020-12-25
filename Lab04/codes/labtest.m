figure;
b1 = [0 -1]; 
a1 = [1 8 12]; 
w1 = logspace(-1,1); 
freqs(b1,a1,w1);
title('H_1(s) = (-s)/((s+2)(s+6)) Red box')


figure;
b2 = [0 -1]; 
a2 = [1]; 
w2 = logspace(-1,1); 
freqs(b2,a2,w2);
title('H_2(s) = -s Green box')

figure;
b = [1 0 0]; 
a = [1 8 12]; 
w = logspace(-1,1); 
freqs(b,a,w);
title('H(s) total box')

%H(s) = s^2/(s^2 + 8*s +12)
figure;
H=tf([1 0 0],[1 8 12]);
bode(H);
grid
title('H(s)=H_1(s).H_2(s)=s^2/(s^2 + 8*s +12) total box')
