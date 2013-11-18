l=0;                                                        
n=50;                                                        %grid size
p=300;
dt=pi/50;                                                   %Time increment
t(1)=0;                                                     %Initial time
q=1;                                                        %Particle charge
m=1;                                                        %Particle mass
particlex=25;                                                %initial particle x-position
particley=25;                                                %initial particle y-position
particlez=25;

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
for j=1:1:p    

vx(1)=1;
vy(1)=1;
vz(1)=1;
    
if (particlex<2 && vx(j)<0)
    particlex=particlex+(n-2);
elseif(particlex>n-1 && vx(j)>0)
    particlex=particlex-(n-2);
end

if (particley<2 && vy(j)<0)
    particley=particley+(n-2);
elseif(particley>n-1 && vy(j)>0)
    particley=particley-(n-2);
end

if (particlez<2 && vz(j)<0)
    particlez=particlez+(n-2);
elseif(particlez>n-1 && vz(j)>0)
    particlez=particlez-(n-2);
end


    E=[0,0,0]
    B=[0,0,1]
    v=[vx(j),vy(j),vz(j)]
%     ekx=0.5*m*vx^2
%     eky=0.5*m*vy^2
%     ekz=0.5*m*vz^2
    dx=vx(j)*dt;
    dy=vy(j)*dt;
    dz=vz(j)*dt;
    cproduct=cross(v,B)

 
        fx(j) = q*(E(1)+cproduct(1));                                                                      %Force at particle position in x direction

        fy(j) = q*(E(2)+cproduct(2));
 
        fz(j) = q*(E(3)+cproduct(3));                                                                     %Force at particle position in x direction
    
     totf(j)=sqrt(fx(j)^2+fy(j)^2+fz(j)^2)
        
     ax(j) = fx(j)/m;                                                              %Acceleration of particle in x direction
     ay(j) = fy(j)/m;                                                              %Acceleration of particle in y direction 
     az(j) = fz(j)/m;
     vx(j+1)=vx(j)+ax(j)*dt;                                                           %Velocity in x direction
     vy(j+1)=vy(j)+ay(j)*dt;                                                            %Velocity in y direction
     vz(j+1)=vz(j)+az(j)*dt;
     vtot(j)=sqrt(vx(j)^2+vy(j)^2+vz(j)^2);
     particlex = particlex+0.5*(vx(j)+vx(j+1))*dt;                                    %Particle position along the x axis
     particley = particley+0.5*(vy(j)+vy(j+1))*dt;                                  %Particle position along the y axis
     particlez = particlez+0.5*(vz(j)+vz(j+1))*dt;
     particle(j,1)=particlex;
     particle(j,2)=particley;
     particle(j,3)=particlez;
     
 
end
for j=2:1:p
    particle(j,4)=particle(j,3)-particle(j-1,3);
end
     plot3(particle(:,1),particle(:,2),particle(:,3),'-')
     axis([20 35 20 35 20 40]);
     grid on
xlabel('x','FontSize', 10)
ylabel('y', 'FontSize', 10)
zlabel('z', 'FontSize', 10)

