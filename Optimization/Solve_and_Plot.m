close all;
clear all;
clc;

%startopt.m
OP=[10,1];
R=80;
r=90;
L1=120;
L2=100;
phi_0=pi*1/2;
Theta=IGM(OP,phi_0,R,r,L1,L2);
Param_opt=[R,r,L1,L2];
theta= [ 1, Theta(1,2),Theta(1,3), Theta(2,1), Theta(2,2),Theta(2,3),Theta(3,1), Theta(3,2),Theta(3,3)];

clear Theta


%% search settings

lb=zeros(1,15);
ub=1000*ones(1,15);
lb(1)=-100;
up(1)=100;
lb(2)=-100;
up(2)=100;
for i=6:15
    lb(i)=-pi;
    up(i)=pi;
end

options = optimset( 'Display','Iter',...
                    'TolX',1e-5,...
                    'TolFun',1e-5,...
                    'MaxIter',100,...
                    'MaxfunEval',10000);

%% Optimize
P_opt=fmincon(@(Param_opt)objective(Param_opt),[OP,Param_opt,theta],[],[],[],[],lb,ub,@(Param_opt) constraints(Param_opt,OP),options)
R = P_opt(3)
r = P_opt(4)
L1= P_opt(5)
L2= P_opt(6)