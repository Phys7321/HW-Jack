clc
clear all
I=0;
d=0.1;
N=10/d;
for k=1:N
    x1(k)=-10+(k-1)*d;
    x2(k)=1+d+(k-1)*d;
    rho=@(x0) 2*x0/(abs(x1(k)-x0));
    v1(k)=trapezoid(rho,0,1);
    rho=@(x0) 2*x0/(abs(x2(k)-x0));
    v2(k)=trapezoid(rho,0,1);
end
[E1,xx1]=Der(v1,x1);
[E2,xx2]=Der(v2,x2);
for m=1:N/2
    for n=1:N/2
        x21(m)=d+(m-1)*d;
        y21(n)=1+d+(n-1)*d;
        rho=@(x0) x0^2/sqrt((x21(m)-x0)^2+y21(n)^2);
        V21(m,n)=trapezoid(rho,0,1);
        rho=@(y0) y0/sqrt(x21(m)^2+(y21(n)-y0)^2);
        V22(m,n)=trapezoid(rho,1,2);
    end
end
for m=1:N/2
    for n=1:N/2
        x31(m)=d+(m-1)*d-2.5;
        y31(n)=d+(n-1)*d-2.5;
            f=@(r,theta)r.^2.*cos(theta)./sqrt((r*cos(theta)-x31(m)).^2+(r*sin(theta)-y31(n)).^2+4);
            V3(m,n)=dblquad(f,0,2,0,2*pi);
    end
end

            
V2=V21+V21;
[u,v]=gradient(V2);
subplot(331)
plot(x1,v1,'c',x2,v2,'c')
xlabel('x');ylabel('V(x)');
legend({'1D Potential'});
subplot(332)
plot(xx1,-E1,'c',xx2,-E2,'c')%E=-gradient(V)
axis([-10 10 -5 10])
xlabel('x');ylabel('E(x)');
legend({'1D E field'});
subplot(334)
mesh(x21,y21,V2)
xlabel('x');ylabel('y');zlabel('V(x,y)')
legend({'2D Potential'});
subplot(335)
quiver(x21,y21,-u,-v)
xlabel('x');ylabel('y')
legend({'2D E(x,y)'});
axis([0 2 1 3])
subplot(336)
mesh(x21,y21,sqrt(u^2+v^2))
xlabel('x');ylabel('y')
legend({'2D Magnitude of E(x,y)'});
subplot(337)
mesh(x31,y31,V3)
xlabel('x');ylabel('y');zlabel('V(x,y)')
legend({'2D Potential at z=2 plane'});
subplot(338)
[p,q]=gradient(V3);
mesh(x31,y31,p^2+q^2)
legend({'2D Magnitude of E(x,y)'});





       
    


    
