clc;
clear;
%%
filename = 'D:\matlab_work\AM_work\2D_Slicing\spring_fine.stl';
[F,V,N] = stlread(filename);
load Centroid.mat Centroid;
contour_transform = coordinate_transform(Centroid, V);




%%
%[Layers] = ContourPath(Layers,SliceHeight,Layerthickness);
filename = 'D:\matlab_work\AM_work\2D_Slicing\spring_fine.stl';  % Example file.
[F,V,N] = stlread(filename);

tic;
LayerThickness=2;
%LayerThickness=str2num(get(handles.Layerthickness,'string'));
fnum=size(F,1);
% vout=V;
fv=(reshape(V', 9,[]))';
Layers={};
% compute the bottom and top of the model (vout)
bottom=min(V(:,3));
top=max(V(:,3));
global REL_TOL;
global ABS_TOL;
global DEBUG;
DEBUG=false;
REL_TOL=1e-5;
ABS_TOL=REL_TOL*(top-bottom);
numberLayers=ceil((top-bottom)/LayerThickness);
SliceHeight=zeros;
scale=2;
%plot one contours
% [segments]=GetIntersectingLines(fnum,fv,50);
% polt_height=repmat(50,length(segments),1);
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
    %[Contours]=SimplifyContours(Contours);% simplification: if connected lines have the same direction, emerge
    %polt_height=repmat(SliceHeight(Layer),length(Contours{1,1}),1);
    %plot3(Contours{1,1}(:,1),Contours{1,1}(:,2),polt_height(:,1),'r');
    [Contours]=GradContours(Contours);% left domin rule
    %disp(['Layer','=',num2str(Layer),' ','GradContours']);
    [Layers]=LayerContour(Contours,Layer,Layers);
    %disp(['Layer','=',num2str(Layer),' ','Finished!']);
    Layers{Layer,1} = Layers{Layer,1}(:,1:2);
    Layers{Layer,1}(:,3) = SliceHeight(Layer);
    Centroid(Layer-1,:) = Calculate_centroid(Layers{Layer,1});
end
toc;
% figure
% %Centroid = 
% plot3(Centroid(:,1),Centroid(:,2),Centroid(:,3),'*');
% hold on
% polt_height=repmat(SliceHeight(3),length(Layers{3,1}),1);
% plot3(Layers{3,1}(:,1),Layers{3,1}(:,2),polt_height(:,1),'r');
% plot(Contours{1,1}(:,1),Contours{1,1}(:,2),'*');
% hold on
% plot(Contours{1,1}(:,1),Contours{1,1}(:,2),'o');
save Layers;
%[Layers]=ContourPath(Layers,SliceHeight,Layerthickness);
%[Layers]=PlotLayers(Layers,SliceHeight);
%[offest_con] = offest_convex(Layers{1},0.9);
M = Layers{1}(:,1:2);
%M = sortrows(M);

X1 = M(:,1);
Y1 = M(:,2);
% x_start = min(X1);
% %y_strat =M(x_start,1);
% x_end = max(X1);
% %y_end =M(x_end,1);
% Up_S = find(M(:,1)==x_start);
% Up_E = find(M(:,1)==x_end);
% % plot(M(Up_S:Up_E,1),M(Up_S:Up_E,2),'*');
% X1 = [M(1:Up_S,1);M(Up_E:72,1)];
% Y1 = [M(1:Up_S,2);M(Up_E:72,2)];
plot (X1,Y1,'*');
hold on
X2 = 1:1:50;
X2 =X2';
Y2 = 2*X2 + 2;
Y2 =Y2';
% plot(X1,Y1,'*');
% x=6.28:0.5:41.93;
% y1=interp1(X1,Y1,x,'linear');
% hold on
% plot(x,y1,'*');
[P] = Find_inersectdePoints(X1,Y1,X2,Y2);
figure
plot(Layers{1}(:,1),Layers{1}(:,2));
hold on
plot(X2,Y2);
plot(P(:,1),P(:,2),'*');
plot(offest_con(:,1),offest_con(:,2),'*');
%[Layers]=SaveLayer(Layers,Layerthickness);
handles.Layers=Layers;
handles.SliceHeight=SliceHeight;
guidata(hObject,handles);
disp 'Slicing finished!';