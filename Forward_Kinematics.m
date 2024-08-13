syms theta a d alpha;
Hom_rot = [cosd(theta) -sind(theta)*cosd(alpha) sind(theta)*sind(alpha) a*cosd(theta);
    sind(theta) cosd(theta)*cosd(alpha) -cosd(theta)*sind(alpha) a*sind(theta);
    0 sind(alpha) cosd(alpha) d;
    0 0 0 1];

syms theta1 theta2 theta3 theta4
a1 = 23.13;
a2 = 146.66;
a3 = 119.19;
a4 = 154.27;
d1 = 194.79;
d2 = 32.8;
d3 = -30.67;
d4 = 0;
alpha1 = -90;
alpha2 = 0;
alpha3 = 0;
alpha4 = 0;

H1 = [subs(Hom_rot, [theta a d alpha], [theta1 a1 d1 alpha1])];
H2 = [subs(Hom_rot, [theta a d alpha], [theta2 a2 d2 alpha2])];
H3 = [subs(Hom_rot, [theta a d alpha], [theta3 a3 d3 alpha3])];
H4 = [subs(Hom_rot, [theta a d alpha], [theta4 a4 d4 alpha4])];

Hom_tot = H1*H2*H3*H4;


angle_1 = 0;
angle_2 = 0;
angle_3 = 0;
angle_4 = 0;

Hom_tot_ans = double(subs(Hom_tot, {theta1 theta2 theta3 theta4}, {angle_1 angle_2 angle_3 angle_4}))

x = Hom_tot_ans(1, 4);
y = Hom_tot_ans(2, 4);
z = Hom_tot_ans(3, 4);
