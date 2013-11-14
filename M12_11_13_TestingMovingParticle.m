l=0;                                                        
n=50;                                                        %grid size
p=10;                                                       %No of time steps
dt=pi/50;                                                   %Time increment
t(1)=0;                                                     %Initial time
q=0.01;                                                        %Particle charge
m=0.01;                                                        %Particle mass
particlex=2;                                                %initial particle x-position
particley=2;                                                %initial particle y-position
particlez=4;
vx=1;
vy=1
vz=1
v=[vx,vy,vz];
ax=0;
ay=0;
az=0;

% for a=1:1:n
%     for b=1:1:n
%         for c=1:1:n
%            l=l+1;
%            A(a,b,c)=1;                                     %Electric field
%            position(l,1)=a;                                 %Storing the x position of the grid 
%            position(l,2)=b;                                 %Storing the y position of the grid
%            position(l,3)=c;                                 %Storing the y position of the grid
%         end
%     end
% end


% for i=2:1:p
%     for d=1:1:n   
%         for l=1:1:n
%     A(l,d,n)=A(l,d,2);
%     A(l,d,1)=A(l,d,n-1);
%     A(1,d,l)=A(n-1,d,l);
%     A(n,d,l)=A(2,d,l);
%     A(l,1,d)=A(l,n-1,d);
%     A(l,n,d)=A(l,2,d);
%     A(n,n,n)=A(2,2,2);
%     A(1,1,1)=A(n-1,n-1,n-1);
%     A(n,1,1)=A(2,n-1,n-1);
%     A(1,n,1)=A(n-1,2,n-1);
%     A(1,1,n)=A(n-1,n-1,2);
%     A(1,n,n)=A(n-1,2,2);
%     A(n,1,n)=A(2,n-1,2);
%     A(n,n,1)=A(2,2,n-1);
%         end
%     end
% end


%     for l=1:1:n*n*n
%          position(l,4)=A(position(l,1),position(l,2),position(l,3));
% 
%    end
for j=1:1:n    
if (particlex<2 && vx<0)
    particlex=particlex+(n-2);
elseif(particlex>n-1 && vx>0)
    particlex=particlex-(n-2);
end

if (particley<2 && vy<0)
    particley=particley+(n-2);
elseif(particley>n-1 && vy>0)
    particley=particley-(n-2);
end

if (particlez<2 && vz<0)
    particlez=particlez+(n-2);
elseif(particlez>n-1 && vz>0)
    particlez=particlez-(n-2);
end


    E=[0,0,0]
    B=[0,0,1]
    v=[vx,vy,vz]
    ekx=0.5*m*vx^2
    eky=0.5*m*vy^2
    ekz=0.5*m*vz^2
    dx=0.5*ax*(dt)^2
    dy=0.5*ay*(dt)^2
    dz=0.5*az*(dt)^2
    cproduct=cross(v,B)

     if(dx==0)
        fx = q*(E(1)+cproduct(1))                                                                      %Force at particle position in x direction
     else
        fx = q*(E(1)+cproduct(1))+ekx/dx
     end
     if(dy==0)
        fy = q*(E(2)+cproduct(2))
     else
        fy = q*(E(2)+cproduct(2))+eky/dy                                                %Force at particle position in y direction
     end
     if(dz==0)
        fz = q*(E(3)+cproduct(3))                                                                      %Force at particle position in x direction
     else
        fz = q*(E(3)+cproduct(3))+ekz/dz
     end    
         
     ax = fx/m;                                                              %Acceleration of particle in x direction
     ay = fy/m;                                                              %Acceleration of particle in y direction 
     az = fz/m;
     vx=vx+ax*dt;                                                           %Velocity in x direction
     vy=vy+ay*dt;                                                            %Velocity in y direction
     vz=vz+az*dt;
     particlex = particlex+0.5*ax*(dt)^2;                                    %Particle position along the x axis
     particley = particley+0.5*ay*(dt)^2;                                     %Particle position along the y axis
     particlez = particlez+0.5*az*(dt)^2;  
     particle(j,1)=particlex
     particle(j,2)=particley
     particle(j,3)=particlez
     
     scatter3(particle(:,1),particle(:,2),particle(:,3))
     hold on
end
% %     plot(B(:,1),B(:,2), '-')
% plot3(particle(:,1),particle(:,2),t, '-')
% xlabel('x','FontSize', 10)
% ylabel('y', 'FontSize', 10)
% zlabel('Time', 'FontSize', 10)

