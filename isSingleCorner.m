function out = isSingleCorner(wall, corner)
%ISSIGNLECORNER Summary of this function goes here
%   Detailed explanation goes here
    out = 0;
    %Si le mur est vertical
    if wall(1) == wall(3)
        
        if corner(1) == wall(1) && (corner(2) <= max(wall(2),wall(4)) && corner(2) >= min(wall(2),wall(4)))
            out = 1;
        end
        
    %Si le mur est horizontam
    elseif wall(2) == wall(4)
        if corner(2) == wall(2) && (corner(1) <= max(wall(1),wall(3)) && corner(1) >= min(wall(1),wall(3)))
            out = 1;
        end
    end

end

