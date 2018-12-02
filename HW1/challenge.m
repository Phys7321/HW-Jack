clc
clear all
N=100;
d=4/N;
for k=1:N
    a(k)=d+(k-1)*d;
    y=@(x)1./sqrt(8*(a(k).^4-x.^4));
    T(k)=quad(y,0,a(k));
end
plot(a,T,'b')
xlabel('a');ylabel('T')
legend({'T vs. a'});
    
        
        
    