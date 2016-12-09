
close all;
clear all;
clc;

%% Read an image

I=imread('bureau.gif');
imshow(I,[]);

[ row, col]= size (I);

% Filter parameters
s=0.5;
Ts=1;
alpha=s*Ts;
a=exp(-alpha);

%% Apply the smoothing (derivative) Flter along the columns (rows) of the images to obtain the
    %component of the gradient on the horizontal direction.

    % smoothing  Flter along the columns
    
        % Causal
        Icausal=zeros(row , col);
        
        for j=1 : col
            
            for r=3 : row   
            y=2*a*Icausal(r-1,j) - a^2*Icausal(r-2,j) + I(r,j) + a*(alpha-1)*I(r-1,j);
            Icausal(r,j)=y;
            end
        end

      

        %Anti Causal part
        IantiCausal=zeros(row , col);
        
        for j=1 : col
            
            for r= 1 : row-2
                yAnti=2*a*IantiCausal(r+1,j) - a^2*IantiCausal(r+2,j)+I(r,j) + a*(alpha+1)*I(r+1 , j) - a^2*I(r+2, j);
                IantiCausal(r , j)=yAnti;
            end
        end
        
        ISmoothed= IantiCausal + Icausal;
        
%         figure, imshow(ISmoothed , [])
%         title('');

        % derivative Filtering along rows
        
        % causal
            IcausalDer=zeros(row , col);
            for r=1 : row

                for c=3 : col
                   y=2*a*IcausalDer(r,c-1)-a^2*IcausalDer( r , c-2) + ISmoothed( r, c )- s*a*(alpha)*ISmoothed( r, c-1);
                   IcausalDer(r,c)=y;
                end
            end 

            %Anti Causal part
            IantiCausalDer= zeros(row , col);
           
            for r=1 : row
                for c=1 : col-2
                   y=2*a*IantiCausalDer(r, c+1) - a^2*IantiCausalDer(r, c+2) + a*(alpha)*s*ISmoothed( r, c+1);
                   IantiCausalDer(r , c)=y;
                end
            end
            
            xGradImage= IantiCausalDer + IcausalDer;
            
   figure, imshow(xGradImage , [])
   title('component of the gradient on the horizontal direction')
   
            

%% Apply the smoothing (derivative) Flter along the rows (columns) of the images to obtain the
   %component of the gradient on the vertical direction.
   
      % smoothing  Flter along the rows
    
             % Causal
        Icausal=zeros(row , col);
        
        for r=1 : row
            
            for c=3 : col   
            y=2*a*Icausal( r , c-1) - a^2*Icausal( r, c-2) + I( r, c) + a*(alpha-1)*I( r, c-1);
            Icausal(r,c)=y;
            end
        end

      

        %Anti Causal part
        IantiCausal=zeros(row , col);
        
        for r=1 : row
            
            for c= 1 : col-2
                yAnti=2*a*IantiCausal(r, c+1) - a^2*IantiCausal(r, c+2)+I(r,c) + a*(alpha+1)*I(r, c+1) - a^2*I(r, c+2);
                IantiCausal(r , c)=yAnti;
            end
        end
        
        ISmoothed= IantiCausal + Icausal;
    
    % derivative Filtering along columns
    
    % causal
            IcausalDer=zeros(row , col);
            for c=1 : col

                for r=3 : row
                   y=2*a*IcausalDer(r-1,c)-a^2*IcausalDer( r-2 , c) + ISmoothed( r, c )- s*a*(alpha)*ISmoothed( r-1, c);
                   IcausalDer(r,c)=y;
                end
            end 

            %Anti Causal part
            IantiCausalDer= zeros(row , col);
           
            for c=1 : col
                for r=1 : row-2
                   y=2*a*IantiCausalDer(r+1, c) - a^2*IantiCausalDer(r +2 , c) + a*(alpha)*s*ISmoothed( r + 1, c);
                   IantiCausalDer(r , c)=y;
                end
            end
            
            yGradImage= IantiCausalDer + IcausalDer;
            
   figure, imshow(xGradImage , [])
   title('component of the gradient on the vertical direction')
   
   
%%  Write Canny edge detection function. Display the modulus and the phase of the results.

modulus= sqrt(yGradImage.^2 + xGradImage.^2);

   figure, imshow(modulus , [])
   title('modulus')
   
 phase = atan( yGradImage ./ xGradImage);
 figure, imshow(phase , [])
%  figure
%  plot(phase)
   title('phase')



