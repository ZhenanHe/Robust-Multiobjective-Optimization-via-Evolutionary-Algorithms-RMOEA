function f=archive_updating(w,ds,n)
%return archive of each vector

[N1,M]=size(w);
lf=cell(N1,1);
for i=1:N1
    t1(i,1)=norm(w(i,:)); %Eucidean distance of the vector
end
[N,S]=size(ds);

for i=1:N
    t2(i,1)=norm(ds(i,n+1:n+M));
end

for i=1:N
    t=[];
    for j=1:N1
        t(j,1)=acos(ds(i,n+1:n+M)*w(j,:)'/t1(j,1)/t2(i,1)); %Calculate the angle between solution and weight vector
    end 
    [y1,y2]=min(t(:,1)); %Selecte the weight vector with the minimum angle
    lf{y2,1}=[lf{y2,1};ds(i,:)];
end
f=lf;