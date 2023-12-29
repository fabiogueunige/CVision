addpath("Video\")
% ottengo percorso dove si trova il main


stringa1 = 'Video/sphere/sphere.';
stringa3 = '.ppm';

for k = 0:18
    string2 = num2str(k);
    stringtot = strcat(stringa1, string2, stringa3);
    string2_next = num2str((k + 1));
    stringtot2 = strcat(stringa1, string2_next, stringa3);
    [U,V] = TwoFramesLK(stringtot, stringtot2, 10);
    
    %title(['Frames: ' num2str(k) ' - ' num2str(k + 1)]);
end
