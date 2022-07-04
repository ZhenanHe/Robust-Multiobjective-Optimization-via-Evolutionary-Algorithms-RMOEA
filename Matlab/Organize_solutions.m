function g0=Organize_solutions(ds,n,phi)
%g0: grid of each solution

%Input original solutions
[s1,s2]=size(ds);
g0=zeros(s1,n+1);%integer grid (original)
%for each solution,calculate the integer grid coordinate
for i=1:s1
    for j=1:n
        g0(i,j)=floor(ds(i,j)/phi/2); %Get the grid        
    end
end

