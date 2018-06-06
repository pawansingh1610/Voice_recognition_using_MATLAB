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
%% Feature Extraction
 f= voiceFeatures(data);
 
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
 msgbox('your voice registered')
     
