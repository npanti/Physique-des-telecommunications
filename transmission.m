function Tr = transmission(wall, TX, RX, Pr)
%TRANSMISSION Summary of this function goes here
%   Detailed explanation goes here
    Tr = ones(size(Pr,3),1);
    %On parcour les chemins de reflexion
    for i=1:+1:size(Pr,3)
        
        first = 1;
        for j=size(Pr,1):-1:0
            
            if j==0 || ~isequal(Pr(j,:,i),[0 0 0 0])
               
                %Si on tombe sur le premier point de reflexion on prend la
                %droite entre l'émeteur et le premier point de reflexion
                if first == 1 
                    P_tmp = [TX(1) TX(2) Pr(j,1:2,i)];
                    except_wall = Pr(j,3,i);
                
                %Dernier cas on prend le dernier point de réflexion et le récepteur    
                elseif j==0
                    P_tmp = [Pr(j+1,1:2,i) RX(1) RX(2)];
                    except_wall = Pr(j+1,3,i);
                else
                    P_tmp = [Pr(j,1:2,i) Pr(j+1,1:2,i)];
                    except_wall = [Pr(j,3,i) Pr(j+1,3,i)];
                end
                
                %On parcoure les murs et on plot le point d'intersection
                for m=5:+1:size(wall,1)
                    
                    %On ne calcule pas de transmission sur le mur ou il y a
                    %eu reflexion
                    pass = 0;
                    if size(except_wall,2) == 1
                        if except_wall == m
                            pass = 1;
                        end
                    elseif size(except_wall,2) == 2
                        if except_wall(1,1) == m || except_wall(1,2) == m
                            pass = 1;
                        end
                    end
                    
                    if ~pass
                        
                        P_intersection = intersectionTwoLines(wall(m,1:4), P_tmp);

                        %Si le point d'intersection se trouve bien sur le
                        %segment du mur et pas la droite formé par le mur
                        if (P_intersection(1) ~= P_tmp(1) && P_intersection(2) ~= P_tmp(2)) || (P_intersection(1) ~= P_tmp(3) && P_intersection(2) ~= P_tmp(4))
                            if (isIntersectSegment(wall(m,1:4),P_intersection(1), P_intersection(2)) && isIntersectSegment(P_tmp,P_intersection(1), P_intersection(2)))
                                %plot(P_intersection(1),P_intersection(2),'.k', 'MarkerSize', 10);

                                theta_i = angleBetweenTwoLines(wall(m,1:4),P_tmp);

                                Tr(i) = Tr(i)*coef_transmission(wall(m,5),wall(m,6), wall(m,7),theta_i);

                            end
                        end
                    end
                    
                end
                
                first = 0;
            end
            
        end
        
    end

end

