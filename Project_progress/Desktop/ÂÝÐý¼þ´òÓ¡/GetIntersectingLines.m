function  [segments]  = GetIntersectingLines( fnum,fv,z )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
segments=[];
numseg=0;
global ABS_TOL;
global DEBUG;
if (DEBUG)
    figure()
    hold on
    xL=max(fv(:,1))-min(fv(:,1));
    yL=max(fv(:,2))-min(fv(:,2));
    zL=max(fv(:,3))-min(fv(:,3));
    axis([min(fv(:,1))-xL/10 max(fv(:,1))+xL/10 min(fv(:,2))-yL/10 max(fv(:,2))+yL/10 min(fv(:,3))-zL/10 max(fv(:,3))+zL/10]);
    xlabel('x');ylabel('y');zlabel('z');title('Getting intersection segments');pause
end
zmin=z-ABS_TOL;
zmax=z+ABS_TOL;
% count the intersection lines
j=0;
prej=j;
for i=1:fnum
    prej=j;
    % one line lies on the slicing plane
    if fv(i,3)>zmax&fv(i,6)>zmin& fv(i,6)<zmax&fv(i,9)>zmin& fv(i,9)<zmax
        j=j+1;
        segments(j,1)=fv(i,4);
        segments(j,2)=fv(i,5);
        segments(j,3)=fv(i,7);
        segments(j,4)=fv(i,8);
    elseif fv(i,6)>zmax&fv(i,3)>zmin& fv(i,3)<zmax&fv(i,9)>zmin& fv(i,9)<zmax
        j=j+1;
        segments(j,1)=fv(i,1);
        segments(j,2)=fv(i,2);
        segments(j,3)=fv(i,7);
        segments(j,4)=fv(i,8);
    elseif fv(i,9)>zmax&fv(i,3)>zmin& fv(i,3)<zmax&fv(i,6)>zmin& fv(i,6)<zmax
        j=j+1;
        segments(j,1)=fv(i,1);
        segments(j,2)=fv(i,2);
        segments(j,3)=fv(i,4);
        segments(j,4)=fv(i,5);
    end
    
    % one vertex lies on the plane
    if fv(i,3)>zmin&fv(i,3)<zmax&fv(i,6)>zmax&fv(i,9)<zmin
        j=j+1;
        segments(j,1)=fv(i,1);
        segments(j,2)=fv(i,2);
        segments(j,3)=fv(i,7)+(fv(i,4)-fv(i,7))*(z-fv(i,9))/(fv(i,6)-fv(i,9));
        segments(j,4)=fv(i,8)+(fv(i,5)-fv(i,8))*(z-fv(i,9))/(fv(i,6)-fv(i,9));
    elseif fv(i,3)>zmin&fv(i,3)<zmax&fv(i,9)>zmax&fv(i,6)<zmin
        j=j+1;
        segments(j,1)=fv(i,1);
        segments(j,2)=fv(i,2);
        segments(j,3)=fv(i,4)+(fv(i,7)-fv(i,4))*(z-fv(i,6))/(fv(i,9)-fv(i,6));
        segments(j,4)=fv(i,5)+(fv(i,8)-fv(i,5))*(z-fv(i,6))/(fv(i,9)-fv(i,6));
    elseif fv(i,6)>zmin&fv(i,6)<zmax&fv(i,3)>zmax&fv(i,9)<zmin
        j=j+1;
        segments(j,1)=fv(i,7)+(fv(i,1)-fv(i,7))*(z-fv(i,9))/(fv(i,3)-fv(i,9));
        segments(j,2)=fv(i,8)+(fv(i,2)-fv(i,8))*(z-fv(i,9))/(fv(i,3)-fv(i,9));
        segments(j,3)=fv(i,4);
        segments(j,4)=fv(i,5);
    elseif fv(i,6)>zmin&fv(i,6)<zmax&fv(i,9)>zmax&fv(i,3)<zmin
        j=j+1;
        segments(j,1)=fv(i,1)+(fv(i,7)-fv(i,1))*(z-fv(i,3))/(fv(i,9)-fv(i,3));
        segments(j,2)=fv(i,2)+(fv(i,8)-fv(i,2))*(z-fv(i,3))/(fv(i,9)-fv(i,3));
        segments(j,3)=fv(i,4);
        segments(j,4)=fv(i,5);
    elseif fv(i,9)>zmin&fv(i,9)<zmax&fv(i,6)>zmax&fv(i,3)<zmin
        j=j+1;
        segments(j,1)=fv(i,1)+(fv(i,4)-fv(i,1))*(z-fv(i,3))/(fv(i,6)-fv(i,3));
        segments(j,2)=fv(i,2)+(fv(i,5)-fv(i,2))*(z-fv(i,3))/(fv(i,6)-fv(i,3));
        segments(j,3)=fv(i,7);
        segments(j,4)=fv(i,8);
    elseif fv(i,9)>zmin&fv(i,9)<zmax&fv(i,3)>zmax&fv(i,6)<zmin
        j=j+1;
        segments(j,1)=fv(i,4)+(fv(i,1)-fv(i,4))*(z-fv(i,6))/(fv(i,3)-fv(i,6));
        segments(j,2)=fv(i,5)+(fv(i,2)-fv(i,5))*(z-fv(i,6))/(fv(i,3)-fv(i,6));
        segments(j,3)=fv(i,7);
        segments(j,4)=fv(i,8);
    end
    % one vertex up  & two vertexes down
    if fv(i,3)>zmax&fv(i,6)<zmin&fv(i,9)<zmin
        j=j+1;
        segments(j,1)=fv(i,4)+(fv(i,1)-fv(i,4))*(z-fv(i,6))/(fv(i,3)-fv(i,6));
        segments(j,2)=fv(i,5)+(fv(i,2)-fv(i,5))*(z-fv(i,6))/(fv(i,3)-fv(i,6));
        segments(j,3)=fv(i,7)+(fv(i,1)-fv(i,7))*(z-fv(i,9))/(fv(i,3)-fv(i,9));
        segments(j,4)=fv(i,8)+(fv(i,2)-fv(i,8))*(z-fv(i,9))/(fv(i,3)-fv(i,9));
    elseif fv(i,6)>zmax&fv(i,3)<zmin&fv(i,9)<zmin
        j=j+1;
        segments(j,1)=fv(i,1)+(fv(i,4)-fv(i,1))*(z-fv(i,3))/(fv(i,6)-fv(i,3));
        segments(j,2)=fv(i,2)+(fv(i,5)-fv(i,2))*(z-fv(i,3))/(fv(i,6)-fv(i,3));
        segments(j,3)=fv(i,7)+(fv(i,4)-fv(i,7))*(z-fv(i,9))/(fv(i,6)-fv(i,9));
        segments(j,4)=fv(i,8)+(fv(i,5)-fv(i,8))*(z-fv(i,9))/(fv(i,6)-fv(i,9));
    elseif fv(i,9)>zmax&fv(i,6)<zmin&fv(i,3)<zmin
        j=j+1;
        segments(j,1)=fv(i,4)+(fv(i,7)-fv(i,4))*(z-fv(i,6))/(fv(i,9)-fv(i,6));
        segments(j,2)=fv(i,5)+(fv(i,8)-fv(i,5))*(z-fv(i,6))/(fv(i,9)-fv(i,6));
        segments(j,3)=fv(i,1)+(fv(i,7)-fv(i,1))*(z-fv(i,3))/(fv(i,9)-fv(i,3));
        segments(j,4)=fv(i,2)+(fv(i,8)-fv(i,2))*(z-fv(i,3))/(fv(i,9)-fv(i,3));
    end
    % two vertexes up & one vertex down
    if fv(i,3)>zmax&fv(i,6)>zmax&fv(i,9)<zmin
        j=j+1;
        segments(j,1)=fv(i,7)+(fv(i,1)-fv(i,7))*(z-fv(i,9))/(fv(i,3)-fv(i,9));
        segments(j,2)=fv(i,8)+(fv(i,2)-fv(i,8))*(z-fv(i,9))/(fv(i,3)-fv(i,9));
        segments(j,3)=fv(i,7)+(fv(i,4)-fv(i,7))*(z-fv(i,9))/(fv(i,6)-fv(i,9));
        segments(j,4)=fv(i,8)+(fv(i,5)-fv(i,8))*(z-fv(i,9))/(fv(i,6)-fv(i,9));
    elseif fv(i,6)>zmax&fv(i,3)<zmin&fv(i,9)>zmax
        j=j+1;
        segments(j,1)=fv(i,1)+(fv(i,4)-fv(i,1))*(z-fv(i,3))/(fv(i,6)-fv(i,3));
        segments(j,2)=fv(i,2)+(fv(i,5)-fv(i,2))*(z-fv(i,3))/(fv(i,6)-fv(i,3));
        segments(j,3)=fv(i,1)+(fv(i,7)-fv(i,1))*(z-fv(i,3))/(fv(i,9)-fv(i,3));
        segments(j,4)=fv(i,2)+(fv(i,8)-fv(i,2))*(z-fv(i,3))/(fv(i,9)-fv(i,3));
    elseif fv(i,9)>zmax&fv(i,6)<zmin&fv(i,3)>zmax
        j=j+1;
        segments(j,1)=fv(i,4)+(fv(i,7)-fv(i,4))*(z-fv(i,6))/(fv(i,9)-fv(i,6));
        segments(j,2)=fv(i,5)+(fv(i,8)-fv(i,5))*(z-fv(i,6))/(fv(i,9)-fv(i,6));
        segments(j,3)=fv(i,4)+(fv(i,1)-fv(i,4))*(z-fv(i,6))/(fv(i,3)-fv(i,6));
        segments(j,4)=fv(i,5)+(fv(i,2)-fv(i,5))*(z-fv(i,6))/(fv(i,3)-fv(i,6));
    end
    numseg=j;
    if (DEBUG)
        if j>prej
            plot3([fv(i,1) fv(i,4) fv(i,7) fv(i,1)],[fv(i,2) fv(i,5) fv(i,8) fv(i,2)],[fv(i,3) fv(i,6) fv(i,9) fv(i,3)],'b');pause
            plot3([segments(j,1) segments(j,3)],[segments(j,2) segments(j,4)],[z z],'r');
            text((segments(j,1)+segments(j,3))/2,(segments(j,2)+segments(j,4))/2,z,num2str(j),...
                'edgecolor','b','BackgroundColor',[.4 .5 .9],'fontsize',8);pause
        end
    end
end

% eliminate 0 length segment
tempSeg=[];
for it=1:size(segments,1)
    if norm([segments(it,1)-segments(it,3) segments(it,2)-segments(it,4)])~=0
        tempSeg(end+1,:)=segments(it,:);
    end
end
segments=tempSeg;