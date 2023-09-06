%% Task 3 Dropping of ball on inclined surface when no air resistance
%This motion is combination of linear motion under gravity and projectile
%motion on inclined surface under gravity
%assumption m=1  mass of the ball
%first component in vector is for x and second for y
%origin is at A
%because mass is 1 kg so acceleration due to drag will be a=Cd*v^2 in the
%opposite direction of motion
%angle am is direction of motion
clear
close all
clc

%% setup
g=[0,-9.81]; % acceleration due to gravity in m/s^2 in vector form
m=1; % mass of the ball in kg
h=2; % h in diagram in metre
dt=0.001; %time step in seconds
Cd=0.8; %drag coefficient
theta=pi/6; %angle of inclination in radian (30 degree)
hold on
title("With air resistance")
grid on
p = animatedline;
axis equal
axis([-2,10,-10,5])
%equation of inclined plane
%yi=-xi/sqrt(3)-h;
line([-2,10],[(2/sqrt(3)-h),(-10/sqrt(3)-h)])


%% for path AB
u=[0,0]; %intial velocity in vector form m/s
x0=[0,0]; % initial location
xp=x0; %location for previous time
vp=u; %velocity for previous time
a=g; %acceleration
t0=0; %initial time
tp=t0; %previous time
while true
    t=tp+dt; %calculate new time
    am=atan(abs(vp(2)/vp(1)));
    if isnan(am)
        am=pi/2;
    end
    f=Cd*sum(vp.^2);
    ad(1)=-1*sign(vp(1))*cos(am)*f; %acceleration due to air resistance
    ad(2)=-1*sign(vp(2))*sin(am)*f;
    a=g+ad; %net acceleration
    dv=a*dt; %change in velocity
    v=vp+dv; %calculate new velocity
    dx=v*dt; %change in location
    x=xp+dx; %calculate new location
    vp=v; %update value of previous velocity
    xp=x; %update value of previous locaton
    tp=t; %update previous time
    if x(2)<=-h
        %disp('first collision');
        msg=['tAB is ',num2str(t-t0),' seconds'];
        disp(msg)
        break
    end
    addpoints(p,x(1),x(2));
    drawnow
end

%% for path BC
% now all xp,tp,vp will become initial velocity for path BC
%initial velocity for BC
v0=sqrt(sum(vp.^2)); %initial velocity for BC in projectile direction
u(1)=v0*cos(theta); %velocity component in x-direction
u(2)=v0*sin(theta); %velocity component in y-direction
vp=u; %velocity for previous time
t0=tp; %initial time for path BC
x0=xp; %initial location for path BC
while true
    t=tp+dt; %calculate new time
    am=atan(abs(vp(2)/vp(1)));
    if isnan(am)
        am=pi/2;
    end
    f=Cd*sum(vp.^2);
    ad(1)=-1*sign(vp(1))*cos(am)*f; %acceleration due to air resistance
    ad(2)=-1*sign(vp(2))*sin(am)*f;
    a=g+ad; %net acceleration
    dv=a*dt; %change in velocity
    v=vp+dv; %calculate new velocity
    dx=v*dt; %change in location
    x=xp+dx; %calculate new location
    vp=v; %update value of previous velocity
    xp=x; %update value of previous locaton
    tp=t; %update previous time
    if x(2)<=(-x(1)/sqrt(3)-h)
        %disp('second collision');
        msg=['tBC is ',num2str(t-t0),' seconds'];
        disp(msg)
        d=sqrt(sum((x-x0).^2));
        msg=['BC distance is ',num2str(d),' metres'];
        disp(msg)
        break
    end
    addpoints(p,x(1),x(2));
    drawnow
end
hold off