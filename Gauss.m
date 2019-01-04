%marche sur matlab
%Le porgramme demande n et m, la taile de la matrice
%ensuite les valeurs dans la matrice
%ensuite le B, de l'équation Ax=B (coefd result)
%Le programme affiche la matrice éliminée (left) et la saolution
clear
clc
m=input('m= ');
n=input('n= ');
left=zeros(n,m);
right=zeros(1,n);
X=zeros(1,m);
A=zeros(1,m);

%INputs
for i=1:n
  for j=1:m
    left(i,j)=input('coeff equa= ');
  end
end
for i=1:n
  right(i)=input('coeff result= ');
end


h=length(left); %n is the lenght of the matrix "left" going from 0 to n


%Gaussian elimination
for i=1:h
  for j=i+1:h
    k=((-1*left(j,i))/left(i,i)); %we calculate the factor use to multiply row in order to have left(i,i) = a(j,i)
    left(j,:)=k*left(i,:)+left(j,:); %we multiply row j by z and add it to row i in order to set the value left(j,i) to 0
    right(j)=k*right(i)+right(j); %we do the same with the matrix containing right hand part of the system
  end
end
%disp(left);
%disp(right);
for i=1:m
  A(i)=m-1*(i-1);
end
for i=1:m
  B=0;
  for j=1:m
    if j==A(i)
      continue
    else
      B=B+(X(j)*left(A(i),j));
      X(A(i))=(right(A(i))-B)/left(A(i),A(i));
    end
  end
end 
left
X


