%funzione main
imgi235 = imread("i235.png");

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
    RectDetection (windowb1,img{ind},"immagine: "+ind," Smaller")
end

windowb2 = img{1}(375:410,570:615); %facendo 400 la ultima prende il furgone
for ind = 1:6     
    RectDetection (windowb2,img{ind},"immagine: "+ind," Medium")
end

windowb3 = img{1}(360:420,555:645);
for ind = 1:6     
    RectDetection (windowb3,img{ind},"immagine: "+ind, " Bigger")
end


%% Blob detection
%Harris corner detector


I=double(imgi235);
figure,imagesc(I),colormap gray

%compute x and y derivative of the image using Sobel
dx=[1 0 -1; 2 0 -2; 1 0 -1];
dy=[1 2 1; 0  0  0; -1 -2 -1];
Ix=conv2(I,dx,'same');
Iy=conv2(I,dy,'same');
figure,imagesc(Ix),colormap gray,title('Ix')
figure,imagesc(Iy),colormap gray,title('Iy')

%compute products of derivatives at every pixel
Ix2=Ix.*Ix; Iy2=Iy.*Iy; Ixy=Ix.*Iy;

%compute the sum of products of  derivatives at each pixel
g = fspecial('gaussian', 9, 1.2);
figure,imagesc(g),colormap gray,title('Gaussian')
Sx2=conv2(Ix2,g,'same'); Sy2=conv2(Iy2,g,'same'); Sxy=conv2(Ixy,g,'same');

%features detection
[rr,cc]=size(Sx2);
edge_reg=zeros(rr,cc); corner_reg=zeros(rr,cc); flat_reg=zeros(rr,cc);
R_map=zeros(rr,cc);
k=0.05;

for ii=1:rr
    for jj=1:cc
        %define at each pixel x,y the matrix
        M=[Sx2(ii,jj),Sxy(ii,jj);Sxy(ii,jj),Sy2(ii,jj)];
        %compute the response of the detector at each pixel
        R=det(M) - k*(trace(M).^2);
        R_map(ii,jj)=R;
        %threshod on value of R
        if R<-300000
            edge_reg(ii,jj)=1;
        elseif R>3000000
            corner_reg(ii,jj)=1;
        else
            flat_reg(ii,jj)=1;
        end
    end
end

figure,imagesc(edge_reg.*I),colormap gray,title('edge regions')
figure,imagesc(corner_reg.*I),colormap gray,title('corner regions')
figure,imagesc(flat_reg.*I),colormap gray,title('flat regions')
figure,imagesc(R_map),colormap jet,title('R map')




