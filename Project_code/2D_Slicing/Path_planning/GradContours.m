function [ Contours ] = GradContours( Contours )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(Contours);
    x_max(i)=max(Contours{i,1}(:,1));
    x_min(i)=min(Contours{i,1}(:,1));
    y_max(i)=max(Contours{i,1}(:,2));
    y_min(i)=min(Contours{i,1}(:,2));
end
xmax=max(x_max);
xmin=min(x_min);
ymax=max(y_max);
ymin=min(y_min);
for i=1:length(Contours);
    if xmax==x_max(i)& xmin==x_min(i)&ymax==y_max(i)&ymin==y_min(i);
        Con=Contours{i,1};
        % find the top point
        [ a b]=size(Con);
        ytop=ymax;
        xtop=xmax;
        for j=1:a;
            if ytop==Con(j,2)&Con(j,1)<xtop;
                xtop=Con(j,1);
            end
        end
        % find the first line segment in Contour{i,1}
        k=1;
        while k<=a;
            if Con(k,1)==xtop&Con(k,2)==ytop;
                if k==1;
                    point1=[Con(1,1) Con(1,2)];
                    point2=[Con(1,3) Con(1,4)];
                    point3=[Con(a,1) Con(a,2)];
                else
                    point1=[Con(k,1) Con(k,2)];
                    point2=[Con(k,3) Con(k,4)];
                    point3=[Con(k-1,1) Con(k-1,2)];
                end
                x1=point2(1)-point1(1);
                y1=point2(2)-point1(2);
                x2=point3(1)-point1(1);
                y2=point3(2)-point1(2);
                R=x1*y2-x2*y1;
                if R<0;
                    Contours{i,1}(1,:)=[xtop ytop Con(k,3) Con(k,4)];
                    for j=2:a;
                        n=k+j-1;
                        if n>a; 
                            n=n-a;
                        end
                        Contours{i,1}(j,:)=Con(n,:);
                    end
                else
                    Contours{i,1}(1,:)=[xtop ytop point3(1) point3(2)];
                    for j=2:a;
                        n=k-j;
                        if n<=0; 
                            n=n+a;
                        end
                        Contours{i,1}(j,:)=[Con(n,3) Con(n,4) Con(n,1) Con(n,2)];
                    end
                end
                k=a;
            end
            k=k+1;
        end 
    else
       Con=Contours{i,1};
        % find the top point
        [ a b]=size(Con);
        ytop=y_max(i);
        xtop=x_max(i);
        for j=1:a;
            if ytop==Con(j,2)&Con(j,1)<xtop;
                xtop=Con(j,1);
            end
        end
        % find the first line segment in Contour{i,1}
        k=1;
        while k<=a;
            if Con(k,1)==xtop&Con(k,2)==ytop;
                if k==1;
                    point1=[Con(1,1) Con(1,2)];
                    point2=[Con(1,3) Con(1,4)];
                    point3=[Con(a,1) Con(a,2)];
                else
                    point1=[Con(k,1) Con(k,2)];
                    point2=[Con(k,3) Con(k,4)];
                    point3=[Con(k-1,1) Con(k-1,2)];
                end
                x1=point2(1)-point1(1);
                y1=point2(2)-point1(2);
                x2=point3(1)-point1(1);
                y2=point3(2)-point1(2);
                R=x1*y2-x2*y1;
                if R>0;
                    Contours{i,1}(1,:)=[xtop ytop Con(k,3) Con(k,4)];
                    for j=2:a;
                        n=k+j-1;
                        if n>a; 
                            n=n-a;
                        end
                        Contours{i,1}(j,:)=Con(n,:);
                    end
                else
                    Contours{i,1}(1,:)=[xtop ytop point3(1) point3(2)];
                    for j=2:a;
                        n=k-j;
                        if n<=0; 
                            n=n+a;
                        end
                        Contours{i,1}(j,:)=[Con(n,3) Con(n,4) Con(n,1) Con(n,2)];
                    end
                end
                k=a;
            end
            k=k+1;
        end 
    end
end
% transfer to the left zoom rule
NewC=Contours;
for i=1:size(Contours,1)
    a=size(Contours{i,1},1);
    for j=1:a
        NewC{i,1}(j,:)=[Contours{i,1}(a+1-j,3) Contours{i,1}(a+1-j,4) Contours{i,1}(a+1-j,1) Contours{i,1}(a+1-j,2)];
    end
end
Contours=NewC;







