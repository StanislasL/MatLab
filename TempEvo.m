% Lenb = input('Length of the bar ? ');
Lenb = 2;
% Div = input('Number of divisions ? ');
Div = 25;
% TempL = input('Temperature at the left of the bar ? ');
TempL =0;
% TempR = input('Temperature at the right of the bar ? ');
TempR =100;
% NTempL = input('New temperature at the left of the bar ? ');
NTempL = 0;
% NTempR = input('New temperature at the right of the bar ? ');
NTempR = 20;
% % TempMid = input('Temperature at the center ? ');
% 
% T = input('Total time of study ? ');
T = 1000000;
% Dens = input('Density of the material ? ');
Dens = 7800;
% Cp = input('Heat capacitance of the material ? ');
Cp =460;
% k = input('k of the material ?');
k = 50;

A = zeros(1,Div);

TDiv = ceil(T/(((Lenb/Div)^2)*Cp*Dens/(2*k)));

A(1,1)=TempL;
A(1,Div)=TempR;

B = zeros(Div,TDiv);

for x=2:1:Div-1
    A(1,x)= A(1,1)+x*(A(1,Div)-A(1,1))/Div;
end

A(1,1) = NTempL;
A(1,Div) = NTempR;

B(:,1)=A

for t=2:1:TDiv
    for x=2:1:Div-1
        A(1,x)=0.5*(A(1,x-1)+A(1,x+1));
    end
    B(:,t)=A;
end


for t=1:1:TDiv
    bar(B(:,t), 'red');
    ylim([0,100]);
    pause(1)
end

