Xdiv = input('Number of divisions in x ? ');

Ydiv = input('Number of divisions in y ? ');

Xlen = input('Length in x ? ');

Ylen = input('Length in y ? ');

BoundaryC = zeros(Xdiv, Ydiv);
#{
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
#}

ask = 'Boundary condition in (1,1) ? ';
BoundaryC(1,1)=input(ask);

ask = 'Is the boundary Condition linear ? Y=1, N=0 ';
lin=input(ask);

if lin==1
  ask = strcat('Boundary condition in (1,',num2str(Ydiv),') ? ');
  BoundaryC(1,Ydiv)=input(ask);
  
  ask = strcat('Boundary condition in (',num2str(Xdiv),',1) ? ');
  BoundaryC(Xdiv,1)=input(ask);
  
  ask = strcat('Boundary condition in (',num2str(Xdiv),',',num2str(Ydiv),') ? ');
  BoundaryC(Xdiv,Ydiv)=input(ask);

  for i = 2:Ydiv-1
    BoundaryC(1,i)=((BoundaryC(1,Ydiv)-BoundaryC(1,1))*(i-1)/(Ydiv-1))+BoundaryC(1,1);
  end
  
  for i = 2:Xdiv-1
    BoundaryC(i,1)=BoundaryC(1,1)+(BoundaryC(Xdiv,1)-BoundaryC(1,1))*(i-1)/(Xdiv-1);
  end
  
  for i = 2:Ydiv-1
    BoundaryC(Xdiv,i)=BoundaryC(Xdiv,1)+(BoundaryC(Xdiv,Ydiv)-BoundaryC(Xdiv,1))*(i-1)/(Ydiv-1);
  end
  
  for i = 2:Xdiv-1
    BoundaryC(i,Ydiv)=BoundaryC(1,Ydiv)+(BoundaryC(Xdiv,Ydiv)-BoundaryC(1,Ydiv))*(i-1)/(Xdiv-1);
  end
end

if lin==0
  ask = strcat('Derivative for side (1,1)-(1,',num2str(Ydiv),') as a function of i (i=0 is point (1,1))? ');
  equ = input(ask, "s");
  y = str2func(strcat('@(i) ',equ));
  for i=2:Ydiv
    BoundaryC(1,i)=y(i-2)*(i-1)+BoundaryC(1,1);
  end
  
  ask = strcat('Derivative for side (1,1)-(',num2str(Xdiv),',1) as a function of i (i=0 is point (1,1))? ');
  equ = input(ask, "s");
  y = str2func(strcat('@(i) ',equ));
  for i=2:Xdiv
    BoundaryC(i,1)=y(i-2)*(i-1)+BoundaryC(1,1);
  end
  
  ask = strcat('Derivative for side (',num2str(Xdiv),',1)-(',num2str(Xdiv),',',num2str(Ydiv),') as a function of i (i=0 is point (',num2str(Xdiv),',1))? ');
  equ = input(ask, "s");
  y = str2func(strcat('@(i) ',equ));
  for i=2:Ydiv
    BoundaryC(Xdiv,i)=y(i-2)*(i-1)+BoundaryC(Xdiv,1);
  end

  ask = strcat('Derivative for side (1,',num2str(Ydiv),')-(',num2str(Xdiv),',',num2str(Ydiv),') as a function of i (i=0 is point (1,',num2str(Ydiv),'))? ');
  equ = input(ask, "s");
  y = str2func(strcat('@(i) ',equ));
  for i=2:Xdiv-1
    BoundaryC(i,Ydiv)=y(i-2)*(i-1)+BoundaryC(1,Ydiv);
  end
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
    t = length(A)+1 - i;
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