clear;
clc;

%Récepteur et émeteur [x y]
TX = [1 1];
RX = [7 8];

DIM3 = [26 22];
DIM2 = [20 10];
DIM = [10 10];

%Pièce simple (carrée)
mur = [0 0 0 10 ; 0 10 10 10 ; 10 10 10 0 ; 10 0 0 0];
mur2 = [0 0 0 10 ; 0 10 20 10 ; 20 10 20 0 ; 20 0 0 0 ; 10 0 10 4 ; 10 10 10 6] ;
mur3 = [
    0 0 26 0;
    26 0 26 22;
    26 22 0 22;
    0 22 0 0;
    0 8 4 8;
    0 11 5 11;
    0 13 6 13;
    0 17 1 17;
    3 17 5 17;
    5 22 5 16;
    5 13 5 8;
    6 0 6 7;
    5 18 7 18;
    7 18 7 17;
    8 22 8 18;
    7 15 7 13;
    6 4 8 4;
    6 5 8 5;
    6 8 10 8;
    9 0 9 6;
    6 11 13 11;
    9 11 9 8;
    10 11 10 8;
    13 11 13 0;
    10 7 13 7;
    10 7 10 5;
    10 5 12 5;
    7 13 13 13;
    13 13 13 22;
    7 14 13 14;
    7 16 13 16;
    8 17 10 17;
    10 17 10 16;
    9 18 13 18;
    14 13 26 13;
    15 15 15 14;
    15 14 18 14;
    18 14 18 17;
    13 17 15 17;
    15 17 15 16;
    16 15 16 17;
    16 17 19 17;
    17 22 17 18;
    17 18 15 18;
    18 18 21 18;
    19 18 19 16;
    18 16 22 16;
    22 16 22 22;
    22 19 23 19;
    25 19 26 19;
    19 14 22 14;
    14 13 14 11;
    14 11 17 11;
    17 12 17 10;
    18 13 18 11;
    19 13 19 11;
    19 10 26 10;
    14 7 14 8;
    14 8 19 8;
    19 8 19 1;
    17 8 17 9;
    15 8 15 6;
    14 6 19 6;
    19 4 26 4;
    19 7 21 7;
    21 7 21 5;
    20 8 26 8;
    21 10 21 9;
    ];
%Matric de resultat en db 
db_null = [10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ];

%Parcourir à gauche, à droite, de haut et d'en bas jusqu'à un mur ensuite
%commencer le calcul des points images
for a=1: +1: size(mur,1)
   plot([mur(a,1) mur(a,3)],[mur(a,2) mur(a,4)]);
   hold on;
end

plot([TX(1) RX(1)], [TX(2) RX(2)], '*r', 'MarkerSize', 10);

%On parcour de gauche à droite et de haut en bas à partir de TX

for Xp = TX(1) : +1 : DIM(1)
    
    Yp = TX(2);
    %fprintf('[%d,%d]\n',Xp, Yp);
    
    for i=1: +1: size(mur,1)
       
        if isIntersectWall(mur(i,:),Xp,Yp, 0)
            fprintf('Droite - Intersection en [%d,%d]\n', Xp, Yp);
            
            Pi_x = TX(1) + 2*abs(Xp - TX(1));
            Pi_y = TX(2);
            
            x1 = mur(i,1);
            y1 = mur(i,2);
            dx1 = mur(i,3) - x1;
            dy1 = mur(i,4) - y1;
            
            x2 = Pi_x;
            y2 = Pi_y;
            dx2 = RX(1) - x2;
            dy2 = RX(2) - y2;
            
            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
            
            
            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, RX(1), RX(2))
                %plot([TX(1) Xi RX(1)],[TX(2) Yi RX(2)], 'r');
            end
            
            %Deuxieme réflexion
            for Xp2 = Pi_x: +1: DIM(1)
                Yp2 = Pi_y;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x + 2*abs(Xp2 - Pi_x);
                        Pi2_y = Pi_y;

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                               

                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                            
                        end
                    end
                end
            end
            for Xp2 = Pi_x: -1: 0
                Yp2 = Pi_y;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x - 2*abs(Xp2 - Pi_x);
                        Pi2_y = Pi_y;

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            for Yp2 = Pi_y: +1: DIM(2)
                Xp2 = Pi_x;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x;
                        Pi2_y = Pi_y + 2*abs(Yp2 - Pi_y);

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            for Yp2 = Pi_y: -1: 0
                Xp2 = Pi_x;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x;
                        Pi2_y = Pi_y - 2*abs(Yp2 - Pi_y);

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            
        end
        
    end
    
end

for Xp = TX(1) : -1 : 0
    
    Yp = TX(2);
    %fprintf('[%d,%d]\n',Xp, Yp);
    
    for i=1: +1: size(mur,1)
       
        if isIntersectWall(mur(i,:),Xp,Yp, 0)
            fprintf('Gauche - Intersection en [%d,%d]\n', Xp, Yp);
            
            Pi_x = TX(1) - 2*abs(Xp - TX(1));
            Pi_y = TX(2);
            
            x1 = mur(i,1);
            y1 = mur(i,2);
            dx1 = mur(i,3) - x1;
            dy1 = mur(i,4) - y1;
            
            x2 = Pi_x;
            y2 = Pi_y;
            dx2 = RX(1) - x2;
            dy2 = RX(2) - y2;
            
            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
            
            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, RX(1), RX(2))
                %plot([TX(1) Xi RX(1)],[TX(2) Yi RX(2)], 'r');
            end
            
            %Deuxieme réflexion
            for Xp2 = Pi_x: +1: DIM(1)
                Yp2 = Pi_y;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x + 2*abs(Xp2 - Pi_x);
                        Pi2_y = Pi_y;

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                               

                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                            
                        end
                    end
                end
            end
            for Xp2 = Pi_x: -1: 0
                Yp2 = Pi_y;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x - 2*abs(Xp2 - Pi_x);
                        Pi2_y = Pi_y;

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            for Yp2 = Pi_y: +1: DIM(2)
                Xp2 = Pi_x;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x;
                        Pi2_y = Pi_y + 2*abs(Yp2 - Pi_y);

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            for Yp2 = Pi_y: -1: 0
                Xp2 = Pi_x;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x;
                        Pi2_y = Pi_y - 2*abs(Yp2 - Pi_y);

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            
        end
        
    end
    
end

for Yp = TX(2) : +1 : DIM(1)
    
    Xp = TX(1);
    %fprintf('[%d,%d]\n',Xp, Yp);
    
    for i=1: +1: size(mur,1)
       
        if isIntersectWall(mur(i,:),Xp,Yp, 0)
            fprintf('Haut - Intersection en [%d,%d]\n', Xp, Yp);
            Pi_x = TX(1) ;
            Pi_y = TX(2) + 2*abs(Yp - TX(2));
            
            x1 = mur(i,1);
            y1 = mur(i,2);
            dx1 = mur(i,3) - x1;
            dy1 = mur(i,4) - y1;
            
            x2 = Pi_x;
            y2 = Pi_y;
            dx2 = RX(1) - x2;
            dy2 = RX(2) - y2;
            
            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
            
            %On vérifie ensuite que le point d'intersection se trouve bien
            %sur le mur et que le point de reflexion se trouve entre le
            %point image et le récepteur
            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, RX(1), RX(2))
                %plot([TX(1) Xi RX(1)],[TX(2) Yi RX(2)], 'r');
            end
            
            %Deuxieme réflexion
            for Xp2 = Pi_x: +1: DIM(1)
                Yp2 = Pi_y;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x + 2*abs(Xp2 - Pi_x);
                        Pi2_y = Pi_y;

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                               

                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                            
                        end
                    end
                end
            end
            for Xp2 = Pi_x: -1: 0
                Yp2 = Pi_y;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x - 2*abs(Xp2 - Pi_x);
                        Pi2_y = Pi_y;

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            for Yp2 = Pi_y: +1: DIM(2)
                Xp2 = Pi_x;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x;
                        Pi2_y = Pi_y + 2*abs(Yp2 - Pi_y);

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            for Yp2 = Pi_y: -1: 0
                Xp2 = Pi_x;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x;
                        Pi2_y = Pi_y - 2*abs(Yp2 - Pi_y);

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            
        end
        
    end
    
end

for Yp = TX(2) : -1 : 0
    
    Xp = TX(1);
    %fprintf('[%d,%d]\n',Xp, Yp);
    
    for i=1: +1: size(mur,1)
        
        if isIntersectWall(mur(i,:),Xp,Yp, 0)
            fprintf('Bas - Intersection en [%d,%d]\n', Xp, Yp);
            
            Pi_x = TX(1);
            Pi_y = TX(2) - 2*abs(Yp - TX(2));
            
            x1 = mur(i,1);
            y1 = mur(i,2);
            dx1 = mur(i,3) - x1;
            dy1 = mur(i,4) - y1;
            
            x2 = Pi_x;
            y2 = Pi_y;
            dx2 = RX(1) - x2;
            dy2 = RX(2) - y2;
            
            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
            
            if isIntersectWall(mur(i,:), Xi, Yi)  && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, RX(1), RX(2))
                %plot([TX(1) Xi RX(1)],[TX(2) Yi RX(2)], 'r');
            end
            
            %Deuxieme réflexion
            for Xp2 = Pi_x: +1: DIM(1)
                Yp2 = Pi_y;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x + 2*abs(Xp2 - Pi_x);
                        Pi2_y = Pi_y;

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                               

                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                            
                        end
                    end
                end
            end
            for Xp2 = Pi_x: -1: 0
                Yp2 = Pi_y;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x - 2*abs(Xp2 - Pi_x);
                        Pi2_y = Pi_y;

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            for Yp2 = Pi_y: +1: DIM(2)
                Xp2 = Pi_x;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x;
                        Pi2_y = Pi_y + 2*abs(Yp2 - Pi_y);

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            for Yp2 = Pi_y: -1: 0
                Xp2 = Pi_x;
                for j=1: +1: size(mur,1)
                    if isIntersectWall(mur(j,:),Xp2,Yp2, 0)
                        Pi2_x = Pi_x;
                        Pi2_y = Pi_y - 2*abs(Yp2 - Pi_y);

                        x1 = mur(j,1);
                        y1 = mur(j,2);
                        dx1 = mur(j,3) - x1;
                        dy1 = mur(j,4) - y1;

                        x2 = Pi2_x;
                        y2 = Pi2_y;
                        dx2 = RX(1) - x2;
                        dy2 = RX(2) - y2;

                        X2i = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                        Y2i = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                        
                        if isIntersectWall(mur(j,:), X2i, Y2i) && isBetweenTwoPoints(X2i, Y2i, Pi2_x, Pi2_y, RX(1), RX(2))
                            x1 = mur(i,1);
                            y1 = mur(i,2);
                            dx1 = mur(i,3) - x1;
                            dy1 = mur(i,4) - y1;

                            x2 = X2i;
                            y2 = Y2i;
                            dx2 = Pi_x - x2;
                            dy2 = Pi_y - y2;

                            Xi = -(dx2*dy1*x1 - dx1*dy2*x2 - dx1*dx2*y1 + dx1*dx2*y2)/(dx1*dy2 - dx2*dy1);
                            Yi = -(dy1*dy2*x1 - dy1*dy2*x2 - dx1*dy2*y1 + dx2*dy1*y2)/(dx1*dy2 - dx2*dy1);
                            
                            if isIntersectWall(mur(i,:), Xi, Yi) && isBetweenTwoPoints(Xi, Yi, Pi_x, Pi_y, X2i, Y2i)
                                plot([TX(1) Xi X2i RX(1)],[TX(2) Yi Y2i RX(2)], 'g');
                            
                            end
                        end
                    end
                end
            end
            
        end

    end
    
end



%Affichage
%gui_project_ZC(mur, db_null, TX);
