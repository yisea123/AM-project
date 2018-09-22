function [Path] = ContourPath(contours ,offest_d, angle)
% Input:the points on the max contours;
% offest_distance: the distance between the path;
% angle: the angle of the path [0-90]
% Output: the struct of all the contour path;
%%
%first offest the outermost contour
Path ={};
Path{1} = contours;
X_length = floor(abs(max(Path{1}(:,1))-min(Path{1}(:,1))))+10;  %����ƽ��·���滮��ֱ�ߵĳ���
offset = -offest_d;                % ����������ƫ�õľ���
num_offset = 2;            % ����������ƫ�õ�Ȧ��
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
% ������ת����
Rotate = [[cosd(angle) -sind(angle) 0];
          [sind(angle) cosd(angle) 0];
          [0 0 1]];
rotate_offest = second_Contour*Rotate;
% Ѱ��ת������ϵ�µı߽��
min_x = min(rotate_offest(:,1));
max_x = max(rotate_offest(:,1));
min_y = min(rotate_offest(:,2));
max_y = max(rotate_offest(:,2));
% ��ת������
Rotate_inv = [[cosd(-angle) -sind(-angle) 0];
          [sind(-angle) cosd(-angle) 0];
          [0 0 1]];
% �ҳ����ߵĶ�Ӧ���ĸ��߽��
m_minx = rotate_offest(rotate_offest(:,1)==min_x,:)*Rotate_inv;
m_maxx = rotate_offest(rotate_offest(:,1)==max_x,:)*Rotate_inv;
m_miny = rotate_offest(rotate_offest(:,2)==min_y,:)*Rotate_inv;
m_maxy = rotate_offest(rotate_offest(:,2)==max_y,:)*Rotate_inv;
%�����߽��
% plot(m_minx(:,1),m_minx(:,2),'o');
% plot(m_maxx(:,1),m_maxx(:,2),'*');
% plot(m_miny(:,1),m_miny(:,2),'o');
% plot(m_maxy(:,1),m_maxy(:,2),'*');
% ����ͨ����߽���ֱ��
% ·������X�᷽��
b_minx = m_miny(:,2)-tand(angle)*m_miny(:,1);
b_maxx = m_maxy(:,2)-tand(angle)*m_maxy(:,1);
nx =floor(abs(b_maxx -b_minx)/offest_d);
% ·������Y�᷽��
b_miny = m_minx(:,2)-tand(angle+90)*m_minx(:,1);
b_maxy = m_maxx(:,2)-tand(angle+90)*m_maxx(:,1);
ny =floor(abs(b_maxy - b_miny)/offest_d);
%%
% ֱ�߷�Χ��ѡ��(��Ҫ�޸�)
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
   % ·�����ɵķ������������ת�������
   % ��Ҫ���ȶԽ������һ������
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


