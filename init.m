% init.m
% tutorial development

% MKS units
kv= 0.05;
ks= 0.02;
M= 5;
Ts = 1E-3;
d=1.0;   % multiplier on plant mass

% c.t. plant, states {x, x_dot}%
%   M*dx_dot/dt =  U - ks*x - kv*x_dot
A = [  0      1;                  
     -ks/M -kv/M;];
B = [ 0;
      1/M ];
C = [1 0];
D= 0;

% augment plant with neew state, integral of error {x, x_dot, xa_dot}
Aa = [  0      1       0;                  
      -ks/M -kv/M     0;
       -1     0       0];
Ba = [ 0;
      1/M; 
      0];
Ca = [1 0 0];
Da= 0;

% Use lqr to calculate gain for all 3 states
sys= ss(Aa,Ba,Ca,Da);
Q= 0.95*ones(3);
R= 0.05;
K = lqr(sys, Q, R);


