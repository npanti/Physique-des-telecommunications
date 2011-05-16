function  diffractionPoints(wall, TX, RX)
%UNTITLED Retourne une matric avec les points de diffraction
%   Retourne un matric avec les points ou la diffraction est possible
    
    %On parcoure les murs
    for i=5: +1: size(wall,1)
        for j=1: +2: 3
            
            wall_x = wall(i,j);
            wall_y = wall(i,j+1);
%           z = 0;
            y = 0;
            diff = 0;
            
            for k=1: +1: size(wall,1)
            %Vérifie que la diffraction est possible
                   if isIntersectSegment(wall(k,:), wall_x, wall_y) && k ~= i
 %                      z = z + 1;
                       if (wall_x == wall(k,1) && wall_y == wall(k,2)) || (wall_x == wall(k,3) && wall_y == wall(k,4))
                           y = y + 1;
                       end                       
                   end
            end
            
            %Si le point se trouve sur l'extrémité d'un mur en contact
            %d'aucun autre
%             if z==0
%                 %plot([TX(1) wall_x RX(1)], [TX(2) wall_y RX(2)], '-g', 'LineWidth', 1);
%             end
            
            %Si le point de diffraction est sur le coin d'un mur
            if y == 1
                diff = 1;
                if (wall_x == wall(k,1) && wall_y == wall(k,2)) 
                    if (wall(k,1) == wall(k,3))                              % mur k vertical
                            if (wall_x < wall(i,j+2))                       % mur xy direction droite
                                if (wall(k,2) < wall(k,4))                  % mur k direction haut
                                    if (TX(1) >= wall_x && TX(2) >= wall_y || RX(1) >= wall_x && RX(2) >= wall_y)  % recepteur ou emetteur plus haut et plus a droite
                                    diff = 0;
                                    end
                                else                                        % mur k direction bas
                                    if (TX(1) >= wall_x && TX(2) <= wall_y || RX(1) >= wall_x && RX(2) <= wall_y)
                                    diff = 0;
                                    end
                                end
                            else                                            % mur xy direction gauche
                                if (wall(k,2) < wall(k,4))                  % mur k direction haut
                                    if (TX(1) <= wall_x && TX(2) >= wall_y || RX(1) <= wall_x && RX(2) >= wall_y)  
                                    diff = 0;
                                    end
                                else                                        % mur k direction bas
                                    if (TX(1) <= wall_x && TX(2) <= wall_y || RX(1) <= wall_x && RX(2) <= wall_y)
                                    diff = 0;
                                    end
                                end
                            end
                    else                                                    % mur horizontal
                            if (wall_x < wall(i,j+2))                       % direction droite
                                if (wall(k,2) < wall(k,4))                  % direction haut
                                    if (TX(1) >= wall_x && TX(2) >= wall_y || RX(1) >= wall_x && RX(2) >= wall_y)  % recepteur ou emetteur plus haut et plus a droite
                                    diff = 0;
                                    end
                                else                                        % direction bas
                                    if (TX(1) >= wall_x && TX(2) <= wall_y || RX(1) >= wall_x && RX(2) <= wall_y)
                                    diff = 0;
                                    end
                                end
                            else                                            % direction gauche
                                if (wall(k,2) < wall(k,4))                  % direction haut
                                    if (TX(1) <= wall_x && TX(2) >= wall_y || RX(1) <= wall_x && RX(2) >= wall_y)  
                                    diff = 0;
                                    end
                                else                                        % direction bas
                                    if (TX(1) <= wall_x && TX(2) <= wall_y || RX(1) <= wall_x && RX(2) <= wall_y)
                                    diff = 0;
                                    end
                                end 
                            end
                    end
                else %if (wall_x == wall(k,3) && wall_y == wall(k,4))
                    if (wall(k,3) == wall(k,1))                              % mur vertical
                            if (wall_x < wall(i,j-2))                       % direction droite
                                if (wall(k,2) < wall(k,4))                  % direction haut
                                    if (TX(1) >= wall_x && TX(2) >= wall_y || RX(1) >= wall_x && RX(2) >= wall_y)  % recepteur ou emetteur plus haut et plus a droite
                                    diff = 0;
                                    end
                                else                                        % direction bas
                                    if (TX(1) >= wall_x && TX(2) <= wall_y || RX(1) >= wall_x && RX(2) <= wall_y)
                                    diff = 0;
                                    end
                                end
                            else                                            % direction gauche
                                if (wall(k,2) < wall(k,4))                  % direction haut
                                    if (TX(1) <= wall_x && TX(2) >= wall_y || RX(1) <= wall_x && RX(2) >= wall_y)  
                                    diff = 0;
                                    end
                                else                                        % direction bas
                                    if (TX(1) <= wall_x && TX(2) <= wall_y || RX(1) <= wall_x && RX(2) <= wall_y)
                                    diff = 0;
                                    end
                                end
                            end
                    else                                                    % mur horizontal
                            if (wall_x < wall(i,j-2))                       % direction droite
                                if (wall(k,2) < wall(k,4))                  % direction haut
                                    if (TX(1) >= wall_x && TX(2) >= wall_y || RX(1) >= wall_x && RX(2) >= wall_y)  % recepteur ou emetteur plus haut et plus a droite
                                        diff = 0;
                                    end
                                else                                        % direction bas
                                    if (TX(1) >= wall_x && TX(2) <= wall_y || RX(1) >= wall_x && RX(2) <= wall_y)
                                        diff = 0;
                                    end
                                end
                            else                                            % direction gauche
                                if (wall(k,2) < wall(k,4))                  % direction haut
                                    if (TX(1) <= wall_x && TX(2) >= wall_y || RX(1) <= wall_x && RX(2) >= wall_y)  
                                    diff = 0;
                                    end
                                else                                        % direction bas
                                    if (TX(1) <= wall_x && TX(2) <= wall_y || RX(1) <= wall_x && RX(2) <= wall_y)
                                    diff = 0;
                                    end
                                end 
                            end
                    end
                end
                if diff
                plot(wall_x, wall_y, '.r', 'MarkerSize', 10);   
                end   
            end                      
        end
    end


