function [ quternion ] = MatrixToQuternion( T )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
% 转换矩阵转换成EULER
euler(3)=atan2(T(2,1),T(1,1));
euler(2)=atan2(-T(3,1),cos(euler(3))*T(1,1)+sin(euler(3))*T(2,1));
euler(1)=atan2(sin(euler(3))*T(1,3)-cos(euler(3))*T(2,3),-sin(euler(3))*T(1,2)+cos(euler(3))*T(2,2));

euler=euler*180/pi;
%EULER转换成四元数
ax=euler(1)*pi/180;
ay=euler(2)*pi/180;
az=euler(3)*pi/180;

x1=cos(ay)*cos(az);
x2=cos(ay)*sin(az);
x3=-sin(ay);
y1=-cos(ax)*sin(az)+sin(ax)*sin(ay)*cos(az);
y2=cos(ax)*cos(az)+sin(ax)*sin(ay)*sin(az);
y3=sin(ax)*cos(ay);
z1=sin(ax)*sin(az)+cos(ax)*sin(ay)*cos(az);
z2=-sin(ax)*cos(az)+cos(ax)*sin(ay)*sin(az);
z3=cos(ax)*cos(ay);

q1=sqrt(x1+y2+z3+1)/2;
if(y3>=z2)
    q2=sqrt(x1-y2-z3+1)/2;
else
    q2=-sqrt(x1-y2-z3+1)/2;
end
if(z1>=x3)
    q3=sqrt(y2-x1-z3+1)/2;
else
    q3=-sqrt(y2-x1-z3+1)/2;
end
if(x2>=y1)
    q4=sqrt(z3-x1-y2+1)/2;
else
    q4=-sqrt(z3-x1-y2+1)/2;
end
quternion = [q1 q2 q3 q4];
end

