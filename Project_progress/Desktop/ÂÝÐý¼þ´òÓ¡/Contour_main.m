clc,clear;
global ABS_TOL;
ABS_TOL = 0.001; % related to the threshold of contour simplification
global DEBUG;
DEBUG = 0;

Layer = 1;
Layers = {};
%%
[F,V] = stlread('Fine_model.stl');
fnum = size(F,1);
vout = V;
fv = (reshape(V', 9, []))';

%% get intersection lines
[segments]  = GetIntersectingLines( fnum,fv,50 );

%% Drawing contour
% figure
% for i = 1: size(segments)
%     plot(segments(i,[1 3]),segments(i,[2 4]));
%     hold on
% end

%% form and simplify contours
[Contours] = FormContours( segments );
[Contours] = SimplifyContours(Contours);
[Contours] = GradContours(Contours);        % the contour arranged from top point counterclockwise
contour_disp = Contours{1,1};
figure
plot(contour_disp(:,1), contour_disp(:,2), '*');
hold on
% [Layers] = LayerContour(Contours,Layer,Layers);
offset = 1;
num_offset = 2;
Offset_contour = Contour_offset(Contours, offset, num_offset);
contour_disp = [];
for i = 1:num_offset
    contour_disp = Offset_contour{i};
    plot(contour_disp(:,1), contour_disp(:,2), '-');
    hold on;
end
axis equal;