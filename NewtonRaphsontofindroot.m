%Marche surmatlab
%Input F, la dérivé de F => f
%Input le Initial GUess
%Output la root si le initila guess est bon
F = @(x) x*x*x + x*x - 3*x -3;
f = @(x) 3*x*x + 2*x -3;

IniGuess=100;
c=IniGuess;
for i=0:100
    if abs(F(c))>0.0001
        c = c - F(c)/f(c);
    end
end

c