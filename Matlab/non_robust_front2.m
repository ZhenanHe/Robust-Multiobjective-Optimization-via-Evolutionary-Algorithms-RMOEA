function [w_limit,m_limit,k,lf1]=non_robust_front2(lf,n,M,phi,w,Tnon,theta,func)
%w_limit: the worst PBI on each vector
%m_limit: the average PBI on each vector
%k: the optimal solution of each vector
%lf1: the archive of each vector

[s1,s2]=size(lf);
for i=1:s1
    t5(i,1)=norm(w(i,:)); %norm w
end
k=zeros(s1,M+n+2);
lf1=cell(s1,1);
for i=1:s1
    temp1=lf{i,1};%all solutions belong to this vector
    [ss1,ss2]=size(temp1);
    if ss1>0
       t=zeros(ss1,1);
       for j=1:ss1
           %Calculate PBI for solution j on vector i
           d1=temp1(j,n+1:n+M)*w(i,:)'/t5(i,1);
           dt=temp1(j,n+1:n+M)-w(i,:)*(d1/t5(i,1));
           d2=norm(dt);
           t(j,1)=d1+theta*d2;
           temp1(j,M+n+2)=t(j,1);
       end
       [k1,k2]=min(t(:,1)); %Find the solution with minimum PBI on vector j
       k(i,:)=temp1(k2,:); %Assign the solution as the optimal solution on vector j
       lf1{i,1}=temp1;
    end
end
r1=[];
for i=1:s1
    for ii=1:Tnon %Sampling
        f3=k(i,1:n);%Optimal solution on vector i
        for j=1:n
            c=rand(1)*2*phi-phi;
            f3(1,j)=k(i,j)+c;
            while f3(1,j)<0 && j<2
                  c=rand(1)*2*phi-phi;
                  f3(1,j)=k(i,j)+c;
            end
         %  while f3(1,j)<-0.15 && j==2
          %        c=rand(1)*2*phi-phi;
           %      f3(1,j)=k(i,j)+c;
            %end
            while f3(1,j)<-1
                  c=rand(1)*2*phi-phi;
                  f3(1,j)=k(i,j)+c;
            end
            while f3(1,j)>1
                  c=rand(1)*2*phi-phi;
                  f3(1,j)=k(i,j)+c;
            end
        end
        f4=[];
        f4(ii,:)=evaluate_objective(f3(1,1:n),func); %Evaluate sampled solution on benchmark
        %Calculate PBI of the sampled solution
        d1=f4(ii,n+1:n+M)*w(i,:)'/t5(i,1);
        dt=f4(ii,n+1:n+M)-w(i,:)*(d1/t5(i,1));
        d2=norm(dt);
        r1(ii,i)=d1+theta*d2;
    end
end
for i=1:s1
    w_limit(i,1)=max(r1(:,i)); %Calculate the worst PBI of solution on vector i
    m_limit(i,1)=mean(r1(:,i));%Calculate the average PBI of solution on vector i
end