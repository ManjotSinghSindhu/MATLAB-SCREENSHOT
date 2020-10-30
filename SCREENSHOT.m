clc
clear
close all

import java.awt.Robot;
vks = Robot; %Creating a Robot object

import java.awt.Rectangle;
rect = Rectangle; %Creating a Rectangle object 

import java.awt.Toolkit.getDefaultToolkit;
tool = getDefaultToolkit; %Creating a Toolkit object

screenDim = tool.getScreenSize; %Getting the screen size

width = screenDim.width; %Width of screen
height = screenDim.height; %Height of screen

rect.setRect(0, 0, width, height); %Setting the size of screen capture

screen = vks.createScreenCapture(rect); %capturing the screen

pixelsData = reshape(typecast(screen.getData.getDataStorage, 'uint8'), 4, width, height);
%Converting to 8 Bit data

imgData = zeros([height,width,3],'uint8'); %Create the image variable
imgData(:,:,1) = transpose(reshape(pixelsData(3, :, :), width, height));
imgData(:,:,2) = transpose(reshape(pixelsData(2, :, :), width, height));
imgData(:,:,3) = transpose(reshape(pixelsData(1, :, :), width, height));
%Save image data B-G-R Plane wise

imshow(imgData) %Show the captured screenshot
imwrite(imgData, 'ScreenCaptureMatlab.jpg'); %Save the captured screenshot
%End of code
