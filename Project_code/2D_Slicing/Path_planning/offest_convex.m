function [out_contour] = offest_convex(in_contour, ratio)
%%
% this function point to the convex contour;
% Inuput: the Matrix of the contour;
% ratio: the scale of offest;
% Output: the offest_contour of the given_contour;
%%
% D:the geometric central point of the control points
M = sum(in_contour);
n = size(in_contour,1);
M = M/n;
D = [M(:,1) M(:,2)];
% X = M(:,1);
% Y = M(:,2);
%%
out_contour = zeros(n,3);
out_contour(:,1) = D(:,1) + ratio*(in_contour(:,1)-D(:,1));
out_contour(:,2) = D(:,2) + ratio*(in_contour(:,2)-D(:,2));
end