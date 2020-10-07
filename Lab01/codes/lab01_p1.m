
% part 1: tutorials
for i=0:7, x(i+1)= sin(i*pi/4), end;
plot(x);
whos;
i=int8(i);
whos;
help int8;
help lookfor;

tic, for i=0:7, x(i+1)= sin(i*pi/4); end, toc, plot(x);
tic, i=0:7;, x = sin(i*pi/4); toc, plot(x);
i=0:0.1:7;, x = sin(i*pi/4); plot(x);

%for i=0:5;, x(i)=i^2, end ;
%for i=1:6;, x(i)=(i-1)^2, end;

x = [1 2 3; 4 5 6; 7 8 9];, x.*x;
x = [1 2 3; 4 5 6; 7 8 9];, x*x;

x = [1+j*1 2+2*j; 3+3*j 4+ 4*j]';
x = [1+j*1 2+2*j; 3+3*j 4+ 4*j].';

