clc
clear

% Optimization Algorithms:
options = optimoptions(@fsolve, 'Algorithm', 'trust-region', 'UseParallel', false, 'OptimalityTolerance', 1e-8, 'FunctionTolerance', 1e-12); 

% User Inputs:
x = 312.5;
y = 116;
z = 204.5;
angle = 0;

initialGuess = [10; 40; -100; angle];

[SolutionAngles] = fsolve(@(theta)Kinematics_Function(theta, x, y, z, angle), initialGuess, options);
theta1 = SolutionAngles(1)
theta2 = SolutionAngles(2)
theta3 = SolutionAngles(3)
theta4 = SolutionAngles(4)


