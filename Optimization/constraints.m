function [G,H]=constraints(Paramopt,OP)
% [G,H] = constr(A,B,P1,C,r,increment)
%
%   H    vector of equalitites
%   g    vector of inequalities
%
% Param  vector containing paramters to optimize:
%           Param =[R,r,L1,L2]

%% Parameter definition
R = Paramopt(3);
r = Paramopt(4);
L1= Paramopt(5);
L2= Paramopt(6);
G=[50-R 15-r 40-L1 40-L2 0 0 0 0 r-R];

%% joint variables
theta=IGM(OP,pi*2/3,R,r,L1,L2);
theta(1,1)=1;

%% other parameters
phi=[sum(theta(:,1));
     sum(theta(:,2));
     sum(theta(:,3))];
G(5)= 2/3*pi - (phi(1)+0);
% H(1)= phi(1) - (phi(2)+pi*2/3);
% H(2)= phi(1) - (phi(1)+pi*4/3);
H=[];
%% copute jacobian
h=[    1,         cos(pi*2/3),      cos(pi*4/3);
       0,         sin(pi*2/3),      sin(pi*4/3)];
   
temp =  R*h + L1*[cos(theta(1,1)),cos(theta(1,2)),cos(theta(1,3)); sin(theta(1,1)),sin(theta(1,2)),sin(theta(1,3))];
u= temp ./ abs(temp);
temp = temp + L2*[cos(theta(2,1)),cos(theta(2,2)),cos(theta(2,3)); sin(theta(2,1)),sin(theta(2,2)),sin(theta(2,3))];
v= temp ./ abs(temp);
temp = temp +  r*[cos(theta(3,1)),cos(theta(3,2)),cos(theta(3,3)); sin(theta(3,1)),sin(theta(3,2)),sin(theta(3,3))];
k= temp ./ abs(temp);
E=[0,-1;
   1, 0];
  
A  = [-r*v(:,1).'*E*k(:,1),               v(:,1).';
      -r*v(:,2).'*E*k(:,2),               v(:,2).';
      -r*v(:,3).'*E*k(:,3),               v(:,3).'];
B  = [L1*v(:,1).'*E*u(:,1),                    0,                     0;
                          0, L1*v(:,2).'*E*u(:,2),                    0;
                          0,                    0, L1*v(:,3).'*E*u(:,3)];   


G(6)=0.1-cond(A(1,:)/r);
G(7)=0.1-cond(B/L1);
if G(6)==-Inf 
    G(6) = -1000;
end
if G(7)==-Inf 
    G(7) = -1000;
end
clear OP
OP= R*h(:,1) + L1*u(:,1) + L2*v(:,1) + r*k(:,1);
phi=sum(theta);
G(8)= 100^2 - (OP(1)^2+OP(2)^2);

%%
G;
end