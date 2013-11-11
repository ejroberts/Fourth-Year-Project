dt=pi/50;
t(1)=0;                      %Initial time
potential(1)=rand;           %Initial random potential
n=100;                         %Number of steps
b=0.9;

for k=1:1:n
    u(k)=rand;
end

for k=2:1:n
        
        potential(k)=u(k)-b*u(k-1);   %Calculates potential 
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

 



