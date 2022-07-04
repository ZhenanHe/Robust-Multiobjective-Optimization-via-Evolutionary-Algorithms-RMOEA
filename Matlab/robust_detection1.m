function w3=robust_detection1(w,t2,n,phi,nei,TN,theta,func)
%w3: store the MPBIi and WPBIi of hyperbox on each neighbor vector

%TN=50;
a=t2(1,:);
[ss1,M]=size(w);
[s1,s2]=size(t2);
if s1<TN
   temp1=TN-s1;
   %Do sampling in this box
   y1=2*phi*lhsdesign(temp1,n);
   i1=1;c=0;
   while i1<=temp1
         y=y1(i1,1:n)+a(1,1:n)-phi*ones(1,n);
         j=1;
         while j<=n
               if y(1,j)<=1 && y(1,j)>=-1 
                  j=j+1;
               else
                  j=n+10;
                  c=1;
               end
               if j<2
               if y(1,j)<0 
                  j=n+10;
                  c=1;
               end
               end
               %if j==2
                %if y(1,j)<-0.15 
                 % j=n+10;
                  %c=1;
               %end
               %end
         end
         if j<=(n+1)
            y(1,1:n+M)=evaluate_objective(y(1,1:n),func);
            t2=[t2;y];
            i1=i1+1;
         else
            i1=temp1+10;
         end
   end
   s1=TN;
end

[s3,s4]=size(nei);
w3=zeros(s4,2);
if c<1
    for i=1:s4 %for each vector in the neighbor
        w1=w(nei(1,i),:);
        t5=norm(w1(1,:));
        r=[];
        for j=1:s1
            d1=t2(j,n+1:n+M)*w1(1,:)'/t5;
            dt=t2(j,n+1:n+M)-w1(1,:)*(d1/t5);
            d2=norm(dt);
            r(j,1)=d1+theta*d2;
        end
        w3(i,1)=mean(r(:,1)); %MPBIi
        w3(i,2)=max(r(:,1)); %WPBIi
    end
else    
   w3=100*ones(s4,2);
end