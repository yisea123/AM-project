function Offset_contour = Contour_offset(Contours, offset, num_offset)
% input:
%         Contour:            outer contour of a layer
%         offset:             deviation of the offset
%         num_offset:         number of offset
% output:
%         Offset_contour:     the offset contours of contour
%%
contour = Contours{1,1};                        % extract contour data
contour = contour(:,1:2);                       % store the contour data
Offset_contour = {};
for j = 1 : num_offset                          % do the offset for num_offset times
    % the normal of adjacent two points
%     for i = 1 : size(contour,1)                 % traverse all the data point to cal. the normal
%         if i == size(contour,1)
%             seg_vector = contour(1,1:2) - contour(i,1:2);
%         else
%             seg_vector = contour(i+1,1:2) - contour(i,1:2);
%         end
%         normal = cross([0,0,1], [seg_vector, 1]);   % the normal point to inner area
%         normal_norm = normal(1:2) / norm(normal(1:2),2);
%         Offset_contour{j}(i,:) = contour(i,1:2) + normal_norm;
%     end
    % the normal of adjacent three points
     for i = 1 : size(contour,1)                 % traverse all the data point to cal. the normal
        if i == size(contour,1)-1
            seg_vector_1 = contour(i+1,1:2) - contour(i,1:2);
            seg_vector_1 = seg_vector_1 / norm(seg_vector_1,2);
            seg_vector_2 = contour(1,1:2) - contour(i+1,1:2);
            seg_vector_2 = seg_vector_2 / norm(seg_vector_2,2);
            seg_vector =seg_vector_1 + seg_vector_2;       
        elseif i == size(contour,1)
            seg_vector_1 = contour(1,1:2) - contour(i,1:2);
            seg_vector_1 = seg_vector_1 / norm(seg_vector_1,2);
            seg_vector_2 = contour(2,1:2) - contour(1,1:2);
            seg_vector_2 = seg_vector_2 / norm(seg_vector_2,2);
            seg_vector =seg_vector_1 + seg_vector_2;                   
        else
            seg_vector_1 = contour(i+1,1:2) - contour(i,1:2);
            seg_vector_1 = seg_vector_1 / norm(seg_vector_1,2);
            seg_vector_2 = contour(i+2,1:2) - contour(i+1,1:2);
            seg_vector_2 = seg_vector_2 / norm(seg_vector_2,2);
            seg_vector =seg_vector_1 + seg_vector_2;           
        end
        normal = cross([0,0,1], [seg_vector, 1]);   % the normal point to inner area
        normal_norm = normal(1:2) / norm(normal(1:2),2);
        Offset_contour{j}(i,:) = contour(i,1:2) + normal_norm;
    end   
    contour = Offset_contour{j};
end


