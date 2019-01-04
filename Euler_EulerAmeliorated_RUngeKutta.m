%Change the intervall with a and b
%change the number of step (100 is good choice)
%change the formula of the derivative
%The programm wil plot the euler/euler amelio/ rk4

clear  %clear all the variables
a=0; %a and b are the interval on which we will draw the function
b=1; 
N=100; %number of steps

h=(b-a)/N; %size of a step
x(1)=a; 
y0= 1; %initial values
y(1)=y0;
z(1)=y0;
w(1)=y0;

%formula of the derivative
F = @(x) exp(-x*x);

for n=1:N
  x(n+1)=x(n)+h; %step
  
  %euler
  z(n+1)=z(n)+h*F(x(n));
  
##  %euler ameliorated
##  yi = y(n)+h*F(x(n),y(n));
##  y(n+1)=y(n)+h*(F(x(n),y(n)) + F(x(n+1),yi))/2;
##  
##  %Runge Kutta
##  k_1 = F(x(n),w(n)); 
##  k_2 = F(x(n)+0.5*h,w(n)+0.5*k_1*h);
##  k_3 = F(x(n)+0.5*h,(w(n)+0.5*k_2*h));
##  k_4 = F(x(n+1),w(n)+k_3*h);    
##  w(n+1) = w(n) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;
end

plot(x,z); 