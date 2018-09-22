clc;
clear;
filename = 'drill.stl';  % Example file.
[F,V,N] = stlread(filename);
fv = (reshape(V', 3, []))';

[unbuild_prj] = nobuild_part(F,V,N);
% plot(v_plnar(:,1),v_plnar(:,2),'*'); 

figure
% shp = alphaShape(unbuild_prj(:,1), unbuild_prj(:,2),10);
shp = alphaShape(fv(:,1), fv(:,2),10);
figure
plot(shp);

figure
in = inShape(shp, fv(:,1), fv(:,2));
[bf, p] = boundaryFacets(shp);
plot(p(:,1),p(:,2),'bo');
%% 检测面片是否在不可打印的范围内，拆分面片

% %[para, min_contour, max_contour] = min_maxContour(v_plnar,1,0.01,9,40,0.8);
% % plot(max_contour(:,1),max_contour(:,2),'r','LineWidth',2);
% 
% fv = (reshape(V', 3, []))';
% [in, on] = inpolygon(fv(:,1), fv(:,2), max_contour(:,1), max_contour(:,2));
% in = in|on;
% out = ~inpolygon(fv(:,1), fv(:,2), min_contour{1}(:,1), min_contour{1}(:,2));
% flag = in & out;
% 
% fv = [fv, flag, in, out];
% 
% 
% 
% build =[];
% unbuild = [];
% for i = 1:size(fv,1)
%     if in(i) ==1
%         build = [build; fv(i,1:3)];
%     else
%         unbuild = [unbuild; fv(i,1:3)];
%     end
% end
% figure
% plot(build(:,1),build(:,2),'*b');
% figure
% plot(unbuild(:,1),unbuild(:,2),'ro');
% % build = [];
% % unbuild = [];
% % for i = 1:size(fv,1)
% %     if fv(i,4) ==1
% %         build = [build; fv(i,1:3)];
% %     else
% %         unbuild = [unbuild; fv(i,1:3)];
% %     end
% % end
% % figure
% % plot(build(:,1),build(:,2),'*b');
% % hold on
% % plot(unbuild(:,1),unbuild(:,2),'ro');
% % figure
% % patch('XData',build(:,1), 'YData', build(:,2), 'ZData', build(:,3));
% % figure
% % patch('XData',unbuild(:,1), 'YData', unbuild(:,2), 'ZData', unbuild(:,3));
% 
% 
