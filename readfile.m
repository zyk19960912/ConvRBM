clc;clear;
for i = 1: 12
    for j = 1:500
        filedir = ['C:\Users\1\Desktop\70dB\words\',int2str(i),'\',int2str(i),' (',int2str(j),').wav'];
        [x,fs]=audioread(filedir);
        data70(j + 500*(i-1),:)=x';
    end
end