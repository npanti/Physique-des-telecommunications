clear;
clc;

global beta lambda f Z0 G_TX P_TX h_e Ra TX RX eps0 mhu0 omega;

%Norme
P_TX_dbm = 12;
P_TX = 0.001*10^(P_TX_dbm/10); %Puissance maximum légal pour un wifi en intérieur est de 100mW
f = 2.45e9; %2,45 Ghz norme 802.11n
beta = 2*pi*f/300e6;
lambda = 300e6/f;
h_e = -lambda/pi;
%h_e = -lambda/pi*cos(pi/2*cos(pi/2))/sin(pi/2)^2; %Formule generale
Ra = 75;
eps0 = 8.854187e-12;
mhu0 = pi*4e-7;
omega = 2*pi*f;

%impédance du vide
Z0 = 120*pi;

%Récepteur et émeteur [x y]
RX = [1 1];

G_TX = 1.6524;

reflexion_max = 1;

%Pièce simple (carrée)
x=30;
y=10;
mur = [0 0 30 0 0.10 5 0.1; 30 0 30 10 0.10 5 0.1; 30 10 0 10 0.10 5 0.1; 0 10 0 0 0.10 5 0.1; 4 0 4 4 0.10 5 0.1];
mur2 = [0 0 0 10 0.10 5 0.1; 0 10 20 10 0.10 5 0.1; 20 10 20 0 0.10 5 0.1; 20 0 0 0 0.10 5 0.1; 10 0 10 4 0.10 5 0.1; 10 10 10 6 0.10 5 0.1; 5 5 15 5 0.10 5 0.1];
mur3 = [0 0 0 10 0.10 5 0.1; 0 10 20 10 0.10 5 0.1; 20 10 20 0 0.10 5 0.1; 20 0 0 0 0.10 5 0.1; 10 0 10 4 0.10 5 0.1; 10 10 10 6 0.10 5 0.1] ;
mur4 = [0 0 8 0 0.15 5 0.1
       0 0 0 33 0.15 5 0.1
       8 0 8 33 0.15 5 0.1
       0 33 8 33 0.15 5 0.1
       0 18 6 18 0.15 5 0.1
       0 22 6 22 0.15 5 0.1
       6 18 6 20 0.15 5 0.1
       6 21 6 22 0.15 5 0.1
       6 33 6 22 0.15 5 0.1
       6 18 6 0 0.15 5 0.1
       6 26 0 26 0.15 5 0.1
       6 9 0 9 0.15 5 0.1
       3 22 3 20 0.02 5 0.1
       3 20 5 20 0.02 5 0.1
       5 20 5 22 0.02 5 0.1];
mur5 = [
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
TX = [1 1];

% hold on;
% for z=1:+1:size(mur,1)
%     plot([mur(z,1) mur(z,3)],[mur(z,2) mur(z,4)],'-k');
% end

db_power = zeros(x,y);
bitrate_mb = zeros(x,y);

end_time = 0;
total_time = 0;
moyenne = 0;

for i=0.5:+1:x
   for j=0.5:+1:y
       
       ticID = tic();
       %clc;
       fprintf('Avancement : %.2f %% \nTemps estimé: %.1f minutes',((i+0.5-1)*y+j+0.5)/(x*y)*100, (moyenne*x*y-total_time)/60);

       RX = [i j];
       Pr = raytracing(mur,TX,reflexion_max);
       Tr = transmission(mur,TX,RX,Pr);
       R = coef_reflection(mur,Pr);

       E_tot = electric_field(Pr,Tr,R,TX,RX);
       
       %Diffraction
       diffract = diffraction(mur,RX);
           Tr = transmission(mur,TX,RX,diffract);
           D = coef_diffraction(diffract);
           E_diffract = electric_field(diffract,Tr,ones(size(D,3)),TX,RX,D);
           E_tot = [E_tot; E_diffract];
       
       %Chemin direct
       Tr_direct = transmission(mur,TX,RX);
       E_direct = electric_field(0,Tr_direct,0,TX,RX);
       
       E_tot(size(E_tot,1)+1) = E_direct;
        
       db_power(i+0.5,j+0.5) = signal_strength(E_diffract);
       
       end_time = toc(ticID);
       total_time = total_time + end_time;
       moyenne = total_time/((i+0.5-1)*y+j+0.5);
       
   end
end

%plot([TX(1) RX(1)],[TX(2) RX(2)],'.r');

% TX = [23 21];
% db_power2 = zeros(x,y);
% end_time = 0;
% total_time = 0;
% moyenne = 0;
% 
% for i=0.5:+1:x
%    for j=0.5:+1:y
%        
%        ticID = tic();
%        clc;
%        fprintf('Avancement : %.2f %% \nTemps estimé: %.2f minutes',((i+0.5-1)*y+j+0.5)/(x*y)*100, (moyenne*x*y-total_time)/60);
% 
%        RX = [i j];
%        ray = tic();
%        Pr = raytracing(mur,TX,reflexion_max);
%        Tr = transmission(mur,TX,RX,Pr);
%        R = coef_reflection(mur,Pr);
% 
%        E_tot = electric_field(Pr,Tr,R,TX,RX);
%        
%        %Chemin direct
%        Tr_direct = transmission(mur,TX,RX);
%        E_direct = electric_field(0,Tr_direct,0,TX,RX);
%        
%        E_tot(size(E_tot,1)+1) = E_direct;
%         
%        
%        db_power2(i+0.5,j+0.5) = signal_strength(E_tot);
%        
%        end_time = toc(ticID);
%        total_time = total_time + end_time;
%        moyenne = total_time/((i+0.5-1)*y+j+0.5);
%        
%    end
% end
% 
% TX = [20 9];
% db_power3 = zeros(x,y);
% end_time = 0;
% total_time = 0;
% moyenne = 0;
% 
% for i=0.5:+1:x
%    for j=0.5:+1:y
%        
%        ticID = tic();
%        clc;
%        fprintf('Avancement : %.2f %% \nTemps estimé: %.2f minutes',((i+0.5-1)*y+j+0.5)/(x*y)*100, (moyenne*x*y-total_time)/60);
% 
%        RX = [i j];
%        ray = tic();
%        Pr = raytracing(mur,TX,reflexion_max);
%        Tr = transmission(mur,TX,RX,Pr);
%        R = coef_reflection(mur,Pr);
% 
%        E_tot = electric_field(Pr,Tr,R,TX,RX);
%        
%        %Chemin direct
%        Tr_direct = transmission(mur,TX,RX);
%        E_direct = electric_field(0,Tr_direct,0,TX,RX);
%        
%        E_tot(size(E_tot,1)+1) = E_direct;
%         
%        
%        db_power3(i+0.5,j+0.5) = signal_strength(E_tot);
%        
%        end_time = toc(ticID);
%        total_time = total_time + end_time;
%        moyenne = total_time/((i+0.5-1)*y+j+0.5);
%        
%    end
% end
% 
% db_power_tot = totalStrength(db_power,db_power2,db_power3);

%On calcul le debit binaire
bitrate_mb = bitrate(db_power);



%diffractionPoints(mur,TX,RX);

fprintf('\n');
toc();
gui_project_ZC(mur,db_power,TX);
gui_project_DR(mur,bitrate_mb,TX);
%load handel;
%sound(y,Fs);