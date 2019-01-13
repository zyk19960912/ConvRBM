clc;clear;
% load ask_bb_train;load carry_bb_train;
% load dark_bb_train;load dont_bb_train;
% load greasy_bb_train;load oily_bb_train;
% load she_bb_train;load that_bb_train;
% load wash_bb_train;load year_bb_train;
% traindata=[ask;carry;dark;dont;greasy;oily;she;that;wash;year];
% for i=1:18480
%    x=traindata(i,:);
%    mel=melcepst(x,16000,'EdD',12,35,400,160);
%    mel=mel';
%    c(i,:)=reshape(mel,1,size(mel,1)*size(mel,2));
%    i
% end
% save traindata c
% 
 load traindata;

%     load ask;load carry;load dark;load dont;load greasy;
%     load oily;load she;load that;load wash;load year;
%    noise=audioread('wind.wav');fs=16000;
%     SNR=1;
%     test=[ask;carry;dark;dont;greasy;oily;she;that;wash;year];
%     for i=1:1680
%        test(i,:)=v_addnoise(test(i,:),fs,SNR,'',noise,fs);
%        mel=melcepst(test(i,:),16000,'EdD',12,35,400,160);
%        mel=mel';
%        t(i,:)=reshape(mel,1,size(mel,1)*size(mel,2));
%       i
%     end
%    save test_1 t;

   load test_5;
 test_label=zeros(1680,1);
 trainlabel=zeros(4620,1);
  for i = 1:10
      trainlabel(462*i-461:462*i,1)=i;
      test_label(168*i-167:168*i,1)=i;
  end
    model = svmtrain(trainlabel, c, '-c 5');
   [predicted_label, accuracy, prob_est] =...
       svmpredict(test_label, t, model);