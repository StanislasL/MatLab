%MArche sur matlab
%LA formule du prof dans le cours ne marche pas
%Input delta t, delta x(avec les coefficient mu et F)
%changer la formule la ou je mets trois points d'interrogations
%output l'evolution de la position de la ficelle dans le temps
clear x
clear y

mu=1;
F=400;
dx=0.1; %cm
dt=dx*sqrt(mu/F);

l=80; %cm
N=l/dx;
y=zeros(N,1000);
y(200,1)= 0.6;
%cree la corde qui se leve de 0 a 20 cm
for i=1:200
    y(i,1)=0.6*i/200;
end
%cree la corde qui se baisse de 20 a 80 cm
for i=200:N
    y(i,1)= -i*0.6/600 + 0.8;
end
    
%application de la fomrule du prof
for j=2:N
    for i=2:(N-1)
        y(i,j+1) = y(i+1,j) + y(i-1,j) - y(i,j-1); %??????????????????????????
    end
end

%Affichage de la matrice ligne par ligne
%Chaque 0,001 seconde une nouvelle ligne s'affiche, les valuers de la ligne
%sont plot en fonction de x
x=0:+dx:l-dx;
z=zeros(1,N);
for j=1:1000
    for i=1:N
        z(i)=y(i,j);
    end
    plot(x,z);
    pause(0.001);
end