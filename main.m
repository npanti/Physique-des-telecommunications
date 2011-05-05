clear;
clc;

%Norme
P_TX = 0.1; %Puissance maximum l�gal pour un wifi en int�rieur est de 100mW
f = 2.45e9; %2,45 Ghz norme 802.11n
beta = 2*pi*f/300e6;

%imp�dance du vide
Z0 = 120*pi;

%R�cepteur et �meteur [x y]
RX = [1 1];
TX = [12 9];

G_TX = 1.6524;

reflexion_max = 2;

%Pi�ce simple (carr�e)
mur1 = [0 0 0 10 10 5 0.1; 0 10 10 10 10 5 0.1; 10 10 10 0 10 5 0.1; 10 0 0 0 10 5 0.1];
mur = [0 0 0 10 10 5 0.1; 0 10 20 10 10 5 0.1; 20 10 20 0 10 5 0.1; 20 0 0 0 10 5 0.1; 10 0 10 4 10 5 0.1; 10 10 10 6 10 5 0.1; 5 5 15 5 10 5 0.1];
mur3 = [
    %Coordon�e du mur   |epaiseur|eps_r|sigma  
     0     0    26     0    10    5    0.1
    26     0    26    22    10    5    0.1
    26    22     0    22    10    5    0.1
     0    22     0     0    10    5    0.1
     0     8     4     8    10    5    0.1
     0    11     5    11    10    5    0.1
     0    13     6    13    10    5    0.1
     0    17     1    17    10    5    0.1
     3    17     5    17    10    5    0.1
     5    22     5    16    10    5    0.1
     5    13     5     8    10    5    0.1
     6     0     6     7    10    5    0.1
     5    18     7    18    10    5    0.1
     7    18     7    17    10    5    0.1
     8    22     8    18    10    5    0.1
     7    15     7    13    10    5    0.1
     6     4     8     4    10    5    0.1
     6     5     8     5    10    5    0.1
     6     8    10     8    10    5    0.1
     9     0     9     6    10    5    0.1
     6    11    13    11    10    5    0.1
     9    11     9     8    10    5    0.1
    10    11    10     8    10    5    0.1
    13    11    13     0    10    5    0.1
    10     7    13     7    10    5    0.1
    10     7    10     5    10    5    0.1
    10     5    12     5    10    5    0.1
    13    13    13    22    10    5    0.1
     7    13    13    13    10    5    0.1
     7    14    13    14    10    5    0.1
     7    16    13    16    10    5    0.1
     8    17    10    17    10    5    0.1
    10    17    10    16    10    5    0.1
     9    18    13    18    10    5    0.1
    14    13    26    13    10    5    0.1
    15    15    15    14    10    5    0.1
    15    14    18    14    10    5    0.1
    18    14    18    17    10    5    0.1
    13    17    15    17    10    5    0.1
    15    17    15    16    10    5    0.1
    16    15    16    17    10    5    0.1
    16    17    19    17    10    5    0.1
    17    22    17    18    10    5    0.1
    17    18    15    18    10    5    0.1
    18    18    21    18    10    5    0.1
    19    18    19    16    10    5    0.1
    18    16    22    16    10    5    0.1
    22    16    22    22    10    5    0.1
    22    19    23    19    10    5    0.1
    25    19    26    19    10    5    0.1
    19    14    22    14    10    5    0.1
    14    13    14    11    10    5    0.1
    14    11    17    11    10    5    0.1
    17    12    17    10    10    5    0.1
    18    13    18    11    10    5    0.1
    19    13    19    11    10    5    0.1
    19    10    26    10    10    5    0.1
    14     7    14     8    10    5    0.1
    14     8    19     8    10    5    0.1
    19     8    19     1    10    5    0.1
    17     8    17     9    10    5    0.1
    15     8    15     6    10    5    0.1
    14     6    19     6    10    5    0.1
    19     4    26     4    10    5    0.1
    19     7    21     7    10    5    0.1
    21     7    21     5    10    5    0.1
    20     8    26     8    10    5    0.1
    21    10    21     9    10    5    0.1];
%Matric de resultat en db 
db_null2 = [10 1 1 1 1 1 1 1 1 1
           10 1 1 1 1 1 1 1 1 1
           10 1 1 1 1 1 1 1 1 1
           10 1 1 1 1 1 1 1 1 1
           10 1 1 1 1 1 1 1 1 1
           10 1 1 1 1 1 1 1 1 1
           10 1 1 1 1 1 1 1 1 1
           10 1 1 1 1 1 1 1 1 1
           10 1 1 1 1 1 1 1 1 1
           10 1 1 1 1 1 1 1 1 1];
db_null = [10 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
           1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
       
tic();
%Tracage des murs
for a=1: +1: size(mur,1)
   plot([mur(a,1) mur(a,3)],[mur(a,2) mur(a,4)],'r');
   hold on;
end

%Chemin direct
plot([TX(1) RX(1)],[TX(2) RX(2)],'g');

%Lancement du programme de raytracing
Pr = raytracing(mur,TX,RX,reflexion_max);
Tr = transmission(mur,TX,RX,Pr);

%diffractionPoints(mur,TX,RX);

%Lancement du programme de calcul de puissance et d�bit


plot(TX(1), TX(2), '.r', 'MarkerSize', 10);
plot(RX(1), RX(2), '.r', 'MarkerSize', 10);

toc();
%load handel;
%sound(y,Fs);

%gui_project_ZC(mur,db_null2,TX);