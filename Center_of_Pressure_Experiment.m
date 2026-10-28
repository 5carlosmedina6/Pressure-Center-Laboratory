% Center of Pressure LAB
% Carlos I Medina

% Data:

R1 = 100/1000; % m % Inner Radius
R2 = 200/1000; % m % Outer Radius
R3 = 200/1000; % m % Moment Arm

Theta = deg2rad(0); % Angle of the Tank
B = 75/1000;% m % Width of Plane Surface
mp = [50,70,90,140,190,240,290]; % Mass
mf = [390,590,790,890]; % Mass
hp = [170,162,158,144,130,120,110]/1000; % Partially Submerged Height
hf = [92,54,18,0]/1000; % Fully Submerged Height
rho = 1000; % kg/m^3 % Density of Water
g = 9.81; % m/s^2 % Gravity
w = rho*g; % N/m^3 % Specific Weight of Water

N_p = (1:7); % Steps
N_f = (1:4); % Steps

% mp = Partially Submerged Mass
% mf = Fully Submerged Mass

% Partially Submerged Weight of Mass

wp = (mp/1000)*(9.81); % N

% Fully Submerged Weight of Mass

wf = (mf/1000)*(9.81); % N


% Calculate Experimental Moment

Mp = wp*R3; % N*m % Partially Submerged
Mfull = wf*R3; % N*m % Fully Submerged


% Theoretical Moment: Partially Submerged Equation (5)

%Mf = wp*B*R2^3*cos(theta)/3 - wp*B*R2^2*h/2 + wp*B*h^3*sec^2(theta)/6

%cos(theta) = 1 & sec^2(theta) = 1

Mfp = (w*B*R2^3/3 - w*B*R2^2*hp/2 + w*B*hp.^3/6); % Theoretical Moment Partially Submerged


% Theoretical Moment: Fully Submerged Equation (7)

Mff = w*B*(R2^3 - R1^3)/3 - w*B*(R2^2 - R1^2).*hf/2; % Theoretical Moment Fully Submerged


% Resultant Force: Partially Submerged

dp = R2 - hp;

FRp = w*B*dp.^2/2;

% Resultant Force: Fully Submerged

FRf = w*B/2 * ((R2-hf).^2 - (R1 - hf).^2);


% Center of Pressure Ycp_p: Partially Submerged

Ycp_p = 2*dp/3; % m

% Center of Pressure Ycp_f: Fully Submerged

yc = (R2-R1)/2 + (R1-hf); % m % Centroid Depth

A = B*(R2 - R1); % m^2 % Submerged Area
Ayc = A.*yc; % m^3

Ixxc = B*(R2 - R1)^3/12; % m^4 % Second Moment of Area About the Centroidal x-axis

Ycp_f = yc + Ixxc./Ayc; % m

T_Partial = table(N_p', mp', wp', Mp', Mfp', FRp', Ycp_p', 'VariableNames',{'No.', 'Mass of Partially Submerged (g)', 'Partially Submerged Weight of Mass (N)', 'Experimental Moment Mp (Nm)', 'Theoretical Moment Partially Submerged (Nm)', 'Resultant Force: Partially Submerged (N)', 'Center of Pressure Ycp_p: Partially Submerged (m)'});
T_Partial.Properties.Description = 'TABLE 1: PARTIALLY SUBMERGED';

disp(T_Partial.Properties.Description)
disp(T_Partial)

T_Fully = table(N_f', mf', wf', Mfull', Mff', FRf', Ycp_f', 'VariableNames',{'No.', 'Mass of Fully Submerged (g)', 'Fully Submerged Weight of Mass (N)', 'Experimental Moment Mff (Nm)', 'Theoretical Moment Partially Submerged (Nm)', 'Resultant Force: Fully Submerged (N)', 'Center of Pressure Ycp_f: Fully Submerged (m)' });
T_Fully.Properties.Description = 'TABLE 2: FULLY SUBMERGED';

disp(T_Fully.Properties.Description)
disp(T_Fully)

figure(Name="Theoretical Moment Mf_P vs. Experiemtal Moment Mp", NumberTitle="off")
plot(Mfp,Mp,"LineWidth",2, "Color","b", "LineStyle","-","Marker","square")
title('Theoretical Moment Mf_P vs. Experiemtal Moment Mp','FontSize',14,'FontWeight','normal','Color',"r")
xlabel('Theoretical Moment (Nm)','FontSize',11)
ylabel('Experimental Moment (Nm)','FontSize',11)
legend('Theoretical Moment vs. Experimental Moment')

figure(Name="Center of Pressure Partially Submerged (Ycp_p) vs. Resultant Force Partially Submerged (FRp)", NumberTitle="off")
plot(Ycp_p,FRp,"LineWidth",2, "Color","b", "LineStyle","-","Marker","square")
title('Center of Pressure Partially Submerged (Ycp_p) vs. Resultant Force Partially Submerged (FRp)','FontSize',14,'FontWeight','normal','Color',"r")
xlabel('Center of Pressure Ycp_p (m)','FontSize',11)
ylabel('Resultant Force FRp (N)','FontSize',11)
legend('Center of Pressure Partially Submerged vs. Resultant Force Partially Submerged')

figure(Name="Theoretical Moment Mff vs. Experiemtal Moment Mfull", NumberTitle="off")
plot(Mff,Mfull,"LineWidth",2, "Color","b", "LineStyle","-","Marker","square")
title('Theoretical Moment Mff vs. Experiemtal Moment Mfull','FontSize',14,'FontWeight','normal','Color',"r")
xlabel('Theoretical Moment (Nm)','FontSize',11)
ylabel('Experimental Moment (Nm)','FontSize',11)
legend('Theoretical Moment vs. Experimental Moment')

figure(Name="Center of Pressure Fully Submerged (Ycp_f) vs. Resultant Force Fully Submerged (FRf)", NumberTitle="off")
plot(Ycp_f,FRf,"LineWidth",2, "Color","b", "LineStyle","-","Marker","square")
title('Center of Pressure Fully Submerged (Ycp_p) vs. Resultant Force Fully Submerged (FRp)','FontSize',14,'FontWeight','normal','Color',"r")
xlabel('Center of Pressure Ycp_p (m)','FontSize',11)
ylabel('Resultant Force FRp (N)','FontSize',11)
legend('Center of Pressure Fully Submerged vs. Resultant Force Fully Submerged')