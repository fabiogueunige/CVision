function matches = findMatchesMat(img1, img2)
    % Estrarre i punti chiave e i descrittori dalle due immagini
    points1 = detectSURFFeatures(img1);
    [f1, d1] = extractFeatures(img1, points1);

    points2 = detectSURFFeatures(img2);
    [f2, d2] = extractFeatures(img2, points2);

    % Trovare corrispondenze tra i descrittori delle due immagini
    indexPairs = matchFeatures(f1, f2);

    % Ottieni i punti chiave corrispondenti
    matchedPoints1 = d1(indexPairs(:, 1),:);
    matchedPoints2 = d2(indexPairs(:, 2),:);

    % Crea una struttura contenente i match trovati
    matches = struct('matchedPoints1', matchedPoints1.Location, 'matchedPoints2', matchedPoints2.Location);


    figure;
    imshowpair(img1, img2, 'montage');
    title('Match tra immagini');
    hold on;
    
    % Disegna le linee che collegano i punti chiave corrispondenti
    plot(matches.matchedPoints1(:, 1), matches.matchedPoints1(:, 2), 'go'); % Punti chiave immagine 1
    plot(matches.matchedPoints2(:, 1) + size(img1, 2), matches.matchedPoints2(:, 2), 'go'); % Punti chiave immagine 2
    
    % Disegna le linee che collegano i punti chiave corrispondenti
    for i = 1:size(matches.matchedPoints1, 1)
        line([matches.matchedPoints1(i, 1), matches.matchedPoints2(i, 1) + size(img1, 2)], ...
             [matches.matchedPoints1(i, 2), matches.matchedPoints2(i, 2)], 'Color', 'y');
    end
    
    hold off;
end