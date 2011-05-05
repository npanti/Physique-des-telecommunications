function angle = angleBetweenTwoLines(line1,line2,varargin)
%ANGLEBETWEENTWOLINES Fonction qui retourne l'angle entre deux droite

    indegree = 0;
    if ~isempty(varargin)
        indegree = varargin{1};
    end

    %Vecteur directeur des deux droites
    vec1 = [-(line1(3)-line1(1)) line1(4)-line1(2)];
    vec2 = [-(line2(3)-line2(1)) line2(4)-line2(2)];
    
    if indegree
        angle = 90 - acos(dot(vec1,vec2)/(norm(vec1)*norm(vec2)))*180/pi;
    else
        angle = pi/2 - acos(dot(vec1,vec2)/(norm(vec1)*norm(vec2)));
    end

end

