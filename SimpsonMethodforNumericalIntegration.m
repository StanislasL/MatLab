%Works for Matlab
%Input les bornes de l'intégration a et b
%Input N le nombre de steps
%Input la fonction F
%Output the value of the integral
a=0;
b=0.5*pi;
N=100;
h=(b-a)/N;

F = @(x) cos(x)*sin(x);

S1= F(a+h/2);
S2=0;

for i=1:(N-1)
  S1= S1 + F(a+h*i+h/2);
  S2= S2 + F(a+h*i);
end

integral= h*(F(a)+F(b)+4*S1+2*S2)/6;

integral