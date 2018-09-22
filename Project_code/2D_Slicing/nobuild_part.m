% clc;
% clear;
function [v_plnar] = nobuild_part(F,V,N)
%�ҳ�����в��ɴ�ӡ�Ĳ���
% Input:��ȡ����������ͷ�����
% Output:ͶӰ֮����������������
%%
% filename='D:\matlab_work\AM_work\2D_Slicing\component.stl';
% [F,V,N] = stlread(filename);
[fnum,n]=size(F);
%fv=zeros(fnum,9);
fv=(reshape(V', 9,[]))';
%%
nz=[0 0 1];
f_normal=[];
v_num=[];
j=1;
for i=1:1:fnum
    n1=N(i,:);
    if(dot(n1,nz)<0)            %�ҳ��������ӡ�������Ƭ
        f_normal(j,:)=F(i,:);
        v_num(j,:)=fv(i,:);
        j=j+1;
    end
end
%%
%�������ɴ�ӡ����
%patch('Faces',F_num,'Vertices',v_num,'FaceColor','red');
% for i=1:1:m
%    x=[v_num(i,1);v_num(i,4);v_num(i,7)];
%    y=[v_num(i,2);v_num(i,5);v_num(i,8)];
%    z=[v_num(i,3);v_num(i,6);v_num(i,9)];
%    patch(x,y,z,'red');
%    hold on
% end
% view([-135 35]);
%%
%�����ܴ�ӡ�Ĳ��ֽ���ͶӰ�ҳ��������
m=size(v_num,1);
v_plnar=zeros(3*m,2);
j=1;
for i=1:1:m
    v_plnar(j,:)=v_num(i,1:2);
    v_plnar(j+1,:)=v_num(i,4:5);
    v_plnar(j+2,:)=v_num(i,7:8);
    j=j+3;
end
%save BW.mat v_plnar                       %����ͶӰ����
%plot(v_plnar(:,1),v_plnar(:,2),'*');      %����ͶӰ����
% dt=delaunayTriangulation(v_plnar(:,1),v_plnar(:,2));%dt=delaunay(v_plnar(:,1),v_plnar(:,2));
% K=convexHull(dt);
% plot(dt.Points(K,1),dt.Points(K,2),'r','LineWidth',2);
end
% E=edges(dt);
%%