% main control programming of delevering the pegs
%first step :connet the physical robot with the computer by TCP/IP interface
%% �˶�������
t=tcpip('192.168.125.1',1502,'NetworkRole','client');
fopen(t);
%%
%% ��ʼλ�ã�
[position,eulerang,T]=GetCalibTool(t);  %����еs���ֶ��ƶ�������װ����ɵ�λ�ã�Ȼ���ټ�¼��ʱ�����λ��
MoveToolTo(position+[0,0,20],eulerang+[0,0,0],50,t);%����ڻ�������ϵ���ƶ�λ�ã�λ�ã�ŷ���ǣ��ٶȣ������ˣ�

%%
% Input:   the points on the one layer contour;
%          Sample: number of points on the contour;
