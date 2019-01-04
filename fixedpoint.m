%Marche sur matlab
%Input les deux functions f et g
%Initial guess avec olds
%Output l'abscisse et le nombre de step

f =@(x) exp(x)+x;
g =@(x) -exp(x);

olds = 0;
news = olds;
i = 0;

while i<100 
  news = g(olds);
  olds = news;
  i = i+1;
end
steps =i;
x = news;
y =f(news);  

steps
x
y