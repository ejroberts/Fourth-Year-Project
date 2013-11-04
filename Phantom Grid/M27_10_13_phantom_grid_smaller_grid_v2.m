l=0;
n=5;                                                        %grid size
for a=1:1:n
    for b=1:1:n
           l=l+1;
           A(a,b)=rand;                                     %brownian seed function
           B0(a,b)=rand;                                      %potential seed function
           B(a,b)=B0(a,b);
           position(l,1)=a;                                 %Storing the x position of the grid 
           position(l,2)=b;                                 %Storing the y position of the grid
    end
end
q=1;                                                        %Particle charge
m=1;                                                        %Particle mass
particlex=3;                                            %initial particle x-position
particley=3;                                               %initial particle y-position
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
         potential=B0(j,k)*exp(c-0.5*(d^2))*t+d*brownian;    %Calculates potential using stochastic
         position(l,3)=potential;
         A(j,k)=brownian;
         B(j,k)=potential;
       end 
   end

for l=1:1:n
    B(l,n)=B(l,2)
    B(l,1)=B(l,n-1)
    B(1,l)=B(n-1,l)
    B(n,l)=B(2,l)
    B(n,n)=B(2,2)
    B(1,1)=B(n-1,n-1)
    B(n,1)=B(2,n-1)
    B(1,n)=B(n-1,2)
end



        scatter3(position(:,1),position(:,2),position(:,3));
        sf=fit([position(:,1), position(:,2)], position(:,3), 'thinplateinterp');    %fits surface to potential
        plot(sf,[position(:,1), position(:,2)], position(:,3));
       
if (particlex<=n-1 && particlex>=2)                                           %For particle within the grid
    if(particley<=n-1 && particley>=2)
        particlex=particlex
        particley=particley
        
    elseif(particley>n-1)
        particley=particley-(n-2)
        particlex=particlex
     
    else
        particley=particley+(n-2)
        particlex=particlex
    end


elseif (particley<=n-1 && particley>=2) 
     if(particlex<=n-1 && particlex>=2)
        particlex=particlex
        particley=particley
        
    elseif(particlex>n-1)
        particlex=particlex-(n-2)
        particley=particley
     
    else(particlex<2)
        particlex=particlex+(n-2)
        particley=particley
     end
elseif(particlex>(n-1))
    if (particley>(n-1))
        particlex=particlex-(n-2)
        particley=particley-(n-2)
    
    elseif (particley<2)
        particlex=particlex-(n-2)
        particley=particley+(n-2)
        
    end
elseif (particlex<2)
    if (particley>(n-1))
        particlex=particlex+(n-2)
        particley=particley-(n-2)
    
    elseif (particley<2)
        particlex=particlex+(n-2)
        particley=particley+(n-2)
        
    end
end
    [gx, gy] = differentiate(sf, [particlex,particley])                     %Electric field calculated as derivative of potential at particle position
     gx=-ex
     gy=-ey
     ekx=0.5*m*vx^2
     eky=0.5*m*vy^2
     dx=0.5*ax*(dt)^2
     dy=0.5*ay*(dt)^2
     fx = q*ex+ekx/dx                                                              %Force at particle position in x direction
     fy = q*ey+eky/dy                                                              %Force at particle position in y direction
     ax = fx/m                                                              %Acceleration of particle in x direction
     ay = fy/m                                                              %Acceleration of particle in y direction 
     vx=vx+ax*dt                                                            %Velocity in x direction
     vy=vy+ay*dt                                                            %Velocity in y direction
     particlex = particlex+0.5*ax*(dt)^2                                      %Particle position along the x axis
     particley = particley+0.5*ay*(dt)^2                                      %Particle position along the y axis
    

     end



