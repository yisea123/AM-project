clear
clc
L1=link([-pi/2 0 0 255 0]); %L =LINK([alpha A theta D sigma])
                            %LINK.alpha	   返回扭转角
	                        %LINK.A        返回杆件长度
                        	%LINK.theta    返回关节角
                            %LINK.D        返回横距
                            %LINK.sigma    返回关节类型
L2= link([pi/2 0 0 255 0]);
L3=link([pi/2 0 0 0 0]);
L4=link([-pi/2 0 0 300 0]);
L5=link([pi/2 0 0 0 0]);
L6=link([0 0 0 120 0]);
r=robot({L1 L2 L3 L4 L5 L6});
r.name='MY ROBOT';%模型的名称
drivebot(r);              
q1=[0 0 0 0 0 0];%起始点关节空间矢量          
q2=[pi/12 -pi/6 pi/4 pi*5/12 pi*5/9 -pi*11/18]; %终止点关节空间矢量   
t=[0:0.05:10];%仿真时间              
q=jtraj(q1,q2,t);%关节空间规划         
p=fkine(r,q);

x = squeeze(p(1,4,:));
y = squeeze(p(2,4,:));
z = squeeze(p(3,4,:));
s1 = squeeze(q(:,1,:));
s2 = squeeze(q(:,2,:));
s3 = squeeze(q(:,3,:));
s4 = squeeze(q(:,4,:));
s5 = squeeze(q(:,5,:));
s6 = squeeze(q(:,6,:));
%存入X,Y,Z值
xlswrite('e:\测量件坐标.xls',x,'sheet1','a');
xlswrite('e:\测量件坐标.xls',y,'sheet1','b');
xlswrite('e:\测量件坐标.xls',z,'sheet1','c');
%存入s1,s2,s3,s4,s5,s6
xlswrite('e:\测量件旋转角.xls',s1,'sheet1','a');
xlswrite('e:\测量件旋转角.xls',s2,'sheet1','b');
xlswrite('e:\测量件旋转角.xls',s3,'sheet1','c');
xlswrite('e:\测量件旋转角.xls',s4,'sheet1','d');
xlswrite('e:\测量件旋转角.xls',s5,'sheet1','e');
xlswrite('e:\测量件旋转角.xls',s6,'sheet1','f');

figure(2);
plot(r,q);                 
hold off

figure(3);
plot(t,q(:,:),'LineWidth',2);%设置线宽            
legend('s1','s2','s3','s4','s5','s6');
grid on;      
saveas(gcf,'e:/标准件/3.jpg') ;

figure(4)
plot(t,squeeze(p(:,4,:))); 
legend('x','y','z');
grid on;  

figure(5);
subplot(2,2,1)
%scatter(x,y,'*');
hold on;
plot(x,y) 
title('XY平面内的投影')
xlabel('x')
ylabel('y')%显示在XY平面内的投影
grid on; 
subplot(2,2,2)
%scatter(x,z,'*');
hold on;
plot(x,z)
title('XZ平面内的投影')
xlabel('x')
ylabel('z')%显示在XZ平面内的投影
grid on; 
subplot(2,2,3)
%scatter(y,z,'*');
hold on;
plot(y,z)
title('YZ平面内的投影')
xlabel('y')
ylabel('z')%显示在YZ平面内的投影
grid on; 
subplot(2,2,4)
scatter3(x,y,z,'*');
%hold on;
%plot3(x1,y1,z)

plot3(x,y,z);
xlabel('X(m)')
ylabel('Y(m)')
zlabel('Z(m)')
grid
