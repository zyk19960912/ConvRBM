clc;clear;
load data50;
maxepoch = 25;   %number of training iteration
eta = zeros(1,maxepoch);     %learning rate
eta(1:10)=0.005;eta(21:25)=0;
 for i = 11: 20
     eta(i)=0.01-0.0005*i;
 end
 m = 128;         %length of subband filters
 K = 35;          %number of subband filters
 momentum = zeros(1,maxepoch);
 momentum(1:5)=0.5;
 momentum(6:25)=0.9;
for i = 1 : 250
    for j = 1 : 12                  %12组作为训练集
        word(j,:) = data50(i+250*(j-1),:);
    end
    [num,n]=size(word);%number of training examples num 
                       %length of signal n       
        W0=0.01*randn(K,m);
        c0 = 0;
        b0 = zeros(K,1);
        W=W0;b=b0;c=c0;
    
    %training
        for t = 1 : maxepoch
            deltaW=zeros(K,m);deltab=zeros(K,1);deltac=0;
            for a = 1 : num
                X = word(a,:);
                X = zscore(X);
                for k = 1 : K
                    y(k,:) = conv2(X,fliplr(W(k,:)),'valid');
                    I(k,:) = y(k,:) + b(k);
                    hact(k,:) = max(0,I(k,:));
                    s(k,:)=sqrt(1./(1+exp(-I(k,:))));
                    hsample(k,:) = max(0,I(k,:)+s(k,:).*randn());
                    VH1(k,:) = conv2(X,fliplr(hact(k,:)),'valid');
                    HE1(k,1) = sum(hact(k,:),2);
                end
                for k = 1 : K                             %reconstruct signal
                    uu(k,:) = conv2(hsample(k,:),W(k,:));
                end
                tt=sum(uu,1)+c;
                xx=zscore(tt);
            
                for k = 1 : K
                    yy(k,:) = conv(xx,fliplr(W(k,:)),'valid');
                    II(k,:) = yy(k,:) + b(k);
                    hhact(k,:) = max(0,II(k,:));
                    ss(k,:)=sqrt(1./(1+exp(-II(k,:))));
                    hhsample(k,:) = max(0,II(k,:)+ss(k,:).*randn());  
                    VH2(k,:) = conv2(xx,fliplr(hhact(k,:)),'valid');
                    HE2(k,1) = sum(hhact(k,:),2);
                end
                deltaW = deltaW + (VH1-VH2)/n;
                deltab = deltab + (HE1-HE2)/n;
                deltac = deltac + (sum(X)-sum(xx))/n;
                a
            end
                WW = W + eta(t)/num*deltaW + momentum(t)/num*W0;
                bb = b + eta(t)/num*deltab + momentum(t)/num*b0;
                cc = c + eta(t)/num*deltac + momentum(t)/num*c0;
                W0 = W;b0 = b;c0 = c;  
                W = WW;b = bb;c = cc;
                t
        end
        paraW(:,:,i)=W;parab(:,i)=b;parac(i)=c;
        i
end