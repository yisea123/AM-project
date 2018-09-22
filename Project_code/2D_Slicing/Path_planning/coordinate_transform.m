function contour_transform = coordinate_transform(Centroid, V)
% input:
%             Centroid:   n*3 coordinate of the centroid
%             V:          n*3 input of the vertices
% output:
%             Contours:   intersected contours of the plane and model
contour_transform = {};
z_original = [0 0 1];
vertices = ones(size(V,1), 4);
vertices(:,1:3) = V;


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
    %plot(contour(:,1),contour(:,2),'r');
%     axis equal;
    %%
%     hold on
%     offset = 1;                % 外轮廓向内偏置的距离
%     num_offset = 2;            % 外轮廓向内偏置的圈数
%     Offset_contour = Contour_offset(contour, offset, num_offset);
%     first_Contour = Offset_contour{1};
%     %first_Contour = offest_convex(contours, 0.9);
%     Path{2} = first_Contour;
%     second_Contour = Offset_contour{2};
%     % figure
%     plot(first_Contour(:,1),first_Contour(:,2),'b');
%     hold on
%     plot(second_Contour(:,1),second_Contour(:,2),'*');
%%
    %平面内路径规划的参数
    offest_d = 0.5; 
    angle = 30;  % 平面内路径规划的方向设定
    
    try
        path = ContourPath(contour, offest_d, angle);
    catch
        disp(i); %输出平面分层错误的层
    end

    %绘制每一层的画图结果
%     figure
%     plot(path{1}(:,1),path{1}(:,2),'r');
%     hold on
%     plot(path{2}(:,1),path{2}(:,2),'b');
%     hold on
%     plot(path{3}(:,1),path{3}(:,2),'g');
%     axis equal;
    % plot contour
%     figure
%     for j = 1:size(Contours, 1)
%         x = Contours{j,1}(:,1);
%         y = Contours{j,1}(:,2);
%         plot(x, y, '-');
%         hold on
%     end
%     axis equal
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
    
    %plot contour
%     figure
%     for i = 1:size(Contours, 1);
%         x = Contours{i,1}(:,1);
%         y = Contours{i,1}(:,2);
%         z = Contours{i,1}(:,3);
%         plot3(x, y, z, '*');
%         hold on
%     end
end