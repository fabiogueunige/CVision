addpath("Video\")
% ottengo percorso dove si trova il main
pmain= fileparts(which('main.m'));
pLucas = fullfile(pmain, 'LucasKanade\TwoFramesLK.m');
addpath(pLucas)
addpath("Detection\")

stringa1 = 'Video\sphere\sphere.';
stringa3 = '.ppm';
numero = 0; % Numero che si desidera convertire in stringa
for k = 0:18
    string2 = num2str(k);
    stringtot = strcat(stringa1, string2, stringa3);
    string2 = num2str((k + 1));
    stringtot2 = strcat(stringa1, string2, stringa3);
    TwoFramesLk(stringtot, stringtot2, 10);
end
