clc;clear;
load data70;
for i=1:250
    for j = 1:12
        word(j,:) = data70(i+250*(j-1),:);
    end
    for r = 1:12
        x=word(r,:);
        mel = melcepst(x,16000,'EdD',12,35,400,160);
        mel=mel';
        c(r+12*(i-1),:)=reshape(mel,1,size(mel,1)*size(mel,2));
    end   
    i
end