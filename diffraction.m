function  D = diffraction(wall,RX)
%UNTITLED Retourne une matric avec les points de diffraction
%   Retourne un matric avec les points ou la diffraction est possible
    
    global TX;
    
    D=NaN;
    
    %On parcoure les murs
    for i=5: +1: size(wall,1)
        for j=1: +2: 3
            
            wall_x = wall(i,j);
            wall_y = wall(i,j+1);
            if j==1
                wall_x2 = wall(i,3);
                wall_y2 = wall(i,4);
            else
                wall_x2 = wall(i,1);
                wall_y2 = wall(i,2);
            end
            z = 0;
            y = 0;
            selected_point = 0;
            selected_wall = 0;
            
            for k=1: +1: size(wall,1)
            %Vérifie que la diffraction est possible
                   if isSingleCorner(wall(k,1:4), [wall_x wall_y]) && k ~= i
                       z = z + 1;
                       selected_wall = k;
                       if (wall_x == wall(k,1) && wall_y == wall(k,2))
                           y = y + 1;
                           selected_point = 3;
                       elseif (wall_x == wall(k,3) && wall_y == wall(k,4))
                           y = y + 1;
                           selected_point = 1;
                       end                       
                   end
            end
            
            %Si le point se trouve sur l'extrémité d'un mur en contact
            %d'aucun autre
            if z==0

                   phi1 = angle(TX(1)-wall_x+1i*(TX(2)-wall_y));
                   phi2 = angle(RX(1)-wall_x+1i*(RX(2)-wall_y));
                   
                   delta = pi - (phi2-phi1);
                   
                   
                   if isnan(D)
                       D = [wall_x wall_y delta];
                   else
                       D(1,:,size(D,3)+1) = [wall_x wall_y delta];
                   end
            end
            
            %Si le point de diffraction est sur le coin d'un mur
            if y == 1
                diff = 1;
                %Si le mur est vertical
                if wall_x == wall_x2
                    
                    %Si le mur horizontal part vers la gauche
                    if wall(selected_wall,selected_point) < wall_x
                        
                        %Si on est dans la configuration en _|
                        if wall_y < wall_y2
                            
                            if (TX(1) <= wall_x && TX(2) >= wall_y) || (RX(1) <= wall_x && RX(2) >= wall_y)
                                diff = 0;
                            end
                            
                        %Si on est dans la configuration en _
                        %                                    |
                        else
                            if (TX(1) <= wall_x && TX(2) <= wall_y) || (RX(1) <= wall_x && RX(2) <= wall_y)
                                diff = 0;
                            end
                        end
                    
                    %Si le mur horizontal par vers la droite
                    else
                        
                        %Si on est dans la configuration |_
                        if wall_y < wall_y2
                            
                            if (TX(1) >= wall_x && TX(2) >= wall_y) || (RX(1) >= wall_x && RX(2) >= wall_y)
                                diff = 0;
                            end
                            
                        %Si on est dans la configuration en  _
                        %                                   |
                        else
                            if (TX(1) >= wall_x && TX(2) <= wall_y) || (RX(1) >= wall_x && RX(2) <= wall_y)
                                diff = 0;
                            end
                        end
                        
                    end
                    
                %S'il est horizontal
                else
                    
                    %Le mur vertical part vers le bas
                    if wall(selected_wall,selected_point+1) < wall_y
                       
                        %Si on est dans la configuration  _
                        %                                | 
                        if wall_x < wall_x2
                        
                            if (TX(1) >= wall_x && TX(2) <= wall_y) || (RX(1) >= wall_x && RX(2) <= wall_y)
                                diff = 0;
                            end
                            
                        %Si on est dans la configuration _
                        %                                 |
                        else
                            if (TX(1) <= wall_x && TX(2) <= wall_y) || (RX(1) <= wall_x && RX(2) <= wall_y)
                                diff = 0;
                            end
                        end
                        
                    %Si le mur vertical part vers le haut    
                    else
                        
                        %Si on est dans la configuration |_
                        if wall_x < wall_x2
                        
                            if (TX(1) >= wall_x && TX(2) >= wall_y) || (RX(1) >= wall_x && RX(2) >= wall_y)
                                diff = 0;
                            end
                            
                        %Si on est dans la configuration _|    
                        else
                            if (TX(1) <= wall_x && TX(2) >= wall_y) || (RX(1) <= wall_x && RX(2) >= wall_y)
                                diff = 0;
                            end
                        end
                        
                    end
                    
                end
                
               if diff
                   phi1 = angle(TX(1)-wall_x+1i*(TX(2)-wall_y));
                   phi2 = angle(RX(1)-wall_x+1i*(RX(2)-wall_y));
                   
                   delta = pi - (phi2-phi1);
                   
                   if isnan(D)
                       D = [wall_x wall_y delta];
                   else
                       D(1,:,size(D,3)+1) = [wall_x wall_y delta];
                   end
                   
               end
            end
                    
        end
    end


