clear;clc;
cd(".\colormaps")
filenames=ls;
filenames=filenames(3:end,:);
[r,~]=size(filenames);
for i=1:r
    filename(i)=string(filenames(i,:));
end
filename=strtrim(filename);
clear filenames i r
for name=filename
    name1=char(name);
    mp_list=mymap();
    s=sum(contains(mp_list,name1(1,1:end-4))); %检查是否已有同名cm
    if ~s %mymap不包含cm时执行添加程序
        message1=['add ',name1(1,1:end-4)]
        eval([name1(1,1:end-4),'=importmaprbg(name1);'])
        eval(['add_map(',name1(1,1:end-4),');'])
        figure
        im=imagesc(1:256); colormap(mymap(name1(1,1:end-4)))
        im.Parent.DataAspectRatio=[4 1 2]; axis off
    end
end
clear all