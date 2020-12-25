syms t;
%https://www.mathworks.com/help/symbolic/create-symbolic-numbers-variables-and-expressions.html


x = exp(-0.5*t);

%given function has wo = 2;
n=1:10;
ao = int((1/pi)*x, 0 , pi);
ao_coeff = eval(ao);
an = int(((2/pi)*x*sym(cos(2*n*t))),t, 0,pi);


an_coeffs= eval(an);
bn = int(((2/pi)*x*sym(sin(2*n*t))),t, 0,pi) ;
bn_coeffs = eval(bn);


cn = sqrt(an_coeffs.^2 + bn_coeffs.^2);
subplot(211);
inde = 0:10;
stem(inde,[ao_coeff cn]);
title('Example 6.1');
xlabel('Index (multiple of fundamental frequency)');
ylabel('cn');
subplot(212);
angles = atan(-bn_coeffs./an_coeffs);
stem(inde,[0 angles]);
title('Phase');
xlabel('Index (multiple of fundamental frequency)');
ylabel('degrees, radian');