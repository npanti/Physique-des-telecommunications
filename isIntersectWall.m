function out = isIntersectWall(mur, Xp, Yp, varargin)
% Fonction qui retourne TRUE ou FALSE si un point ce trouve sur une segment
% de droite
check = 1;
if ~isempty(varargin)
    check = varargin{1};
end
    
        out = 0;
        Xo = mur(1);
        Yo = mur(2);
        dx = mur(3) - Xo;
        dy = mur(4) - Yo;
        
        
        %On vérifie si la distance entre le point et la droite formé par le
        %mur est inférieur à un degré de précision.
        if abs((Xp - Xo)*dy - (Yp - Yo)*dx)/sqrt(dx^2 + dy^2) < eps
           
            %On vérifie si le point est dans l'interval forme par les deux
            %points.
            if check
                if min(Xo, Xo+dx) <= Xp && max(Xo, Xo+dx) >= Xp && min(Yo, Yo+dy) <= Yp && max(Yo, Yo+dy) >= Yp
                    out = 1;
                end
            else
                out = 1;
            end
            
            
        end

end

