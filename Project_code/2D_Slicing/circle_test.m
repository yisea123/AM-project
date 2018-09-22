clc;
clear;
% Q = EulerToQuternion ([0,90,0])
% alpha=0:pi/50:2*pi;%½Ç¶È[0,2*pi]
% R = 80;
% x = R*cos(alpha)
% y = R*sin(alpha)
% z = 0.0
% fileID = fopen('robot_circle.txt','w');
% % Q = [0.7071 0.0000 -0.7071 0.0000];
% size(x,2)
% for j=1:size(x,2)
%     fprintf(fileID,'%.4f %.4f %.4f %.4f %.4f %.4f %.4f\n', x(j) + 572.42, y(j),...
%             z + 606.89,Q(1),Q(2),Q(3),Q(4));
% %        a = sprintf('MoveL [[%0.4f,%0.4f,%0.4f],[%.4f %.4f %.4f %.4f],[%d,%d,%d,%d],[%s,%s,%s,%s,%s,%s]], v100, z5, tool1;',x(j)+572.42, y(j), z + 606.89,Q(1),Q(2),Q(3),Q(4),...
% %            -1,0,0,1,'9E+09','9E+09','9E+09','9E+09','9E+09','9E+09');
% %        fprintf(fileID,'%s\n',a);
% end 
% fclose(fileID);

Q = []
Pos_start = []
fileID = fopen('robot_test.txt','w');
dx = 0:1:100
for j =1:100
    fprintf(fileID,'%.4f %.4f %.4f %.4f %.4f %.4f %.4f\n', dx(j) + Pos_start(1), Pos_start(2),...
            Pos_start(3),Q(1),Q(2),Q(3),Q(4));
end
fclose(fileID);