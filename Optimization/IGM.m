function theta = IGM(OP,phi,R,r,L1,L2)

syms xB1 yB1 xB2 yB2 xB3 yB3
B=[xB1, xB2, xB3;
   yB1, yB2, yB3];

h=[    1,         cos(pi*2/3),      cos(pi*4/3);
       0,         sin(pi*2/3),      sin(pi*4/3)];
   
k=[    cos(phi),         cos(pi*2/3 + phi),      cos(pi*4/3 + phi);
       sin(phi),         sin(pi*2/3 + phi),      sin(pi*4/3 + phi)];
   
A=R*h;
C=[OP.'-r*k(:,1) OP.'-r*k(:,2) OP.'-r*k(:,2)];

eqn=[ L1^2== (A(1,1)-B(1,1))^2 + (A(2,1)-B(2,1))^2;
      L2^2== (C(1,1)-B(1,1))^2 + (C(2,1)-B(2,1))^2;
      L1^2== (A(1,2)-B(1,2))^2 + (A(2,2)-B(2,2))^2;
      L2^2== (C(1,2)-B(1,2))^2 + (C(2,2)-B(2,2))^2;
      L1^2== (A(1,3)-B(1,3))^2 + (A(2,3)-B(2,3))^2;
      L2^2== (C(1,3)-B(1,3))^2 + (C(2,3)-B(2,3))^2];
[T11,T21,T12,T22,T13,T23,paramams,conditions]=solve(eqn, B(1,1),B(2,1),B(1,2),B(2,2),B(1,3),B(2,3),'Real',true, 'ReturnConditions', true);
if size(T11,1)==0
    error('No IGM solution found')
end
clear B;
B=[T11(1),T12(1),T13(1);
   T21(1),T22(1),T23(1)];
th   = [atan2(A(2,:),A(1,:));
        atan2((B(2,:)-A(2,:)),(B(1,:)-A(1,:)));
        atan2((C(2,:)-B(2,:)),(C(1,:)-B(1,:)))];
theta= double(th);
