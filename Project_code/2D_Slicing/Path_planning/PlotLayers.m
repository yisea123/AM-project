function [Layers] = PlotLayers(layers,SliceHeight)
% plot the 3D STL model;
% Output: the 3-d coordinate of the pionts;
for i=2:length(layers)
    %for j=1:size(layers{i}(1))
    polt_height=repmat(SliceHeight(i),length(layers{i}),1);
    plot3(layers{i}(:,1),layers{i}(:,2),polt_height(:,1),'r');
    hold on
    Layers{i,1}= [layers{i}(:,1),layers{i}(:,2),polt_height(:,1)];
    %end
end
end

