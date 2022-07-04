function f=sort_archive(lf1,m_limit)
%return updated archive

[ss1,ss2]=size(lf1);
la=cell(ss1,1);
for i=1:ss1
    t=lf1{i,1};
    [s1,s2]=size(t);   
    if s1>0
       [y1,y2]=sort(t(:,s2));  
       temp2=t(y2(1,1),:);
       c=t(y2(1,1),s2);
       for j=2:s1
           if t(y2(j,1),s2)<=m_limit(i,1) %Delete solution with PBI larger than worst PBI
              if t(y2(j,1),s2)-c>=0.001 %Delete solution with same PBI further control the size of archive
                 temp2=[temp2;t(y2(j,1),:)];
                 c=t(y2(j,1),s2);
              end
           end
       end
       la{i,1}=temp2;
   end
end
f=la;