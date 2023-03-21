%% Independent K-values
%   This model calculates K-values that are independent of the flow 
%   velocity. Some other initial calculations are preformed as well. These 
%   K-values are based on fixed parameters and will not change after they 
%   are calculated.

%% Setting parameters
K_values_test_setup_parameters;

%% 90-degree bend
r_bend = 0.5*D_bend; %[m] Radius of the bend.
A_bend = pi * r_bend^2; %[m^2] Area of the bend
r_bend_connection=0.5*D_bend_connection;
A_bend_connection = pi * r_bend_connection^2; %[m^2] Area of the entrance and exit of the bend. 
alfa_bend = 0.95 * 17.2 * ((R_bend/r_bend)^(-1.96)); %[-] emperical factor depending on the angle of the bend
angle_bend = 90; %[degrees] Angle that the bends make  

A_ratio_bend = A_bend/A_bend_connection; %ratio between the area of the entrance of the bend and the area in the bend
A_ratio_table_bend = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
[~,index_K_contraction_bend] = min(abs(A_ratio_table_bend - A_ratio_bend)); %gives the index number ratio from the ratio table closesed to A_ratio
Cc_table_bend = [0.585 0.624 0.632 0.643 0.659 0.681 0.712 0.755 0.813 0.892 1]; 
Cc =Cc_table_bend(index_K_contraction_bend); %Uses the index number to match the corresponding Cc value.
K_contraction_bend = ((1/Cc)-1)^2; 

K_enlargement_bend = (1 - (A_bend/A_bend_connection))^2; %ratio between the area of the bend and the area of the exit.

%%  Ball valve
Angle_ball_valve_table = [0 30 60 90]; %[degrees] Gives the possible angles for the ball valve
[~,index_K_ball_valve] = min(abs(Angle_ball_valve_table - Angle_ball_valve)); %[-] finds the closesed value from the table
K_ball_valve_table = [0.05 5.5 200 999999999]; %Corresponding K-values
K_ball_valve = K_ball_valve_table(index_K_ball_valve); 
r_ball_valve=0.5*D_ball_valve;
A_ball_valve = pi*(r_ball_valve^2);

%% Unions       
if Union_type == 1 %indicates a threaded union
    K_unions = 0.08;
elseif Union_type == 2 %indicates a flanged union
    K_unions = 0.04;
end
r_union=0.5*D_union;
A_union = pi*(r_union^2);

%% 90-degree elbow
K_elbow_90 = 1.4; %[-] K-value for a 90-degree elbow, average value
r_elbow_90=0.5*D_elbow_90;
A_elbow_90 = pi*(r_elbow_90^2);

%% 45-degree elbow
K_elbow_45 = 0.425; %[-] K-value for a 45-degree elbow, average value
r_elbow_45=0.5*D_elbow_45;
A_elbow_45 = pi*(r_elbow_45^2);

%% Inlets
r_inlet=0.5*D_inlet;
d_inlet_rounded = 2* r_inlet; %[m] diameter of the tube connected to the inlet
if Inlet_type == 1 %indicates a square inlet
    K_inlet = 0.5; %[-]K-value for an inlet with square edges
elseif Inlet_type == 2 %indicates a rounded inlet
    rd_ratio = r_inlet/d_inlet_rounded; %[-] ratio between r and d of the rounded inlet
    rd_table = [0.02 0.04 0.06 0.1 0.15];
    [~,index_K_inlet_rounded] = (min(abs(rd_table-rd_ratio)));
    K_inlet_rounded_table = [0.28 0.24 0.15 0.09 0.04];
    K_inlet = K_inlet_rounded_table(index_K_inlet_rounded);
elseif Inlet_type == 3 %indicates an inlet with an extended edge
    K_inlet = 0.78; %[-]K-value for an inlet with an extended edge 
elseif Inlet_type ==4 %indicates an inlet with a chamfered edge
    K_inlet = 0.25; %[-]K-value for an inlet with a chamfered edge 
end
A_inlet = pi*(r_inlet^2);

%% Contraction
A_contraction_1 = pi*(r_contraction_1^2);
A_contraction_2 = pi*(r_contraction_2^2);

A_ratio_contraction = A_contraction_2/A_contraction_1; %ratio between the area of the entrance of the bend and the area in the bend
A_ratio_table = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
[~,index_K_contraction] = min(abs(A_ratio_table - A_ratio_contraction)); %gives the index number ratio from the ratio table closesed to A_ratio
Cc_table = [0.585 0.624 0.632 0.643 0.659 0.681 0.712 0.755 0.813 0.892 1]; 
Cc =Cc_table(index_K_contraction); %Uses the index number to match the corresponding Cc value.
K_contraction = ((1/Cc)-1)^2; 
