function  diffractionPoints(wall, TX, RX)
%UNTITLED Retourne une matric avec les points de diffraction
%   Retourne un matric avec les points ou la diffraction est possible
    
    %On parcoure les murs
    for i=5: +1: size(wall,1)
        for j=1: +2: 3
            
            wall_x = wall(i,j);
            wall_y = wall(i,j+1);
            z=0;
            y=0;
            x = 0;
            
            for k=1: +1: size(wall,1)
                    
                   if isIntersectSegment(wall(k,:), wall_x, wall_y) && k ~= i
                       z = z + 1;
                       if (wall_x == wall(k,1) && wall_y == wall(k,2)) || (wall_x == wall(k,3) && wall_y == wall(k,4))
                           
                           %Vérifie que la diffraction est possible
                           
                           y = y + 1;
                           x = k;
                       end
                   end
            end
            
            %Si le point se trouve sur l'extrémité d'un mur en contact
            %d'aucun autre
            if z==0
                %plot([TX(1) wall_x RX(1)], [TX(2) wall_y RX(2)], '-g', 'LineWidth', 1);
            end
            
            %Si le point de diffraction est sur le coin d'un mur
            if y==1
                %plot([TX(1) wall_x RX(1)], [TX(2) wall_y RX(2)], '-g', 'LineWidth', 1);
                
                
            end
            
            
        end
    end
end

