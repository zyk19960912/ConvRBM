clc;clear;
load 70fea;
x=q(1:9,:);
y=q(10:12,:);
for i = 2:250
    x=[x;q(1+12*(i-1):9+12*(i-1),:)];
    y=[y;q(10+12*(i-1):12+12*(i-1),:)];
end