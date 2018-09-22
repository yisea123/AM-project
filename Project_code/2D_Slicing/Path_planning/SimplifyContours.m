function [Contours]=SimplifyContours(Contours)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
global ABS_TOL;
for i=1:size(Contours,1)
    Finish=0;
    while Finish==0
        Finish=1;
    for j=1:size(Contours{i,1},1)
        A=[Contours{i,1}(j,3)-Contours{i,1}(j,1) Contours{i,1}(j,4)-Contours{i,1}(j,2)];% vector
        if j==size(Contours{i,1},1)
            line=Contours{i,1}(1,:);
        else
            line=Contours{i,1}(j+1,:);
        end
        B=[line(3)-line(1) line(4)-line(2)];
        A=A/norm(A);
        B=B/norm(B);
        if A*B'>(1-ABS_TOL) % meaning two lines can merge
            Contours{i,1}(j,3)=line(3);
            Contours{i,1}(j,4)=line(4);
            % form the new simplified Contour
            newC=[];
            newN=0;
            if j==size(Contours{i,1},1)
                for nj=2:j
                    newN=newN+1;
                    newC(newN,:)=Contours{i,1}(nj,:);   
                end
            else
                for nj=1:j
                    newN=newN+1;
                    newC(newN,:)=Contours{i,1}(nj,:); 
                end
                for nj=(j+2):size(Contours{i,1},1)
                    newN=newN+1;
                    newC(newN,:)=Contours{i,1}(nj,:); 
                end
            end
            Contours{i,1}=[];
            Contours{i,1}=newC;
            Finish=0;
            break
        end
    end
    end
end
end

