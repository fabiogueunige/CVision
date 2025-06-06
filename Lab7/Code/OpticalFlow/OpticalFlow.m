addpath ("..\Video\");
addpath("..\Video\statua\")
addpath("..\Video\videosurveillance\")
%% Sphere Video
stringa1 = 'sphere\sphere.';
stringa3 = '.ppm';
for k = 0:18
    string2 = num2str(k);
    stringtot = strcat(stringa1, string2, stringa3);
    string2_next = num2str((k + 1));
    stringtot2 = strcat(stringa1, string2_next, stringa3);
    [U,V] = TwoFramesLK(stringtot, stringtot2, 10);
    %disp(U);
    %disp(V);
    %pause(5);
    title(['Frames sphere: ' num2str(k) ' - ' num2str(k + 1)]);
end

%% VideoSurveillance (too many data so it is commented -> other videos ligther)
% stringa1 = 'frame0';
% stringa3 = '.jpg';
% for k = 250:319
%     string2 = num2str(k);
%     stringtot = strcat(stringa1, string2, stringa3);
%     string2_next = num2str((k + 1));
%     stringtot2 = strcat(stringa1, string2_next, stringa3);
%     [U,V] = TwoFramesLK(stringtot, stringtot2, 10);
%     title(['Frames surveillance: ' num2str(k) ' - ' num2str(k + 1)]);
% end

%% statua
stringa1 = 'statua.0';
stringa3 = '.ppm';
for k = 4 : 14
    string2 = num2str(k);
    if (k<9)
        stringtot = strcat(stringa1,num2str(0), string2, stringa3);
        string2_next = num2str((k + 1));
        stringtot2 = strcat(stringa1,num2str(0), string2_next, stringa3);
    elseif(k == 9)
        stringtot = strcat(stringa1,num2str(0), string2, stringa3);
        string2_next = num2str((k + 1));
        stringtot2 = strcat(stringa1, string2_next, stringa3);
    else
        stringtot = strcat(stringa1, string2, stringa3);
        string2_next = num2str((k + 1));
        stringtot2 = strcat(stringa1, string2_next, stringa3);
    end
    [U,V] = TwoFramesLK(stringtot, stringtot2, 10);
end
