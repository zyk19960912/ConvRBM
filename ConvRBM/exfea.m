clc;clear;
load para50;
load data70;
for i = 1 : 250
    for j = 1 : 12                  %12组作为训练集,4组作为测试
        word(j,:) = data70(i+250*(j-1),:);
    end
    W=paraW(:,:,i);b=parab(:,i);c=parac(i);
    [num,n]=size(word);
    [K,m]=size(W);
    for r = 1:num
        x = word(r,:);
         for k = 1:K
            I1(k,:,r) = conv2(x,fliplr(W(k,:)),'valid')+ b(k);
         end  
    end
 %%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    I1 = max(0,I1);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    I = avgpool(I1);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    I = log(I+0.0001);
    for  v=1:num
        q(v+12*(i-1),:)=reshape(I(:,:,v)',1,35*60);
    end
    i
end