%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4: part 1

%setting up signal with no eco: array x
x = zeros(1,100);
x(1:10)=1;


%setting up signal with eco: array xt
xt = zeros(1,100);
xt(1:10)=1;
xt(50:59)=0.5;

subplot(2,1,1); plot(xt);  title('x(t) echo signal'); 
hold on;

ht=zeros(1,103);
ht(1) = 1;   % initialize first value of ht
td = 50;
attn = 0.5;
N = 2;
for t=1:103
    for k=0:N
        di = dirac(t-td*k);
        if di == Inf     % find Inf
            di = 1;      % set Inf to finite value, which is 1
        end 
        ht(t) = ht(t) + ((-attn)^k * di);
    end
end


plot(ht), title('x(t) echo signal & h(t) filter signal');xlabel('time t'); ylabel('x(t)'); xlim([1 105]);ylim([-1.5 1.5]);
hold off;

ct = conv(xt,ht);

subplot(2,1,2); plot(ct);  title('x(t)*h(t)'); xlabel('time t'); ylabel('x(t)*h(t)'); xlim([1 100]);ylim([-1.5 1.5]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4: part 2

clc
clear all
clear vars

xt = zeros(1,100);
xt(1:10)=1;
xt(50:59)=0.5;

attn = 0.01:0.01:1; % attentuation always 0 < alpha < 1, with 0.1 of increment (1x100 matrix)
td = 1:1:100;   % time delay from 0 to 100 (1x100 matrix)

energy = zeros(100,100);
N = 9;
for i = 1:length(attn)
    for j=1:length(td)
        h=zeros(1,100);
        for k = 0: N
            h(1+(td(j)*k)) = (-attn(i)).^k;  
        end
        yt = conv(xt,h);
        energy (i,j) = sum(yt.^2);
    end 
end


figure;
mesh(td,attn,energy); xlabel('Time delay'); ylabel('Attenuation value'); zlabel('Energy');
title('Energy with Attenuation and Time delay')

max_val = max(max(energy));
min_val = min(min(energy));
[x_max,y_max]=find(energy==max(max(energy)));
[x_min,y_min]=find(energy==min(min(energy)));