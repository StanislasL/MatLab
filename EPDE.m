clear
%works on matlab
%Just input the boundary condition when the programm ask them
%Output the matrix with all the tempeartures


%we define the boundaries of the metal sheet
Ly = 15;
Lx = 12;
%We chose to divide each length in segments of 3 cm
h = 1;
%Definition of the dimension of the matrix containing the temperature
pty = Ly/h+1;
ptx = Lx/h+1;
%Creation of a zero matrix that will contain the temperatires in different points
sheet = zeros (ptx, pty);

sheet(:,1) = 0;
sheet(1,:) = 0;




%we set up the temperatures on the first line
for i=1:pty
  sheet(1,i) = 20*h*(i-1);
  end
  
 
%we set up the temperatures on the last column
for i=0:ptx-1
  sheet(ptx-i,pty) = 25*h*i;
  end
  
  

%Creation of  matrix containing all our unknowns 
Matrix = zeros ((ptx-2)*( pty-2),(ptx-2)*( pty-2));
%Creation of a matrix containing our initial conditions
Final = zeros ((ptx-2)*( pty-2),1);




%In this loop, the program will ask the user to input all the values of T1 until
%T12 in Matrix, and the corresponding boundary condition in Final

%Counting the lines
for i=1:12
%Counting the columns
  for j = 1:12
    Matrix(i,j) = input('T');
    disp (Matrix) 
    end
  Final (i,1) = input ('Boundary');
  disp (Final);
end  



%X will contain all our results
X = linsolv(Matrix,Final);
disp (X);


