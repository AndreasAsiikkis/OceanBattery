function [K_Values]=independant_k_values(OB_GUI_parameters)

%% Independent K-values
%   This model calculates K-values that are independent of the flow 
%   velocity. These K-values are based on fixed parameters and will not 
%   change after they are calculated.

%% Setting parameters
%   Sets the OB parameters and the parameters specific to the charging or 
%   the discharging phase.

K_values_charging_parameters; %Loads the script K_values_charging_parameters.

OB_parameters; %Loads the script OB_parameters.

%% 90-degree bend
A_bend = pi * (0.5*D_bend)^2; %[m^2] Area of the bend.
r_bend = 0.5*D_bend; %[m] Radius of the bend.
A_bend_connection = pi * (0.5*D_bend_connection)^2; %[m^2] Area of the entrance and exit of the bend. 
alfa_bend = 0.95 * 17.2 * ((R_bend/r_bend)^(-1.96)); %[-] Emperical factor depending on the angle of the bend.
angle_bend = 90; %[degrees] Angle that the bends make.  

A_ratio = A_bend/A_bend_connection; %Ratio between the area of the entrance of the bend and the area in the bend.
A_ratio_table = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]; %Creates a vector of possible ratios.  
[~,index_K_contraction] = min(abs(A_ratio_table - A_ratio)); %Gives the index number of the ratio from A_ratio_table that is closest to A_ratio.
Cc_table = [0.585 0.624 0.632 0.643 0.659 0.681 0.712 0.755 0.813 0.892 1]; %Generates a table with possible contraction coefficients. 
Cc = Cc_table(index_K_contraction); %Uses the index number to match the corresponding Cc value.
K_Values.K_contraction_bend_charging = ((1/Cc)-1)^2; %[-] Minor loss coefficient of the contraction.  

K_Values.K_enlargement_bend_charging = (1 - (A_bend/A_bend_connection))^2; %[-] Minor loss coefficient of the enlargement.

%%  Ball valve
Angle_ball_valve_table = [0 30 60 90]; %[degrees] Gives the possible angles for the ball valve.
[~,index_K_ball_valve] = min(abs(Angle_ball_valve_table - Angle_ball_valve)); %[-] Finds the closesed value from the table.
K_ball_valve_table = [0.05 5.5 200 999999999]; %Corresponding K-values.
K_Values.K_ball_valve_charging = K_ball_valve_table(index_K_ball_valve); %[-] Minor loss coefficient ball valve. 
A_ball_valve = pi*(0.5*D_ball_valve)^2; %[m^2] Area of the ball valve. 

%% Unions       
if Union_type == 1 %indicates a threaded union.
    K_Values.K_unions_charging = 0.08; %[-] Minor loss coefficient threaded union.
elseif Union_type == 2 %indicates a flanged union.
    K_Values.K_unions_charging = 0.04; %[-] Minor loss coefficient flanged union. 
end
A_union = pi*(0.5*D_union)^2; %[m^2] Area union.

%% pressure sensor
K_Values.K_pressure_sensor_charging = 0.08; %[-] K-value of a pressure sensor.
A_pressure_sensor = pi*(0.5*D_pressure_sensor)^2; %[m^2] Area pressure sensor.

%% Flow meter
if Flow_meter_type == 1 %indicates an electromagnetic flow meter.
    K_Values.K_flow_meter_charging = 0; %[-] Minor loss coefficient electromagnetic flow meter.
elseif Flow_meter_type == 2 %indicates an ultrasonic flow meter.
    K_Values.K_flow_meter_charging = 0; %[-] Minor loss coefficient ultrasonic flow meter.
elseif Flow_meter_type == 3 %indicates a turbine flow meter.
    K_Values.K_flow_meter_charging = 0.8; %[-] Minor loss coefficient turbine flow meter.
elseif Flow_meter_type == 4 %indicates a paddle wheel flow meter.
    K_Values.K_flow_meter_charging = 1; %[-] Minor loss coefficient paddle wheel flow meter.
end
A_flow_meter = pi*(0.5*D_flow_meter)^2; %[m^2] Minor loss coefficient flow meter.

%% Check valve
K_Values.K_check_valve_charging = 2; %[-] K-value for an open check valve, if the valve is closed, the K-value equals infinity.
A_check_valve = pi*(0.5*D_check_valve)^2; %[m^2] Area check valve.

%% 90-degree elbow
K_Values.K_elbow_90_charging= 1.4; %[-] K-value for a 90-degree elbow, average value.
A_elbow_90 = pi*(0.5*D_elbow_90)^2; %[m^2] Area elbow. 

%% 45-degree elbow
K_Values.K_elbow_45_charging = 0.425; %[-] K-value for a 45-degree elbow, average value.
A_elbow_45 = pi*(0.5*D_elbow_45)^2; %[m^2] Area elbow.

%% Inlets
if Inlet_type == 1 %Indicates a square inlet.
    K_Values.K_inlet_charging = 0.5; %[-]K-value for an inlet with square edges.
elseif Inlet_type == 2 %Indicates a rounded inlet.
    rd_ratio = r_inlet_rounded/D_inlet; %[-] Ratio between r_inlet_rounded and D_inlet of the rounded inlet.
    rd_table = [0.02 0.04 0.06 0.1 0.15]; %Vector with possible ratios.
    [~,index_K_inlet_rounded] = (min(abs(rd_table-rd_ratio))); %Finds the index number of the ratio from the table that is closest to rd_ratio. 
    K_inlet_rounded_table = [0.28 0.24 0.15 0.09 0.04]; %Corresponding minor loss coefficients.
    K_Values.K_inlet_charging = K_inlet_rounded_table(index_K_inlet_rounded); %[-] Minor loss coefficient inlet. 
elseif Inlet_type == 3 %Indicates an inlet with an extended edge.
    K_Values.K_inlet_charging = 0.78; %[-]K-value for an inlet with an extended edge.
elseif Inlet_type ==4 %Indicates an inlet with a chamfered edge.
    K_Values.K_inlet_charging = 0.25; %[-]K-value for an inlet with a chamfered edge. 
end
A_inlet = pi*(0.5*D_inlet)^2; %[m^2] Area inlet. 

%% Outlets
K_Values.K_outlet_charging = 1; %[-] K-value for all outlets.
A_outlet = pi*(0.5*D_outlet)^2; %[m^2] Area of the outlet. 

%% Bypass
%   The bypass is mentioned seperate and not as a set of inlets and
%   outlets because it has a different diamter and a different amount of 
%   flow passes though it. It also provides a better overview of the 
%   system. 

K_Values.K_outlet_bypass_charging = K_Values.K_outlet_charging ; %[-] Minor loss coefficient outlet bypass. Is the same for every kind of outlet.

if Inlet_type_bypass == 1 %Indicates a square inlet.
    K_Values.K_inlet_bypass_charging = 0.5; %[-]K-value for an inlet with square edges.
elseif Inlet_type_bypass == 2 %Indicates a rounded inlet.
    rd_ratio = r_inlet_rounded_bypass/D_bypass; %[-] Ratio between r_inlet_rounded and D_inlet of the rounded inlet.
    rd_table = [0.02 0.04 0.06 0.1 0.15]; %Vector with possible ratios.
    [~,index_K_inlet_rounded] = (min(abs(rd_table-rd_ratio))); %Finds the index number of the ratio from the table that is closest to rd_ratio. 
    K_inlet_rounded_table = [0.28 0.24 0.15 0.09 0.04]; %Corresponding minor loss coefficients.
    K_Values.K_inlet_bypass_charging = K_inlet_rounded_table(index_K_inlet_rounded); %[-] Minor loss coefficient inlet. 
elseif Inlet_type_bypass == 3 %Indicates an inlet with an extended edge.
    K_Values.K_inlet_bypass_charging = 0.78; %[-]K-value for an inlet with an extended edge.
elseif Inlet_type_bypass == 4 %Indicates an inlet with a chamfered edge.
    K_Values.K_inlet_bypass_charging = 0.25; %[-]K-value for an inlet with a chamfered edge. 
end

K_Values.K_bypass_charging = K_Values.K_inlet_bypass_charging + K_Values.K_outlet_bypass_charging; %[-] Minor loss coefficient bypass.
A_bypass = pi*(0.5*D_bypass)^2; %[m^2] Area bypass.


%%

K_values_discharging_parameters; %Loads the script K_values_discharging_parameters.


OB_parameters; %Loads the script OB_parameters.

%% 90-degree bend
A_bend = pi * (0.5*D_bend)^2; %[m^2] Area of the bend.
r_bend = 0.5*D_bend; %[m] Radius of the bend.
A_bend_connection = pi * (0.5*D_bend_connection)^2; %[m^2] Area of the entrance and exit of the bend. 
alfa_bend = 0.95 * 17.2 * ((R_bend/r_bend)^(-1.96)); %[-] Emperical factor depending on the angle of the bend.
angle_bend = 90; %[degrees] Angle that the bends make.  

A_ratio = A_bend/A_bend_connection; %Ratio between the area of the entrance of the bend and the area in the bend.
A_ratio_table = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]; %Creates a vector of possible ratios.  
[~,index_K_contraction] = min(abs(A_ratio_table - A_ratio)); %Gives the index number of the ratio from A_ratio_table that is closest to A_ratio.
Cc_table = [0.585 0.624 0.632 0.643 0.659 0.681 0.712 0.755 0.813 0.892 1]; %Generates a table with possible contraction coefficients. 
Cc = Cc_table(index_K_contraction); %Uses the index number to match the corresponding Cc value.
K_Values.K_contraction_bend_discharging = ((1/Cc)-1)^2; %[-] Minor loss coefficient of the contraction.  

K_Values.K_enlargement_bend_discharging = (1 - (A_bend/A_bend_connection))^2; %[-] Minor loss coefficient of the enlargement.

%%  Ball valve
Angle_ball_valve_table = [0 30 60 90]; %[degrees] Gives the possible angles for the ball valve.
[~,index_K_ball_valve] = min(abs(Angle_ball_valve_table - Angle_ball_valve)); %[-] Finds the closesed value from the table.
K_ball_valve_table = [0.05 5.5 200 999999999]; %Corresponding K-values.
K_Values.K_ball_valve_discharging = K_ball_valve_table(index_K_ball_valve); %[-] Minor loss coefficient ball valve. 
A_ball_valve = pi*(0.5*D_ball_valve)^2; %[m^2] Area of the ball valve. 

%% Unions       
if Union_type == 1 %indicates a threaded union.
    K_Values.K_unions_discharging = 0.08; %[-] Minor loss coefficient threaded union.
elseif Union_type == 2 %indicates a flanged union.
    K_Values.K_unions_discharging = 0.04; %[-] Minor loss coefficient flanged union. 
end
A_union = pi*(0.5*D_union)^2; %[m^2] Area union.

%% pressure sensor
K_Values.K_pressure_sensor_discharging = 0.08; %[-] K-value of a pressure sensor.
A_pressure_sensor = pi*(0.5*D_pressure_sensor)^2; %[m^2] Area pressure sensor.

%% Flow meter
if Flow_meter_type == 1 %indicates an electromagnetic flow meter.
    K_Values.K_flow_meter_discharging = 0; %[-] Minor loss coefficient electromagnetic flow meter.
elseif Flow_meter_type == 2 %indicates an ultrasonic flow meter.
    K_Values.K_flow_meter_discharging = 0; %[-] Minor loss coefficient ultrasonic flow meter.
elseif Flow_meter_type == 3 %indicates a turbine flow meter.
    K_Values.K_flow_meter_discharging = 0.8; %[-] Minor loss coefficient turbine flow meter.
elseif Flow_meter_type == 4 %indicates a paddle wheel flow meter.
    K_Values.K_flow_meter_discharging = 1; %[-] Minor loss coefficient paddle wheel flow meter.
end
A_flow_meter = pi*(0.5*D_flow_meter)^2; %[m^2] Minor loss coefficient flow meter.

%% Check valve
K_Values.K_check_valve_discharging = 2; %[-] K-value for an open check valve, if the valve is closed, the K-value equals infinity.
A_check_valve = pi*(0.5*D_check_valve)^2; %[m^2] Area check valve.

%% 90-degree elbow
K_Values.K_elbow_90_discharging= 1.4; %[-] K-value for a 90-degree elbow, average value.
A_elbow_90 = pi*(0.5*D_elbow_90)^2; %[m^2] Area elbow. 

%% 45-degree elbow
K_Values.K_elbow_45_discharging = 0.425; %[-] K-value for a 45-degree elbow, average value.
A_elbow_45 = pi*(0.5*D_elbow_45)^2; %[m^2] Area elbow.

%% Inlets
if Inlet_type == 1 %Indicates a square inlet.
    K_Values.K_inlet_discharging = 0.5; %[-]K-value for an inlet with square edges.
elseif Inlet_type == 2 %Indicates a rounded inlet.
    rd_ratio = r_inlet_rounded/D_inlet; %[-] Ratio between r_inlet_rounded and D_inlet of the rounded inlet.
    rd_table = [0.02 0.04 0.06 0.1 0.15]; %Vector with possible ratios.
    [~,index_K_inlet_rounded] = (min(abs(rd_table-rd_ratio))); %Finds the index number of the ratio from the table that is closest to rd_ratio. 
    K_inlet_rounded_table = [0.28 0.24 0.15 0.09 0.04]; %Corresponding minor loss coefficients.
    K_Values.K_inlet_discharging = K_inlet_rounded_table(index_K_inlet_rounded); %[-] Minor loss coefficient inlet. 
elseif Inlet_type == 3 %Indicates an inlet with an extended edge.
    K_Values.K_inlet_discharging = 0.78; %[-]K-value for an inlet with an extended edge.
elseif Inlet_type ==4 %Indicates an inlet with a chamfered edge.
    K_Values.K_inlet_discharging = 0.25; %[-]K-value for an inlet with a chamfered edge. 
end
A_inlet = pi*(0.5*D_inlet)^2; %[m^2] Area inlet. 

%% Outlets
K_Values.K_outlet_discharging = 1; %[-] K-value for all outlets.
A_outlet = pi*(0.5*D_outlet)^2; %[m^2] Area of the outlet. 

%% Bypass
%   The bypass is mentioned seperate and not as a set of inlets and
%   outlets because it has a different diamter and a different amount of 
%   flow passes though it. It also provides a better overview of the 
%   system. 

K_Values.K_outlet_bypass_discharging = K_Values.K_outlet_discharging; %[-] Minor loss coefficient outlet bypass. Is the same for every kind of outlet.

if Inlet_type_bypass == 1 %Indicates a square inlet.
    K_Values.K_inlet_bypass_discharging = 0.5; %[-]K-value for an inlet with square edges.
elseif Inlet_type_bypass == 2 %Indicates a rounded inlet.
    rd_ratio = r_inlet_rounded_bypass/D_bypass; %[-] Ratio between r_inlet_rounded and D_inlet of the rounded inlet.
    rd_table = [0.02 0.04 0.06 0.1 0.15]; %Vector with possible ratios.
    [~,index_K_inlet_rounded] = (min(abs(rd_table-rd_ratio))); %Finds the index number of the ratio from the table that is closest to rd_ratio. 
    K_inlet_rounded_table = [0.28 0.24 0.15 0.09 0.04]; %Corresponding minor loss coefficients.
    K_Values.K_inlet_bypass_discharging = K_inlet_rounded_table(index_K_inlet_rounded); %[-] Minor loss coefficient inlet. 
elseif Inlet_type_bypass == 3 %Indicates an inlet with an extended edge.
    K_Values.K_inlet_bypass_discharging = 0.78; %[-]K-value for an inlet with an extended edge.
elseif Inlet_type_bypass == 4 %Indicates an inlet with a chamfered edge.
    K_Values.K_inlet_bypass_discharging = 0.25; %[-]K-value for an inlet with a chamfered edge. 
end

K_Values.K_bypass_discharging = K_Values.K_inlet_bypass_discharging + K_Values.K_outlet_bypass_discharging; %[-] Minor loss coefficient bypass.
A_bypass = pi*(0.5*D_bypass)^2; %[m^2] Area bypass.

end


