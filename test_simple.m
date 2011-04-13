clear;
clc;

%Récepteur et émeteur [x y]
TX = [1 2];
RX = [7 8];

DIM = [26 22];
%DIM = [10 10];

%Pièce simple (carrée)
vec = [0 0 0 10 ; 0 10 10 10 ; 10 10 10 0 ; 10 0 0 0];
mur = [
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

%On parcour de gauche à droite et de haut en bas à partir de TX

for Xp = TX(1) : +1 : DIM(1)
    
    Yp = TX(2);
    %fprintf('[%d,%d]\n',Xp, Yp);
    
    for i=1: +1: size(mur,1)
       
        if isIntersectWall(mur(i,:),Xp,Yp)
            fprintf('Droite - Intersection en [%d,%d]\n', Xp, Yp);
        end
        
    end
    
end

for Xp = TX(1) : -1 : 0
    
    Yp = TX(2);
    %fprintf('[%d,%d]\n',Xp, Yp);
    
    for i=1: +1: size(mur,1)
       
        if isIntersectWall(mur(i,:),Xp,Yp)
            fprintf('Gauche - Intersection en [%d,%d]\n', Xp, Yp);
        end
        
    end
    
end

for Yp = TX(2) : +1 : DIM(1)
    
    Xp = TX(1);
    %fprintf('[%d,%d]\n',Xp, Yp);
    
    for i=1: +1: size(mur,1)
       
        if isIntersectWall(mur(i,:),Xp,Yp)
            fprintf('Haut - Intersection en [%d,%d]\n', Xp, Yp);
        end
        
    end
    
end

for Yp = TX(2) : -1 : 0
    
    Xp = TX(1);
    %fprintf('[%d,%d]\n',Xp, Yp);
    
    for i=1: +1: size(mur,1)
        
        if isIntersectWall(mur(i,:),Xp,Yp)
            fprintf('Bas - Intersection en [%d,%d]\n', Xp, Yp);
        end

    end
    
end



%Affichage
gui_project_ZC(mur, db_null, TX);
