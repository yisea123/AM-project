clear
clc
L1=link([-pi/2 0 0 255 0]); %L =LINK([alpha A theta D sigma])
                            %LINK.alpha	   ����Ťת��
	                        %LINK.A        ���ظ˼�����
                        	%LINK.theta    ���عؽڽ�
                            %LINK.D        ���غ��
                            %LINK.sigma    ���عؽ�����
L2= link([pi/2 0 0 255 0]);
L3=link([pi/2 0 0 0 0]);
L4=link([-pi/2 0 0 300 0]);
L5=link([pi/2 0 0 0 0]);
L6=link([0 0 0 120 0]);
r=robot({L1 L2 L3 L4 L5 L6});
r.name='MY ROBOT';%ģ�͵�����
drivebot(r);              
q1=[0 0 0 0 0 0];%��ʼ��ؽڿռ�ʸ��          
q2=[pi/12 -pi/6 pi/4 pi*5/12 pi*5/9 -pi*11/18]; %��ֹ��ؽڿռ�ʸ��   
t=[0:0.05:10];%����ʱ��              
q=jtraj(q1,q2,t);%�ؽڿռ�滮         
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
%����X,Y,Zֵ
xlswrite('e:\����������.xls',x,'sheet1','a');
xlswrite('e:\����������.xls',y,'sheet1','b');
xlswrite('e:\����������.xls',z,'sheet1','c');
%����s1,s2,s3,s4,s5,s6
xlswrite('e:\��������ת��.xls',s1,'sheet1','a');
xlswrite('e:\��������ת��.xls',s2,'sheet1','b');
xlswrite('e:\��������ת��.xls',s3,'sheet1','c');
xlswrite('e:\��������ת��.xls',s4,'sheet1','d');
xlswrite('e:\��������ת��.xls',s5,'sheet1','e');
xlswrite('e:\��������ת��.xls',s6,'sheet1','f');

figure(2);
plot(r,q);                 
hold off

figure(3);
plot(t,q(:,:),'LineWidth',2);%�����߿�            
legend('s1','s2','s3','s4','s5','s6');
grid on;      
saveas(gcf,'e:/��׼��/3.jpg') ;

figure(4)
plot(t,squeeze(p(:,4,:))); 
legend('x','y','z');
grid on;  

figure(5);
subplot(2,2,1)
%scatter(x,y,'*');
hold on;
plot(x,y) 
title('XYƽ���ڵ�ͶӰ')
xlabel('x')
ylabel('y')%��ʾ��XYƽ���ڵ�ͶӰ
grid on; 
subplot(2,2,2)
%scatter(x,z,'*');
hold on;
plot(x,z)
title('XZƽ���ڵ�ͶӰ')
xlabel('x')
ylabel('z')%��ʾ��XZƽ���ڵ�ͶӰ
grid on; 
subplot(2,2,3)
%scatter(y,z,'*');
hold on;
plot(y,z)
title('YZƽ���ڵ�ͶӰ')
xlabel('y')
ylabel('z')%��ʾ��YZƽ���ڵ�ͶӰ
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
