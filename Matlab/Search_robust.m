function [w_re,wc]=Search_robust(w,n,lf,g0,phi,ds,m_limit,w_limit,nei,TN,theta,func)
%w_re: robust region of each vector
%wc: store each hyperbox PBI on each neighbor vector
 
   [st1,M]=size(w);  %each weight vector in objective space
   w_re=cell(st1,1); %store each vector's robust regions
   c=0;
   wc=cell(10000,2);
   %For each vector
   for i=1:st1        
       l1=lf{i,1};%l1:all solutions associated to vector i's archive
       [T,TT1]=size(l1);
       
       %For each solution in the archive
       for  jj1=1:T
           %find hyperboxes
            w_e=zeros(12,M+n);
            vt=l1(jj1,M+n+1); %the number(position) of solution in ds            
            for j=1:n
                cc1(1,j)=g0(vt,j)*phi*2+phi; %center of hyperbox2
            end
            cc1(1,1:n+M)=evaluate_objective(cc1(1,1:n),func);
            w1t1=ds(vt,:);
            w1t2=cc1;
            w_e(1,1:M+n)=w1t1(1,1:M+n);
            w_e(2,1:M+n)=w1t2(1,1:M+n);
            for j=1:10 %randomly select 10 grids for hyperbox3 
                rc=rand(1);
                if rc>0.5
                   w1t3=w1t1; %hyperbox3
                else
                   w1t3=w1t2; %hyperbox3
                end    
               if j<=n
                    cr=rand(1);
                    if cr>0.5
                       w1t3(1,j)=w1t3(1,j)+phi*2; %hyperbox3
                       if w1t3(1,j)>(1-phi) 
                          w1t3(1,j)=w1t3(1,j)-phi*4;
                       end
                    else
                       w1t3(1,j)=w1t3(1,j)-phi*2; %hyperbox3
                       if w1t3(1,j)<phi && j<2
                          w1t3(1,j)=w1t3(1,j)+phi*4;
                       end
                       %if w1t3(1,j)<(phi-0.15) && j==2
                        %  w1t3(1,j)=w1t3(1,j)+phi*4;
                       %end
                       if w1t3(1,j)<(-1+phi) 
                          w1t3(1,j)=w1t3(1,j)+phi*4;
                       end
                    end                        
              else
                at1=ceil(rand(1)*n);
                w1t3(1,at1)=w1t3(1,at1)+phi*2; %hyperbox3
                if w1t3(1,at1)>(1-phi) 
                   w1t3(1,at1)=w1t3(1,at1)-phi*4;
                end
                at2=ceil(rand(1)*n);
                w1t3(1,at2)=w1t3(1,at2)-phi*2; %hyperbox3
                if w1t3(1,at2)<phi && at2<2
                   w1t3(1,at2)=w1t3(1,at2)+phi*4;
                end
              %  if w1t3(1,at2)<(phi-0.15) && at2==2
               %       w1t3(1,at2)=w1t3(1,at2)+phi*4;
                %   end
                if w1t3(1,at2)<(-1+phi) 
                   w1t3(1,at2)=w1t3(1,at2)+phi*4;
                end
              end
                w1t3(1,1:n+M)=evaluate_objective(w1t3(1,1:n),func);  
                w_e(2+j,1:M+n)=w1t3(1,1:n+M);
            end
            
            for j=1:12 %detect the robustness of the hyperbox of solution jj1
                 a=w_e(j,1:M+n);
                 w5=robust_detection1(w,a,n,phi,nei(i,:),TN,theta,func);
                 [s3,s4]=size(w5);
                 [tt1,tt2]=sort(w5(:,1));%directly assign robust region on vector
                 j1=1;
                 while j1<=s3
                       temp2=nei(i,tt2(j1,1));
                       ml1=m_limit(temp2,1);
                       wl1=w_limit(temp2,1);
                       %Decide whether the hyperbox is the robust region on j1
                       if w5(tt2(j1,1),1)<=ml1 && w5(tt2(j1,1),2)<=wl1 %less than the worst value of original front
                          a(1,M+n+1)=w5(tt2(j1,1),1);
                          a(1,M+n+2)=w5(tt2(j1,1),2);
                          c=c+1;
                          a(1,M+n+3)=c;
                          wc{c,1}=w5;
                          wc{c,2}=nei(i,:);
                          w_re{temp2,1}=[w_re{temp2,1};a];
                          j1=j1+s3*2;%break
                       end
                       j1=j1+1;
                 end
             end
       end
       %store all robust regions
   end
  