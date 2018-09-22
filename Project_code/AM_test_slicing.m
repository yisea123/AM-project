clc;
clear;
filename = 'spring.stl';
[F,V,N] = stlread(filename);

tic;
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

for Layer=2:numberLayers
    SliceHeight(Layer)=bottom+(Layer-1)*LayerThickness;
    [segments]=GetIntersectingLines(fnum,fv,SliceHeight(Layer));% get the intersecting line segments with the slicing plane
    %disp(['Layer','=',num2str(Layer),' ','GetIntersectingLines']);
    %segments=segments*scale;
    [Contours] = FormContours( segments );% generate Contours from the interseting line segments
    %disp(['Layer','=',num2str(Layer),' ','FormContours']);
%     [Contours]=SimplifyContours(Contours);% simplification: if connected lines have the same direction, emerge
    %polt_height=repmat(SliceHeight(Layer),length(Contours{1,1}),1);
    %plot3(Contours{1,1}(:,1),Contours{1,1}(:,2),polt_height(:,1),'r');
    [Contours]=GradContours(Contours);% left domin rule
    %disp(['Layer','=',num2str(Layer),' ','GradContours']);
    [Layers]=LayerContour(Contours,Layer,Layers);
    %disp(['Layer','=',num2str(Layer),' ','Finished!']);
    Layers{Layer,1} = Layers{Layer,1}(:,1:2);
    Layers{Layer,1}(:,3) = SliceHeight(Layer);
    Centroid(Layer,:) = Calculate_centroid(Layers{Layer,1});
end
Centroid = Centroid(3:length(Centroid)-2, :);
toc;

TCP = [0; 0; 0];
tic
[contour_transform, TCP_traj, TCP_ornt] = coordinate_transform(Centroid, V, TCP);
toc

figure
for i = 1:size(contour_transform, 1)
    x = contour_transform{i,1}(:,1);
    y = contour_transform{i,1}(:,2);
    z = contour_transform{i,1}(:,3);
    plot3(x, y, z, '-');
    hold on
end
plot3(Centroid(:,1),Centroid(:,2),Centroid(:,3),'-');
axis equal

figure
for i = 1:size(TCP_traj, 1)
    x = TCP_traj{i,1}(:,1);
    y = TCP_traj{i,1}(:,2);
    z = TCP_traj{i,1}(:,3);
    plot3(x, y, z, '-');
    hold on
end
axis equal