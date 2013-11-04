l=0;
n=5;                                                        %grid size
for a=1:1:n
    for b=1:1:n
           l=l+1;
           A(a,b)=rand;                                     %brownian seed function
           B(a,b)=rand;                                      %potential seed function
           position(l,1)=a;                                 %Storing the x position of the grid 
           position(l,2)=b;                                 %Storing the y position of the grid
    end
end

q=1;                                                        %Particle charge
m=1;                                                        %Particle mass
particlex=5.5 ;                                             %initial particle x-position
particley=1 ;                                               %initial particle y-position
c=0.1;                                                       %Values defined for parameters in stochastic random walk
d=0.9;
dt=pi/4;                                                     %Time step

for t=0:dt:2*pi  
    l=0;                                                    %Reset the array position to 0
   for j=1:1:n
       for k=1:1:n
         l=l+1;                                             %Move to next row in the array
         fprintf('%f',t);
         brownian=A(j,k)+(sqrt(dt))*(randn);   %Calculates brownian motion 
         potential=B(j,k)*exp(c-0.5*(d^2))*t+d*brownian;    %Calculates potential using stochastic
         position(l,3)=potential;
         A(j,k)=brownian;
       end 
   end
end
for l=1:1:n
    A(l,n)=A(l,2)
    A(l,1)=A(l,n-1)
    A(1,l)=A(n-1,l)
    A(n,l)=A(2,l)
    A(n,n)=A(2,2)
    A(1,1)=A(n-1,n-1)
    A(n,1)=A(2,n-1)
    A(1,n)=A(n-1,2)
end



        scatter3(position(:,1),position(:,2),position(:,3));
        sf=fit([position(:,1), position(:,2)], position(:,3), 'thinplateinterp');    %fits surface to potential
        plot(sf,[position(:,1), position(:,2)], position(:,3));
       
if (particlex<=n-1 && particlex>=2)                                           %For particle within the grid
    if(particley<=n-1 && particley>=2)
        particlex=particlex
        particley=particley
        
    elseif(particley>n-1)
        particley=particley-(n-1)
        particlex=particlex
     
    else
        particley=particley+(n-1)
        particlex=particlex
    end


elseif (particley<=n-1 && particley>=2) 
     if(particlex<=n-1 && particlex>=2)
        particlex=particlex
        particley=particley
        
    elseif(particlex>n-1)
        particlex=particlex-(n-1)
        particley=particley
     
    else(particlex<2)
        particlex=particlex+(n-1)
        particley=particley
     end
elseif(particlex>(n-1))
    if (particley>(n-1))
        particlex=particlex-(n-1)
        particley=particley-(n-1)
    
    elseif (particley<2)
        particlex=particlex-(n-1)
        particley=particley+(n-1)
        
    end
elseif (particlex<2)
    if (particley>(n-1))
        particlex=particlex+(n-1)
        particley=particley-(n-1)
    
    elseif (particley<2)
        particlex=particlex+(n-1)
        particley=particley+(n-1)
        
    end
end





