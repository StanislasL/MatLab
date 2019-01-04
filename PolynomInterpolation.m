%Marche sur Matlab
%Input X et Y demandé par le programme
%Output les coefficients du polynome
%set up the initial conditions
x = input('number of values');
X = zeros (x,1);
Y = zeros (x,1);

%input x
for i=1:x
  X(i,1) = input ('data')
  end
  
%input f(x)
for i=1:x
  Y(i,1) = input ('function')
  end
 
%creation of a matrix that will contain all our coefficients 
Matrix = zeros(x,x);

%We fill this matrix
for i = 1:x
  for j = 1:x
    Matrix(i,j) = X(i,1)^(j-1);
  end
end  

%Solving the linear system of equation
A = linsolve(Matrix,Y);

%display the solution
disp(A)

