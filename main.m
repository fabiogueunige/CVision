%% function main
% Variable declaration
imgi235 = imread("i235.png");
computationTime = zeros (3,6);
img = cell(1,6);
for ind = 1:6
    img{ind} = imread(strcat("ur_c_s_03a_01_L_03", num2str((ind+75)),".png"));
    img{ind} = colorToDouble(img{ind});
end

%% Red car Implementation
figure;
createGraph(img{1},"immagine1","Gray color ","");
%create a window for the filter
windowre = img{1}(359:430,688:770);
for ind = 1:6     
    RectDetection (windowre,img{ind},"image: "+ind,"");
end

%% Black car that is turning implementation
% windowb1 = smaller
windowb1 = img{1}(375:400,575:620); %facendo 400 la ultima prende il furgone
for ind = 1:6     
    computationTime(1,ind) = RectDetection (windowb1,img{ind},"image: "+ind," Smaller");
end

% windowb2 = normal
windowb2 = img{1}(375:410,570:615); %facendo 400 la ultima prende il furgone
for ind = 1:6     
    computationTime(2,ind) = RectDetection (windowb2,img{ind},"image: "+ind," Medium");
end

% windowb3 = bigger
windowb3 = img{1}(360:420,555:645);
for ind = 1:6     
    computationTime(3,ind) = RectDetection (windowb3,img{ind},"image: "+ind, " Bigger");
end

% Operation on Computation time
computationTime_sum = sum(computationTime'); % to see the total time for every one
computationTime_mean = mean(computationTime')

%% Harris corner detector

I = double(imread('i235.png'));
figure;
createGraph (I,"Original Image i235"," ", " ");

% Sobel derivatives
dx = [1 0 -1; 2 0 -2; 1 0 -1];
dy = [1 2 1; 0 0 0; -1 -2 -1];
Ix = conv2(I, dx, 'same');
Iy = conv2(I, dy, 'same');
% products of derivative each pixel
Ix2 = Ix .* Ix; 
Iy2 = Iy .* Iy;
Ixy = Ix .* Iy;

% sum of products of derivatives at each pixel
g = fspecial('gaussian', 9, 1.2);
Sx2 = conv2(Ix2, g, 'same');
Sy2 = conv2(Iy2, g, 'same');
Sxy = conv2(Ixy, g, 'same');
% Image partial derivatives and Gaussian filter
figure;

subplot(2, 3, 1);
createGraph (Ix,"Derivative on x"," ", " ");

subplot(2, 3, 3);
createGraph (Iy,"Derivative on y"," ", " ");

subplot(2, 3, 5);
createGraph (g,"Gaussian Filter image"," ", " ");
sgtitle("Derivatives of each pixel and gaussian filetr images")

% R_map computation
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
        % Define at each pixel x,y the matrix of derivatives
        M = [Sx2(ii, jj), Sxy(ii, jj); Sxy(ii, jj), Sy2(ii, jj)];
        % Compute the response of the detector at each pixel
        R = det(M) - k * (trace(M)^2); % from the formulas
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

%% Figure generator
% R map and detected corners overlapped on the image
figure;
subplot(2, 2, 1);
imagesc(R_map);
colormap jet;
title('R map');

subplot(2, 2, 2);
imagesc(I);
hold on;
[yc, xc] = find(corner_reg);
plot(xc, yc, 'r*');
hold off;
title('Detected Corners overlapped');

subplot(2, 2, 3);
imagesc(I);
hold on;
[y, x] = find(flat_reg);
plot(x, y, 'y*');
hold off;
title('Detected flat regions overlapped');

subplot(2, 2, 4);
imagesc(I);
hold on;
[y, x] = find(edge_reg);
plot(x, y, 'g*');
hold off;
title('Detected edge regions overlapped');
sgtitle('Show detected object on Image');

% corner regions with threshold printing
figure('WindowState', 'fullscreen');
subplot (1,2,1);
createGraph(corner_reg .* I,'Corner regions gray'," "," ");

subplot(1,2,2);
createGraph(I,"Detected Corners"," "," ");
hold on;
plot(xc, yc, 'r*', 'MarkerSize', 3);
hold off;
sgtitle("Full screen to show better the corner detection on imgi235 (esc to close)")

%% Centroid corner
figure;
% corner centroids using regionprops
prop = regionprops(corner_reg > 0, "Centroid");
centroids = cat(1, prop.Centroid);
% centroids on command Window
createGraph(I,"Centroid of Corner Regions"," "," ");
hold on;

plot(centroids(:,1), centroids(:,2), 'r*');
hold off;