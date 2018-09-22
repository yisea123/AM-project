function [Path] = ContourPath(contours ,offest_d, angle)
% Input:the points on the max contours;
% offest_distance: the distance between the path;
% angle: the angle of the path [0-90]
% Output: the struct of all the contour path;
%%
%first offest the outermost contour
Path ={};
Path{1} = contours;
X_length = floor(abs(max(Path{1}(:,1))-min(Path{1}(:,1))))+10;  %用于平面路径规划的直线的长度
offset = -offest_d;                % 外轮廓向内偏置的距离
num_offset = 2;            % 外轮廓向内偏置的圈数
Offset_contour = Contour_offset(contours, offset, num_offset);
first_Contour = Offset_contour{1};
%first_Contour = offest_convex(contours, 0.9);
Path{2} = first_Contour;
second_Contour = Offset_contour{2};
% figure
% plot(first_Contour(:,1),first_Contour(:,2),'b');
% hold on
% plot(second_Contour(:,1),second_Contour(:,2),'*');
%second_Contour = offest_convex(first_Contour, 0.9);
% offest the every contour to   intersect the second_Contour
second_Contour(:,3) = 1;
%%
flag = 1;
if(angle>90)
    angle = angle -90;
    flag = 0;
end
% 坐标旋转矩阵
Rotate = [[cosd(angle) -sind(angle) 0];
          [sind(angle) cosd(angle) 0];
          [0 0 1]];
rotate_offest = second_Contour*Rotate;
% 寻找转换坐标系下的边界点
min_x = min(rotate_offest(:,1));
max_x = max(rotate_offest(:,1));
min_y = min(rotate_offest(:,2));
max_y = max(rotate_offest(:,2));
% 逆转换矩阵
Rotate_inv = [[cosd(-angle) -sind(-angle) 0];
          [sind(-angle) cosd(-angle) 0];
          [0 0 1]];
% 找出曲线的对应的四个边界点
m_minx = rotate_offest(rotate_offest(:,1)==min_x,:)*Rotate_inv;
m_maxx = rotate_offest(rotate_offest(:,1)==max_x,:)*Rotate_inv;
m_miny = rotate_offest(rotate_offest(:,2)==min_y,:)*Rotate_inv;
m_maxy = rotate_offest(rotate_offest(:,2)==max_y,:)*Rotate_inv;
%画出边界点
% plot(m_minx(:,1),m_minx(:,2),'o');
% plot(m_maxx(:,1),m_maxx(:,2),'*');
% plot(m_miny(:,1),m_miny(:,2),'o');
% plot(m_maxy(:,1),m_maxy(:,2),'*');
% 计算通过最边界点的直线
% 路径沿新X轴方向
b_minx = m_miny(:,2)-tand(angle)*m_miny(:,1);
b_maxx = m_maxy(:,2)-tand(angle)*m_maxy(:,1);
nx =floor(abs(b_maxx -b_minx)/offest_d);
% 路径沿新Y轴方向
b_miny = m_minx(:,2)-tand(angle+90)*m_minx(:,1);
b_maxy = m_maxx(:,2)-tand(angle+90)*m_maxx(:,1);
ny =floor(abs(b_maxy - b_miny)/offest_d);
%%
% 直线范围的选择(需要修改)
x = -X_length:1:X_length ;
x = x';

if (flag ==1 )
    for i=1:nx
        y{i} = tand(angle)*x + b_minx +i*offest_d;
        P{i} = Find_inersectdePoints(second_Contour(:,1),second_Contour(:,2),x,y{i});
        n = nx;
    end
else
    for i=1:ny
        y{i} = tand(angle+90)*x + b_miny +i*offest_d;
        P{i} = Find_inersectdePoints(second_Contour(:,1),second_Contour(:,2),x,y{i});
        n = ny;
    end
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
       Path{3}(2*j-1,:) = [P{j}(2,1) P{j}(2,2)];
       Path{3}(2*j,:) = [P{j}(1,1) P{j}(1,2)];
   else
       Path{3}(2*j-1,:) = [P{j}(1,1) P{j}(1,2)];
       Path{3}(2*j,:) = [P{j}(2,1) P{j}(2,2)];
   end      
end   
%    plot (P{1}(:,1),P{1}(:,2),'*');
%    hold on
end


