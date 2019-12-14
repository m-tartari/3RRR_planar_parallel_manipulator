function f=objective(Param)
% f = objective(Param)
%
% Param         vector containing paramters to optimize:
%                   Param =[R,r,L1,L2]

%% Parameter definition
R = Param(3);
r = Param(4);
L1= Param(5);
L2= Param(6);

f=R+r+L1+L2;

end