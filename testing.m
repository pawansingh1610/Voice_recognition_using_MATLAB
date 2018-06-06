
load databse
D=[];
for(i=1; size(F,1))
    d=sum(abs(F(i)-f));
    D=[D d];
end

%%smallest distance
sm =inf;
ind=-1;

for(i=1:length(D))
    if(D(i)<sm)
        sm=D(i);
        ind=i;
    end
end
detected_class=C(ind);
disp('the detected class is');
detected class
dfname=strcat('.\Train\',num2str(detected_class),'.png');

%%plat current data and detected image inthe sam ewindow
subplot(1,2,1);
imshow(im);
title('Given image');
subplot(1,2,2);
imshow(imread(dfname));
title(strcat('Training instance',num2str(detected_class)));