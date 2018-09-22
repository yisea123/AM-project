function [P] = Solve_intersectedPoints(X1 ,Y1, X2 ,Y2)
% Input: the two matrix of the two contours;
% Output: the intersecting points; P
% the input curves are two monotonous curves;
%%
a=max(min(X1),min(X2));
b=min(max(X1),max(X2)); 
a1=find(X1>=a);
a1=a1(1);
a2=find(X2>=a);
a2=a2(1);
b1=find(X1<=b);
b1=b1(end);
b2=find(X2<=b);
b2=b2(end);
% plot(X1,Y1,'r');
x=unique([X1(a1:b1);X2(a2:b2)]);
xin=min(x);
xmax=max(x);
m=xmax-xin;
x=xin:m/100:xmax;
y1=interp1(X1,Y1,x,'linear');           
% figure
% plot(x,y1,'*');
% hold on
y2=interp1(X2,Y2,x,'linear');           % 找出公共部分
% plot(x,y2,'o');
% axis equal;
%%
cy = y1-y2;
%符号记录
pos = cy>0;
neg = cy<=0;
%确定变号位置
fro = diff(pos)~=0;                     %变号的前导位置
rel = diff(neg)~=0;                     %变号的尾巴位置
zpf = find(fro==1);                     %记录索引

zpr = find(rel==1)+1;                   %记录索引

try
    zpfr = [zpf; zpr];
catch
    figure
    plot(x,y1,'*');
    hold on
    plot(x,y2,'o');
    axis equal;
end

%线性求交
x0=(x(zpr).*(y2(zpf)-y1(zpf))-x(zpf).*(y2(zpr)-y1(zpr)))./(y1(zpr)+y2(zpf)-y1(zpf)-y2(zpr));
y0=y1(zpf)+(x0-x(zpf)).*(y1(zpr)-y1(zpf))./(x(zpr)-x(zpf));
if any(isnan(y0)), y0=y2(zpf); end
%加入已经判断为零的位置
x0=[x(abs(cy)<=eps) x0].';
y0=[y1(abs(cy)<=eps) y0].';
P = [x0,y0];
%plot(x0,y0,'k.'); %绘制交点
end