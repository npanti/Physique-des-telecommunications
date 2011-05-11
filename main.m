clear;
clc;

global beta lambda f Z0 G_TX P_TX h_e Ra;

%Norme
P_TX_dbm = 12;
P_TX = 0.001*10^(P_TX_dbm/10); %Puissance maximum légal pour un wifi en intérieur est de 100mW
f = 2.45e9; %2,45 Ghz norme 802.11n
beta = 2*pi*f/300e6;
lambda = 300e6/f;
h_e = -lambda/pi;
%h_e = -lambda/pi*cos(pi/2*cos(pi/2))/sin(pi/2)^2; %Formule generale
Ra = 75;

%impédance du vide
Z0 = 120*pi;

%Récepteur et émeteur [x y]
TX = [2 2];

G_TX = 1.6524;

reflexion_max = 1;

%Pièce simple (carrée)
x=26;
y=22;
mur1 = [0 0 0 10 0.10 5 0.1; 0 10 10 10 0.10 5 0.1; 10 10 10 0 0.10 5 0.1; 10 0 0 0 0.10 5 0.1];
mur2 = [0 0 0 10 0.10 5 0.1; 0 10 20 10 0.10 5 0.1; 20 10 20 0 0.10 5 0.1; 20 0 0 0 0.10 5 0.1; 10 0 10 4 0.10 5 0.1; 10 10 10 6 0.10 5 0.1; 5 5 15 5 0.10 5 0.1];
mur3 = [0 0 0 10 0.10 5 0.1; 0 10 20 10 0.10 5 0.1; 20 10 20 0 0.10 5 0.1; 20 0 0 0 0.10 5 0.1; 10 0 10 4 0.10 5 0.1; 10 10 10 6 0.10 5 0.1] ;
mur = [
    %Coordonée du mur   |epaiseur|eps_r|sigma  
     0     0    26     0    0.1    5    0.1
    26     0    26    22    0.1    5    0.1
    26    22     0    22    0.1    5    0.1
     0    22     0     0    0.1    5    0.1
     0     8     4     8    0.1    5    0.1
     0    11     5    11    0.1    5    0.1
     0    13     6    13    0.1    5    0.1
     0    17     1    17    0.1    5    0.1
     3    17     5    17    0.1    5    0.1
     5    22     5    16    0.1    5    0.1
     5    13     5     8    0.1    5    0.1
     6     0     6     7    0.1    5    0.1
     5    18     7    18    0.1    5    0.1
     7    18     7    17    0.1    5    0.1
     8    22     8    18    0.1    5    0.1
     7    15     7    13    0.1    5    0.1
     6     4     8     4    0.1    5    0.1
     6     5     8     5    0.1    5    0.1
     6     8    10     8    0.1    5    0.1
     9     0     9     6    0.1    5    0.1
     6    11    13    11    0.1    5    0.1
     9    11     9     8    0.1    5    0.1
    10    11    10     8    0.1    5    0.1
    13    11    13     0    0.1    5    0.1
    10     7    13     7    0.1    5    0.1
    10     7    10     5    0.1    5    0.1
    10     5    12     5    0.1    5    0.1
    13    13    13    22    0.1    5    0.1
     7    13    13    13    0.1    5    0.1
     7    14    13    14    0.1    5    0.1
     7    16    13    16    0.1    5    0.1
     8    17    10    17    0.1    5    0.1
    10    17    10    16    0.1    5    0.1
     9    18    13    18    0.1    5    0.1
    14    13    26    13    0.1    5    0.1
    15    15    15    14    0.1    5    0.1
    15    14    18    14    0.1    5    0.1
    18    14    18    17    0.1    5    0.1
    13    17    15    17    0.1    5    0.1
    15    17    15    16    0.1    5    0.1
    16    15    16    17    0.1    5    0.1
    16    17    19    17    0.1    5    0.1
    17    22    17    18    0.1    5    0.1
    17    18    15    18    0.1    5    0.1
    18    18    21    18    0.1    5    0.1
    19    18    19    16    0.1    5    0.1
    18    16    22    16    0.1    5    0.1
    22    16    22    22    0.1    5    0.1
    22    19    23    19    0.1    5    0.1
    25    19    26    19    0.1    5    0.1
    19    14    22    14    0.1    5    0.1
    14    13    14    11    0.1    5    0.1
    14    11    17    11    0.1    5    0.1
    17    12    17    10    0.1    5    0.1
    18    13    18    11    0.1    5    0.1
    19    13    19    11    0.1    5    0.1
    19    10    26    10    0.1    5    0.1
    14     7    14     8    0.1    5    0.1
    14     8    19     8    0.1    5    0.1
    19     8    19     1    0.1    5    0.1
    17     8    17     9    0.1    5    0.1
    15     8    15     6    0.1    5    0.1
    14     6    19     6    0.1    5    0.1
    19     4    26     4    0.1    5    0.1
    19     7    21     7    0.1    5    0.1
    21     7    21     5    0.1    5    0.1
    20     8    26     8    0.1    5    0.1
    21    10    21     9    0.1    5    0.1];

tic();

%Lancement du programme de raytracing

db_power = zeros(x,y);
bitrate_mb = zeros(x,y);

end_time = 0;
total_time = 0;
moyenne = 0;

for i=0.5:+1:x
   for j=0.5:+1:y
       
       ticID = tic();
       clc;
       fprintf('Avancement : %.2f %% \nTemps estimé: %.2f minutes',((i+0.5-1)*y+j+0.5)/(x*y)*100, (moyenne*x*y-total_time)/60);

       RX = [i j];
       ray = tic();
       Pr = raytracing(mur,TX,RX,reflexion_max);
       fprintf('\n Raytracing %f', toc(ray));
       trans = tic();
       Tr = transmission(mur,TX,RX,Pr);
       fprintf('\n transmission %f', toc(trans));
       coef = tic();
       R = coef_reflection(mur,Pr);
       fprintf('\n coef_reflexion %f', toc(coef));
       
       champ = tic();
       E_tot = electric_field(Pr,Tr,R,TX,RX);
       fprintf('\n Champs tot %f', toc(champ));
       
       %Chemin direct
       Tr_direct = transmission(mur,TX,RX);
       E_direct = electric_field(0,Tr_direct,0,TX,RX);
       
       E_tot(size(E_tot,1)+1) = E_direct;
        
       
       db_power(i+0.5,j+0.5) = signal_strength(E_tot);
       
       end_time = toc(ticID);
       total_time = total_time + end_time;
       moyenne = total_time/((i+0.5-1)*y+j+0.5);
       
   end
end

%On calcul le debit binaire
bitrate_mb = bitrate(db_power);

%diffractionPoints(mur,TX,RX);

fprintf('\n');
toc();
gui_project_ZC(mur,db_power,TX);
gui_project_DR(mur,bitrate_mb,TX);
%load handel;
%sound(y,Fs);