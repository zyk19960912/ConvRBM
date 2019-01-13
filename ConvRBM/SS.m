clc;clear;
load 50fea;x=q;
load 70_50fea;y=q;
test_label=zeros(3000,1);
trainlabel=zeros(4000,1);
 for i = 1:250
     trainlabel(16*i-15:16*i,1)=i;
     test_label(12*i-11:12*i,1)=i;
 end
  model = svmtrain(trainlabel, x, '-c 5');
  [predicted_label, accuracy, prob_est] =...
      svmpredict(test_label, y, model);
%     [predicted_label, accuracy, prob_est] =...
%       svmpredict(trainlabel, traindata, model);