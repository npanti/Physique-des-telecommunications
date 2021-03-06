function P = reflexion(wall, Pr, P_i, reflexion_max, reflex_i, selected_wall)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    global RX TX;

    P = 0;
    
    k = reflexion_max - reflex_i + 1;
    k_old = reflexion_max - reflex_i;

    %Calcul du point d'intersection
    if reflex_i == reflexion_max
        Pr_i = intersectionTwoLines(wall(selected_wall(reflex_i),1:4), [P_i(reflex_i,:) RX(1) RX(2)]);
        theta_i = angleBetweenTwoLines(wall(selected_wall(reflex_i),1:4), [P_i(reflex_i,:) RX(1) RX(2)]);
    else
        Pr_i = intersectionTwoLines(wall(selected_wall(reflex_i),1:4), [Pr(k_old,1) Pr(k_old,2) P_i(reflex_i,:)]);
        theta_i = angleBetweenTwoLines(wall(selected_wall(reflex_i),1:4), [P_i(reflex_i,:) RX(1) RX(2)]);
    end
    
    
    if size(Pr,2) == 1
        Pr = [Pr_i selected_wall(reflex_i) theta_i];
        
        %V�rifie que le point d'intersection v�rifie les conditions
        %d'existence
        if isIntersectSegment(wall(selected_wall(reflex_i),1:4), Pr(k,1), Pr(k,2)) && isBetweenTwoPoints(Pr(k,1), Pr(k,2), P_i(reflex_i,1), P_i(reflex_i,2), RX(1), RX(2))
            if (reflex_i - 1) > 0
                P = reflexion(wall, Pr, P_i, reflexion_max, reflex_i-1, selected_wall);
            else
                %plot([TX(1) fliplr(Pr(:,1)') RX(1)],[TX(2) fliplr(Pr(:,2)') RX(2)], 'b');
                P = Pr;
            end
        end
        
    else
        %V�rifie que le point de r�flexion n'est pas le m�me que le
        %pr�cedent
        if Pr(k_old,1) ~= Pr_i(1) && Pr(k_old,2) ~= Pr_i(2)
        
            Pr = [Pr; [Pr_i selected_wall(reflex_i) theta_i]];

            if isIntersectSegment(wall(selected_wall(reflex_i),1:4), Pr(k,1), Pr(k,2)) && isBetweenTwoPoints(Pr(k,1), Pr(k,2), P_i(reflex_i,1), P_i(reflex_i,2), Pr(k_old,1), Pr(k_old,2))
                if (reflex_i - 1) > 0

                    P_tmp = reflexion(wall, Pr, P_i, reflexion_max, reflex_i-1, selected_wall);
                    if size(P_tmp,2) > 1
                       P = P_tmp;
                    end
                else
                    %plot([TX(1) fliplr(Pr(:,1)') RX(1)],[TX(2) fliplr(Pr(:,2)') RX(2)], 'b');
                    P = Pr;
                end
            end
        else
            P = 0;
        end
    end
    

end

