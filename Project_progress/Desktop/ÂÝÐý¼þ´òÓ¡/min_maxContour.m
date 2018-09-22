function   [para, hough_circle, max_contour]=min_maxContour(BW,step_r,step_angle,r_min,r_max,p)   
  % 根据输入的投影点找出投影点所在的最大和最小轮廓
  rows=BW(:,1);
  m_max=ceil(max(rows));
  m_min=round(min(rows));
  cols=BW(:,2);
  n_max=ceil(max(cols));
  n_min=round(min(cols));
  %%
  k=boundary(rows,cols);
  max_contour=[rows(k),cols(k)];
  %plot(dt.Points(K,1),dt.Points(K,2),'r','LineWidth',2);
  
  
  
  %%
  % 最小内轮廓是根据在本例中的圆的检测实现的
  %------------------------------算法概述-----------------------------  
  % 该算法通过a = x-r*cos(angle)，b = y-r*sin(angle)将圆图像中的边缘点
  % 映射到参数空间(a,b,r)中，由于是数字图像且采取极坐标，angle和r都取
  % 一定的范围和步长，这样通过两重循环（angle循环和r循环）即可将原图像
  % 空间的点映射到参数空间中，再在参数空间（即一个由许多小立方体组成的
  % 大立方体)中寻找圆心，然后求出半径坐标。
  %-------------------------------------------------------------------
  
  %------------------------------输入参数-----------------------------
  % BW:二值图像；
  % step_r:检测的圆半径步长
  % step_angle:角度步长，单位为弧度
  % r_min:最小圆半径
  % r_max:最大圆半径
  % p:以p*hough_space的最大值为阈值，p取0，1之间的数
  %-------------------------------------------------------------------
  
  %------------------------------输出参数-----------------------------
  % hough_space:参数空间，h(a,b,r)表示圆心在(a,b)半径为r的圆上的点数
  % hough_circl:二值图像，检测到的圆
  % para:检测到的圆的圆心、半径
  %-------------------------------------------------------------------
  %%
  %搜索过程所需的参数设置
  %load BW
  %BW=v_plnar;
  %搜索过程的调节参数
  r_max=40;
  r_min=9;
  step_r=1;
  step_angle=0.01;
  p=0.8;
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
  % Hough变换  
  % 将图像空间(x,y)对应到参数空间(a,b,r)  
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
  % 搜索超过阈值的聚集点  
  max_para = max(max(max(hough_space)));
  index = find(hough_space>=max_para*p);
  length=size(index,1);
  hough_circle={};%画出每个圆轮廓所包含的点坐标
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
              hough_circle{k}(j,:) = [rows(i) cols(i)];                %存储检测到的每个圆所包含的点坐标
              %plot(hough_circle{k}(j,1),hough_circle{k}(j,2),'*');
              j=j+1;
              hold on
          end
      end
  end
  %输出检测到的圆的参数
  for k=1:length  
    par3 = floor(index(k)/(m*n))+1;  
    par2 = floor((index(k)-(par3-1)*(m*n))/m)+1;  
    par1 = index(k)-(par3-1)*(m*n)-(par2-1)*m;  
    par3 = r_min+(par3-1)*step_r;  
    fprintf(1,'Center %d %d radius %d\n',par1,par2,par3);  
    para(:,k) = [par1,par2,par3]';                  %存储检测到的圆的主要参数
  end
end
%%
%确定搜索范围，搜索的矩形的四个定点为[e3,e1],[e3,e2],[e4,e1],[e4,e2]   
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
%   %Hough变换求瞳孔中心   
%   flag=1;count=0; %flag为循环控制变量，count记录落在所得圆上的点   
%   while(flag)   
%     flag=0;   
%     BW2=zeros(m,n); %设0矩阵BW2，以BW2为变换空间   
%     for   j=e1:e2                           
%        for   i=e3:e4
%            for index=1:1:m
%                k=(j-x0)^2+(i-y0)^2-r0^2;
%            end
%            if   BW1(i,j)==1  %在搜索范围内找到一个值为1点   
%                   k=(j-x0)^2+(i-y0)^2-r0^2;               
%                   if   k>-1600&k<1600                             %这个点在有效区内   
%                       real=j-x0;imag=y0-i;   
%                       theta=atan2(imag,real);         %theta为BW1(i,j)相对于(x0,y0)的圆心角   
%                       ii=round(i+r0*sin(theta));jj=round(j-r0*cos(theta));   
%                       %BW2(ii,jj)为以BW1(i,j)的确定的圆心的位置   
%                       BW2(ii,jj)=BW2(ii,jj)+1;   
%                   end   
%             end   
%         end   
%     end   
%     A=max(BW2);%BW2中的各列最大值组成向量A   
%     count1=max(A);                   %count1为A中的最大值   
%     if   count1>=count               %当求出的值较大时，用新值代替原来的count值,并将r减1再求一次   
%           count=count1;   
%           r0=r0-1;   
%           BW3=BW2;   
%           flag=1;   
%     end           
%   end   
%   [y,x]=find(BW3==count);           %最大值的位置坐标   
%   n=length(y);   
%   if   n>1                                             %最大值的位置坐标不唯一时取所有位置的算术平均值                           
%           yy=sum(y)/n;   
%           xx=sum(x)/n;   
%           y=yy;   
%           x=xx;   
%   end   
%   r=r0+1;                                           %定位的半径   
%   return;   
%%  
