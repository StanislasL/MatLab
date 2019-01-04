%Marche Uniquement sur Matlab
%Input X et Y les coordonées des points
%Output les coeficient a b c et d et plot la fonction

clear
x = [0.5 1.5 2.5 ];
y = [2.89 0.21 -3.90];
n =length(x);

for i=1:(n-1)
    h(i)=x(i+1)-x(i);
end


for i=2:(n-1)
    alpha(i)=3*(y(i+1)-y(i))/h(i) -3*(y(i)-y(i-1))/h(i-1);
end

I(1)=1;
mu(1)=0;
z(1)=0;

for i=2:(n-1)
    I(i) = 2*(x(i+1)-x(i-1)) -h(i-1)*mu(i-1);
    mu(i)=h(i)/I(i);
    z(i)=(alpha(i)-h(i-1)*z(i-1))/I(i);
end

I(n)=1;
c(n)=0;
z(n)=0;

for j=(n-1):-1:1
  c(j)=z(j)-mu(j)*c(j+1);
  b(j)=(y(j+1)-y(j))/h(j) - h(j)*(c(j+1) + 2*c(j))/3;
  d(j)=(c(j+1)-c(j))/(3*h(j));
end


%plot the function obtained
for i=1:(n-1)
    w = linspace(x(i),x(i+1));
    f =@(t) d(i).*(t-x(i)).^3 + c(i).*(t-x(i)).^2 + b(i).*(t-x(i)) +y(i);
    s = f(w);
    plot(w,s);
    hold on
end

y
b
c
d