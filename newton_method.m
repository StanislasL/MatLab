%Marche sur matlab
%Input tous les f g et derivées partielles de f et g
%Input le initial guess X0
%Output la solution

f=@(x,y) -x^2 - y^2 + 4;
g=@(x,y) -exp(x) - y + 1;

dfx=@(x) -2*x;
dfy=@(y) -2*y;
dgx=@(x) -exp(x);
dgy=@(y) -1; 

X0 = [1;1];
A = [dfx(X0(1)), dfy(X0(2)); dgx(X0(1)), dgy(X0(2))];
A;
B = [-f(X0(1),X0(2));-g(X0(1),X0(2))];
B;
k = 0;
err = abs(f(X0(1),X0(2)));

for q = 1:2
  for i= 1:2
    Aux1 = A(1,1);
    A(i,:) = A(i,:)/Aux1;
    B(i) = B(i)/Aux1;
  
    for j = i+1:2
      Aux2 = A(j,i);
      A(j,:) = A(j,:) - A(i,:)*Aux2;
      B(j) = B(j) - B(i)*Aux2;
    end
  end
  A;
  B;

  for i=2:-1:1
    sum = 0;
    for j=i+1:2
      sum = sum + A(i,j)*C(j);
    end
    C(i) = [(-sum + B(i))/A(i,i)];
  end
  
  X0 = transpose(X0);
  X = C + X0;
  X0 = [1;1];
  A = [dfx(X(1)), dfy(X(2)); dgx(X(1)), dgy(X(2))];
  B = [-f(X(1),X(2));-g(X(1),X(2))];
  err = abs(f(X(1),X(2)));
  
end

X
