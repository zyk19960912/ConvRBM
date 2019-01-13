clc;clear;
num=[0,38,76,76,68,70,35,77,22];
s=0;
for i = 1:8
    s = s + num(i);
    for j = 1:num(i+1)
        filedir = ['C:\Users\1\Desktop\timit111\train\',int2str(i),'\1 (',int2str(j),')\sa1.wav'];
        [x,fs]=audioread(filedir);
        filename=['sa1(',int2str(s+j),').wav'];
        audiowrite(filename,x,fs);
    end
end

