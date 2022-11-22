function map = importmaprbg(filename)
startRow = 3;
endRow = inf;
formatSpec = '%10f%10f%10f%[^\n\r]';
%% 打开文本文件。
fileID = fopen(filename,'r');
%% 根据格式读取数据列。
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end
%% 关闭文本文件。
fclose(fileID);
map = [dataArray{1:end-1}];
if max(map,[],'all')>1
   map = map/255; 
end
