clc;
clear;
%%
filename='drill2.stl';
[F,V,N] = stlread(filename);
[m,n]=size(F);
fnum=m;
fv = (reshape(V', 9,[]))';

nz=[0 0 1];
f_normal=[];
v_num=[];
j=1;
for i=1:1:fnum
   n1=N(i,:);
   if(dot(n1,nz)<0)%找出不满足打印方向的面片
       f_normal(j,:)=F(i,:);
       v_num(j,:)=fv(i,:);
       j=j+1;
   end
end
%%
%画出不可打印的面
%patch('Faces',F_num,'Vertices',v_num,'FaceColor','red');
m=size(v_num,1);
% for i=1:1:m
%    x=[v_num(i,1);v_num(i,4);v_num(i,7)];
%    y=[v_num(i,2);v_num(i,5);v_num(i,8)];
%    z=[v_num(i,3);v_num(i,6);v_num(i,9)];
%    patch(x,y,z,'red');
%    hold on
% end
% view([-135 35]);
%%
%将不能打印的部分进行投影出最大轮廓
v_plane=zeros(3*m,2);
j=1;
for i=1:1:m
   v_plane(j,:)=v_num(i,1:2);
   v_plane(j+1,:)=v_num(i,4:5);
   v_plane(j+2,:)=v_num(i,7:8);
   j=j+3;
end
%画出投影轮廓
figure
plot(v_plane(:,1),v_plane(:,2),'*');
dt=delaunayTriangulation(v_plane(:,1),v_plane(:,2));
%dt=delaunay(v_plnar(:,1),v_plnar(:,2));

% hold on, triplot(dt), hold off
%K=convexHull(dt);
% plot(dt.Points(:,1),dt.Points(:,2),'r','LineWidth',2);
% E=edges(dt);
% plot(dt.Points(E(2,1),1),dt.Points(E(2,1),2),dt.Points(E(2,2),1),dt.Points(E(2,2),2),'r','LineWidth',2);
%%