function [sp_img] = saltPepperDistribution (img)
%Function that create some salt and pepper noise in the image
    
    [rr,cc]=size(img);
    maxv=max(max(img));
    indices=full(sprand(rr,cc,0.2)); %0.2 is the noise density 
    
    mask1=indices>0 & indices<0.5;  
    mask2=indices>=0.5;%matlab masking technique
    
    sp_img = img.*(~mask1);
    sp_img = img.*(~mask2)+maxv*mask2;
    
end