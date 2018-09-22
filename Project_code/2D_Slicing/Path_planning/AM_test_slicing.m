clc;
clear;
%%
%将输出的位置信息写成TXT格式
Q = EulerToQuternion ([0,90,0])
load matlab.mat;
% load TCP_ornt.mat TCP_ornt;
M = EulerToMatrix([0 0 0],[0 0 0]);
% Q1 = MatrixToQuternion(TCP_ornt{1,1}*M)
fileID = fopen('robot.txt','w');
size(TCP_traj, 1)
% for j=1:size(TCP_traj{1,1},1)
%     
%         a = sprintf('MoveL [[%4.2f,%4.2f,%4.2f],[%d,%d,%d,%d],[%d,%d,%d,%d],[%s,%s,%s,%s,%s,%s]], v40, z5, tool1;',TCP_traj{1,1}(j,1)+572.42,TCP_traj{1,1}(j,2),TCP_traj{1,1}(j,3)+456.89,Q1(1),Q(2),Q(3),Q(4),-1,0,0,1,'9E+09','9E+09','9E+09','9E+09','9E+09','9E+09');
%         fprintf(fileID,'%s\n',a);
% end
% Q2 = MatrixToQuternion(TCP_ornt{2,1}*M);
% for j=1:size(TCP_traj{2,1},1)
%         a = sprintf('MoveL [[%4.2f,%4.2f,%4.2f],[%d,%d,%d,%d],[%d,%d,%d,%d],[%s,%s,%s,%s,%s,%s]], v40, z5, tool1;',TCP_traj{2,1}(j,1)+572.42,TCP_traj{2,1}(j,2),TCP_traj{2,1}(j,3)+456.89,0.7071,0.0,0.7071,0.00,-1,0,0,1,'9E+09','9E+09','9E+09','9E+09','9E+09','9E+09');
%         fprintf(fileID,'%s\n',a);
% end
% fclose(fileID);
%焊枪位置坐标[572.42 0 456.89]
for i=1:2
    Q = MatrixToQuternion(TCP_ornt{i,1}*M);
    for j=1:size(TCP_traj{i,1},1)
        a = sprintf('MoveL [[%4.2f,%4.2f,%4.2f],[%4.3d,%4.2d,%4.2d,%4.2d],[%d,%d,%d,%d],[%s,%s,%s,%s,%s,%s]], v100, z5, tool1;',TCP_traj{i,1}(j,1)+572.42,TCP_traj{i,1}(j,2),TCP_traj{i,1}(j,3)+606.89,Q(1),Q(2),Q(3),Q(4),-1,0,0,1,'9E+09','9E+09','9E+09','9E+09','9E+09','9E+09');
        fprintf(fileID,'%s\n',a);
    end
end

for i=1:2
    Q = MatrixToQuternion(TCP_ornt{i,1}*M);
    for j=1:size(TCP_traj{i,1},1)
        %a = sprintf('%4.2f %4.2f %4.2f %4.3d %4.2d %4.2d %4.2d',round(TCP_traj{i,1}(j,1)+572.42,4),TCP_traj{i,1}(j,2),TCP_traj{i,1}(j,3)+606.89,Q(1),Q(2),Q(3),Q(4));
       %fprintf(fileID,'%s\n',a);
      
        fprintf(fileID,'%.4f %.4f %.4f %.4f %.4f %.4f %.4f\n',TCP_traj{i,1}(j,1)+572.42,TCP_traj{i,1}(j,2),...
            TCP_traj{i,1}(j,3)+606.89,Q(1),Q(2),Q(3),Q(4));
    end
end
fclose(fileID);
%%
filename = 'D:\matlab_work\AM_work\2D_Slicing\spring_fine.stl';
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
DEBUG = false;
REL_TOL=1e-5;
ABS_TOL=REL_TOL*(top-bottom);
numberLayers=ceil((top-bottom)/LayerThickness);
SliceHeight=zeros;
scale=2;

for Layer=2:numberLayers
    SliceHeight(Layer)=bottom+(Layer-1)*LayerThickness;
    [segments]=GetIntersectingLines(fnum,fv,SliceHeight(Layer));% get the intersecting line segments with the slicing plane
    %disp(['Layer','=',num2str(Layer),' ','GetIntersectingLines']);
    %segments=segments*scale;
    [Contours] = FormContours( segments );% generate Contours from the interseting line segments
    %disp(['Layer','=',num2str(Layer),' ','FormContours']);
    [Contours]=SimplifyContours(Contours);% simplification: if connected lines have the same direction, emerge
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
%%
Centroid = Centroid(12:length(Centroid)-12, :);
% plot3(Centroid(:,1),Centroid(:,2),Centroid(:,3),'-');
% axis equal
% 使用理论值计算中心点的位置
% t = linspace(0, 2, 150);
% x_theory = 70 + 50 * cos(-2 * pi * t + pi);
% y_theory = 70 + 50 * sin(-2 * pi * t + pi);
% z_theory = 100 * t + 10;
% Centroid = [x_theory',y_theory',z_theory'];

toc;
TCP = [0; 0; 0];
tic
[contour_transform, TCP_traj, TCP_ornt] = Coordinate_transform_new(Centroid, V, TCP)
toc
save('TCP_traj.mat', 'TCP_traj');
figure
% 画出全部的路径分层
for i = 1:size(contour_transform, 1)
    x = contour_transform{i,1}(:,1);
    y = contour_transform{i,1}(:,2);
    z = contour_transform{i,1}(:,3);
    plot3(x, y, z, '-');
    hold on
end
plot3(Centroid(:,1),Centroid(:,2),Centroid(:,3),'-');
axis equal
% 画出机器人末端的空间位置规划
figure
for i = 1:size(TCP_traj, 1)
    x = TCP_traj{i,1}(:,1);
    y = TCP_traj{i,1}(:,2);
    z = TCP_traj{i,1}(:,3);
    plot3(x, y, z, '-');
    hold on
end
axis equal