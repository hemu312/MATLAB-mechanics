%% Task 2 Undamped Spring-Mass System of n-degrees of freedom
% equation for spring-mass system
% M*diff(x,t,2)+K*x=0;
%where x is vector of displacments
%M=mass matrix
%K=stiffness matrix for system

%% setup
m=5; %mass of each mass in kg
k=1000; %spring constant of each spring in N/m
n=200; %degree of freedom of system
M=zeros(n,n); %zero initialized mass matrix
K=zeros(n,n); %zero initializer stiffness matrix

%% putting correct values in mass and stiffness matrix
for i=1:n
    M(i,i)=m;
    K(i,i)=2*k;
    if i>1
        K(i,i-1)=-k;
    end
    if i<n
        K(i,i+1)=-k;
    end
end

%% Calculation of 7th natural frequencies
%d=eig(K,M) which contains square of natural frequencies
d=eig(K,M);
f7=sqrt(d(7)); %7th natural frequency
msg=['7th natural frequency is ',num2str(f7),' rad/s'];
disp(msg);