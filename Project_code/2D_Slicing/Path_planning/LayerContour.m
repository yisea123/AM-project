function [Layers]=LayerContour(Contours,Layer,Layers)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
num=0;
for i=1:size(Contours,1)
    if size(Contours{i,1},1)>2
    num=num+1;
    Layers{Layer,num}=Contours{i,1};
    end
end
end

