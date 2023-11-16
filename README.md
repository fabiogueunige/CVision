# Laboratory 6

## Goal

The goal of the lab is to implement the 8-point algorithm, to estimate the fundamental matrix F.

Please, read carefully the text below before starting and download the material from HERE.

### Part 1
Implement the following functions/scripts:

1.   8-point algorithm function (version 1) --  A Matlab function function [F] = EightPointsAlgorithm(P1, P2) implementing the following steps:

 Write down the matrix A (see the slides...)
Compute the SVD decomposition of A 
[U, D, V]=svd(A);
and select as solution f the last column of V.
Reshape the column vector f so to obtain a matrix F (see function reshape)
Force the rank of F to be 2:
Use again the SVD to decompose the matrix 
[U, D, V] = svd(F)
Set D(3,3)=0
Recompute the final F: F=U*D*VT.
2. 8-point algorithm function (version2) -- A Matlab function function [F] = EightPointsAlgorithmN(P1, P2) implementing the following steps:

Normalize the points using the function normalise2dpts already provided.
[nP1, T1] = normalise2dpts(P1)

[nP2, T2]=normalise2dpts(P2)
Call the function EightPointsAlgorithm on the normalized points
De-normalize the resulting F as T2T*F*T1. This is your final F
3. A script file to check the correctness of the implementation, and evaluate the results -- It should include the following functionalities:

Load the two sets of corresponding points already provided and arrange them in two matrices P1 and P2 of size 3xN (or Nx3), where N is the number of corresponding points. NOTE: the size 3 is because you need to add a final 1 to the 2D image coordinates as you will work in homogeneous coordinates 
Call the function  for estimating the fundamental matrix F from P1 and P2
Visualize the results and evaluate your estimated F (see Evaluation of the results below)


### Part 2
Prepare a script file including the following steps:

Load a pair of stereo images
Run the image matching algorithm between the two images, obtaining a set of M correspondences (presumably, some of them will be wrong/noisy)
Call the RANSAC function to estimate the optimal F matrix from the correspondences (using the version 2 of the function)
Visualize the results and evaluate your estimated F (see Evaluation of the results below)

### Evaluation of the results
To verify your implementation consider the following tests:

Check the epipolar constraint (x'TFx=0) holds for all points with the estimated F (both with and without normalization)
Visualize the stereo pairs with epipolar lines of the corresponding points (use the function visualizeEpipolarLines provided with the Lab material) Type help visualizeEpipolarLines from the Matlab shell before using it (NOTE: it requires the points to be arranged in Nx2 matrices). 
Have a look at the epipoles. To compute left and right epipoles, recall that they are respectively, the right and left null space of F, thus you can simply perform the SVD decomposition of F, F=UWVT,  and then select the last columns of U and V.


 Assignment
--- 
You are requested to deliver

A zip file including your code, which should contain information about its use if needed
A report in which you discuss your results (including pictures with the epipolar lines, epipoles, ...).
