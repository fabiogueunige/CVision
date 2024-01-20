%% Main
treeimg = imread ("tree.png");
imgi235 = imread ("i235.png");
treeimg =  double(treeimg);
imgi235 = double(imgi235);

%% Question 1
%Gaussian Images density 20
[gaussian_tree] = gaussianNoise(treeimg,20);
[gaussian_i235] = gaussianNoise(imgi235,20);

%Salt & Pepper distribution density 20
[sp_tree] = saltPepperDistribution(treeimg);
[sp_i235] = saltPepperDistribution(imgi235);

%Generating graphs
ImageCreation(treeimg,gaussian_tree,sp_tree,"tree");
ImageCreation(imgi235,gaussian_i235,sp_i235,"i2235");


%% Question 2 
%Remove noise from immage using a moving average (3x3)
%3x3
movingAvarage(gaussian_tree,sp_tree,3,"tree","3x3"); 
movingAvarage(gaussian_i235,sp_i235,3,"i235","3x3");
%7x7
movingAvarage(gaussian_tree,sp_tree,7,"tree","7x7");
movingAvarage(gaussian_i235,sp_i235,7,"i235","7x7");

%Filtering with low pass gaussian filter
%dim 3x3


lpGaussianFilter (gaussian_tree,sp_tree,3,"tree");
lpGaussianFilter (gaussian_i235,sp_i235,3,"i235");

%dim 7x7
lpGaussianFilter (gaussian_tree,sp_tree,7,"tree");
lpGaussianFilter (gaussian_i235,sp_i235,7,"i235");


%% Question 3
%primo filtro slides 41
imgConvKernel(gaussian_tree,7,"tree");

%sharpening filter, slides 44
[sharpening_filter] = sharperedImg(7, treeimg, imgi235);

%slides 44, find only detail image1
[detailTree] = smoothedImage (7,treeimg,"tree");

%slides 44, find only detail image2
[detail235] = smoothedImage (7,imgi235,"img i235");

%slide 44, plot sharpened img1 
sharpenedImg (treeimg,detailTree,"tree");
%sharpened image 2
sharpenedImg (imgi235,detail235, "imgi235");

%% Question 4

transforedMagnitude(treeimg,"tree");
transforedMagnitude(imgi235,"i235");

%Displey the magnitude of the fft of the gaussian LPF 
LP2 = fspecial('gaussian',101,5);
transforedMagnitude (LP2, "Gaussian LPfilter");
%%%figure,imagesc(log(fftshift(LP2_module))), colormap gray,xlabel('wx'),ylabel('wy'),axis square, title("fftshift(MOD) gaussian filter")


%display a sharpering_filter inside a 101x101 zeros matrix

% paste the sharpering filter matrix inside the big matrix
[zero_matrix] = magnitudeTranSharpening(101,sharpening_filter);
transforedMagnitude (zero_matrix," Sharpening filter ");




