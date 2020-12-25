syms w 
X = 14400/(576+w^2);
w_values = -100:100;   % frequency values
X_values = double(subs(X, w, w_values));
figure, plot(w_values, abs(X_values)), title('Amplitude plot'), xlabel('Frequency'), ylabel('Amplitude') 
figure, plot(w_values, angle(X_values)), title('Phase plot'), xlabel('Frequency'), ylabel('Phase')

% 
% pi = sym(pi);
% x=-1:0.01:1;
% y=dirac(x);
% idx = y == Inf; % find Inf
% y(idx) = 1;     % set Inf to finite value
% %f=(2*pi*y + 5*pi*exp(2 - 2*x)*(sign(x - 1) + 1))/(2*pi);
% 
% % for i=1:length(x)
% %     if f(i) == inf   
% %         f(i) = 1;
% %     elseif f(i) == -inf
% %         f(i) = -1;
% %     else
% %         continue
% %     end    
% % end
% plot(x,y)