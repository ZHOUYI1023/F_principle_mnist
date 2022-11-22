function zc=deal_cmdata(map)
zc=char();
[r,~]=size(map);
for i=1:r
    zc=[zc,num2str(map(i,1)),',',num2str(map(i,2)),',',num2str(map(i,3)),';'];
end
zc=[inputname(1),'=[',zc(1:end-1),'];'];
end