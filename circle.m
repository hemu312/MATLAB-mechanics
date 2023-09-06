function [x,y]=circle(c,r,theta)
% c is coordinate of centre and r is radius of circle
%using equation of circle
x=c(1)+r*cos(theta);
y=c(2)+r*sin(theta);