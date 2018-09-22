function [boundary] = Get_boundary( F, V, N, toc_theta)
% 找出模型的边界
% Input:the file of STL:F ,V ,N 
%       角度阈值toc_theta       
% Output:the matrix of the points on the boundary:
[fnum,n]=size(F);
fv=(reshape(V', 9,[]))';
fv(:,10)=1;%%创建一个使用标签
total=1;
%toc_theta=20;%%两个面二面角的阈值
boundary=[];
num_bou=1;
%求出交线点
while (total<=fnum)
    facet_first=fv(total,:);%%被比较面片
    n2=N(total,:);
    fv(total,10)=0;
    for i=1:1:fnum
        if fv(i,10)==1
            n1=N(i,:);
            %%找相邻的面片并且判断相邻的二面角
            for j=1:3:7
                %验证第一个点是否和目前选择的面的第一个点相等
                if(fv(i,j:j+2)==facet_first(:,1:3))
                    if(j==1)
                        if(fv(i,j+3:j+5)==facet_first(:,4:6)|fv(i,j+6:j+8)==facet_first(:,4:6))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(4:6)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                        if(fv(i,j+3:j+5)==facet_first(:,7:9)|fv(i,j+6:j+8)==facet_first(:,7:9))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                    end
                    if(j==4)
                        if(fv(i,j+3:j+5)==facet_first(:,4:6)|fv(i,j-3:j-1)==facet_first(:,4:6))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(4:6)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                        if(fv(i,j+3:j+5)==facet_first(:,7:9)|fv(i,j-3:j-1)==facet_first(:,7:9))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                    end
                    if(j==7)
                        if(fv(i,j-6:j-4)==facet_first(:,4:6)|fv(i,j-3:j-1)==facet_first(:,4:6))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(4:6)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                        if(fv(i,j-6:j-4)==facet_first(:,7:9)|fv(i,j-3:j-1)==facet_first(:,7:9))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                    end
                end
                %验证第一个点是否和目前选择的面的第二个点相等
                if(fv(i,j:j+2)==facet_first(:,4:6))
                    if(j==1)
                        if(fv(i,j+3:j+5)==facet_first(:,1:3)|fv(i,j+6:j+8)==facet_first(:,1:3))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(4:6)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                        if(fv(i,j+3:j+5)==facet_first(:,7:9)|fv(i,j+6:j+8)==facet_first(:,7:9))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(4:6) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                    end
                    if(j==4)
                        if(fv(i,j+3:j+5)==facet_first(:,1:3)|fv(i,j-3:j-1)==facet_first(:,1:3))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(4:6)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                        if(fv(i,j+3:j+5)==facet_first(:,7:9)|fv(i,j-3:j-1)==facet_first(:,7:9))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(4:6) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                    end
                    if(j==7)
                        if(fv(i,j-6:j-4)==facet_first(:,1:3)|fv(i,j-3:j-1)==facet_first(:,1:3))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(4:6)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                        if(fv(i,j-6:j-4)==facet_first(:,7:9)|fv(i,j-3:j-1)==facet_first(:,7:9))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(4:6) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                    end
                end
                %验证第一个点是否和目前选择的面的第三个点相等
                if(fv(i,j:j+2)==facet_first(:,7:9))
                    if(j==1)
                        if(fv(i,j+3:j+5)==facet_first(:,4:6)|fv(i,j+6:j+8)==facet_first(:,4:6))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(4:6) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                        if(fv(i,j+3:j+5)==facet_first(:,1:3)|fv(i,j+6:j+8)==facet_first(:,1:3))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                    end
                    if(j==4)
                        if(fv(i,j+3:j+5)==facet_first(:,4:6)|fv(i,j-3:j-1)==facet_first(:,4:6))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(4:6) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                        if(fv(i,j+3:j+5)==facet_first(:,1:3)|fv(i,j-3:j-1)==facet_first(:,1:3))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                    end
                    if(j==7)
                        if(fv(i,j-6:j-4)==facet_first(:,4:6)|fv(i,j-3:j-1)==facet_first(:,4:6))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(4:6) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                        if(fv(i,j-6:j-4)==facet_first(:,1:3)|fv(i,j-3:j-1)==facet_first(:,1:3))
                            theta=dot(n1,n2)/(norm(n1)*norm(n2));
                            rad_theta=rad2deg(acos(theta));
                            if(rad_theta>toc_theta)
                                boundary(num_bou,:)=[facet_first(1:3) facet_first(7:9)];
                                num_bou=num_bou+1;
                                break;
                            end
                        end
                    end
                end
            end
        end
    end
    total=total+1;
end