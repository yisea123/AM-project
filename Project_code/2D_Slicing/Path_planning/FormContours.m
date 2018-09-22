function [Contours] = FormContours( segments )
%UNTITLED7 Summary of this function goes here
%Detailed explanation goes here
segments(:,5)=1; % =1 meaning all the line segments havn't been used
Contours={};% cell to represent the contours
numseg=size(segments,1);
noc=0;%number of contours
total=0;% number of total marked lines
global DEBUG;
% check whether ABS_TOL suitable for LOC_TOL
% 1e-3*min Length<LOC_TOL<1e-2*min Length
Length=[];
for i=1:numseg
    Length(i)=norm([segments(i,1)-segments(i,3) segments(i,2)-segments(i,4)]);
end
minLength=min(Length);
LOC_TOL=minLength*0.01;
    
if (DEBUG)
    figure()
    hold on
    axis([min(segments(:,1)) max(segments(:,1)) min(segments(:,2)) max(segments(:,2))])
    title('Forming Contours within a Layer');xlabel('x');ylabel('y');pause
end
while total<numseg
    nol=0;%number of line segments for each contour
    for i=1:numseg % get the first line of the new contour
        if segments(i,5)==1
            noc=noc+1;
            nol=nol+1;
            Contours{noc,1}(nol,:)=segments(i,1:4);
            if (DEBUG)
               plot([segments(i,1) segments(i,3)],[segments(i,2) segments(i,4)]);
               h1=text((segments(i,1)+segments(i,3))/2,(segments(i,2)+segments(i,4))/2,num2str(noc),...
                'edgecolor','b','BackgroundColor',[.4 .5 .9],'fontsize',8);pause; delete(h1);pause
            end
            segments(i,5)=0;%mark the used line
            total=total+1;
            break
        end
    end
    % form the new contour
    Finish=0;
    while Finish==0
        Finish=1;% if no connecting line is found, finish this contour
        for i=1:numseg
            if segments(i,5)==1
                disHead=norm([Contours{noc,1}(nol,3)-segments(i,1) Contours{noc,1}(nol,4)-segments(i,2)]);
                disTail=norm([Contours{noc,1}(nol,3)-segments(i,3) Contours{noc,1}(nol,4)-segments(i,4)]);
                if disHead<LOC_TOL
                    nol=nol+1;
                    total=total+1;
                    Contours{noc,1}(nol,:)=segments(i,1:4);
                    segments(i,5)=0;% mark the used line
                    Finish=0;% keep forming
                    if (DEBUG)
                        plot([segments(i,1) segments(i,3)],[segments(i,2) segments(i,4)]);
                        h1=text((segments(i,1)+segments(i,3))/2,(segments(i,2)+segments(i,4))/2,num2str(noc),...
                        'edgecolor','b','BackgroundColor',[.4 .5 .9],'fontsize',8);pause;delete(h1);pause 
                    end
                    break
                elseif disTail<LOC_TOL
                    nol=nol+1;
                    total=total+1;
                    Contours{noc,1}(nol,:)=[segments(i,3) segments(i,4) segments(i,1) segments(i,2)];
                    segments(i,5)=0;% mark the used line
                    Finish=0;
                    if (DEBUG)
                        plot([segments(i,1) segments(i,3)],[segments(i,2) segments(i,4)]);
                        h1=text((segments(i,1)+segments(i,3))/2,(segments(i,2)+segments(i,4))/2,num2str(noc),...
                        'edgecolor','b','BackgroundColor',[.4 .5 .9],'fontsize',8);pause;delete(h1);pause 
                    end
                    break
                end
            end
        end
    end
end





    



        
               
            
            
        
        
        
        

        

