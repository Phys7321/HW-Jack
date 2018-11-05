function y = lcg(a,M,N,c,r1)

if nargin==0
    error('Not enough input arguments')
end

if nargin==1
    error('Not enough input arguments')
end

if nargin==2
    error('Not enough input arguments')
end

if nargin==3
   c=0;
   r1=1;
end

if nargin==4
   c=0;
end

for i=1:N
    if i==1
       y(i)=r1;
    else
    y(i)=mod(a*y(i-1)+c,M);
    end
end
for i=1:N
    y(i)=y(i)./M;
end


