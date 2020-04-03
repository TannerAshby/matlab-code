%%

a = dicomread('IM-0001-0001.dcm');
b = dicomread('IM-0001-0002.dcm');
c = dicomread('IM-0001-0003.dcm');
d = dicomread('IM-0001-0004.dcm');

figure(1)
imagesc(a)
colormap gray
axis image

figure(2)
imagesc(b)
colormap gray
axis image

figure(3)
imagesc(c)
colormap gray
axis image

figure(4)
imagesc(d)
colormap gray
axis image




