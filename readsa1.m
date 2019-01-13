clc;clear;
for i=1:462
    file = ['C:\Users\1\Desktop\sa1_train\sa1 (',int2str(i),').wav'];
    [x,fs]=audioread(file);
    data(i,1:length(x))=x';
end
data=data';