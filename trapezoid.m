function y=trapezoid(F,a,b)
h=0.1;
N=(b-a)/h;
y=0;
I=0;
k=1;
for k=1:N
    I=F(a+(k-1)*h)+F(a+k*h);
    y=y+I;
end
y=0.5*h*y;


