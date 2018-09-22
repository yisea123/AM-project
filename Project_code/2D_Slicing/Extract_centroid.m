function [] = Extract_centroid(F, V, N, inc)
% function
% Input:     
%       STL model(F,V,N)
%       the increment distance
% Output:
%       the centroid axis
%%
tic;
LayerThickness =3;
fnum =size(F,1);
fv=(reshape(V', 9,[]))';
Layers={};

bottom=min(V(:,3));
top=max(V(:,3));
global REL_TOL;
global ABS_TOL;
global DEBUG;
DEBUG=false;
REL_TOL=1e-5;
ABS_TOL=REL_TOL*(top-bottom);
numberLayers = ceil((top-bottom)/LayerThickness);
SliceHeight = zeros;
scale=2;
%plot one contours
%polt_height=repmat(50,length(segments),1);
%for j=1:size(segments,1)
    %hold on
    %plot([segments(j,1) segments(j,3)],[segments(j,2) segments(j,4)],'r');
    %plot3(segments(:,1),segments(:,3),polt_height(:,1),'r');
 %end

for Layer=1:numberLayers
    SliceHeight(Layer)=bottom+(Layer-1)*LayerThickness;
    [segments]=GetIntersectingLines(fnum,fv,SliceHeight(Layer));% get the intersecting line segments with the slicing plane
    %disp(['Layer','=',num2str(Layer),' ','GetIntersectingLines']);
    %segments=segments*scale;
    [Contours] = FormContours( segments );% generate Contours from the interseting line segments
    %disp(['Layer','=',num2str(Layer),' ','FormContours']);
    [Contours] = SimplifyContours(Contours);% simplification: if connected lines have the same direction, emerge
    
    [Contours]=GradContours(Contours);% left domin rule
    %disp(['Layer','=',num2str(Layer),' ','GradContours']);
    [Layers]=LayerContour(Contours,Layer,Layers);
    %disp(['Layer','=',num2str(Layer),' ','Finished!']);    
end


toc;