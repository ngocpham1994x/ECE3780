% %create dirac delta function
% n=-100:1:100;
% impulse = [zeros(1,100),ones(1,1),zeros(1,100)];
% %stem(n,impulse);
% delta = zeros(1,100);
% for n=1:length(delta)
%     delta(n) = impulse(n+100); 
% end
% stem(delta);
% 
% 
% %filter signal h(t)
% ht = zeros(1,100);
% for t=1:length(ht)
%     for k=0:length(ht)-1  % k from 0 to N 
%         ht(t) = ht(t) - xt(k+1)*delta(t+k);
%     end
% end
% 
% 
% 
% t_delay = 50;
% impulse = zeros(1,100);
% for t=1:100
%     for k=0:length(impulse)  % k from 0 to N 
%         if(t==50)
%             impulse(t) = -0.5;
%         else
%             impulse(t)=0;
%         end 
%     end
% end
% 
% 
% t = -100:1:100;
% y = dirac(t-50);
% index = y == Inf; % find Inf
% y(index) = 1;     % set Inf to finite value
% stem(t,y)

xt=zeros(100,1);
xt(1:11)=1;
xt(51:61)=0.5;

% h=zeros(103,1); 
% for t=1:103
%     for k=0:10
%         di=dirac((t-2)-10*k);
%         if di == inf
%             di=1;
%         end
%         h(t)=h(t)+((-0.5)^k*di);
%     end
% end
% h;
% 
% plot(h)



% clear all, close all, clc; 


% h=zeros(103,1);
% for t=1:103
%     for k=0:1
%         di=dirac((t-1)-50*k);
%         if di == inf
%             di=1;
%         end
%         h(t)=h(t)+((-0.5)^k*di);
%     end
% end
% h;
% 
% plot(h)
% 
% y=conv(xt,h);
% plot(y)

% xt = zeros(1,100);
% xt(1:10)=1;
% xt(50:59)=0.5;
% 
% attn = 0.01:0.01:1; % attentuation always 0 < alpha < 1, with 0.1 of increment (1x10 matrix)
% td = 0:99;   % time delay from 0 to 100 (1x10 matrix)
% energy = zeros(100,100);
% 
% N = 9;
% for i = 1:length(attn)
%     for j=1:length(td)
%         h=zeros(1,10);
%         for k = 0: N
%             h(1+(td(j)*k)) = (-attn(i)).^k;  
%         end
%         yt = conv(xt,h);
%         energy (i,j) = sum(yt.^2);
%     end 
% end
% 
% 
% figure;
% mesh(td,attn,energy); xlabel('Time delay'); ylabel('Attenuation value'); zlabel('Energy');
% title('Energy with Attenuation and Time delay')


A = [1 9 -2; 8 4 -5;10 11 20];
N = max(max(A));
[M,I] = max(A);
[x,y]=find(A==max(A(:)));