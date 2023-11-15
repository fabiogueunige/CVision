function [elapsedtime] = RectDetection (window,img,nomeImg, type)
%   	
    figure;
    subplot(2,2,1);
    createGraph(img,nomeImg,"Gray color ","");
    tic;
    %create a window for the filter
    Cross_img = normxcorr2(window, img);%Normalized 2-D cross-correlation
    
    [ypeak,xpeak] = find(Cross_img == max(Cross_img(:)));
    xpeak_off = xpeak - size(window,2);
    ypeak_off = ypeak - size(window,1);
    pos = [xpeak_off,ypeak_off,size(window,2),size(window,1)];
    elapsedtime = toc;

    % Images at the end to save only computational time
    subplot(2,2,3);
    createGraph(Cross_img," ","Cross Correlation "," ");
    subplot(2,2,4);
    createGraph(img," ","Window: ",type);
    rectangle('Position',pos, "EdgeColor",[1 0 0]);
    sgtitle("Image "+nomeImg+" ");
end