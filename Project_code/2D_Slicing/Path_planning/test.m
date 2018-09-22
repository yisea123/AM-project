clc;
clear;
% euler = [0 0 0];
% q = EulerToQuternion (euler);%q=[1 0 0 0];
% cf = [1, 1, 0, 0];
% extax = [ 11, 12.3, 9, 9, 9, 9];
%load Centroid.mat Centroid;
load Layers.mat Layers;
% L = Layers{1}(:,1:2);
% for i=1:length(L)
%     L(i,3) = 30;
%     L(i,4:7) = q;
%     L(i,8:11) = cf;
%     L(i,12:17) = extax;
% end
% M=round(L,2);
% save M.mat 'M'
% xlswrite('robot.xlsx', M);
% offset = 1;
% num_offset = 2;
% Offset_contour = Contour_offset(L, offset, num_offset);

Path = ContourPath(Layers{10} ,2.0, 120);
plot(Path{1}(:,1),Path{1}(:,2),'r');
hold on
plot(Path{2}(:,1),Path{2}(:,2),'b');
hold on
plot(Path{3}(:,1),Path{3}(:,2),'g');
axis equal;
[offest_con] = offest_convex(Layers{1},0.9);
offest_con(:,3) = 1;
figure
plot(Layers{1}(:,1),Layers{1}(:,2),'b');
hold on 
plot(offest_con(:,1),offest_con(:,2),'g');
hold on
angle = 60;
Rotate = [[cosd(angle) -sind(angle) 0];
          [sind(angle) cosd(angle) 0];
          [0 0 1]];
rotate_offest = offest_con*Rotate;
min_x = min(rotate_offest(:,1));
max_x = max(rotate_offest(:,1));
min_y = min(rotate_offest(:,2));
max_y = max(rotate_offest(:,2));
angle = -60;
Rotate1 = [[cosd(angle) -sind(angle) 0];
          [sind(angle) cosd(angle) 0];
          [0 0 1]];
% 找出曲线的四个边界点
m_minx = rotate_offest(rotate_offest(:,1)==min_x,:)*Rotate1;
m_maxx = rotate_offest(rotate_offest(:,1)==max_x,:)*Rotate1;
m_miny = rotate_offest(rotate_offest(:,2)==min_y,:)*Rotate1;
m_maxy = rotate_offest(rotate_offest(:,2)==max_y,:)*Rotate1;


% 路径沿新X轴方向
b_minx = m_miny(:,2)-tand(60)*m_miny(:,1);
b_maxx = m_maxy(:,2)-tand(60)*m_maxy(:,1);
% plot(m_miny(:,1),m_miny(:,2),'o');
% hold on
% plot(m_maxy(:,1),m_maxy(:,2),'*');
% 路径沿新Y轴方向
b_miny = m_minx(:,2)-tand(150)*m_minx(:,1);
b_maxy = m_maxx(:,2)-tand(150)*m_maxx(:,1);
% x = 1:1:45;
% x = x';
% y1 = tand(60)*x + b_minx;
% y2 = tand(60)*x + b_maxx;
% y3 = tand(150)*x + b_miny;
% y4 = tand(150)*x + b_maxy ;
% plot(x,y1,x,y2,x,y3,x,y4);
b = b_minx:1:b_maxx;
% n =floor(abs(b_maxx -b_minx)/2.);
n =floor(abs(b_maxy -b_miny)/2.);
x = 1:1:45;
x = x';
for i=1:n
   y{i} = tand(150)*x + b_miny +i*2;  
   P{i} = Find_inersectdePoints(offest_con(:,1),offest_con(:,2),x,y{i});
%    plot (x,y{i}(:,1));
%    hold on
end

for j=1:n
   % 路径生成的方向就是沿着旋转轴的正向
   % 需要首先对交点进行一个排序
   if(P{j}(1,2)>P{j}(2,2))
      temp = P{j}(1,:);
      P{j}(1,:) = P{j}(2,:);
      P{j}(2,:) = temp;
   end
   if(mod(j,2)==0)
       Path (2*j-1,:) = [P{j}(2,1) P{j}(2,2)];
       Path (2*j,:) = [P{j}(1,1) P{j}(1,2)];
   else
       Path (2*j-1,:) = [P{j}(1,1) P{j}(1,2)];
       Path (2*j,:) = [P{j}(2,1) P{j}(2,2)];
   end      
end
plot(Path(:,1),Path(:,2),'r');
plot (P{1}(:,1),P{1}(:,2),'*');
hold on
y1 = tand(60)*x + b_min;
y2 = tand(60)*x + b_max;
plot(x,y1,x,y2);
plot(m_minx(:,1),m_minx(:,2),'o');
hold on
plot(m_maxx(:,1),m_maxx(:,2),'*');
x = 1:0.5:45;
x = x';
y = {};
for i=1:10
    y{i} = 2*x + i*2;
    plot(x,y{i});
    hold on
end

%[P] = Find_inersectdePoints(offest_con(:,1),offest_con(:,2),x,y);
%%
% dt = delaunayTriangulation(Layers{1}(:,1),Layers{1}(:,2));
% k = convexHull(dt);
% figure
% plot(Layers{1}(:,1),Layers{1}(:,2), '.', 'markersize',10); 
% hold on;
% plot(Layers{1}(k,1),Layers{1}(k,2), 'r'); 
% hold off;
