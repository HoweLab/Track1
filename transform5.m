function coords2D = transform5(coords3D)

% define constants that describe setup geometry 

% create an output matrix of the same size as the input
% first two rows are x and y
% the third row indicates whether the location should be visible
coords2D = zeros(size(coords3D));
% by default, make all points visible
coords2D(3,:) = 1;

% aspect ratio of the window (1080/1920)
aspectRatio = .56;
%aspectRatio = 1.8;

% viewing parameters
s = 1;
p = 1;

% perspective transformation
coords2D(1,:) = s*coords3D(1,:)./coords3D(2,:); % monitor x
coords2D(2,:) = s*coords3D(3,:)./coords3D(2,:); % monitor y

% check if point is visible, and if not, clip it
coords2D(3,:) = double(coords3D(2,:)>0);
signX = double(coords3D(1,:)>0) + -1*logical(double(coords3D(1,:))<=0);
coords2D(1,coords3D(2,:)<=0) = p*signX(coords3D(2,:)<=0)*aspectRatio; % at the edges (x edges are -aspectRatio & +aspectRatio)
signZ = double(coords3D(3,:)>0) + -1*logical(double(coords3D(3,:))<=0);
coords2D(2,coords3D(2,:)<=0) = p*signZ(coords3D(2,:)<=0); % at the edges (y edges are -1 and 1)
