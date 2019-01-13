function [ y ] = avgpool( X )
%Input:activation output
%output:pooling output
[K,n,t]=size(X);
wl = 400;%window length
ws = 160;%window shift
F = floor((n-wl+ws)/ws);
for j =1:t
    for k = 1:K
        for i = 1:F
            y(k,i,j)=sum(X(k,(i-1)*ws+1:(i-1)*ws+wl,j))/wl;
        end
    end
end

