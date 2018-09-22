clc;
clear;
%%
%使用理论值
filename = 'D:\matlab_work\AM_work\2D_Slicing\spring_fine.stl';
[F,V,N] = stlread(filename);

LayerThickness = 2;
fnum = size(F,1);
fv = (reshape(V', 9,[]))';
Layers = {};
bottom = min(V(:,3));
top = max(V(:,3));
global REL_TOL;
global ABS_TOL;
global DEBUG;
DEBUG=false;
REL_TOL=1e-5;
ABS_TOL=REL_TOL*(top-bottom);
numberLayers=ceil((top-bottom)/LayerThickness);
SliceHeight=zeros;
scale=2;
% plot one contours
[segments]=GetIntersectingLines(fnum,fv,50);
polt_height=repmat(50,length(segments),1);
% for j=1:size(segments,1)
%     hold on
%     plot([segments(j,1) segments(j,3)],[segments(j,2) segments(j,4)],'r');
%     axis equal
%     %plot3(segments(:,1),segments(:,3),polt_height(:,1),'r');
%  end

% tic;
% for Layer=2:numberLayers
%     SliceHeight(Layer)=bottom+(Layer-1)*LayerThickness;
%     [segments]=GetIntersectingLines(fnum,fv,SliceHeight(Layer));% get the intersecting line segments with the slicing plane
%     %disp(['Layer','=',num2str(Layer),' ','GetIntersectingLines']);
%     %segments=segments*scale;
%     [Contours] = FormContours( segments );% generate Contours from the interseting line segments
%     %disp(['Layer','=',num2str(Layer),' ','FormContours']);
% %     [Contours]=SimplifyContours(Contours);% simplification: if connected lines have the same direction, emerge
%     %polt_height=repmat(SliceHeight(Layer),length(Contours{1,1}),1);
%     %plot3(Contours{1,1}(:,1),Contours{1,1}(:,2),polt_height(:,1),'r');
%     [Contours]=GradContours(Contours);% left domin rule
% %     plot(Contours{1,1}(:,1),Contours{1,1}(:,2),'-');
% %     axis equal
%     %disp(['Layer','=',num2str(Layer),' ','GradContours']);
%     [Layers]=LayerContour(Contours,Layer,Layers);
%     %disp(['Layer','=',num2str(Layer),' ','Finished!']);
%     Layers{Layer,1} = Layers{Layer,1}(:,1:2);
%     Layers{Layer,1}(:,3) = SliceHeight(Layer);
%     Centroid(Layer,:) = Calculate_centroid(Layers{Layer,1});
% end
% Centroid = Centroid(3:length(Centroid)-2, :);
% toc;

% % plot layers
% figure
% for j = 2:size(Layers, 1)
%     x = Layers{j,1}(:,1);
%     y = Layers{j,1}(:,2);
%     z = Layers{j,1}(:,3);
%     plot3(x, y, z, '-','LineWidth',0.01);
%     hold on
% end
% plot3(Centroid(:,1),Centroid(:,2),Centroid(:,3),'-','LineWidth',1);
% axis equal

% theoretical centroid axis
t = linspace(0, 2, 150);
x_theory = 70 + 50 * cos(-2 * pi * t + pi);
y_theory = 70 + 50 * sin(-2 * pi * t + pi);
z_theory = 100 * t + 10;
Centroid = [x_theory',y_theory',z_theory'];
% % figure
% plot3(x_theory, y_theory, z_theory, '-','LineWidth',2);
% axis equal;

TCP = [0; 0; 0];
tic
[contour_transform, TCP_traj, TCP_ornt] = Coordinate_transform_new(Centroid, V, TCP);
toc
save('TCP_traj.mat', 'TCP_traj');
save ('TCP_ornt.mat','TCP_ornt');
% figure
% draw_data = [];
% for i = 1:size(contour_transform, 1)
%     x = contour_transform{i,1}(:,1);
%     y = contour_transform{i,1}(:,2);
%     z = contour_transform{i,1}(:,3);
%     temp = [x, y, z];
%     draw_data = [draw_data; temp];
% end
% plot3(draw_data(:,1), draw_data(:,2), draw_data(:,3), '-');
% axis equal;


figure
for i = 1:size(contour_transform, 1)
    x = contour_transform{i,1}(:,1);
    y = contour_transform{i,1}(:,2);
    z = contour_transform{i,1}(:,3);
    plot3(x, y, z, '-');
    hold on
end
axis equal;


% draw the whole circle
% for i = 1:size(contour_transform, 1)
%     x = [contour_transform{i,1}(:,1); contour_transform{i,1}(1,1)];
%     y = [contour_transform{i,1}(:,2); contour_transform{i,1}(1,2)];
%     z = [contour_transform{i,1}(:,3); contour_transform{i,1}(1,3)];
%     plot3(x, y, z, '-');
%     hold on
% end

% plot3(Centroid(:,1),Centroid(:,2),Centroid(:,3),'-b','LineWidth',1);
axis equal
% view(90,90);

figure
for i = 1:size(TCP_traj, 1)
    x = TCP_traj{i,1}(:,1);
    y = TCP_traj{i,1}(:,2);
    z = TCP_traj{i,1}(:,3);
    plot3(x, y, z, '-');
    hold on
end
axis equal