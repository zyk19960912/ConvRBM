%%%%%%%%%%%%%%%%%%%%%%%%%%%%feature extraction%%%%%%%%%%%%%%%%%%%%%%%
%Input:testdata with n samples in length;
%      model parameters W,b,c after training
%Output:Features K*F
%      K number of filterbanks
%      F number of frames
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Input%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
 load askpara;
 load ask_fa_train;
 [num,n]=size(ask);
 [K,m]=size(W);
 %%%%%%%%%%%%%%%%%%%%%%%%convolution layer%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for i = 1:462
     x = ask(i,:);
     for k = 1:K
         I1(k,:,i) = conv2(x,fliplr(W(k,:)),'valid')+ b(k);
     end  
 end
 %%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I1 = max(0,I1);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I1 = avgpool(I1);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1 = log(I1+0.0001);
for i =1:462
    q1(i,:)=reshape(I1(:,:,i)',1,980);
end

 load carrypara;
 load carry_fa_train;
 [num,n]=size(carry);
 [K,m]=size(W);
 %%%%%%%%%%%%%%%%%%%%%%%%convolution layer%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for i = 1:462
     x = carry(i,:);
     for k = 1:K
         I2(k,:,i) = conv2(x,fliplr(W(k,:)),'valid')+ b(k);
     end  
 end
 %%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I2 = max(0,I2);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I2 = avgpool(I2);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2 = log(I2+0.0001);
for i =1:462
    q2(i,:)=reshape(I2(:,:,i)',1,980);
end

 load darkpara;
 load dark_fa_train;
 [num,n]=size(dark);
 [K,m]=size(W);
 %%%%%%%%%%%%%%%%%%%%%%%%convolution layer%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for i = 1:462
     x = dark(i,:);
     for k = 1:K
         I3(k,:,i) = conv2(x,fliplr(W(k,:)),'valid')+ b(k);
     end  
 end
 %%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I3 = max(0,I3);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I3 = avgpool(I3);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I3 = log(I3+0.0001);
for i =1:462
    q3(i,:)=reshape(I3(:,:,i)',1,980);
end

 load dontpara;
 load dont_fa_train;
 [num,n]=size(dont);
 [K,m]=size(W);
 %%%%%%%%%%%%%%%%%%%%%%%%convolution layer%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for i = 1:462
     x = dont(i,:);
     for k = 1:K
         I4(k,:,i) = conv2(x,fliplr(W(k,:)),'valid')+ b(k);
     end  
 end
 %%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I4 = max(0,I4);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I4 = avgpool(I4);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I4 = log(I4+0.0001);
for i =1:462
    q4(i,:)=reshape(I4(:,:,i)',1,980);
end

load greasypara;
 load greasy_fa_train;
 [num,n]=size(greasy);
 [K,m]=size(W);
 %%%%%%%%%%%%%%%%%%%%%%%%convolution layer%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for i = 1:462
     x = greasy(i,:);
     for k = 1:K
         I5(k,:,i) = conv2(x,fliplr(W(k,:)),'valid')+ b(k);
     end  
 end
 %%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I5 = max(0,I5);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 I5 = avgpool(I5);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I5 = log(I5+0.0001);
for i =1:462
    q5(i,:)=reshape(I5(:,:,i)',1,980);
end

load oilypara;
load oily_fa_train;
[num,n]=size(oily);
[K,m]=size(W);
%%%%%%%%%%%%%%%%%%%%%%%%convolution layer%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:462
    x = oily(i,:);
    for k = 1:K
        I6(k,:,i) = conv2(x,fliplr(W(k,:)),'valid')+ b(k);
    end  
end
%%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I6 = max(0,I6);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I6 = avgpool(I6);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I6 = log(I6+0.0001);
for i =1:462
    q6(i,:)=reshape(I6(:,:,i)',1,980);
end

load shepara;
load she_fa_train;
[num,n]=size(she);
[K,m]=size(W);
%%%%%%%%%%%%%%%%%%%%%%%%convolution layer%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:462
    x = she(i,:);
    for k = 1:K
        I7(k,:,i) = conv2(x,fliplr(W(k,:)),'valid')+ b(k);
    end  
end
%%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I7 = max(0,I7);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I7 = avgpool(I7);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I7 = log(I7+0.0001);
for i =1:462
    q7(i,:)=reshape(I7(:,:,i)',1,980);
end

load thatpara;
load that_fa_train;
[num,n]=size(that);
[K,m]=size(W);
%%%%%%%%%%%%%%%%%%%%%%%%convolution layer%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:462
    x = that(i,:);
    for k = 1:K
        I8(k,:,i) = conv2(x,fliplr(W(k,:)),'valid') + b(k);
    end  
end
%%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I8 = max(0,I8);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I8 = avgpool(I8);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I8 = log(I8+0.0001);
for i =1:462
    q8(i,:)=reshape(I8(:,:,i)',1,980);
end

load washpara;
load wash_fa_train;
[num,n]=size(wash);
[K,m]=size(W);
%%%%%%%%%%%%%%%%%%%%%%%%convolution layer%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:462
    x = wash(i,:);
    for k = 1:K
        I9(k,:,i) = conv2(x,fliplr(W(k,:)),'valid')+ b(k);
    end  
end
%%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I9 = max(0,I9);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I9 = avgpool(I9);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I9 = log(I9+0.0001);
for i =1:462
    q9(i,:)=reshape(I9(:,:,i)',1,980);
end

load yearpara;
load year_fa_train;
[num,n]=size(year);
[K,m]=size(W);
%%%%%%%%%%%%%%%%%%%%%%%convolution layer%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:462
    x = year(i,:);
    for k = 1:K
        I10(k,:,i) = conv2(x,fliplr(W(k,:)),'valid')+ b(k);
    end  
end
%%%%%%%%%%%%%%%%%%%%%%%ReLU activation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I10 = max(0,I10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%Pooling%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I10 = avgpool(I10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%log%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I10 = log(I10+0.0001);
for i =1:462
    q10(i,:)=reshape(I10(:,:,i)',1,980);
end
traindata=[q1;q2;q3;q4;q5;q6;q7;q8;q9;q10];