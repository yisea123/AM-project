% main control programming of delevering the pegs
%first step :connet the physical robot with the computer by TCP/IP interface
%% 运动主函数
t=tcpip('192.168.125.1',1502,'NetworkRole','client');
fopen(t);
%%
%% 初始位置：
[position,eulerang,T]=GetCalibTool(t);  %将机械s臂手动移动到孔轴装配完成的位置，然后再记录此时的轴的位置
MoveToolTo(position+[0,0,20],eulerang+[0,0,0],50,t);%相对于基座坐标系的移动位置（位置，欧拉角，速度，机器人）

%%
% Input:   the points on the one layer contour;
%          Sample: number of points on the contour;
