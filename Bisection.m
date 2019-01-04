%marche sur matlab
%Inserez la fonction f et les bornes a et b
%output une root entre les bornes
f =@(x) 3*x*x - 4*x;
a=0.5;
b=5;
if f(a)*f(b)>0 
    disp('Bad choice')
else
    p = (a + b)/2;
    err = abs(f(p));
    while err > 0.001
        if f(a)*f(p)<0 
            b = p;
        else
            a = p;          
        end
        p = (a + b)/2; 
        err = abs(f(p));
    end
end

p