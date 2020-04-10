%%

s = load('mri');
mriVolume = squeeze(s.D); % removes singleton dimensions
sizeIn = size(mriVolume);
hFigOriginal = figure;
hAxOriginal = axes;
slice(double(mriVolume),sizeIn(2)/2,sizeIn(1)/2,sizeIn(3)/2); % Volumetric slice plot
grid on, shading interp, colormap gray

theta = pi/8;
t = [cos(theta),0,-sin(theta),0 % matrix must be 4 x 4 for affine3d to work
     0,1,0,0
     sin(theta),0,cos(theta),0
     0,0,0,1];
tform = affine3d(t) % 3D affine geometric transformation 

mriVolumeRotated = imwarp(mriVolume,tform); 

sizeOut = size(mriVolumeRotated);
hFigRotated = figure;
hAxRotated  = axes;
slice(double(mriVolumeRotated),sizeOut(2)/2,sizeOut(1)/2,sizeOut(3)/2)
grid on, shading interp, colormap gray

linkprop([hAxOriginal,hAxRotated],'View'); % maintain same value for corresponding properties
set(hAxRotated,'View',[-3.5 20.0])






















