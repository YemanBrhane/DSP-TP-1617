function  convolvolution2D()
%A=[1 2 3; 4 5 6; 7 8 9]
%k=[-1 -2 -1;0 0 0;1 2 1]
clear all; close all; clc;
  I=imread('lena-grey.bmp');  
    figure
  imshow(I,[]);
  title('Input Image');
  
  kernel=(1/256)*[1 4 6 4 1;4 16 24 16 4;6 24 36 24 6;4 16 24 16 4;1 4 6 4 1];
  im_gua=conv2D(I,kernel);
  figure
  imshow(im_gua,[]);
  title('Gaussian blered Image');
  
  %%%%%%% Sobel Filtering or convolution with kernels Gx and Gy, which
  %%%%%%% finds the edges along x and y 
  Gx=[-1 0 1;-2 0 2;-1 0 1];
  Gy=[1 2 1;0 0 0;-1 -2 -1];
  H_edge=conv2D(I,Gx); %edges along x 
   V_edge=conv2D(I,Gy);%edges along y
   edge=sqrt(V_edge.^2 + H_edge.^2); %resultant edges 
   figure
  imshow(edge,[]);
  title('Sobel edge Image');
  
  %.........function definition.............
  
 function Conv_im=conv2D(I,kernel)
        [r, c] = size(I);
        [m, n] = size(kernel);
        % in some cases the kernel may not be symetric and we have to flip
        % it horizontally and vertically
        % here we may not need this fliping since our kernel(Gaussian) is
        % Symmetric
        h = rot90(kernel, 2);
        cen_ker = floor((size(h)+1)/2);
        % deciding the zeros to be appended
        left = cen_ker(2) - 1;
        right = n - cen_ker(2);
        top = cen_ker(1) - 1;
        bottom = m - cen_ker(1);
        % zero pading at the right, left, botom, and top depending on the
        % size of Kernel or filter
        I_padded = zeros(r + top + bottom, c + left + right); % size of new image
I_padded(1 + top : r + top,1 + left : c + left)=I;
        %do convolution on the input image only, not on padded pixels
        Conv_im = zeros(r , c);
        for x = 1 : r
            for y = 1 : c
                for i = 1 : m
                    for j = 1 : n
                        q = x - 1;
                        w = y -1;
                        Conv_im(x, y) = Conv_im(x, y) + (I_padded(i + q, j + w) * h(i, j));
                    end
                end
            end
        end
 end

end
 
 
