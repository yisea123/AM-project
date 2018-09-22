clc;
clear;
filename = 'D:\matlab_work\AM_work\2D_Slicing\component.stl';  % Example file.
[F,V,N] = stlread(filename);
%[boundary] = Get_boundary( F, V, N,20);
%%
[v_plnar] = nobuild_part(F,V,N);
plot(v_plnar(:,1),v_plnar(:,2),'*'); 

[para, hough_circle, max_contour] = min_maxContour(v_plnar,1,0.01,9,40,0.8);
%plot(max_contour(:,1),max_contour(:,2),'r','LineWidth',2);
% length = size(hough_circle);
% 
% for k=1:length
%     plot(hough_circle{k}(:,1),hough_circle{k}(:,2),'*');
% end
%将点与坐标进行统一
%%
%画出轮廓边界
% save boundary;
figure;
for j=1:size(boundary,1)
    hold on
    x=[boundary(j,1) boundary(j,4)];
    y=[boundary(j,2) boundary(j,5)];
    z=[boundary(j,3) boundary(j,6)];
    plot3(x,y,z,'r');
end


    