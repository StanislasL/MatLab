%Marche sur MAtlab
%Change the constant c, k, ro
%Change a and b, the born of the tube
%change N the number of steps
%Change the formula where I put the ???????
%Output the temperature versus the time vs the x position
clear x
clear y

c=460;
k=50;
ro=7800;

a=0;
b=1;
N=100;

h=(b-a)/N;
dt=h*h*c*ro/(2*k);
M= zeros(N,N);
x(1)=a;
%initialazing the first row
for i=1:N
  M(1,i)=(i-1);
end
for n=1:N
  M(n,1)=20;
  M(n,N)=100;
end

%Applying the formula
for j=1:N
  for n=2:(N-1)  
    M(j+1,n)=0.5*(M(j,n-1)+M(j,n+1)); %?????????
   end
   x(n)=n*dt;
end
M;

surf(M);  
