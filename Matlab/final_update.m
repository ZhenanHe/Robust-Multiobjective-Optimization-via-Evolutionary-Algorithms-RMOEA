function f=final_update(llf,n,phi)

[p1,p2]=size(llf);
lff=cell(p1,1);
for i=1:p1 %for each vector
    t=llf{i,1};
    
    [s1,s2]=size(t);
    if s1>0
        tt=t(1,:);
    a=1;
    for j=2:s1 %for each solution in vector i
        y=1; %tt(y,:)
        while y<=a
            sum1=0;
            for y1=1:n
                sum1=sum1+abs(t(j,y1)-tt(y,y1));
            end
            if sum1<=(phi*3)
               y=a+10;
            else
               y=y+1; 
            end
        end
        if y<=(a+1)
           tt=[tt;t(j,:)];
           a=a+1;
        end
    end
    lff{i,1}=tt;
    end
end
f=lff;