function[H_loss_turbine_unit] = Turbine_unit_loss(Q_turbine)
%% Head loss of the turbine unit.
%   The turbine unit present in the test setup consists of three separate
%   smaller turbines. The turbines did not produce power during the test
%   run, the resistance was therefore smaller. Because of this, the
%   turbines will be modelled as paddle wheel flow meters. 

%% Parameter setting
g = 9.81; %[m/s^2] Gravitational acceleration. 

%% 90-degree elbows
K_90_degree_elbow = 1.4; %[-] Minor loss coefficient 90 degree elbow.
Number_90_degree_elbow = 2; %[-] Number of 90-degree elbows.
r_90_degree_elbow = 0.0136; %[m] Inside radius
A_90_degree_elbow = pi*(r_90_degree_elbow^2); %[m^2] Area.
Q_90_degree_elbow = Q_turbine/3; %[m^3/s] Flow through elbow.
v_90_degree_elbow = Q_90_degree_elbow/A_90_degree_elbow; %[m/s] Velocity through elbow. 

%% Contraction
Number_contraction = 3; %[-] Number of contractions.
r_1_contraction = 0.0136; %[m] Inside radius before contraction.
r_2_contraction = 0.003; %[m] Inside radius after contraction.
A_1_contraction = pi*(r_1_contraction^2); %[m^2] Area before contraction.
A_2_contraction = pi*(r_2_contraction^2); %[m^2] Area after contraction.
Q_contraction = Q_turbine/3; %[m^3/s] Flow through contraction.
v_contraction = Q_contraction/A_1_contraction; %[m/s] Velocity through contraction.

A_ratio_contraction = A_2_contraction/A_1_contraction; %ratio between the two areas of the contraction.
A_ratio_table_contraction = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
[~,index_K_contraction] = min(abs(A_ratio_table_contraction - A_ratio_contraction)); %gives the index number ratio from the ratio table closesed to A_ratio
Cc_table = [0.585 0.624 0.632 0.643 0.659 0.681 0.712 0.755 0.813 0.892 1]; 
Cc = Cc_table(index_K_contraction); %Uses the index number to match the corresponding Cc value.
K_contraction = ((1/Cc)-1)^2; %[-] Minor loss coefficient contraction.

%% Enlargement
number_enlargement = 3; %[-] Number of enlargements.
r_1_enlargement = 0.003; %[m] Radius before enlargement.
r_2_enlargement = 0.0136; %[m] Radius after enlargement.
A_1_enlargement = pi*(r_1_enlargement^2); %[m^2] Area before enlargement.
A_2_enlargement = pi*(r_2_enlargement^2); %[m^2] Area after enlargement.
K_enlargement = (1-((A_1_enlargement)/(A_2_enlargement)))^2; %[-] Minor loss coefficient enlargement.
Q_enlargement = Q_turbine/3; %[m^3/s] Flow rate through enlargement.
v_enlargement = Q_enlargement/A_1_enlargement; %[m/s^2] Flow velocity through enlargement. 

%% Tee junctions
%   Outbranching tee
r_tee_outbr = 0.0136; %[m] Inside radius outbranching tee. 
A_tee_outbr = pi*(r_tee_outbr^2); %[m^2] Area outbranching tee.
K_tee_outbr = 2.9; %[-] K-value outbranching tee.
Q_tee_outbr_1 = Q_turbine; %[m^3/s] Flow through first outbranching tee.
Q_tee_outbr_2 = 2*Q_turbine/3; %[m^3/s] Flow through second outbranching tee. 
v_tee_outbr_1 = Q_tee_outbr_1/A_tee_outbr; %[m/s] Flow velocity through first outbranching tee.
v_tee_outbr_2 = Q_tee_outbr_2/A_tee_outbr; %[m/s] Flow velocity through second outbranching tee.

%   Inbranching tee
r_tee_inbr = 0.0136; %[m] Inside radius inbranching tee. 
A_tee_inbr = pi*(r_tee_inbr^2); %[m^2] Area inbranching tee.
K_tee_inbr = 2.9; %[-] K-value inbranching tee.
Q_tee_inbr_1 = 2*Q_turbine/3; %[m^3/s] Flow through first inbranching tee.
Q_tee_inbr_2 = Q_turbine; %[m^3/s] Flow through second inbranching tee.
v_tee_inbr_1 = Q_tee_inbr_1/A_tee_inbr; %[m/s] Flow velocity through first inbranching tee.
v_tee_inbr_2 = Q_tee_inbr_2/A_tee_inbr; %[m/s] Flow velocity through second inbranching tee.

%% Minor head loss calculation
H_loss_turbine_unit = K_90_degree_elbow*Number_90_degree_elbow*((v_90_degree_elbow^2)/(2*g)) + K_contraction*Number_contraction*((v_contraction^2)/(2*g)) + K_enlargement*number_enlargement*((v_enlargement^2)/(2*g)) + K_tee_outbr*((v_tee_outbr_1^2)/(2*g)) + K_tee_outbr*((v_tee_outbr_2^2)/(2*g)) + K_tee_inbr*((v_tee_inbr_1^2)/(2*g)) + K_tee_inbr*((v_tee_inbr_2^2)/(2*g));

end
