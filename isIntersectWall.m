function P = isIntersectWall(wall, line)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    P = 0;
    for i=1:+1:size(wall,1)
        P_tmp = intersectionTwoLines(wall(i,:),line);
        if size(P_tmp,2) > 1
           if isIntersectSegment(wall(i,:),P_tmp(1),P_tmp(2));
               if P == 0
                   P = [P_tmp i];
               else
                   P = [P; [P_tmp i]];
               end
           end
        end
    end
end

