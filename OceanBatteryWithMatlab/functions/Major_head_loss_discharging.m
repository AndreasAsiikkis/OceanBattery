function [H_loss_discharging_major] = Major_head_loss_discharging(Q_turbine,OB_GUI_parameters)

% Number_90deg_bends=OB_GUI_parameters.Number_90deg_bends_discharging;
% R_bend=OB_GUI_parameters.R_bend_discharging;
% R_bend=OB_GUI_parameters.R_bend_discharging;
% D_bend=OB_GUI_parameters.D_bend_charging;
% D_bend_connection=OB_GUI_parameters.D_bend_connection_discharging;
% Number_ball_valves=OB_GUI_parameters.Number_ball_valves_discharging;
% Angle_ball_valve=OB_GUI_parameters.Angle_ball_valve_discharging;
% D_ball_valve=OB_GUI_parameters.D_ball_valve_discharging;
% Number_unions=OB_GUI_parameters.Number_unions_discharging;
% Union_type=OB_GUI_parameters.Union_type_discharging;
% D_union=OB_GUI_parameters.D_union_discharging;
% Number_pressure_sensors=OB_GUI_parameters.Number_pressure_sensors_discharging;
% D_pressure_sensor=OB_GUI_parameters.D_pressure_sensor_discharging;
% Number_flow_meters=OB_GUI_parameters.Number_flow_meters_discharging;
% Flow_meter_type=OB_GUI_parameters.Flow_meter_type_discharging;
% D_flow_meter=OB_GUI_parameters.D_flow_meter_discharging;
% Number_check_valves=OB_GUI_parameters.Number_check_valves_discharging;
% D_check_valve=OB_GUI_parameters.D_check_valve_discharging;
% Number_90deg_elbows=OB_GUI_parameters.Number_90deg_elbows_discharging;
% D_elbow_90=OB_GUI_parameters.D_elbow_90_discharging;
% Number_45deg_elbows=OB_GUI_parameters.Number_45deg_elbows_discharging;
% D_elbow_45=OB_GUI_parameters.D_elbow_45_discharging;
% Number_inlets=OB_GUI_parameters.Number_inlets_discharging;
% r_inlet_rounded=OB_GUI_parameters.r_inlet_rounded_discharging;
% Inlet_type=OB_GUI_parameters.Inlet_type_discharging;
% D_inlet=OB_GUI_parameters.D_inlet_discharging;
% Number_outlets=OB_GUI_parameters.Number_outlets_discharging;
% D_outlet=OB_GUI_parameters.D_outlet_discharging;
% Number_bypasses=OB_GUI_parameters.Number_bypasses_discharging;
% D_bypass=OB_GUI_parameters.D_bypass;
% Inlet_type_bypass=OB_GUI_parameters.Inlet_type_bypass_discharging;
% r_inlet_rounded_bypass=OB_GUI_parameters.r_inlet_rounded_bypass_charging;

%% Major head loss (discharging) 
%   This function calculates the major head loss during the discharge
%   phase.

%% Flow == 0
%   The script generates an error when the flow is zero. To prevent this,
%   this if-statemtent is used. 
if Q_turbine == 0
    H_loss_discharging_major = 0;
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
Q_bypass = Q_turbine*(V_rigid_in/Capacity_rigid); %[m^3/s]

%% Dependent parameters
Re_pipeline = ((Q_turbine/A_pipeline) * D_pipeline * Dens_wat) / Visc_wat; %[-] Reynolds number of the flow in the pipeline.
f_pipeline = Moody(RR_pipeline, Re_pipeline); %[-] Friction factor of the pipeline, from the moody diagram.
Re_bypass = ((Q_bypass/A_bypass) * D_bypass * Dens_wat) / Visc_wat; %[-] Reynolds number of the flow in the bypass.
f_bypass = Moody(RR_bypass, Re_bypass); %[-] Friction factor of the bypass, from a moody diagram.

%% Major head loss in the bypass
H_loss_discharging_bypass = f_bypass * (L_bypass/D_bypass) * (((Q_bypass/A_bypass)^2)/(2*g)); %[m]

%% Major head loss calculation
H_loss_discharging_major = f_pipeline * (L_pipeline_discharging/D_pipeline) * (((Q_turbine/A_pipeline)^2)/(2*g)) + H_loss_discharging_bypass; %[m]
end
