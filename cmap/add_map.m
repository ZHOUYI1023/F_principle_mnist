function add_map(map)
% 请不要将表达式作为输入
    filename=which('mymap');
    fid=fopen(filename,'r+');
    frewind(fid);
    while true
        temp=fgetl(fid);
        if contains(temp,'otherwise')
            len=length(temp);
            P=ftell(fid);
            while ~contains(temp,'"viridis", "plasma"')
                temp=fgetl(fid);
            end
            break
        end
    end
    fseek(fid,P-len-4,'bof');
    format1='\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s';
    str_1=['        case ''',inputname(1),''''];
    str0=['            ',deal_cmdata(map),'  '];
    str1='        otherwise';
    str2='            error(''无匹配的颜色图'')';
    str3='    end';
    str4='else';
    str5=[temp(1,1:end-2),',"',inputname(1),'"];'];
    str6='end';
    str7='end              ';
    fprintf(fid,format1,str_1,str0,str1,str2,str3,str4,str5,str6,str7);
    fclose all;
end