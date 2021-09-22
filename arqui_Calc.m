% Created by JJ %

clear all
syms q1 q2 q3 q4 q5 q6 d2 d3 a
syms Nx Ny Nz Ox Oy Oz Ax Ay Az Px Py Pz
syms L1 L2 L3 L4 L5 L6 L7
format short 


F = sym(pi)/180;



%T2 = Rz(q1)*Rx(q2)*Tx(L1)*Rz(180*F)*Tz(L2)*Rx(q3)*Tx(L3)*Rz(180*F)*Tz(L4)*Rx(q4)*Tx(L5)*Rz(q5)*Tz(L6)*Rx(q6)*Tx(L7)





T0 = Rz(q1)




% T0 = Rf(q1, L1)
% T1 = Rz(q2)*Tz(L2)
% 
% T = T0*T1
% 
% invT0 = invM(T0)
% invT1 = invM(T1)
% 
% F = invT0*T
% Td = [Nx Ny Nz; Ox Oy Oz; Ax Ay Az; Px Py Pz]


function [INV] = invM(M)
INV = [M(1,1), M(2,1), M(3,1), (M(1,4)*M(1,1) + M(2,4)*M(1,2) + M(3,4)*M(1,3))*-1;
       M(1,2), M(2,2), M(3,2), (M(1,4)*M(2,1) + M(2,4)*M(2,2) + M(3,4)*M(2,3))*-1;
       M(1,3), M(2,3), M(3,3), (M(1,4)*M(3,1) + M(2,4)*M(3,2) + M(3,4)*M(3,3))*-1;
       0     , 0     , 0     , 1];
   
end

function [RF] = Rf(q, L1) 
RF = [cos(q) 0 sin(q) 0 ; sin(q) 0 -cos(q) 0; 0 1 0 L1; 0 0 0 1]
end


function [RZ] = Rz(q) 
RZ = [cos(q) -sin(q) 0 0; sin(q) cos(q) 0 0; 0 0 1 0; 0 0 0 1]
end

function [RX] = Rx(q) 
RX = [1 0 0 0; 0 cos(q) -sin(q) 0; 0 sin(q) cos(q) 0;0 0 0 1]
end

function [RX] = Rx1(q) 
RX = [1 0 0 0; 0 -sin(q) cos(q) 0; 0 -cos(q) -sin(q) 0;0 0 0 1]
end

function [TX] = Tx(q) 
TX = [1 0 0 q; 0 1 0 0; 0 0 1 0; 0 0 0 1]
end

function [TZ] = Tz(q) 
TZ = [1 0 0 0; 0 1 0 0; 0 0 1 q; 0 0 0 1]
end

function [TY] = Ty(q) 
TY = [1 0 0 0; 0 1 0 q; 0 0 1 0; 0 0 0 1]
end