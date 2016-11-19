function Character_recognition()
close all;
clc;
clear all;

% Read the images
text_im=imread('text.png');
a_im=imread('a.png');
% There is inconsistency in pixel value representation on the two images
% to overcome this we have to complement one of the images
a_im = imcomplement(a_im); %reverse the pixel values 

figure
imshow(text_im, [])
title('Input Text Image');

figure
imshow(a_im, [])
title('Input a Image Complimented');

% Generating binary images

level_T = graythresh(text_im);
BW_text = im2bw(text_im,level_T);
figure
imshow(BW_text)
title('Binarized Text Image');
figure
level_a = graythresh(a_im);
BW_a = im2bw(a_im,level_a);
imshow(BW_a)
title('Binarized a Image');


% find the correlation between the two images
xCorr_im= xcorr2(im2double(BW_text),im2double(BW_a));
 %xCorr_im= normxcorr2(im2double(BW_a),im2double(BW_text));
figure
imshow(xCorr_im,[]);
title('corelated Image');
%%%....The fisrt 10 'a' LETTERS in the text image corresponds to to the first 
%the first 10 maximum values in the correlated image 

B=sort(xCorr_im(:),'descend'); % arrange the correlated values in assending order
B(1:10,:) % see the first 10 maximum values
index=[]; % holdes the position of the maximum values
for i=1:10
[r,c]=find(xCorr_im==B(i));% find coordinate positions of the maximum values
index=[index;[r c]];
tmp = length(c);
    if tmp >=10;% only 10 values
        break
    end
end
X=index(1:10,:) % contains the index of the first 10 maximum correlation values
%X=X-10;
%.....Locate the 10 letters..............

figure
imshow(text_im, [])
%Y=zeros(10,2);
%Y(:,:)=20
%position=[X,Y];
title('Detected a position')
hold on
X=X-8;
for i=1:10
    y=X(i,1);
    x=X(i,2);
    plot(x,y,'.', 'MarkerSize', 20);
end

end

