function [P] = Find_inersectdePoints(X1 ,Y1, X2 ,Y2)
% Input: the two matrix of the two contours;
% Output: the intersecting points; P 
if max(X1)<min(X2) || max(X2)<min(X1)
    P=[];       % 两个区间没有重叠，不可能有交点
    return;
end
%%
% First divide the closed curve into two parts;
% Next solve the two parts with the curve; 
n = length(X1);
x_start = min(X1);
%y_strat =M(x_start,1);
x_end = max(X1);
%y_end =M(x_end,1);
Up_S = find(X1==x_start);
Up_E = find(X1==x_end);
if Up_S<Up_E
    X_part1 = [X1(1:Up_S);X1(Up_E:n)];
    Y_part1 = [Y1(1:Up_S);Y1(Up_E:n)];
%     plot(X_part1,Y_part1,'*');
%     hold on
    X_part2 = X1(Up_S:Up_E);
    Y_part2 = Y1(Up_S:Up_E);
%     plot(X_part2,Y_part2,'o');
elseif Up_S>Up_E
    X_part1 = [X1(1:Up_E);X1(Up_S:n)];
    Y_part1 = [Y1(1:Up_E);Y1(Up_S:n)];
%     plot(X_part1,Y_part1,'*');
%     hold on
    X_part2 = X1(Up_E:Up_S);
    Y_part2 = Y1(Up_E:Up_S);
%     plot(X_part2,Y_part2,'o');
else
        return;
end

[P1] = Solve_intersectedPoints(X_part1, Y_part1, X2, Y2);
[P2] = Solve_intersectedPoints(X_part2, Y_part2, X2, Y2);
P =[P1;P2];
end

