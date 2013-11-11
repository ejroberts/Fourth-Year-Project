dt=pi/50;
t(1)=0;                      %Initial time
t(2)=dt;
potential(1)=rand;           %Initial random potential
potential(2)=rand;
n=180;                         %Number of steps
delta=0.577;
c=1.407;
d=-0.498;

for k=3:1:n
        potential(k)=delta+c*potential(k-1)+d*potential(k-2)+(randn);   %Calculates potential 
        t(k)=t(k-1)+dt;                                 %Time increment
    end
    

    
 
 for i=1:1:20
 M=0;
 N=0; 
 a=zeros([1,n]);
 b=zeros([1,n]);
 
     for k=1:1:n-i
         M=M+potential(k);
    end
 
    Meana=M/(n-i);
    
    for k=1:1:n-i
        a(k)=(potential(k)-Meana);
    end
    
    
    for k=1+i:1:n
        N=N+potential(k);
    end
    
    Meanb=N/(n-i);
    
    for k=1:1:n-i
        b(k)=(potential(k+i)-Meanb);
    end
    
 A=sum(a.^2);
 B=sum(b.^2);
 
 den=sqrt(A*B);

num=sum(a.*b);
 
 autocorrelation(i)=num/den;
 positivelimit(i)=2/sqrt(n);      %Setting 95% confidence limits
 negativelimit(i)=-2/sqrt(n);
 g(i)=i;
 end
 
plot(g,autocorrelation, '-b', g, positivelimit, '-r', g, negativelimit, '-r' )                             
xlabel('Lag','FontSize', 10)
ylabel('Autocorrelation','FontSize',10)
grid on
figure
plot(t,potential, '-')

 



