function raytracing(init_point, wall, TX, RX, reflexion_max, varargin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

reflex_i = 1;

if size(varargin, 2) >= 1
    reflex_i = varargin{1};
    
    if size(varargin, 2) >= 2
       P_i = varargin{2}; 
       
       if size(varargin, 2) >= 3
          wallArrayPos = varargin{3}; 
       end
       
    end
    
end

    

    Xmax = max([wall(:,1) wall(:,3)]);
    Ymax = max([wall(:,2) wall(:,4)]);
    
    %Déplacement du point vers les x positif
    for Xp = init_point(1) : +1 : Xmax(1)
    
        Yp = init_point(2);
        
        %On parcour tout les murs
        for i=1: +1: size(wall,1)
            
            %On vérifie si le point de parcour se trouve sur une droite
            %formé par les murs
            if isIntersectWall(wall(i,:),Xp,Yp, 0)
                
                if reflex_i == 1
                    Pi_x = TX(1) + 2*abs(Xp - TX(1));
                    Pi_y = TX(2);
                    Pi_tmp = [Pi_x Pi_y];
                    wallArrayPos_tmp = i;
                else
                    Pi_x = P_i(reflex_i-1,1) + 2*abs(Xp - P_i(reflex_i-1,1));
                    Pi_y = P_i(reflex_i-1,2);
                    Pi_tmp = vertcat(P_i, [Pi_x Pi_y]);
                    wallArrayPos_tmp = vertcat(wallArrayPos, i);
                end
                
                %On lance le tracing
                reflexion(wall, TX, RX, 0, Pi_tmp, reflex_i, reflex_i, wallArrayPos_tmp);
                
                %On relance la fonction pour la réflexion suivante
                if reflex_i + 1 <= reflexion_max
                    raytracing([Pi_x Pi_y], wall, TX, RX, reflexion_max, reflex_i + 1, Pi_tmp, wallArrayPos_tmp);
                end
                
            end
            
        end

    end

    for Xp = init_point(1) : -1 : 0

        Yp = init_point(2);

        for i=1: +1: size(wall,1)
            
            if isIntersectWall(wall(i,:),Xp,Yp, 0)
                
                if reflex_i == 1
                    Pi_x = TX(1) - 2*abs(Xp - TX(1));
                    Pi_y = TX(2);
                    Pi_tmp = [Pi_x Pi_y];
                    wallArrayPos_tmp = i;
                else
                    Pi_x = P_i(reflex_i-1,1) - 2*abs(Xp - P_i(reflex_i-1,1));
                    Pi_y = P_i(reflex_i-1,2);
                    Pi_tmp = vertcat(P_i, [Pi_x Pi_y]);
                    wallArrayPos_tmp = vertcat(wallArrayPos, i);
                end
                
                %On lance le tracing
                reflexion(wall, TX, RX, 0, Pi_tmp, reflex_i, reflex_i, wallArrayPos_tmp);
                
                %On relance la fonction pour la réflexion suivante
                if reflex_i + 1 <= reflexion_max
                    
                    raytracing([Pi_x Pi_y], wall, TX, RX, reflexion_max, reflex_i + 1, Pi_tmp, wallArrayPos_tmp);
                end
                
            end

        end

    end

    for Yp = init_point(2) : +1 : Ymax(1)

        Xp = init_point(1);

        for i=1: +1: size(wall,1)
            
            if isIntersectWall(wall(i,:),Xp,Yp, 0)
                
                if reflex_i == 1
                    Pi_x = TX(1);
                    Pi_y = TX(2) + 2*abs(Yp - TX(2));
                    Pi_tmp = [Pi_x Pi_y];
                    wallArrayPos_tmp = i;
                else
                    Pi_x = P_i(reflex_i-1,1);
                    Pi_y = P_i(reflex_i-1,2) + 2*abs(Yp - P_i(reflex_i-1,2));
                    Pi_tmp = vertcat(P_i, [Pi_x Pi_y]);
                    wallArrayPos_tmp = vertcat(wallArrayPos, i);
                end
                
                %On lance le tracing
                reflexion(wall, TX, RX, 0, Pi_tmp, reflex_i, reflex_i, wallArrayPos_tmp);
                
                %On relance la fonction pour la réflexion suivante
                if reflex_i + 1 <= reflexion_max
                    
                    raytracing([Pi_x Pi_y], wall, TX, RX, reflexion_max, reflex_i + 1, Pi_tmp, wallArrayPos_tmp);
                end
                
            end

        end

    end

    for Yp = init_point(2) : -1 : 0

        Xp = init_point(1);

        for i=1: +1: size(wall,1)
            
            if isIntersectWall(wall(i,:),Xp,Yp, 0)
                
                if reflex_i == 1
                    Pi_x = TX(1);
                    Pi_y = TX(2) - 2*abs(Yp - TX(2));
                    Pi_tmp = [Pi_x Pi_y];
                    wallArrayPos_tmp = i;
                else
                    Pi_x = P_i(reflex_i-1,1);
                    Pi_y = P_i(reflex_i-1,2) - 2*abs(Yp - P_i(reflex_i-1,2));
                    Pi_tmp = vertcat(P_i, [Pi_x Pi_y]);
                    wallArrayPos_tmp = vertcat(wallArrayPos, i);
                end
                
                %On lance le tracing
                reflexion(wall, TX, RX, 0, Pi_tmp, reflex_i, reflex_i, wallArrayPos_tmp);
                
                %On relance la fonction pour la réflexion suivante
                if reflex_i + 1 <= reflexion_max
                    
                    raytracing([Pi_x Pi_y], wall, TX, RX, reflexion_max, reflex_i + 1, Pi_tmp, wallArrayPos_tmp);
                end
                
            end            

        end

    end
    

end

