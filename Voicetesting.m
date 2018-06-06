clear all;
close all;
clc;
%% create recorder object
recorder = audiorecorder(16000,8,2);
%% record user voice for 5 sec
disp('please record your voice');
drawnow();
pause(1);
recordblocking(recorder, 5);
play(recorder);
data = getaudiodata(recorder);
plot(data)
figure;
load('database.mat');
%% Feature Extraction
 f= voiceFeatures(data);
 
 %% classify
D=[];
for (i=1:size(F,1))
    d=sum(abs(F(i)-f));
    D=[D d];
end

%% smallest distance
sm =inf;
ind=-1;

for i=1:length(D)
    if(D(i)<sm)
        sm=D(i);
        ind=i;
    end
end
detected_class=C(ind);
disp('the detected class is');
detected_class
 
 %% save users data
 uno=input('enter the user data ');
 try
     load database
     F=[F;f];
     C=[C;uno];
     save database
 catch
     F=f;
     C=uno;
     save database F C
 end
% % % % % % %  msgbox('your voice registered')
     
