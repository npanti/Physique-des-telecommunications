function out = isIntersectWall(mur, Xp, Yp)
        
        out = 0;
        Xo = mur(1);
        Yo = mur(2);
        dx = mur(3) - Xo;
        dy = mur(4) - Yo;
        
        
        %On v�rifie si la distance entre le point et la droite form� par le
        %mur est inf�rieur � un degr� de pr�cision.
        if abs((Xp - Xo)*dy - (Yp - Yo)*dx)/sqrt(dx^2 + dy^2) < eps
           
            %On v�rifie si le point est dans l'interval forme par les deux
            %points.
            if min(Xo, Xo+dx) <= Xp && max(Xo, Xo+dx) >= Xp && min(Yo, Yo+dy) <= Yp && max(Yo, Yo+dy) >= Yp
                out = 1;
            end
            
        end

end

