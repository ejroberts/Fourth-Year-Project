t(1)=0;                      %Initial time
dt=pi/50;
potential(1)=rand;           %Initial random potential
n=50000;                         %Number of steps


    for k=2:1:n
        potential(k)=potential(k-1)+(sqrt(dt))*(randn);   %Calculates potential 
        t(k)=t(k-1)+dt;                                 %Time increment
        
    end
    

    
 
 for i=1:1:5000
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
 
 g(i)=i;
 end
 
plot(g,autocorrelation, '-rs')                             
xlabel('Lag','FontSize', 10)
ylabel('Autocorrelation','FontSize',10)
grid on
