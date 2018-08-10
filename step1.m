filename = 'eng.txt';
fid = fopen(filename);
A = textscan(fid,'%s%s%s\n','Delimiter','\n');
fclose(fid);
B = [A{1},A{2},A{3}];
B = string(B);
disp([filename,' has been read into memory.']);
repeat_cnt = 0;
record_num = length(B);
ii = 1;
while ii < record_num
    if B(ii,2) == B(ii+1,2) && B(ii,3) == B(ii+1,3)
        B(ii,:) = [];
        record_num = record_num - 1;
        repeat_cnt = repeat_cnt + 1;
    end
    ii = ii + 1;
end

for ii = 1:record_num
    B(ii,1) = num2str(ii);
end

disp(['Detected ',num2str(repeat_cnt),' repeat records, deleted.']);

fid = fopen('derepeat.txt','w');
fprintf(fid,'%s\n%s\n%s\n\n',B');
fclose(fid);