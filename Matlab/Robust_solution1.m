function f=Robust_solution1(w,nei,w_re,n,lf,w_limit,wc,fn1,T)
%return final solution   

   %T=10;
   %TT=3;
   [st1,M]=size(w);
   f=zeros(st1,M+n);
   for i=1:st1
       t5(i,1)=norm(w(i,:)); %norm w
   end
   t=zeros(st1,1);
   llr=zeros(st1,7000);
   %% round 1
   for i=1:st1
       rr=w_re{i,1};
       [r10,r20]=size(rr);
       % If one weight vector is associated with any robust region
       if r10>0
            rk1=zeros(1,r10);         
            for j=1:r10
               rk1(1,j)=rr(j,M+n+1);%mean
            end
            [k3,k4]=min(rk1(1,:));
            f(i,:)=rr(k4,1:M+n);
            t(i,1)=1;
            llr(i,k4)=1;
       end
   end
   %% round 2
   for i=1:st1
       if t(i,1)==0         
          % If one weight vector is not associated with any robust region        
           % Check if its neighbor vector contains the robust region
           r1=nei(i,2:T+1);r3=[];
           ss1=0;
           for r2=1:T
               rt=w_re{r1(1,r2),1};
               [sc1,sc2]=size(rt);
               ss1=ss1+sc1;
           end
           if ss1>0
              f(i,:)=fn1(i,1:M+n);
           else
              f(i,:)=zeros(1,M+n);
           end
       end
   end