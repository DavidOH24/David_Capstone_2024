% Motor 1 & 3 parameters: [17 gk.cm of rated torque]
T = 35;   % 35 kgf.cm ultimate load torque
omega = 36;   % 36 rpm Max no load speed
ea = 12;  % 12V input voltage
Jm = 1e-4;
Dm = 1e-5;
Kt_Ra = T/ea;
Kb = ea/omega;

% Motor 2 parameters: [45 kgf.cm of rated torque 1.3A]
T2 = 115;   % 115 kgf.cm of ultimate load torque
omega2 = 22;   % 22rpm maximum no load speed
ea2 = 12;   % 12V operating voltage
Jm2 = 1e-4;
Dm2 = 1e-5;
Kt_Ra2 = T2/ea2;
Kb2 = ea2/omega2;

% Motor 4 parameters: [CW - 3.4kg.cm of rated torque]
T4 = 13.6;   % 13.6 kgf.cm stall torque
omega4 = 35;   % 35 rpm no load speed
ea4 = 12;   % 12V operating voltage
Jm4 = 1e-4;
Dm4 = 1e-5;
Kt_Ra4 = T4/ea4;
Kb4 = ea4/omega4;