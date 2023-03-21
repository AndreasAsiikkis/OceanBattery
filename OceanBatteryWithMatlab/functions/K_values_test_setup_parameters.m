% %% Parameters for minor loss test setup
% %   In this script, the parameters that are needed to calculate the minor
% %   loss of the test setup can be entered. 
% 
% %% 90 degree bend
% Number_90deg_bends = 1; %[-] Select the number of 90 degree bends here.
% R_bend = 127; %[m] Radius of the bends.
% r_bend = 0.019; %[m] Inner radius of the bends.
% r__bend_connection = 0.0213;%[m] Inner radius of the entrances and exits of the bends.
% 
% %% Ball valve
% Number_ball_valves = 2; %[-] Select the number of ball valves here
% Angle_ball_valve = 0; %[degree] Select the angle of the ball valves here
% r_ball_valve = 0.0213; %[m] Inner radius of the ball valves
% 
% %% Union
% Number_unions = 8; %[-] Select the number of unions here
% Union_type = 1; %[-] Select the union type here, 1 = threaded // 2 = flanged
% r_union = 0.0213; %[m] Inner radius of the unions
% 
% %% 90-degree elbow
% Number_90deg_elbows = 2; %[-] Select the number of 90-degree elbows here
% r_elbow_90 = 0.0213; %[m] Inner radius of the 90-degree elbows
% 
% %% 45-degree elbow
% Number_45deg_elbows = 7; %[-] Select the number of 45-degree elbows here
% r_elbow_45 = 0.0213; %[m] Inner radius of the 45-degree elbows
% 
% %% Inlets
% Number_inlets = 1; %[-] Select the number of inlets here
% R_inlet_rounded = 1; %[m] radius of the rounded inlet bend
% Inlet_type = 4; %[-] Select the inlet type here, 1 = square edge // 2 = rounded erge // 3 = extended edge // 4 = chamfered edge
% r_inlet = 0.0213; %[m] Inner radius of the pipe right after the inlet 

%% Contraction
r_contraction_1 = 0.0213; %[m] Radius before contraction 
r_contraction_2 = 0.0136; %[m] Radius after contraction

Number_90deg_bends=OB_GUI_parameters.Number_90deg_bends_discharging;
R_bend=OB_GUI_parameters.R_bend_discharging;
R_bend=OB_GUI_parameters.R_bend_discharging;
D_bend=OB_GUI_parameters.D_bend_charging;
D_bend_connection=OB_GUI_parameters.D_bend_connection_discharging;
Number_ball_valves=OB_GUI_parameters.Number_ball_valves_discharging;
Angle_ball_valve=OB_GUI_parameters.Angle_ball_valve_discharging;
D_ball_valve=OB_GUI_parameters.D_ball_valve_discharging;
Number_unions=OB_GUI_parameters.Number_unions_discharging;
Union_type=OB_GUI_parameters.Union_type_discharging;
D_union=OB_GUI_parameters.D_union_discharging;
Number_pressure_sensors=OB_GUI_parameters.Number_pressure_sensors_discharging;
D_pressure_sensor=OB_GUI_parameters.D_pressure_sensor_discharging;
Number_flow_meters=OB_GUI_parameters.Number_flow_meters_discharging;
Flow_meter_type=OB_GUI_parameters.Flow_meter_type_discharging;
D_flow_meter=OB_GUI_parameters.D_flow_meter_discharging;
Number_check_valves=OB_GUI_parameters.Number_check_valves_discharging;
D_check_valve=OB_GUI_parameters.D_check_valve_discharging;
Number_90deg_elbows=OB_GUI_parameters.Number_90deg_elbows_discharging;
D_elbow_90=OB_GUI_parameters.D_elbow_90_discharging;
Number_45deg_elbows=OB_GUI_parameters.Number_45deg_elbows_discharging;
D_elbow_45=OB_GUI_parameters.D_elbow_45_discharging;
Number_inlets=OB_GUI_parameters.Number_inlets_discharging;
r_inlet_rounded=OB_GUI_parameters.r_inlet_rounded_discharging;
Inlet_type=OB_GUI_parameters.Inlet_type_discharging;
D_inlet=OB_GUI_parameters.D_inlet_discharging;
Number_outlets=OB_GUI_parameters.Number_outlets_discharging;
D_outlet=OB_GUI_parameters.D_outlet_discharging;
Number_bypasses=OB_GUI_parameters.Number_bypasses_discharging;
D_bypass=OB_GUI_parameters.D_bypass;
Inlet_type_bypass=OB_GUI_parameters.Inlet_type_bypass_discharging;
r_inlet_rounded_bypass=OB_GUI_parameters.r_inlet_rounded_bypass_discharging;
