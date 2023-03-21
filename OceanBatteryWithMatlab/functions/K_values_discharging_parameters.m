% %% Paramaters for the calculation of K-values (discharging)
% %   In this script the parameters for the minor losses of the discharging 
% %   phase can be set.
% 
% %% 90 degree bend
% Number_90deg_bends = 12; %[-] Select the number of 90 degree bends here.
% R_bend = 0.048; %[m] Radius of the bends.
% D_bend = 0.034; %[m] Inner diameter of the bends.
% D_bend_connection = 0.038;%[m] Inner diameter of the entrances and exits of the bends.
% 
% %% Ball valve
% Number_ball_valves = 1; %[-] Select the number of ball valves here.
% Angle_ball_valve = 0; %[degree] Select the angle of the ball valves here.
% D_ball_valve = 0.034; %[m] Inner diameter of the ball valves.
% 
% %% Union
% Number_unions = 2; %[-] Select the number of unions here.
% Union_type = 1; %[-] Select the union type here, 1 = threaded // 2 = flanged
% D_union = 0.034; %[m] Inner diameter of the unions.
% 
% %% Pressure sensor
% Number_pressure_sensors = 3; %[-] Select the number of pressure sensors here.
% D_pressure_sensor = 0.034; %[m] Inner diameter at the location of the pressure sensor.
% 
% %% Flow meter
% Number_flow_meters = 1; %[-] Select the number of flow meters here.
% Flow_meter_type = 4; %[-] Select the flow meter type here 1 = electromagnetic // 2 = ultrasonic // 3 = turbine // 4 = paddle wheel
% D_flow_meter = 0.034; %[m] Inner diameter at the location of the flow meters.
% 
% %% Check valve
% Number_check_valves = 0; %[-] Select the number of check valves here.
% D_check_valve = 0.034; %[m] Inner diameter of the check valves.
% 
% %% 90-degree elbow
% Number_90deg_elbows = 2; %[-] Select the number of 90-degree elbows here.
% D_elbow_90 = 0.034; %[m] Inner diameter of the 90-degree elbows.
% 
% %% 45-degree elbow
% Number_45deg_elbows = 0; %[-] Select the number of 45-degree elbows here.
% D_elbow_45 = 0.034; %[m] Inner diameter of the 45-degree elbows.
% 
% %% Inlets
% Number_inlets = 1; %[-] Select the number of inlets here.
% r_inlet_rounded = 0.0001; %[m] radius of the rounded inlet bend.
% Inlet_type = 3; %[-] Select the inlet type here, 1 = square edge // 2 = rounded erge // 3 = extended edge // 4 = chamfered edge
% D_inlet = 0.034; %[m] Inner diameter of the pipe right after the inlet.
% 
% %% Outlets
% Number_outlets = 1; %[-] Select the number of outlets here.
% D_outlet = 0.034; %[m] Inner diameter of the pipe right before the outlet.
% 
% %% Bypass
% %   the bypass is mentioned seperate and not as a set of inlets and
% %   outlets because it has a different diamter and a different amount of 
% %   flow passes though it. It also provides a better overview of 
% %   the system. 
% 
% Number_bypasses = 1; %[-] Select the number of bypasses here.
% D_bypass = 0.05; %[m] Inner diameter of the bypass.
% Inlet_type_bypass = 3; %[-] Select the inlet type here, 1 = square edge // 2 = rounded erge // 3 = extended edge // 4 = chamfered edge
% r_inlet_rounded_bypass = .0001; %[m] Radius of the rounded inlet bend.

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