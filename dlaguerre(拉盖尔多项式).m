function y=dlaguerre(p,l,x)
y=zeros(size(x));
for n=0:p
    y=y+(-1)^(n)*prod(1:p+abs(l))*x.^n/prod(1:abs(p-n))/prod(1:abs(l)+n)/prod(1:n);
end