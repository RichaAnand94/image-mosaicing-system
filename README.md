# image-mosaicing-system
PROJECT Name: Image Mosaicing System

Supervisor Name: Dr. Rajiv Kumar

Group Number : 26

Groupmate Name: 
Priyanshi Singh url: https://github.com/priyanshi82/Image-mosaicing-system1.git

Rakhi Singh url : https://github.com/rakhi21/Image-Mosaicing-system.git

Details:

Image mosaicing system  enables to combine together many small images into a one large image. A mosaiced image is the composition of sequence of images , it can be obtained by finding out the coordinate relationship between the overlapping images. This coordinate relationship is between the pixels of one image and in another image which creates a mosaiced image. This relationship must be develop carefully to match the pixels between two images. This is done with the help of homography estimation. 

This project includes three main procedures :

.>Image Acquisition

.>Image Registration

.>Image Blending

Image Acquisition:

The first stage of Image Mosaicing system is the image acquisition stage. The image which is taken from  digital camera is used for mosaicing the image .

Image Registration:

The process of transforming the different sets of data into one coordinate system. This includes two main process: feature detection and feature mapping.

Image Blending:

It is a technique which modifies the image gray levels in the vicinity of a boundary to obtain a smooth transition between images.It is done to minimize the visibility of seams between images.

Using these we create a mosaiced image, which is a overlapping of two or more images of same scene.

In the first module after acquiring the image we detect the corner features of images. for this each group member has used a different detection techniques which are FAST feature detection, minimum eigen value and Harris corner detection and compared them to find the best technique on the basis of their performance.  I have worked  on harris corner detection. 

In the second module of the project we had match the detected features using RANSAC algorithm. In this algorithm I had worked on getdescriptor which is used to get the matching points of two overlapping images.

