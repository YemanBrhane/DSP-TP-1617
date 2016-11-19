clc;
close all;
clear all;

% Information provided
barcode_list=[1,2, 42:54];
nonBarcode_list=3:41;

num_images_correc_class=0;

Directory=pwd; % Save the current working directory
image_folder=[pwd,'\images\1D-DFT']; 
cd (image_folder) % change folder to image folder
files=dir;
num_im=length(files)-2;% this is because when we use the matlab dir command
% the first two elements are not files
%=======================================
% Read the images to determine the smallest size image and rescale the
% other images 
im_size=zeros(1,num_im);
for i=1:num_im
    im=imread(files(i+2).name);% read each image
    [n,m]=size(im);
    im_size(i)=n*m;   
end

%..... Find the minimum size image
min_pos=find(im_size==min(im_size(:)));
position=min_pos ;


% the size of the the minimum size element
im=imread(files(position).name);
[m,n,l]=size(im);% this is the size of the smallest size image

% scale the images to the smallest size image and take one row profile from the center row of the rescaled images
% which the m/2 row of the images
%im_profile=zeros(num_im,n);% holds the profile of te images 

% Variables to hold barcode and non barcode images
bacode_im=[]; 
nonbarcod_im=[];


for i=1:num_im
    im=imread(files(i+2).name);% read each image
    % Normalize the images
    [ a, b, c]= size(im);
    
        if c==4 % some of the images are four dimensional and I took only one dimentsion
            im=im(:,:,1);
        end
        
    % normalize the images   
    im=im/(max(im(:))); 
    
    % resize an  image and take a row profile in the center
    image_resized = imresize(im, [m n]); 
    im_1D_profile=image_resized(m/2,:);
   
    % 1-D DFT of the profile
    N=n;
    fr = (-N/2 : N/2-1);
    image_DFT = ifftshift(fft(im_1D_profile));
    
    % 1-D DFT of the profile another row. if the image is barcode image the
    % DFT of the the second profile will be almost same as the dft of the
    % second profile which taken far from the center
    im_1D_profile2=image_resized(m/2+10,:);
    image_DFT2 = ifftshift(fft(im_1D_profile2));
%    plot(fr, abs(image_DFT)); title('Magnitude'); ...
%    xlabel('Frequency'); ylabel('|image_DFT|');

% Discussion
% For fourier transform of barcode images must have a SIGNIFICANT value when f different from zero, while
%  barcode images have DFT which concentrated at around f=0


%==============================================

% Therefore to determine wether agiven image is bar code or not we can
% see the value of the FFT of the 1-D profile of the images at high frequency(taking Threshold) or use a HIGH
% PASS FILTER. Barcodes Have high frequency components

% Here I am making decision to clasify the images I am testing 
        if ( abs(image_DFT(1,195))>5) 
            % Here I am assuming an image is a bar code if it has
            % significant value at high frequency and some if some profile
            % is taken from same image the difference of the magnitude of
            % DFT is very small compared to non barcode images
           % if  (abs(image_DFT)-abs(image_DFT2))<0.2% The threshold I found it by try and error
                  bacode_im=[bacode_im,i];
                  p=find(barcode_list==i);
                if ~isempty(p)
                    num_images_correc_class=num_images_correc_class+1;
       
                 end
        else
                
            if  (abs(image_DFT)-abs(image_DFT2))<0.2% The threshold I found it by try and error
                  bacode_im=[bacode_im,i];
                  p=find(barcode_list==i);
                if ~isempty(p)
                    num_images_correc_class=num_images_correc_class+1;
                end
            
                else
            
                nonbarcod_im=[nonbarcod_im,i];
                 p=find(nonBarcode_list==i);
                if ~isempty(p)
                    num_images_correc_class=num_images_correc_class+1;
                end
            end
        end
end
length(nonbarcod_im)
length(bacode_im);
%end
%========================Performance measure
% the percentage of images that r correctly classified

percentage=num_images_correc_class/54*100;

%================================================
disp('=========================================================');
str=[num2str(num_images_correc_class),'  Images which is ', num2str(percentage),...
    '% of the images are perfectly detected'];
disp(str);
disp('=============================================================');
%====================================================
% some of the images are difficult to clasify correcty as they resemble as
% barcode though they are not barcode with bars in the images. still have
% high freqiency
bacode_im
nonbarcod_im
cd(Directory)