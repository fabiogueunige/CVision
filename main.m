% img = imread("Mire\Mire1.pgm");
% figure, imshow(img);
P1mire = (loadPoints('Mire\Mire1.points')');
P2mire = (loadPoints('Mire\Mire2.points')');
%[Fmire] = EightPointsAlgorithm (P1mire,P2mire);
A = P1mire'.*P2mire;
[U,D,V] = svd(A)
f = V(:,end)
F = reshape(f',[3,3])