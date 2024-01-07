%% General topic

addpath ("Video\")

N = 5;
%% Surveillance Video

FIRST_IDX = 250; %index of first image
LAST_IDX = 320; % index of last image
filename = sprintf('Video/videosurveillance/frame%4.4d.jpg', FIRST_IDX);
B = double(rgb2gray(imread(filename)));
% Generating the background for the change Detection algorithm
for t = FIRST_IDX+1 : FIRST_IDX + N-1
    filename = sprintf('Video/videosurveillance/frame%4.4d.jpg', t);
    B = B + double(rgb2gray(imread(filename)));  
end

B = B / N; % Average through the first 5 frames
Bprev = B;
figure;
for t = FIRST_IDX+N : LAST_IDX
    filename = sprintf('Video/videosurveillance/frame%4.4d.jpg', t);
    
    imc = num2str(t);
    filename2 = strcat("Image ",imc," Optical Flow vs Change Detection");
    sgtitle(filename2)
    % Lucas Kanade implementation    
    filename2 = sprintf('Video/videosurveillance/frame%4.4d.jpg', (t-1));
    [U,V, At, At1] = TwoFramesLK(filename2,filename,15);
    subplot(2,3,1)
    imshow(At)
    title("Previouse")
    subplot(2,3,2)
    imshow(At1)
    title("Actual")
    subplot(2,3,3)
    quiver(U(1:10:size(U,1), 1:10:size(U,2)), V(1:10:size(V,1), 1:10:size(V,2)))
    quiver(Reduce((Reduce(medfilt2(flipud(U),[5 5])))), -Reduce((Reduce(medfilt2(flipud(V),[5 5])))), 0), axis equal
    title("LK magnitude")
    % Change Detection Implementation
    TAU = 25; 
    TAU_PRIMO = 20;
    ALPHA = 0.7;
    [It,Bt,Mt] = change_detection(Bprev, filename, TAU,TAU_PRIMO, ALPHA);
    
    % keyboard
    subplot(2,3,4), imshow(It);
    title("Actual");
    subplot(2,3,5), imshow(uint8(Bt));
    title("Background");
    subplot(2,3,6), imshow(uint8(Mt*255));
    title("binary map");
    pause(0.1);
    Bprev = Bt;     
end

%% Video sflowg (not the right sequence for the algorithm becouse the camea moves and not the background)
FIRST_IDX = 0; %index of first image
LAST_IDX = 60; % index of last image
filename = sprintf('Video/sflowg/sflowg_%3.3d.ppm', FIRST_IDX);
B = double(rgb2gray(imread(filename)));
% Generating the background for the change Detection algorithm
for t = FIRST_IDX+1 : FIRST_IDX + N-1
    filename = sprintf('Video/sflowg/sflowg_%3.3d.ppm', t);
    B = B + double(rgb2gray(imread(filename)));  
end

B = B / N; % Average through the first 5 frames
Bprev = B;
figure;
for t = FIRST_IDX+N : LAST_IDX
    
    imc = num2str(t);
    filename2 = strcat("Image ",imc," Optical Flow vs Change Detection");
    sgtitle(filename2)
    filename = sprintf('Video/sflowg/sflowg_%3.3d.ppm', t);
    % Lucas Kanade implementation    
    filename2 = sprintf('Video/sflowg/sflowg_%3.3d.ppm', (t-1));
    [U,V, At, At1] = TwoFramesLK(filename2,filename,15);
    subplot(2,3,1)
    imshow(At)
    title("Previouse")
    subplot(2,3,2)
    imshow(At1)
    title("Actual")
    subplot(2,3,3)
    quiver(U(1:10:size(U,1), 1:10:size(U,2)), V(1:10:size(V,1), 1:10:size(V,2)))
    quiver(Reduce((Reduce(medfilt2(flipud(U),[5 5])))), -Reduce((Reduce(medfilt2(flipud(V),[5 5])))), 0), axis equal
    title("LK magnitude")
    
    % Change Detection Implementation
    TAU = 25; 
    TAU_PRIMO = 20;
    ALPHA = 0.7;
    [It,Bt,Mt] = change_detection(Bprev, filename,TAU,TAU_PRIMO, ALPHA);
    
    % keyboard
    subplot(2,3,4), imshow(It);
    title("Actual");
    subplot(2,3,5), imshow(uint8(Bt));
    title("Background");
    subplot(2,3,6), imshow(uint8(Mt*255));
    title("binary map");
    pause(0.1);
    Bprev = Bt;     
end

%% Video Sphere
stringa1 = 'Video/sphere/sphere.';
stringa3 = '.ppm';
FIRST_IDX = 0; %index of first image
LAST_IDX = 19; % index of last image
B = double(rgb2gray(imread('Video/sphere/sphere.0.ppm')));
% Generating the background for the change Detection algorithm
for k = FIRST_IDX+1 : FIRST_IDX + N-1
    string2 = num2str(k);
    stringtot = strcat(stringa1, string2, stringa3);
    B = B + double(rgb2gray(imread(stringtot)));  
end

B = B / N; % Average through the first 5 frames
Bprev = B;
figure;
for k = FIRST_IDX+N : LAST_IDX
    
    imc = num2str(k);
    filename2 = strcat("Image ",imc," Optical Flow vs Change Detection");
    sgtitle(filename2)
    string2 = num2str(k);
    stringtot = strcat(stringa1, string2, stringa3);
    string2_next = num2str((k - 1));
    stringtot2 = strcat(stringa1, string2_next, stringa3);
    [U,V, At, At1] = TwoFramesLK(stringtot2,stringtot, 10);
    subplot(2,3,1)
    imshow(At)
    title("Previouse")
    subplot(2,3,2)
    imshow(At1)
    title("Actual")
    subplot(2,3,3)
    quiver(U(1:10:size(U,1), 1:10:size(U,2)), V(1:10:size(V,1), 1:10:size(V,2)))
    quiver(Reduce((Reduce(medfilt2(flipud(U),[5 5])))), -Reduce((Reduce(medfilt2(flipud(V),[5 5])))), 0), axis equal
    title("LK magnitude")
    
    % Change Detection Implementation
    TAU = 10; 
    TAU_PRIMO = 5;
    ALPHA = 0.3;
    [It,Bt,Mt] = change_detection(Bprev, stringtot,TAU,TAU_PRIMO, ALPHA);
    
    % keyboard
    subplot(2,3,4), imshow(It);
    title("Actual");
    subplot(2,3,5), imshow(uint8(Bt));
    title("Background");
    subplot(2,3,6), imshow(uint8(Mt*255));
    title("binary map");
    pause(0.1);
    Bprev = Bt;
end
%% Functions

function result = Reduce(matrix)
    result = matrix(1:2:end, 1:2:end);
end