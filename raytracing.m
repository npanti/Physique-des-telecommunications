function P_reflexion = raytracing(wall, init_point, reflexion_max, varargin) %#codegen
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    reflexion_i = 1;
    if reflexion_i == 1;
        P_reflexion = zeros(reflexion_max,5);
    end
    TX_tmp = init_point;
    Pi = 0;
    wall_pos = 0;
    if ~isempty(varargin)
        reflexion_i = varargin{1};
        Pi = varargin{2};
        wall_pos = varargin{3};
        TX_tmp = varargin{4};
        P_reflexion = varargin{5};
    end
    
    for i=1: +1: size(wall,1)
        
        %On vérifie que le mur se situe entre l'émetteur et le récepteur
        
        %Si le mur est vertical
        if wall(i,1) == wall(i,3)
            
            %Si le mur est à gauche du point inital
            if wall(i,1) < init_point(1)
               
                %Calcul du point image
                Pi_x = init_point(1) - 2*abs(init_point(1) - wall(i,1));
                Pi_y = init_point(2);
                
                
                %Si ce n'est pas le premier point image on le concate avec
                %le matrice des points images
                if reflexion_i == 1
                    Pi_tmp = [Pi_x Pi_y];
                    wall_pos_tmp = i;
                else
                    Pi_tmp = vertcat(Pi, [Pi_x Pi_y]);
                    wall_pos_tmp = vertcat(wall_pos,i);
                end
                
                Pr = reflexion(wall, 0, Pi_tmp, reflexion_i, reflexion_i, wall_pos_tmp);
                %S'il y a eu réflexion
                if size(Pr,2) > 1
                                        
                    if P_reflexion == 0
                        P_reflexion(1,:) = Pr;
                    else
                        P_reflexion(1:size(Pr,1),:,size(P_reflexion,3)+1) = Pr;
                    end  
                end
                
                if reflexion_i < reflexion_max
                   P_reflexion = raytracing(wall, [Pi_x Pi_y], reflexion_max, reflexion_i+1, Pi_tmp, wall_pos_tmp, TX_tmp, P_reflexion);
                end
                
            %Si le mur est à droite du point initial
            elseif wall(i,1) > init_point(1)
                %Calcul du point image
                Pi_x = init_point(1) + 2*abs(init_point(1) - wall(i,1));
                Pi_y = init_point(2);
                
                %Si ce n'est pas le premier point image on le concate avec
                %le matrice des points images
                if reflexion_i == 1
                    Pi_tmp = [Pi_x Pi_y];
                    wall_pos_tmp = i;
                else
                    Pi_tmp = vertcat(Pi, [Pi_x Pi_y]);
                    wall_pos_tmp = vertcat(wall_pos,i);
                end
                
                Pr = reflexion(wall, 0, Pi_tmp, reflexion_i, reflexion_i, wall_pos_tmp);
                if size(Pr,2) > 1
                    if P_reflexion == 0
                        P_reflexion(1,:) = Pr;
                    else
                        P_reflexion(1:size(Pr,1),:,size(P_reflexion,3)+1) = Pr;
                    end
                end
                
                if reflexion_i < reflexion_max
                    P_reflexion = raytracing(wall, [Pi_x Pi_y], reflexion_max, reflexion_i+1, Pi_tmp, wall_pos_tmp, TX_tmp, P_reflexion);
                end
            end
        
        %Si le mur est horizontal
        elseif wall(i,2) == wall(i,4)
            
            %Si le mur est en bas du point inital
            if wall(i,2) < init_point(2)
               
                %Calcul du point image
                Pi_x = init_point(1);
                Pi_y = init_point(2) - 2*abs(init_point(2) - wall(i,2));
                
                %Si ce n'est pas le premier point image on le concate avec
                %le matrice des points images
                if reflexion_i == 1
                    Pi_tmp = [Pi_x Pi_y];
                    wall_pos_tmp = i;
                else
                    Pi_tmp = vertcat(Pi, [Pi_x Pi_y]);
                    wall_pos_tmp = vertcat(wall_pos,i);
                end
                
                Pr = reflexion(wall, 0, Pi_tmp, reflexion_i, reflexion_i, wall_pos_tmp);
                if size(Pr,2) > 1
                    if P_reflexion == 0
                        P_reflexion(1,:) = Pr;
                    else
                        P_reflexion(1:size(Pr,1),:,size(P_reflexion,3)+1) = Pr;
                    end
                end
                
                if reflexion_i < reflexion_max
                    P_reflexion = raytracing(wall, [Pi_x Pi_y], reflexion_max, reflexion_i+1, Pi_tmp, wall_pos_tmp, TX_tmp, P_reflexion);
                end
                
            %Si le mur est en haut du point initial
            elseif wall(i,2) > init_point(2)
                %Calcul du point image
                Pi_x = init_point(1);
                Pi_y = init_point(2) + 2*abs(init_point(2) - wall(i,2));
                
                %Si ce n'est pas le premier point image on le concate avec
                %le matrice des points images
                if reflexion_i == 1
                    Pi_tmp = [Pi_x Pi_y];
                    wall_pos_tmp = i;
                else
                    Pi_tmp = vertcat(Pi, [Pi_x Pi_y]);
                    wall_pos_tmp = vertcat(wall_pos,i);
                end
                
                Pr = reflexion(wall, 0, Pi_tmp, reflexion_i, reflexion_i, wall_pos_tmp);
                if size(Pr,2) > 1
                    if P_reflexion == 0
                        P_reflexion(1,:) = Pr;
                    else
                        P_reflexion(1:size(Pr,1),:,size(P_reflexion,3)+1) = Pr;
                    end
                end
                
                if reflexion_i < reflexion_max
                    P_reflexion = raytracing(wall, [Pi_x Pi_y], reflexion_max, reflexion_i+1, Pi_tmp, wall_pos_tmp, TX_tmp, P_reflexion);
                end
            end
  
        end
        
    end

end

