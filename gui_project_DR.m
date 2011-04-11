function gui_project_DR(vec,DataRate,TX)
% GUI_PROJECT_DR Interface graphique pour l'affichage des d�bits re�us.
% GUI_PROJECT_DR(VEC,DATARATE,TX) affiche l'environnement VEC, l'�metteur TX
%       et l'ensemble des d�bits re�us DATARATE sur toutes les zones de 
%	  l'environnement.
%
% VEC = matrice [m x 4] repr�sentant l'environnement (murs) o� m est le 
%       nombre de murs.
% DATARATE = matrice [s x t] repr�sentant l'ensemble des d�bits re�us 
%           sur toute la zone de l'environnement. s et t correspondent au
%           dimension de la zone de travail (s correspond � la dimension 
%		maximale selon x (en m�tre) et t selon y. Chaque valeur de 
%		DATARATE repr�sente donc le d�bit moyen re�u pour une
%		zone de 1 m�.
% TX = [x,y] repr�sentant la position de l'�metteur o� x est la coordonn�e
%           selon x de l'�metteur et y celle selon y.



param.h=1;
l = 0.1;
tcolor = [144 144 144;
    144 144 144;
    144 144 144;
    144 144 144;
    144 144 144;
    144 144 144]/255;

tcolor1 = [255 0 0;
    255 0 0;
    255 0 0;
    255 0 0;
    255 0 0;
    255 0 0]/255;

figure;
uplimit = 100; 
downlimit = 8.5714; 
[m n] = size(DataRate);
DataRate1 = DataRate;
DataRate1(m+1,1:n) =0;
DataRate1(1:m+1,n+1) =0;

load('mycolormap','mycmap')
set(gcf,'colormap',mycmap)
h=pcolor([0:m],[0:n],DataRate1');
shading 'flat'
caxis([downlimit uplimit]);
cbar = colorbar;
set(cbar,'CLim',[downlimit uplimit]);
hold on;

set(gca,'DataAspectRatio',[1 1 1]);
set(gcf,'DoubleBuffer','on');
[m n] = size(vec);
axis off

%Affichage du TX
vertices = [TX(1)-1/4 TX(2)-1/4 1/2;
    TX(1)-1/4 TX(2)+1/4 1/2;
    TX(1)+1/4 TX(2)-1/4 1/2;
    TX(1)+1/4 TX(2)+1/4 1/2;
    TX(1)-1/4 TX(2)-1/4 param.h;
    TX(1)-1/4 TX(2)+1/4 param.h;
    TX(1)+1/4 TX(2)-1/4 param.h;
    TX(1)+1/4 TX(2)+1/4 param.h];
faces = [1 2 6 5;
    4 3 7 8;
    1 3 7 5;
    2 4 8 6;
    1 2 4 3;
   5 7 8 6];
tcolor;
patch('Faces',faces,'Vertices',vertices,'FaceVertexCData' ,tcolor1,'FaceColor','flat');

%Affichage des murs
for id = 1 : m
    x1 = vec(id,1);
    y1 = vec(id,2);
    x2 = vec(id,3);
    y2 = vec(id,4);

    if (x1==x2)
        dir = 'vert';
    else
        dir = 'horiz';
    end
    
    switch dir
        case 'vert'
            vertices = [x1-l/2 y1 0;
                x1-l/2 y2 0;
                x2+l/2 y2 0;
                x2+l/2 y1 0;
                x1-l/2 y1 param.h;
                x1-l/2 y2 param.h;
                x2+l/2 y2 param.h;
                x2+l/2 y1 param.h];
            faces = [1 2 6 5;
                4 3 7 8;
                1 5 8 4;
                2 3 7 6;
                5 8 7 6;
                1 4 3 2;];
            tcolor;
            patch('Faces',faces,'Vertices',vertices,'FaceVertexCData' ,tcolor,'FaceColor','flat');
        case 'horiz'
            vertices = [x1 y1-l/2 0;
                x1 y2+l/2 0;
                x2 y2+l/2 0;
                x2 y1-l/2 0;
                x1 y1-l/2 param.h;
                x1 y2+l/2 param.h;
                x2 y2+l/2 param.h;
                x2 y1-l/2 param.h];
            faces = [1 2 3 4;
                5 6 7 8;
                1 2 6 5;
                4 3 7 8;
                1 5 8 4;
                2 6 7 3];
            tcolor;
            patch('Faces',faces,'Vertices',vertices,'FaceVertexCData' ,tcolor,'FaceColor','flat');
    end
end
view(-28,56)
