for a=1:1:5
       for b=1:1:5
           A(a,b)=a^2   %potential seed function
       end
end     
l=1
for t=0:pi/4:2*pi  
    l=l+1
   for j=1:1:5
       for k=1:1:5
         x=sin(t)+2;        %particle motion in x-direction
         y=cos(t)+2;        %particle motion in y-direction
         fprintf('%f',t);
         potentialt=(0.9)*A(j,k)+0.1*(rand-0.5);
         A(j,k)=potentialt;  %potential at each grid point
         scatter3(j,k,A(j,k))
       end
   end
   position(l,1)=x
   position(l,2)=y
   position(l,3)=potentialt
end
fprintf('%f %f %f\n%f %f %f\n%f %f %f\n',A(1,1),A(1,2),A(1,3),A(2,1),A(2,2),A(2,3),A(3,1),A(3,2),A(3,3))

% for i=1:1:2
%     for l=1:1:9
%         fit(position(l,i), potentialt, 'poly23')
%     end
% end