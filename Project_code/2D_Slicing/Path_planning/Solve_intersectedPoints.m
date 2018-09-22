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
y2=interp1(X2,Y2,x,'linear');           % �ҳ���������
% plot(x,y2,'o');
% axis equal;
%%
cy = y1-y2;
%���ż�¼
pos = cy>0;
neg = cy<=0;
%ȷ�����λ��
fro = diff(pos)~=0;                     %��ŵ�ǰ��λ��
rel = diff(neg)~=0;                     %��ŵ�β��λ��
zpf = find(fro==1);                     %��¼����

zpr = find(rel==1)+1;                   %��¼����

try
    zpfr = [zpf; zpr];
catch
    figure
    plot(x,y1,'*');
    hold on
    plot(x,y2,'o');
    axis equal;
end

%������
x0=(x(zpr).*(y2(zpf)-y1(zpf))-x(zpf).*(y2(zpr)-y1(zpr)))./(y1(zpr)+y2(zpf)-y1(zpf)-y2(zpr));
y0=y1(zpf)+(x0-x(zpf)).*(y1(zpr)-y1(zpf))./(x(zpr)-x(zpf));
if any(isnan(y0)), y0=y2(zpf); end
%�����Ѿ��ж�Ϊ���λ��
x0=[x(abs(cy)<=eps) x0].';
y0=[y1(abs(cy)<=eps) y0].';
P = [x0,y0];
%plot(x0,y0,'k.'); %���ƽ���
end