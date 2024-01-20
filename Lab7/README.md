# CVision

## Lab 7 

This assignment aims to compare the use of Optical Flow estimation and Change Detection on different video sequences, that you can download from HERE. Please read carefully

The assignment includes the following tasks:

## Lucas-Kanade algorithm (see the corresponding hands-on activity). 

a function TwoFramesLK that given two frames (their filenames actually) and a size for the neighbourhood calls the function to estimate the optical flow and visualises the result (Figure 1: pair of images; Figure 2: corresponding optical flow estimation)
a function LucasKanade partially implemented, providing the core for the algorithm of estimation (a function to estimate the partial derivatives is also provided)
sequences of images (folder Data) providing different test-beds for the estimation, with variable complexity
What you are required to do:

* complete the implementation of the LucasKanade function, building the linear system Au=b and deriving the solution u (see the slides)
prepare a script that loads all the images in a certain sequence and calls the function TwoFramesLK on pairs of adjacent frames 
* test the implementation on the different sequences, playing with the size of the neighbourhood (Hints: start with the sphere sequence, synthetic and easier than the others)

## change detection algorithm

Implementation of the change detection algorithm using a Running Average approach to model the background. To this purpose fill in the code you find HERE
Preparation of a Matlab script called MotionAlgoComparison that, given a folder containing images of a video sequence, implements the following steps for each image:
Run the optical flow estimation and produce a map with the magnitude of the optical flow
Run the Running average and produce the binary map of the change detection. NOTE: 
Compare in a subplot the two results
What you need to submit:

The code of the hands-on about the optical flow
The code of the hands-on about change detection
The script MotionAlgoComparison
A short report where you summarize the main differences between the two approaches on the video sequences that have been provided

Submission ends in 7 january

## This project is organised in different branches. 

 - main: Where there are all the generic stuff
 - other branch relatives to the different laboratory_ 
 	- Lab_4
 	- Lab5
 	- Lab_5_Andrea 
 	- LAb_5_Fabio
 
 

