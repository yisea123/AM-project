function [contour_transform, TCP_traj, TCP_ornt] = Coordinate_transform_new(Centroid, V, TCP)
% input:
%             Centroid:   n*3 coordinate of the centroid
%             V:          n*3 input of the vertices
%             TCP:        tool center point, which is also the end effector coordinate
%             TCP_ornt:   the orientation of the TCP, the 3*1 z direction vector
% output:
%             contour_transform:   intersected contours of the plane and model
%             TCP_traj:           the trajectory of the Tool Center Point

contour_transform = {};
TCP_traj = {};
TCP_ornt = {};
z_original = [0 0 1];
vertices = ones(size(V,1), 4);
vertices(:,1:3) = V;

% 计算初始初始末端执行器坐标系在cad模型坐标系的位置
z_vector = Centroid(3, :) - Centroid(1, :);
z_vector = z_vector / norm(z_vector, 2);
origin = Centroid(2, :);
R_matrix = Rotation_matrix(z_original, z_vector);
T_matrix = -R_matrix * origin';
R_matrix = [R_matrix; 0 0 0];
T_matrix = [T_matrix; 1];
M_EndEffector2Tool = inv([R_matrix, T_matrix]) * [0 0 1 0; 0 1 0 0; -1 0 0 0; 0 0 0 1];

% 从第二个点开始打印到倒数第二个
for i = 2 : size(Centroid,1)-1     % traverse all the centroid point
    z_vector = Centroid(i+1, :) - Centroid(i-1, :);
    z_vector = z_vector / norm(z_vector, 2);
    origin = Centroid(i, :);
    R_matrix = Rotation_matrix(z_original, z_vector);
    
    T_matrix = -R_matrix * origin';
    R_matrix = [R_matrix; 0 0 0];
    T_matrix = [T_matrix; 1];
    Trans_matrix = [R_matrix, T_matrix];
    new_v = Trans_matrix * vertices';
    new_v = new_v';
    
    %     plot3(new_v(:,1), new_v(:,2), new_v(:,3), 'o');
    %     hold on
    %     [x y] = meshgrid(-50:1:50, -50:1:50);
    %     z = x * 0 ;
    %     surf(x, y, z);
    
    % get the contour under new coordinat system
    fv = new_v(:, 1:3);
    fv = (reshape(fv', 9, []))';
    fnum = size(fv, 1);
    
    [segments] = GetIntersectingLines(fnum, fv, 0);
    [Contours] = FormContours(segments);
    [Contours] = SimplifyContours(Contours);
    [Contours] = GradContours(Contours);        % outpt is a n*4 matrix
    
    
    
    % select the suitable circle
    abs_dis = [];
    for j = 1:size(Contours, 1)
        abs_dis(j) = sum(abs(mean(Contours{j,1}(:,1:2))));
    end
    [~, index_contour] = min(abs_dis);
    contour = Contours{index_contour, 1}(:,1:2);
    
    %%
    %平面内路径规划的参数
    offest_d = 0.5;
    angle = 30;  % 平面内路径规划的方向设定
    
    try
        path = ContourPath(contour, offest_d, angle);
    catch
        disp(i); %输出平面分层错误的层
    end
    %     plot contour
    %         figure
    %         for j = 1:size(Contours, 1)
    %             x = Contours{j,1}(:,1);
    %             y = Contours{j,1}(:,2);
    %             plot(x, y, '-');
    %             hold on
    %         end
    %         axis equal
    % 对contour上的点进行排序
    contour = [];
    length_second = size(path{2},1);
    length_third = size(path{3},1);
    distance1 = sqrt((path{2}(length_second,1)-path{3}(1,1))^2+(path{2}(length_second,2)-path{3}(1,2))^2);
    distance2 = sqrt((path{2}(length_second,1)-path{3}(length_third,1))^2+(path{2}(length_second,2)-path{3}(length_third,2))^2);
    if (distance1>distance2)
        P = path{3};
        for j=1:length_third
            path{3}(j,:) = P(length_third-j+1,:);
        end
    end
    for k = 1:3
        contour_temp = path{k};
        contour = [contour; contour_temp];
    end
    % calculate the TCP in tool coordinate system
    M_Tool2SlicingPlane = Trans_matrix;
    temp = [];
    for j = 1:size(contour,1)
        
        M_SlicingPlane2Welding =    [1, 0, 0, -contour(j,1);
                                     0, 1, 0, -contour(j,2);
                                     0, 0, 1, 0;
                                     0, 0, 0, 1];
        M_total = M_SlicingPlane2Welding * M_Tool2SlicingPlane * M_EndEffector2Tool;
        temp(:,j) = M_total * [TCP(1); TCP(2); TCP(3); 1];
    end
    TCP_traj{i-1,1} = temp(1:3,:)';
    TCP_ornt{i-1,1} = M_total;
    
    
    % transform the contour back to the original CS
    temp = [];
    for k = 1:3
        contour = path{k};
        n_contour = size(contour, 1);
        new_contour = [contour(:,1:2), zeros(n_contour,1), ones(n_contour, 1)];
        new_contour = Trans_matrix \ new_contour';
        temp = [temp; new_contour'];
    end
    contour_transform{i-1,1} = temp(:, 1:3);
    %     n_contour = size(contour, 1);
    %     new_contour = [contour(:,1:2), zeros(n_contour,1), ones(n_contour, 1)];
    %     new_contour = Trans_matrix \ new_contour';
    %     new_contour = new_contour';
    %     contour_transform{i-1,1} = new_contour(:, 1:3);
    
    %plot contour
    %         figure
    %         for j = 1:size(Contours, 1);
    %             x = Contours{j,1}(:,1);
    %             y = Contours{j,1}(:,2);
    %             z = Contours{j,1}(:,3);
    %             plot3(x, y, z, '-');
    %             hold on
    %         end
end

end