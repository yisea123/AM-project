function unbuild_plane = Unbuild_plane(fnum, V, N)
% Calculate the unbuildable surface and its plane projection
% Input:
%             fnum:   number of the facet
%             fv:     n*3 vertices matrix
%             N:      normal of the facet
% Output:
%             unbuild_plane:  the n*2 matrix of the projection of the unbuildable facets

%% calculate the unbuildable facets
normal_z = [0 0 1];
unbuild_vertices = [];
fv = (reshape(V', 9, []))';

j = 1;
for i = 1:fnum
    normal = N(i, :);
    if dot(normal, normal_z) < 0            % the normal is beneath the horizontal plane
        unbuild_vertices(j, :) = fv(i, :);
        j = j + 1;
    end
end

%% project the facets
unbuild_plane = zeros(3*size(unbuild_vertices, 1), 2);
j = 1;
for i = 1:m
    unbuild_plane(j, :) = unbuild_vertices(i, 1:2);
    unbuild_plane(j+1, :) = unbuild_vertices(i, 4:5);
    unbuild_plane(j+2, :) = unbuild_vertices(i, 7:8);
    j = j + 3;
end
end