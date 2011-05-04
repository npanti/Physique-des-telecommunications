function Tr = transmission(wall, TX, RX, Pr)
%TRANSMISSION Summary of this function goes here
%   Detailed explanation goes here
    Tr = zeros(size(Pr,3),1);
    %On parcour les chemins de reflexion
    for i=1:+1:size(Pr,3)
        
        first = 1;
        for j=size(Pr,1):-1:0
            
            if j==0 || ~isequal(Pr(j,:,i),[0 0 0])
               
                %Si on tombe sur le premier point de reflexion on prend la
                %droite entre l'émeteur et le premier point de reflexion
                if first == 1 
                    P_tmp = [TX(1) TX(2) Pr(j,1:2,i)];
                
                %Dernier cas on prend le dernier point de réflexion et le récepteur    
                elseif j==0
                    P_tmp = [Pr(j+1,1:2,i) RX(1) RX(2)];
                else
                    P_tmp = [Pr(j,1:2,i) Pr(j+1,1:2,i)];
                end
                
                %On parcoure les murs et on plot le point d'intersection
                for m=5:+1:size(wall,1)
                    
                    P_intersection = intersectionTwoLines(wall(m,:), P_tmp);
                    
                    %Si le point d'intersection se trouve bien sur le
                    %segment du mur et pas la droite formé par le mur
                    %plot(P_intersection(1),P_intersection(2),'.g', 'MarkerSize', 5);
                    if (isIntersectSegment(wall(m,:),P_intersection(1), P_intersection(2)) && isIntersectSegment(P_tmp,P_intersection(1), P_intersection(2)))
                        plot(P_intersection(1),P_intersection(2),'.k', 'MarkerSize', 10);
                    end
                    
                end
                
                first = 0;
            end
            
        end
        
    end

end

