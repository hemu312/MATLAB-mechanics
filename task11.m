%% Task 1.1 Animation of rolling disk
% 
% <<task1.png>>
% 
%cleaning
close all;
clear;
clc;
%Animation of the motion of the rolling disk for two complete rotations.
rd=10; %radius of disk 10 units
rp=10; %radius of point 10 units
% using information given we can interpret that initially centre of circle
% is located at (10,10) on coordinate system
c=[10,10]; %coordinate of centre
%for 2 rotations disk will rotate 720 degree or 4*pi radian
theta=linspace(0,4*pi,200);
axis([0,160,-50,50]);
axis equal
grid on
hold on
% to plot circle and centre
[x,y]=circle(c,rd,linspace(0,2*pi,100));
p1=plot(x,y,'b'); %plot for circle
p2=plot(c(1),c(2),'b+'); %plot for centre
p3=animatedline('Color','red','LineWidth',2); %trajectory of point on rim
dtheta=theta(2)-theta(1); %change in angle in each step
d=rd*dtheta; %distance travelled when rotated dtheta angle
theta0=-pi/2; %initial angle of point with x-axis

for i=1:length(theta)
    c(1)=c(1)+d; %update position of the centre
    [x,y]=circle(c,rd,linspace(0,2*pi,100)); %new coordinates for circle
    %update data of plots
    p1.XData=x;
    p1.YData=y;
    p2.XData=c(1);
    p2.YData=c(2);
    [xp,yp]=circle(c,rd,-1*theta(i)+theta0); %new position of point
    addpoints(p3,xp,yp)
    pause(0.05) %pause so we can observe animation
    drawnow limitrate % display updates
end
%% Explanation
% 
% <<task11_explanation.png>>
% 