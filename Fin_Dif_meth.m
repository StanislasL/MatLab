Xdiv = input('Number of divisions in x ? ');

Ydiv = input('Number of divisions in y ? ');

Xlen = input('Length in x ? ');

Ylen = input('Length in y ? ');

BoundaryC = zeros(Xdiv, Ydiv);

for i=1:Ydiv
    ask = strcat('Boundary condition in (1,',num2str(i),') ? ');
    BoundaryC(1,i) = input(ask);
end
for i=2:Xdiv
    ask = strcat('Boundary condition in (',num2str(i),',1) ? ');
    BoundaryC(i,1) = input(ask);
end
for i=2:Ydiv
    ask = strcat('Boundary condition in (',num2str(Xdiv),',',num2str(i),') ? ');
    BoundaryC(Xdiv,i) = input(ask);
end
for i=2:Xdiv-1
    ask = strcat('Boundary condition in (',num2str(i),',',num2str(Ydiv),') ? ');
    BoundaryC(i,Ydiv) = input(ask);
end

display(BoundaryC)


PointNum = (Xdiv - 2)*(Ydiv - 2);

A = zeros(PointNum);
B = zeros(1,PointNum);

for i=1:PointNum
    for j=1:PointNum
        if (i==j)
            A(i,j)=4;
        end
    end
    
    a = mod(i,Xdiv-2);
    
    if (mod(i-1,Xdiv-2)~=0)
        if ((i-1)>=1)
            A(i,i-1)=-1;
        end
    end
    if ((a+1)<=Xdiv-2)&&((a+1)>1)
        if ((i+1)<=PointNum)
            A(i,i+1)=-1;
        end
    end
    if ((i-Xdiv+2)>=1)
        A(i,i-Xdiv+2)=-1;
    end
    if ((i+Xdiv-2)<=PointNum)
        A(i,i+Xdiv-2)=-1;
    end
end

for t=1:PointNum
    i = 2+floor((t-1)/(Xdiv-2));
    j = 1+t-(Xdiv-2)*floor((t-1)/(Xdiv-2));
    if ((i-1)==1)
        B(1,t) = B(1,t)+BoundaryC(i-1,j);
    end
    if ((i+1)==Xdiv)
        B(1,t) = B(1,t)+BoundaryC(i+1,j);
    end
    if ((j-1)==1)
        B(1,t) = B(1,t)+BoundaryC(i,j-1);
    end
    if ((j+1)==Ydiv)
        B(1,t) = B(1,t)+BoundaryC(i,j+1);
    end
end

display(A)
display(B)

Ao = A;
An = A;
Bo = transpose(B);
Bn = transpose(B);

for i=1:length(A)
    t = 1;
    while An(i,i) == 0
        An(i,:)=Ao(i+t,:);
        Bn(i,:)=Bo(i+t,:);
        An(i+t,:)=Ao(i,:);
        Bn(i+t,:)=Bo(i,:);
        t = t + 1 ;
        Ao = An ;
        Bo = Bn ;
        if t > length(A)-1
            break
        end
    end
    if An(i,i)==0
    else Bn(i,:)=Bn(i,:)/An(i,i);
         An(i,:)=An(i,:)/An(i,i);
    end
    for j=i+1:length(A)
        Bn(j,:)=Bn(j,:)-Bn(i,:)*An(j,i);
        An(j,:)=An(j,:)-An(i,:)*An(j,i);
    end
    Ao = An;
    Bo = Bn;
end


for i=1:length(A)
    t = 5 - i;
    X(t) = Bn(t);
    for j=t+1:length(A)
        X(t)= X(t) - An(t,j)*X(j);
    end
end

display(An)
display(Bn)
display(X)

Solution = BoundaryC;
t = 1;
for i = 2:Xdiv-1
    for j = 2:Ydiv-1
        Solution(i,j) = X(t);
        t = t+1;
    end
end

display(Solution)

x = 0:Xlen/(Xdiv-1):Xlen;
y = 0:Ylen/(Ydiv-1):Ylen;

surf(x,y,Solution)

