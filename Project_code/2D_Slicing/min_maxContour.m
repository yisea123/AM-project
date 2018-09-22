function   [para, hough_circle, max_contour]=min_maxContour(BW,step_r,step_angle,r_min,r_max,p)   
  % ���������ͶӰ���ҳ�ͶӰ�����ڵ�������С����
  rows=BW(:,1);
  m_max=ceil(max(rows));
  m_min=round(min(rows));
  cols=BW(:,2);
  n_max=ceil(max(cols));
  n_min=round(min(cols));
  %%
  % ����������Ǹ���Ѱ��ɢ�������������
  %dt1 = delaunay(rows,cols);
  dt = delaunayTriangulation(rows,cols);
  %dt=delaunay(v_plnar(:,1),v_plnar(:,2));
  K=convexHull(dt);
  max_contour=[dt.Points(K,1),dt.Points(K,2)];
  hold on
  plot(max_contour(:,1),max_contour(:,2),'r','LineWidth',1);
  %plot(max_contour(:,1),max_contour(:,2),'o')
  hold on
%   triplot(dt1,rows,cols);
  plot(dt.Points(:,1),dt.Points(:,2),'o');
  %%
  % ��С�������Ǹ����ڱ����е�Բ�ļ��ʵ�ֵ�
  %------------------------------�㷨����-----------------------------  
  % ���㷨ͨ��a = x-r*cos(angle)��b = y-r*sin(angle)��Բͼ���еı�Ե��
  % ӳ�䵽�����ռ�(a,b,r)�У�����������ͼ���Ҳ�ȡ�����꣬angle��r��ȡ
  % һ���ķ�Χ�Ͳ���������ͨ������ѭ����angleѭ����rѭ�������ɽ�ԭͼ��
  % �ռ�ĵ�ӳ�䵽�����ռ��У����ڲ����ռ䣨��һ�������С��������ɵ�
  % ��������)��Ѱ��Բ�ģ�Ȼ������뾶���ꡣ
  %-------------------------------------------------------------------
  
  %------------------------------�������-----------------------------
  % BW:��ֵͼ��
  % step_r:����Բ�뾶����
  % step_angle:�ǶȲ�������λΪ����
  % r_min:��СԲ�뾶
  % r_max:���Բ�뾶
  % p:��p*hough_space�����ֵΪ��ֵ��pȡ0��1֮�����
  %-------------------------------------------------------------------
  
  %------------------------------�������-----------------------------
  % hough_space:�����ռ䣬h(a,b,r)��ʾԲ����(a,b)�뾶Ϊr��Բ�ϵĵ���
  % hough_circl:��ֵͼ�񣬼�⵽��Բ
  % para:��⵽��Բ��Բ�ġ��뾶
  %-------------------------------------------------------------------
  %%
  %������������Ĳ�������
  %load BW
  %BW=v_plnar;
  %�������̵ĵ��ڲ���
  %   r_max=40;
  %   r_min=9;
  %   step_r=1;
  %   p=0.8;
  %%
  %[m,n] = size(BW);  
  size_r = round((r_max-r_min)/step_r)+1;  
  size_angle = round(2*pi/step_angle);
  m = m_max - m_min+1;
  n = n_max - n_min+1;
  hough_space = zeros(m,n,size_r);
  %[rows,cols] = find(BW);  
  ecount = size(rows,1);
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Hough�任  
  % ��ͼ��ռ�(x,y)��Ӧ�������ռ�(a,b,r)  
  % a = x-r*cos(angle)  
  % b = y-r*sin(angle)
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  for i=1:ecount  
      for r=1:size_r
          for k=1:size_angle
              a = round(rows(i)-(r_min+(r-1)*step_r)*cos(k*step_angle))-m_min+1;
              b = round(cols(i)-(r_min+(r-1)*step_r)*sin(k*step_angle))-n_min+1;
              if(a>0 && a<=m&&b>0 && b<=n)
                  hough_space(a,b,r) = hough_space(a,b,r)+1;
              end
          end
      end
  end
  % ����������ֵ�ľۼ���  
  max_para = max(max(max(hough_space)));
  index = find(hough_space>=max_para*p);
  length=size(index,1);
  hough_circle={};%����ÿ��Բ�����������ĵ�����
  figure
  for k=1:length
      j=1;
      for i=1:ecount
          par3 = floor(index(k)/(m*n))+1;
          par2 = floor((index(k)-(par3-1)*(m*n))/m)+1;
          par1 = index(k)-(par3-1)*(m*n)-(par2-1)*m;
          par2= par2+n_min-1;
          par1 = par1+m_min-1;
          if((rows(i)-par1)^2+(cols(i)-par2)^2<(r_min+(par3-1)*step_r)^2+20&&...
                  (rows(i)-par1)^2+(cols(i)-par2)^2>(r_min+(par3-1)*step_r)^2-20)
              hough_circle{k}(j,:) = [rows(i) cols(i)];                %�洢��⵽��ÿ��Բ�������ĵ�����
              %plot(hough_circle{k}(j,1),hough_circle{k}(j,2),'*');
              j=j+1;
              hold on
          end
      end
  end
  %�����⵽��Բ�Ĳ���
  for k=1:length  
    par3 = floor(index(k)/(m*n))+1;  
    par2 = floor((index(k)-(par3-1)*(m*n))/m)+1;  
    par1 = index(k)-(par3-1)*(m*n)-(par2-1)*m;  
    par3 = r_min+(par3-1)*step_r;  
    fprintf(1,'Center %d %d radius %d\n',par1,par2,par3);  
    para(:,k) = [par1,par2,par3]';                  %�洢��⵽��Բ����Ҫ����
  end
end
%%
%ȷ��������Χ�������ľ��ε��ĸ�����Ϊ[e3,e1],[e3,e2],[e4,e1],[e4,e2]   
%   e1=floor(x0-r0)-rr;   
%   if   e1<1   
%           e1=1;   
%   end   
%   e2=ceil(x0+r0)+rr;   
%   if   e2>n   
%           e2=n;   
%   end   
%   e3=floor(y0-r0)-rr;   
%   if   e3<1   
%           e3=1;   
%   end   
%   e4=ceil(y0+r0)+rr;   
%   if   e4>m   
%           e4=m;   
%   end   
%   %Hough�任��ͫ������   
%   flag=1;count=0; %flagΪѭ�����Ʊ�����count��¼��������Բ�ϵĵ�   
%   while(flag)   
%     flag=0;   
%     BW2=zeros(m,n); %��0����BW2����BW2Ϊ�任�ռ�   
%     for   j=e1:e2                           
%        for   i=e3:e4
%            for index=1:1:m
%                k=(j-x0)^2+(i-y0)^2-r0^2;
%            end
%            if   BW1(i,j)==1  %��������Χ���ҵ�һ��ֵΪ1��   
%                   k=(j-x0)^2+(i-y0)^2-r0^2;               
%                   if   k>-1600&k<1600                             %���������Ч����   
%                       real=j-x0;imag=y0-i;   
%                       theta=atan2(imag,real);         %thetaΪBW1(i,j)�����(x0,y0)��Բ�Ľ�   
%                       ii=round(i+r0*sin(theta));jj=round(j-r0*cos(theta));   
%                       %BW2(ii,jj)Ϊ��BW1(i,j)��ȷ����Բ�ĵ�λ��   
%                       BW2(ii,jj)=BW2(ii,jj)+1;   
%                   end   
%             end   
%         end   
%     end   
%     A=max(BW2);%BW2�еĸ������ֵ�������A   
%     count1=max(A);                   %count1ΪA�е����ֵ   
%     if   count1>=count               %�������ֵ�ϴ�ʱ������ֵ����ԭ����countֵ,����r��1����һ��   
%           count=count1;   
%           r0=r0-1;   
%           BW3=BW2;   
%           flag=1;   
%     end           
%   end   
%   [y,x]=find(BW3==count);           %���ֵ��λ������   
%   n=length(y);   
%   if   n>1                                             %���ֵ��λ�����겻Ψһʱȡ����λ�õ�����ƽ��ֵ                           
%           yy=sum(y)/n;   
%           xx=sum(x)/n;   
%           y=yy;   
%           x=xx;   
%   end   
%   r=r0+1;                                           %��λ�İ뾶   
%   return;   
%%  
