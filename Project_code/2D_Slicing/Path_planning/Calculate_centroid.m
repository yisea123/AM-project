function [ Centroid ] = Calculate_centroid( contour )
%Calculate_centroid :calculate the centroid of the given contour;
%   Input: the contour points;
%   Output: the centroid point of the contour;
num = length(contour);
Centroid = sum(contour)/num;
end

