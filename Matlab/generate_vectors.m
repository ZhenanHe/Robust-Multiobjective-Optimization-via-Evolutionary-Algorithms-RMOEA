function f=generate_vectors(n,M)
%return weight vector

w=0:(1/n):1; %
z(:,1)=w';%interval
i=1;%objective number

%first objective
v(1:(n+1),1)=z;
N=n+1;%NO. Vectors

for i=2:M
    c=0;
    for j=1:N
        temp=cumsum(v(j,:));
        temp1=temp(i-1);%cumulate sum
        k=1;
        if i<M
           while k<=(n+1)
                 if temp1+z(k,1)<=1
                    c=c+1;
                    vv(c,1:(i-1))=v(j,1:(i-1));
                    vv(c,i)=z(k,1);
                    k=k+1;
                 else
                    k=n+2;
                 end
           end
        else %last objective
           v(j,i)=1-temp1;
        end
    end
    if i<M
       v=vv;N=c;
    else
       s=v;
    end
end
f=s;