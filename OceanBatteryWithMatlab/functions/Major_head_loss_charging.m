function [H_loss_charging_major] = Major_head_loss_charging(Q_pump, OB_GUI_parameters)

% Number_90deg_bends=OB_GUI_parameters.Number_90deg_bends_charging;
% R_bend=OB_GUI_parameters.R_bend_charging;
% R_bend=OB_GUI_parameters.R_bend_charging;
% D_bend=OB_GUI_parameters.D_bend_charging;
% D_bend_connection=OB_GUI_parameters.D_bend_connection_charging;
% Number_ball_valves=OB_GUI_parameters.Number_ball_valves_charging;
% Angle_ball_valve=OB_GUI_parameters.Angle_ball_valve_charging;
% D_ball_valve=OB_GUI_parameters.D_ball_valve_charging;
% Number_unions=OB_GUI_parameters.Number_unions_charging;
% Union_type=OB_GUI_parameters.Union_type_charging;
% D_union=OB_GUI_parameters.D_union_charging;
% Number_pressure_sensors=OB_GUI_parameters.Number_pressure_sensors_charging;
% D_pressure_sensor=OB_GUI_parameters.D_pressure_sensor_charging;
% Number_flow_meters=OB_GUI_parameters.Number_flow_meters_charging;
% Flow_meter_type=OB_GUI_parameters.Flow_meter_type_charging;
% D_flow_meter=OB_GUI_parameters.D_flow_meter_charging;
% Number_check_valves=OB_GUI_parameters.Number_check_valves_charging;
% D_check_valve=OB_GUI_parameters.D_check_valve_charging;
% Number_90deg_elbows=OB_GUI_parameters.Number_90deg_elbows_charging;
% D_elbow_90=OB_GUI_parameters.D_elbow_90_charging;
% Number_45deg_elbows=OB_GUI_parameters.Number_45deg_elbows_charging;
% D_elbow_45=OB_GUI_parameters.D_elbow_45_charging;
% Number_inlets=OB_GUI_parameters.Number_inlets_charging;
% r_inlet_rounded=OB_GUI_parameters.r_inlet_rounded_charging;
% Inlet_type=OB_GUI_parameters.Inlet_type_charging;
% D_inlet=OB_GUI_parameters.D_inlet_charging;
% Number_outlets=OB_GUI_parameters.Number_outlets_charging;
% D_outlet=OB_GUI_parameters.D_outlet_charging;
% Number_bypasses=OB_GUI_parameters.Number_bypasses_charging;
% D_bypass=OB_GUI_parameters.D_bypass;
% Inlet_type_bypass=OB_GUI_parameters.Inlet_type_bypass_charging;
% r_inlet_rounded_bypass=OB_GUI_parameters.r_inlet_rounded_bypass_charging;
    

%% Major head loss (charging)
%   Calculates the marjor head loss of the system during the charging
%   phase. 

%% Flow == 0
%   The script generates an error when the flow is zero. To prevent this,
%   this if-statemtent is used. 
if Q_pump == 0
    H_loss_charging_major = 0;
    return
end

%% Setting parameters
OB_parameters; %Loads the script OB_parameters.m.


%% Independent parameters
A_pipeline = pi * (0.5*D_pipeline)^2; %[m^2] Area of the pipeline.
RR_pipeline = Roughness_pipeline/D_pipeline; %[-] Relative roughness of the pipeline.
A_bypass = pi * (0.5*D_bypass)^2; %[m^2] Area of the bypass.
RR_bypass = Roughness_bypass/D_bypass; %[-] Relative roughness of the bypass.

%% Flow through bypass
Q_bypass = Q_pump * (V_rigid_in/Capacity_rigid); %[m^3/s]

%% Dependent parameters
Re_pipeline = ((Q_pump/A_pipeline) * D_pipeline * Dens_wat) / Visc_wat; %[-] Reynolds number of the flow in the pipeline.
f_pipeline = Moody(RR_pipeline, Re_pipeline); %[-] Friction factor of the pipeline, from a moody diagram.
Re_bypass = ((Q_bypass/A_bypass) * D_bypass * Dens_wat) / Visc_wat; %[-] Reynolds number of the flow in the bypass.
f_bypass = Moody(RR_bypass, Re_bypass); %[-] Friction factor of the bypass, from a moody diagram.

%% Major head loss in the bypass
H_loss_charging_bypass = f_bypass * (L_bypass/D_bypass) * (((Q_bypass/A_bypass)^2)/(2*g)); %[m]

%% Major head loss calculation
H_loss_charging_major = f_pipeline * (L_pipeline_charging/D_pipeline) * (((Q_pump/A_pipeline)^2)/(2*g)) + H_loss_charging_bypass; %[m]

end