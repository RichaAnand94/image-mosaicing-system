function descriptors = GetDescriptors(pic, points) 
 
% It returns extracted feature vectors which is also known as descriptors and their corresponding locations
% This function derives the descriptors from 'pic' surrounding the 'point'. 
% And these points are going to be our interest points depending on which
% we match the pixels of the image.
%
% Input 
%    pic :    picture to get descriptors from 
%    points : points to compute descriptors 
%  
% Output 
%    descriptors, each 2D slice / 3rd coord is a 9*9 descriptors, centered 
%    on a (x,y) point. Each coefficient of this descriptor is the mean of a 
%    5*5 submatrix. (Therefore a descriptor is based on a 45*45 window centered 
%    on the (x,y) point.) 
 
 
    descriptors = zeros(9,9,size(points,1)); %create a Zeros matrix of size 9*9*size of points vector
    descriptor = zeros(9,9); %create a zeros matrix of size 9*9
    pic_padded = padarray(pic,[22,22]); %it pads pic' pixel with zeros. [22,22], this amount is padded.
    for i=1:size(points,1) % a for loop starts from 1 to size of the vector
        window = pic_padded(points(i,1):points(i,1)+44,points(i,2):points(i,2)+44); %create a 45*45 matrix window which is a descriptor centered on [22,22].
        for j=1:9 
            for k=1:9 
                descriptor(j,k) = mean(mean(window(5*j-4:5*j,5*k-4:5*k)));% create a descriptor 
            end 
        end 
       
        descriptor = (descriptor - mean(mean(descriptor)))/std(std(descriptor)); %this step is done to get more accurate descriptor
        descriptors(:,:,i) = descriptor; %returns a 2D descriptor for all i vectors.
         
    end 