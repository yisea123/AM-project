function R = Rotation_matrix(ax1, ax2)
% ´Óax1Ðý×ªµ½ax2
% ax1 = R * ax2
%     Get rotation matrix by vectors before and after rotation
%     http://www.cnblogs.com/xpvincent/archive/2013/02/15/2912836.html
% example:
% fn: face norm;
% Rot_2align=mRotateAx2Ax(fn,[0;0;1]);
% Tra_2align=[0;0;0]-pp;
% pc_aligned=inv(Rot_2align)*(pc+Tra_2align*ones(1,size(pc,2)));
% pcshow(pointCloud(pc_aligned'))
ax1=ax1/norm(ax1); ax2=ax2/norm(ax2);    
theta = acos(dot(ax2,ax1));
    u = cross(ax2,ax1); u = u/norm(u);
    R(1,1) = cos(theta) + u(1) * u(1) * (1 - cos(theta));
    R(1,2) = u(1) * u(2) * (1 - cos(theta)) - u(3) * sin(theta);
    R(1,3) = u(2) * sin(theta) + u(1) * u(3) * (1 - cos(theta));
    R(2,1) = u(3) * sin(theta) + u(1) * u(2) * (1 - cos(theta));
    R(2,2) = cos(theta) + u(2) * u(2) * (1 - cos(theta));
    R(2,3) = -u(1) * sin(theta) + u(2) * u(3) * (1 - cos(theta));
    R(3,1)= -u(2) * sin(theta) + u(1) * u(3) * (1 - cos(theta));
    R(3,2) = u(1) * sin(theta) + u(2) *u(3) * (1 - cos(theta));
    R(3,3) = cos(theta) + u(3) * u(3) * (1 - cos(theta));
end