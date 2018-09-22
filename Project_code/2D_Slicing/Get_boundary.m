function [boundary] = Get_boundary( F, V, N, toc_theta)
% �ҳ�ģ�͵ı߽�
% Input:the file of STL:F ,V ,N 
%       �Ƕ���ֵtoc_theta       
% Output:the matrix of the points on the boundary:
fnum = size(F,1);
fv=(reshape(V', 9,[]))';
fv(:,10)=1;%%����һ��ʹ�ñ�ǩ
total=1;
%toc_theta=20;%%���������ǵ���ֵ
boundary=[];
num_bou=1;
%������ߵ�
while (total<=fnum)
    facet_first=fv(total,:);%%���Ƚ���Ƭ
    n2=N(total,:);
    fv(total,10)=0;
    for i=1:1:fnum
        if fv(i,10)==1
            n1=N(i,:);
            %%�����ڵ���Ƭ�����ж����ڵĶ����
            for j=1:3:7
                %��֤��һ�����Ƿ��Ŀǰѡ�����ĵ�һ�������
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
                %��֤��һ�����Ƿ��Ŀǰѡ�����ĵڶ��������
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
                %��֤��һ�����Ƿ��Ŀǰѡ�����ĵ����������
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