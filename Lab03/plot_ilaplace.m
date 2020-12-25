syms t s
% laplace((t^2)*(heaviside(t-1)),t,s)

% num = [4,1];
% den = [1,5,17,13];
% [res,poles,qt] = residue(num,den)



I=(1/3)*exp(-2*s)*((1/s)-(1/(s+1)))+(1/6)*((1/s)-(1/(s+1)));
i=ilaplace(I);
h=matlabFunction(i);
t=1:0.01:100;
plot(t,h(t))
legend('i(t)')