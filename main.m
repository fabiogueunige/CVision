%funzione main
imgi235 = imread("i235.png");
computationTime = zeros (3,6);
img = cell(1,6);
for ind = 1:6
    img{ind} = imread(strcat("ur_c_s_03a_01_L_03", num2str((ind+75)),".png"));
    img{ind} = colorToDouble(img{ind});
end
createGraph(img{1},"","","");
%
%% For now we focus on img {1} for the red car
createGraph(img{1},"immagine1","Gray color ","");

%create a window for the filter
windowre = img{1}(359:430,688:770);
for ind = 1:6     
    RectDetection (windowre,img{ind},"immagine: "+ind,"")
end

%% Focus on black car that is turning
% windowb1 = smaller
% windowb2 = normal
% windowb3 = bigger
windowb1 = img{1}(375:400,575:620); %facendo 400 la ultima prende il furgone
for ind = 1:6     
    computationTime(1,ind) = RectDetection (windowb1,img{ind},"immagine: "+ind," Smaller");
end

windowb2 = img{1}(375:410,570:615); %facendo 400 la ultima prende il furgone
for ind = 1:6     
    computationTime(2,ind) = RectDetection (windowb2,img{ind},"immagine: "+ind," Medium");
end

windowb3 = img{1}(360:420,555:645);
for ind = 1:6     
    computationTime(3,ind) = RectDetection (windowb3,img{ind},"immagine: "+ind, " Bigger");
end

computationTime_sum = sum(computationTime');
computationTime_mean = mean(computationTime');


%% Blob detection
%Harris corner detector

% Load the image
I = double(imread('i235.png'));
figure;
imagesc(I);
colormap gray;
title('Original Image');

% Compute x e y derivative using Sobel
dx = [1 0 -1; 2 0 -2; 1 0 -1];
dy = [1 2 1; 0 0 0; -1 -2 -1];
Ix = conv2(I, dx, 'same');
Iy = conv2(I, dy, 'same');

% Compute products of derivatives at every pixel
Ix2 = Ix .* Ix;
Iy2 = Iy .* Iy;
Ixy = Ix .* Iy;

% Compute the sum of products of derivatives at each pixel
g = fspecial('gaussian', 9, 1.2);
Sx2 = conv2(Ix2, g, 'same');
Sy2 = conv2(Iy2, g, 'same');
Sxy = conv2(Ixy, g, 'same');

% Features detection
[rr, cc] = size(Sx2);
edge_reg = zeros(rr, cc);
corner_reg = zeros(rr, cc);
flat_reg = zeros(rr, cc);
R_map = zeros(rr, cc);
k = 0.05;

max_R = max(R_map(:));
threshold = 0.3 * max_R;

for ii = 1:rr
    for jj = 1:cc
        % Define at each pixel x,y the matrix
        M = [Sx2(ii, jj), Sxy(ii, jj); Sxy(ii, jj), Sy2(ii, jj)];
        % Compute the response of the detector at each pixel
        R = det(M) - k * (trace(M)^2);
        R_map(ii, jj) = R;
        % Threshold on value of R
        if R < -threshold
            edge_reg(ii, jj) = 1;
        elseif R > threshold
            corner_reg(ii, jj) = 1;
        else
            flat_reg(ii, jj) = 1;
        end
    end
end

% Show partial derivatives and Gaussian filter
figure;
subplot(2, 3, 1);
imagesc(Ix);
colormap gray;
title('Ix');

subplot(2, 3, 2);
imagesc(Iy);
colormap gray;
title('Iy');

subplot(2, 3, 3);
imagesc(g);
colormap gray;
title('Gaussian Filter');

% Show R map and detected corners overlapped on the image
figure;
subplot(1, 2, 1);
imagesc(R_map);
colormap jet;
title('R map');

subplot(1, 2, 2);
imagesc(I);
hold on;
[y, x] = find(corner_reg);
plot(x, y, 'r*');
hold off;
title('Detected Corners overlapped on Image');



% Show corner regions with threshold
figure;
imagesc(corner_reg .* I);
colormap gray;
title('Corner regions with threshold');

% Get corner centroids using regionprops
stats = regionprops(corner_reg, 'Centroid');

% Display centroids
disp('Detected Corner Centroids:');
disp(cat(1, stats.Centroid));

figure;
imshow(I, 'InitialMagnification', 'fit');
hold on;

% Trova le coordinate dei corner
[y, x] = find(corner_reg_thresholded);

% Disegna i corner sull'immagine
plot(x, y, 'r*', 'MarkerSize', 5);

hold off;
title('Detected Corners overlapped on Original Image');
% figure, imagesc(I), colormap gray, title('Original Image and corners');
% 
% figure, imagesc(I), colormap gray, title('Original Image and corners');
% hold on 
% imagesc(stats.Centroid), "r*";
% hold off