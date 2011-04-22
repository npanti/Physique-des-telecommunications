function reflexion(wall, TX, RX, Pr, P_i, reflexion_max, reflex_i, selected_wall)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    k = reflexion_max - reflex_i + 1;
    k_old = reflexion_max - reflex_i;
    %fprintf('Mur selectionn� = %d\n',selected_wall(reflex_i));
    

    %Calcul du point d'intersection
    if reflex_i == reflexion_max
        Pr_i = intersectionTwoLines(wall(selected_wall(reflex_i),:), [P_i(reflex_i,:) RX(1) RX(2)]);
    else
        Pr_i = intersectionTwoLines(wall(selected_wall(reflex_i),:), [Pr(k_old,:) P_i(reflex_i,:)]);
    end
    
    
    if size(Pr,2) ~= 2
        Pr = Pr_i;
        
        %V�rifie que le point d'intersection v�rifie les conditions
        %d'existence
        if isIntersectWall(wall(selected_wall(reflex_i),:), Pr(k,1), Pr(k,2)) && isBetweenTwoPoints(Pr(k,1), Pr(k,2), P_i(reflex_i,1), P_i(reflex_i,2), RX(1), RX(2))
            if (reflex_i - 1) > 0
                reflexion(wall, TX, RX, Pr, P_i, reflexion_max, reflex_i-1, selected_wall);
            end
        end
        
    else
        %V�rifie qu'on retourne pas lorsqu'on � trois r�flexion sur le
        %moins point de r�flexion pr�cedent
        [r,c] = find(Pr == Pr_i(1) & Pr == Pr_i(2));
        
        if isempty(r) && isempty(c)
            Pr = vertcat(Pr, Pr_i);

            if isIntersectWall(wall(selected_wall(reflex_i),:), Pr(k,1), Pr(k,2)) && isBetweenTwoPoints(Pr(k,1), Pr(k,2), P_i(reflex_i,1), P_i(reflex_i,2), Pr(k_old,1), Pr(k_old,2))
                if (reflex_i - 1) > 0
                    reflexion(wall, TX, RX, Pr, P_i, reflexion_max, reflex_i-1, selected_wall);
                else
                    plot([TX(1) fliplr(Pr(:,1)') RX(1)],[TX(2) fliplr(Pr(:,2)') RX(2)], 'b');
                end
            end
        end
    end

end

