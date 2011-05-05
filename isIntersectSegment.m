function out = isIntersectSegment(mur, Xp, Yp)
% Fonction qui retourne TRUE ou FALSE si un point ce trouve sur une segment
% de droite
    
        out = 0;
        Xo = mur(1);
        Yo = mur(2);
        dx = mur(3) - Xo;
        dy = mur(4) - Yo;
        
        
        %On vérifie si la distance entre le point et la droite formé par le
        %mur est inférieur à un degré de précision.
        %d = abs((Xp - Xo)*dy - (Yp - Yo)*dx)/sqrt(dx^2 + dy^2);
        %if d < 1
           
            %On vérifie si le point est dans l'interval forme par les deux
            %points.
                if min(Xo, Xo+dx) <= Xp && max(Xo, Xo+dx) >= Xp && min(Yo, Yo+dy) <= Yp && max(Yo, Yo+dy) >= Yp
                    out = 1; 
                %Mur vertical
                elseif mur(1) == mur(3)

                    if min(mur(2),mur(4)) <= Yp && max(mur(2),mur(4)) >= Yp
                        out = 1;
                    end


                %Mur horizontal    
                elseif mur(2) == mur(4)

                    if min(mur(1),mur(3)) <= Xp && max(mur(1),mur(3)) >= Xp
                        out = 1;
                    end

                end
            
            
        %end

end

