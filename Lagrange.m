%MArche UNIQUEMENT sur Matlab
%Input les différents pint de coordonées x,y
%Output tous les coefficient et affiche la courbe avec les points x et y de
%base

x = [0.5 1.5 2.5 8  ];
y = [2.89 0.21 -3.90  15  ];
sum=0;
for i=1:length(x)
    p=1;
    for j=1:length(x)
        if j~=i
            c = poly(x(j))/(x(i)-x(j));
            p = conv(p,c);
        end
    end
    term = p*y(i);
    sum= sum + term;
end
disp(sum);

w=x(1):0.1:x(length(x));
p = polyval(sum,w);

plot(w,p,x,y,'c*','Color',[1,0,0]);