l=0;                                                        
n=5;                                                        %grid size
p=10;                                                       %No of time steps
dt=pi/50;                                                   %Time increment
t(1)=0;                                                     %Initial time
theta=0.3;                                                  %Constant for ARMA process 
phi=0.5;                                                    %Constant for ARMA process
L(1)=dt;                                                    %Initial lag
q=1;                                                        %Particle charge
m=1;                                                        %Particle mass
particle(1,1)=3;                                                %initial particle x-position
particle(1,2)=3;                                                %initial particle y-position
vx=0;
vy=0;
ax=0;
ay=0;

for a=1:1:n
    for b=1:1:n
           l=l+1;
           A(a,b)=rand;                                     %brownian seed function
           position(l,1)=a;                                 %Storing the x position of the grid 
           position(l,2)=b;                                 %Storing the y position of the grid
    end
end

         a=randn
         b=randn
autocorrelation(1)=((1-theta*phi)*(phi-theta))/(1+(theta^2)-2*theta*phi);

% B(1,1)=0
% B(1,2)=A(3,3)

for i=2:1:p
    t(i)=t(i-1)+dt;
    L(i)=i*dt;                                          %Lag
 
    l=0;                                                    %Reset the array position to 0
   for j=1:1:n
       for k=1:1:n
         l=l+1;                                             %Move to next row in the array
         fprintf('%f',t);
         potential=a-theta*b+phi*A(j,k);            %Calculates the potential
         A(j,k)=potential;
         b=a
         a=randn
       end 
   end
   
%    B(i,1)=t(i)
%    B(i,2)=A(3,3)
   
   autocorrelation(i)=phi*autocorrelation(i-1);     %Calculates the autocorrelation
   

   
for l=1:1:n
    A(l,n)=A(l,2);
    A(l,1)=A(l,n-1);
    A(1,l)=A(n-1,l);
    A(n,l)=A(2,l);
    A(n,n)=A(2,2);
    A(1,1)=A(n-1,n-1);
    A(n,1)=A(2,n-1);
    A(1,n)=A(n-1,2);
end
    for l=1:1:n*n
         position(l,3)=A(position(l,1),position(l,2));

   end
         



        scatter3(position(:,1),position(:,2),position(:,3));
        sf=fit([position(:,1), position(:,2)], position(:,3), 'thinplateinterp')    %fits surface to potential
        plot(sf,[position(:,1), position(:,2)], position(:,3));
%        
% if (particlex<=n-1 && particlex>=2)                                           %For particle within the grid
%     if(particley<=n-1 && particley>=2)
%         particlex=particlex;
%         particley=particley;
%         
%     elseif(particley>n-1)
%         particley=particley-(n-2);
%         particlex=particlex;
%      
%     else
%         particley=particley+(n-2);
%         particlex=particlex;
%     end
% 
% 
% elseif (particley<=n-1 && particley>=2) 
%      if(particlex<=n-1 && particlex>=2)
%         particlex=particlex;
%         particley=particley;
%         
%     elseif(particlex>n-1)
%         particlex=particlex-(n-2);
%         particley=particley;
%      
%     else(particlex<2)
%         particlex=particlex+(n-2);
%         particley=particley;
%      end
% elseif(particlex>(n-1))
%     if (particley>(n-1))
%         particlex=particlex-(n-2);
%         particley=particley-(n-2);
%     
%     elseif (particley<2)
%         particlex=particlex-(n-2);
%         particley=particley+(n-2);
%         
%     end
% elseif (particlex<2)
%     if (particley>(n-1))
%         particlex=particlex+(n-2);
%         particley=particley-(n-2);
%     
%     elseif (particley<2)
%         particlex=particlex+(n-2);
%         particley=particley+(n-2);
%         
%     end
% end
% particlex
% particley
% %     [gx, gy] = differentiate(sf, [particlex,particley])                   %Electric field calculated as derivative of potential at particle position
%      ex=2
%      ey=0
%      ekx=0.5*m*vx^2
%      eky=0.5*m*vy^2
%      dx=0.5*ax*(dt)^2
%      dy=0.5*ay*(dt)^2
%      
%      if(dx==0)
%         fx = q*(ex+                                                                      %Force at particle position in x direction
%      else
%         fx = q*ex+ekx/dx
%      end
%      if(dy==0)
%         fy = q*ey
%      else
%         fy = q*ey+eky/dy                                                %Force at particle position in y direction
%      end
%         
%      ax = fx/m;                                                              %Acceleration of particle in x direction
%      ay = fy/m;                                                              %Acceleration of particle in y direction 
%      vx=vx+ax*dt;                                                           %Velocity in x direction
%      vy=vy+ay*dt;                                                            %Velocity in y direction
%      particlex = particlex+0.5*ax*(dt)^2;                                    %Particle position along the x axis
%      particley = particley+0.5*ay*(dt)^2;                                     %Particle position along the y axis
%      particle(i,1)=particlex;
%      particle(i,2)=particley;
% 
end
% %     plot(B(:,1),B(:,2), '-')
% plot3(particle(:,1),particle(:,2),t, '-')
% xlabel('x','FontSize', 10)
% ylabel('y', 'FontSize', 10)
% zlabel('Time', 'FontSize', 10)
%    
% f=fit(L(:), autocorrelation(:), 'exp1');
% plot(L,autocorrelation, '-b')                             
% hold on
% plot(f)
% xlabel('Lag','FontSize', 10)
% ylabel('Autocorrelation','FontSize',10)
% grid on
% b=coeffvalues(f);
% CorrT=(-1)/b(2) 
