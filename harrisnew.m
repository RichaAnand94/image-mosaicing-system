
%this functiom detects the corner of an image using Harris Corner Technique

function [x,y,v] = harrisnew(imrgb)
im = im2double(rgb2gray(imrgb));
imshow(im);
g1 = fspecial('gaussian', 9,1);  %  creates a two-dimensional gaussian filter with size 9 and standard deviation 1
figure();
imshow(g1);
g2 = fspecial('gaussian', 11,1.5); % creates a two-dimensional gaussian filter with size 11 and standard deviation 1.5
figure();
imshow(g2);
img1 = conv2(im,g1,'same');  % conv2 is used for blur the image. It  first convolves each column of A with the vector 'im' and then convolves each row of the result with the vector 'g1' with the same size of the image
figure, mesh(img1);

Ix = conv2(img1,[-1 0 1],'same');  % take x derivative of the image so that we can use this in the Harris detection method 
Iy = conv2(img1,[-1;0;1],'same');  % take y derivative of the image so that we can use this in the Harris detection method 

% Compute elements of the Harris matrix H 
Ix2 = conv2(Ix.*Ix,g2,'same'); %this computes the x derivative to put into Harris Detector method
Iy2 = conv2(Iy.*Iy,g2,'same'); %this computes the derivative to put into Harris Detector method
IxIy = conv2(Ix.*Iy,g2,'same');
R = (Ix2.*Iy2 - IxIy.*IxIy) ... % It computes the determinant of the matrix H  
    ./ (Ix2 + Iy2);       % It is the trace(H) which  is the sum of diagonal elements along with the epsilon
% this removes the corners close to image border
%R([1:15, end-16:end], :) = 0;
%R(:,[1:15,end-16:end]) = 0;

% this is used for not suppressing the image pixels where the intensity is
% high
nonmax = inline('max(x)'); % It constructs an inline function object 

% processes the image A by rearranging each m-by-n block of A into a column of a temporary matrix, 
% and then applying the function fun to this matrix. fun must be a function handle
Rmax = colfilt(R,[3 3],'sliding',nonmax);
imshow(Rmax); 
