function F = Kinematics_Function(theta, x, y, z, angle)
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

H1 = [cosd(theta(1)) -sind(theta(1))*cosd(alpha1) sind(theta(1))*sind(alpha1) a1*cosd(theta(1));
    sind(theta(1)) cosd(theta(1))*cosd(alpha1) -cosd(theta(1))*sind(alpha1) a1*sind(theta(1));
    0 sind(alpha1) cosd(alpha1) d1;
    0 0 0 1];
H2 = [cosd(theta(2)) -sind(theta(2))*cosd(alpha2) sind(theta(2))*sind(alpha2) a2*cosd(theta(2));
    sind(theta(2)) cosd(theta(2))*cosd(alpha2) -cosd(theta(2))*sind(alpha2) a2*sind(theta(2));
    0 sind(alpha2) cosd(alpha2) d2;
    0 0 0 1];
H3 = [cosd(theta(3)) -sind(theta(3))*cosd(alpha3) sind(theta(3))*sind(alpha3) a3*cosd(theta(3));
    sind(theta(3)) cosd(theta(3))*cosd(alpha3) -cosd(theta(3))*sind(alpha3) a3*sind(theta(3));
    0 sind(alpha3) cosd(alpha3) d3;
    0 0 0 1];
H4 = [cosd(theta(4)) -sind(theta(4))*cosd(alpha4) sind(theta(4))*sind(alpha4) a4*cosd(theta(4));
    sind(theta(4)) cosd(theta(4))*cosd(alpha4) -cosd(theta(4))*sind(alpha4) a4*sind(theta(4));
    0 sind(alpha4) cosd(alpha4) d4;
    0 0 0 1];

Hom_tot = H1*H2*H3*H4;

eqn1 = x - Hom_tot(1, 4);
eqn2 = y - Hom_tot(2, 4);
eqn3 = z - Hom_tot(3, 4);
eqn4 = theta(4) - angle;
F = [eqn1; eqn2; eqn3; eqn4];
end