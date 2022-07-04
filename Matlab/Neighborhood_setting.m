function nei=Neighborhood_setting(w, T)
%return the neighbor of each vector

  %T=10;% Neighborhood size
  [st1,M]=size(w);
  nei=zeros(st1,T+1);
  for i=1:st1
      a=[];
      for j=1:st1
          sum1=0;
          for k1=1:M
              sum1=sum1+(w(i,k1)-w(j,k1))^2;
          end
          a(j,1)=sum1;
      end
      [n1,n2]=sort(a(:,1));
      nei(i,1:T+1)=(n2(1:(T+1),:))'; %nei contains vectors in neighbor
  end
  

  