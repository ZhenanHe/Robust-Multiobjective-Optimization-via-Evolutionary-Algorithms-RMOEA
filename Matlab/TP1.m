function f=TP1(x)
[s1,n]=size(x);
x(1,n+1)=x(1,1); %f1
h=1-x(1,1)^2;
g=0;
for i=2:n
    g=g+10+x(1,i)^2-10*cos(4*pi*x(1,i));
end
s=1/(0.2+x(1,1))+x(1,1)^2;
x(1,n+2)=h+g*s;  %f2
f=x;
