clc;
clear;
filename = 'dirll.stl';
[F,V,N] = stlread(filename);
fnum = size(F, 1);
fv = (reshape(V', 3, []))';

%% calculate the unbuildable surface and its plane projection
% unbuild_plane:  the n*2 matrix of the projection of the unbuildable facets
unbulid_plane = Unbuild_plane(fnum, V, N);

%% find the minimum and maximum contour of the Unbuil_plane
contours = Extract_envelope(unbulid_plane);