function [output] = Ft(x)
% FT Approximation num�rique de la fonction de Fresnel.
% [output] = Ft(x) retourne l'approximation num�rique de la fonction de
%            Fresnel donn�e par [CATEDRA99]. pour l'�l�ment x.
%
%[CATEDRA99] M. F. C�TEDRA and J. P�REZ-ARRIAGA , Cell Planning
%            For Wireless Communications, Artech House mobile 
%            communications library, Boston/London, 1999.

if (x >5.5)
    output = 1+(1i/(2*x))-(3/(4*x^2))-(1i*15/(8*x^3))+(75/(16*x^4));
elseif ( x>=0.3 && x<=5.5)
     F = [0.3 0.5729+1i*0.2677;
        0.5 0.6768+1i*0.2682;
        0.7 0.7439+1i*0.2549;
        1   0.8095+1i*0.2322;
        1.5 0.8730+1i*0.1982;
        2.3 0.9240+1i*0.1577;
        4   0.9658+1i*0.1073;
        5.5 0.9797+1i*0.0828];
    if (x==0.3)
        output = 0.5729+1i*0.2677;
    elseif(x==5.5)
        output = 0.9797+1i*0.0828;
    else
        %ind = min(find(F(:,1)>x));
        ind = find(F(:,1)>x, 1 );
        p = polyfit(F(ind-1:ind,1),F(ind-1:ind,2),1);
        output = polyval(p,x);
    end
    
elseif (x>=0 && x<0.3)
    output = (sqrt(pi*x)-(2*x*exp(1i*pi/4))-(2/3*exp(-1i*pi/4)*x^2))*exp(1i*(x+pi/4));
elseif(x<0)
    output = Ft(abs(x))';
end
